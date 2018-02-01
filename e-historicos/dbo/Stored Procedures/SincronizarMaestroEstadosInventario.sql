CREATE PROCEDURE [dbo].[SincronizarMaestroEstadosInventario]
AS
BEGIN TRY
	DECLARE @fecha_desde DATETIME
	DECLARE @fecha_hasta DATETIME

    BEGIN TRANSACTION

    EXECUTE dbo.GetFechasIntegracion 'ESTADOS_INVENTARIO', @fecha_desde OUTPUT, @fecha_hasta OUTPUT

    --CONSOLIDACION SOURCE
	BEGIN
		IF OBJECT_ID('tempdb..#source') IS NOT NULL BEGIN
			DROP TABLE #source
		END

		;WITH
		cte_00 AS
		(
            SELECT 
                 LEFT(UPPER(a.codval),4) AS invsts
                ,COALESCE(LEFT(UPPER(b.lngdsc),100),'') AS lngdsc
            FROM [$(ttcwmsprd)].dbo.codmst a
            LEFT OUTER JOIN [$(ttcwmsprd)].dbo.dscmst b ON
                b.colnam = a.colnam
            AND b.colval = a.codval
            AND b.locale_id = 'ES-ES'
            WHERE 0 = 0
            AND a.colnam = 'invsts'
        )
		SELECT
            CAST(NULL AS BIGINT) AS id,
            CAST('' AS NVARCHAR(1)) AS operacion,
            CAST(0 AS BIT) AS cambio_notificado,
            @fecha_hasta AS fecha_creacion,
            @fecha_hasta AS fecha_modificacion,
			a.*
		INTO #source
		FROM cte_00 a
    END

    --MERGE
    BEGIN
        UPDATE a
        SET a.id = b.id,
            a.operacion = 'U',
            a.fecha_creacion = b.fecha_creacion
        FROM #source a
        INNER JOIN dbo.estados_inventario b ON
            b.invsts = a.invsts
        WHERE NOT (
            a.lngdsc = b.lngdsc COLLATE SQL_Latin1_General_CP1_CS_AS)     
        
        UPDATE a
        SET a.operacion = 'C'
        FROM #source a
        LEFT OUTER JOIN dbo.estados_inventario b ON
            b.invsts = a.invsts
        WHERE
            b.invsts IS NULL
    END

    --CONSOLIDACION DE REGISTROS inserted/deleted
    BEGIN
		IF OBJECT_ID('tempdb..#not_matched') IS NOT NULL BEGIN
			DROP TABLE #not_matched
		END

        SELECT
            a.*
        INTO #not_matched
        FROM dbo.estados_inventario a
        LEFT OUTER JOIN #source b ON
            b.invsts = a.invsts
        WHERE
            b.invsts IS NULL
        AND a.operacion <> 'D'
        --Se puede utilizar #source porque al crear esta tabla no se usa un filtro por fecha, por tanto siempre trae todos los datos disponibles

		IF OBJECT_ID('tempdb..#deleted') IS NOT NULL BEGIN
			DROP TABLE #deleted
		END

        ;WITH
        cte_matched AS
        (
            SELECT
                b.*
            FROM #source a
            INNER JOIN dbo.estados_inventario b ON
                b.invsts = a.invsts
            WHERE
                a.operacion IN  ('U')
        ),
        cte_01 AS
        (
            SELECT * FROM cte_matched a
            UNION
            SELECT * FROM #not_matched
        )
        SELECT
            a.*
        INTO #deleted
        FROM cte_01 a

        IF OBJECT_ID('tempdb..#inserted') IS NOT NULL BEGIN
			DROP TABLE #inserted
		END

        UPDATE a
        SET  operacion = 'D'
            ,fecha_modificacion = @fecha_hasta
        FROM #not_matched a

        ;WITH 
        cte_00 AS
        (
            SELECT * FROM #source a WHERE a.operacion IN  ('C','U')
            UNION
            SELECT * FROM #not_matched a
        )
		SELECT
			a.*
		INTO #inserted
		FROM cte_00 a
    END

    --ACTUALIZACION TARGET/LOGS
    BEGIN
		DELETE a
		FROM dbo.estados_inventario a
		INNER JOIN #deleted b ON
			b.id = a.id
        
		INSERT INTO dbo.estados_inventario
			(operacion
            ,fecha_creacion
            ,fecha_modificacion

            ,invsts
            ,lngdsc)
		SELECT
			 operacion
            ,fecha_creacion
            ,fecha_modificacion

            ,invsts
            ,lngdsc
		FROM #inserted a
        WHERE
            a.operacion = 'C'

        SET IDENTITY_INSERT dbo.estados_inventario ON

		INSERT INTO dbo.estados_inventario
			(id
            ,operacion
            ,fecha_creacion
            ,fecha_modificacion

            ,invsts
            ,lngdsc)
		SELECT
             id
            ,operacion
            ,fecha_creacion
            ,fecha_modificacion

            ,invsts
            ,lngdsc
		FROM #inserted a
        WHERE
            a.operacion IN ('U','D')

        SET IDENTITY_INSERT dbo.estados_inventario OFF

		INSERT INTO logs.estados_inventario
			(id
            ,operacion
            ,cambio_notificado
            ,fecha_creacion
            ,fecha_modificacion

            ,invsts
            ,lngdsc)
		SELECT
             id
            ,operacion
            ,cambio_notificado
            ,fecha_creacion
            ,fecha_modificacion

            ,invsts
            ,lngdsc
		FROM #deleted a
	END
    
    COMMIT TRANSACTION
END TRY
BEGIN CATCH
    SELECT ERROR_MESSAGE()
	ROLLBACK TRANSACTION
    ;THROW;
END CATCH