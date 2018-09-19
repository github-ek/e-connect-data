CREATE PROCEDURE [dbo].[SincronizarMaestroUnidadesMedida]
AS
BEGIN TRY
	DECLARE @fecha_desde DATETIME
	DECLARE @fecha_hasta DATETIME


    EXECUTE dbo.GetFechasIntegracion 'UNIDADES_MEDIDA', @fecha_desde OUTPUT, @fecha_hasta OUTPUT

    --CONSOLIDACION SOURCE
	BEGIN
		IF OBJECT_ID('tempdb..#source') IS NOT NULL BEGIN
			DROP TABLE #source
		END

		;WITH
		cte_00 AS
		(
            SELECT
                 LEFT(UPPER(colval),2) AS uomcod
                ,LEFT(UPPER(lngdsc),100) AS lngdsc
            FROM [$(ttcwmsprd)].dbo.dscmst a
            WHERE 0 = 0
            AND a.colnam = 'uomcod' 
            AND a.locale_id = 'ES-ES'
        )
		SELECT
            CAST(NULL AS BIGINT) AS id,
            '' AS operacion,
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
        INNER JOIN dbo.unidades_medida b ON
            b.uomcod = a.uomcod
        WHERE NOT (
            a.lngdsc = b.lngdsc COLLATE SQL_Latin1_General_CP1_CS_AS)     
        
        UPDATE a
        SET a.operacion = 'C'
        FROM #source a
        LEFT OUTER JOIN dbo.unidades_medida b ON
            b.uomcod = a.uomcod
        WHERE
            b.uomcod IS NULL
    END

    --CONSOLIDACION DE REGISTROS inserted/deleted
    BEGIN
		IF OBJECT_ID('tempdb..#not_matched') IS NOT NULL BEGIN
			DROP TABLE #not_matched
		END

        SELECT
            a.*
        INTO #not_matched
        FROM dbo.unidades_medida a
        LEFT OUTER JOIN #source b ON
            b.uomcod = a.uomcod
        WHERE
            b.uomcod IS NULL
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
            INNER JOIN dbo.unidades_medida b ON
                b.uomcod = a.uomcod
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

    BEGIN TRANSACTION
    --ACTUALIZACION TARGET/LOGS
    BEGIN
		DELETE a
		FROM dbo.unidades_medida a
		INNER JOIN #deleted b ON
			b.id = a.id
        
		INSERT INTO dbo.unidades_medida
			(operacion
            ,fecha_creacion
            ,fecha_modificacion

            ,uomcod
            ,lngdsc)
		SELECT
			 operacion
            ,fecha_creacion
            ,fecha_modificacion

            ,uomcod
            ,lngdsc
		FROM #inserted a
        WHERE
            a.operacion = 'C'

        SET IDENTITY_INSERT dbo.unidades_medida ON

		INSERT INTO dbo.unidades_medida
			(id
            ,operacion
            ,fecha_creacion
            ,fecha_modificacion

            ,uomcod
            ,lngdsc)
		SELECT
             id
            ,operacion
            ,fecha_creacion
            ,fecha_modificacion

            ,uomcod
            ,lngdsc
		FROM #inserted a
        WHERE
            a.operacion IN ('U','D')

        SET IDENTITY_INSERT dbo.unidades_medida OFF

		INSERT INTO logs.unidades_medida
			(id
            ,operacion
            ,cambio_notificado
            ,fecha_creacion
            ,fecha_modificacion

            ,uomcod
            ,lngdsc)
		SELECT
             id
            ,operacion
            ,cambio_notificado
            ,fecha_creacion
            ,fecha_modificacion

            ,uomcod
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