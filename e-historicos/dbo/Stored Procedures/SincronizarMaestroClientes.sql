CREATE PROCEDURE [dbo].[SincronizarMaestroClientes]
AS
BEGIN TRY
	DECLARE @fecha_desde DATETIME
	DECLARE @fecha_hasta DATETIME

    EXECUTE dbo.GetFechasIntegracion 'CLIENTES', @fecha_desde OUTPUT, @fecha_hasta OUTPUT

    --CONSOLIDACION SOURCE
	BEGIN
		IF OBJECT_ID('tempdb..#source') IS NOT NULL BEGIN
			DROP TABLE #source
		END

		;WITH
		cte_00 AS
		(
            SELECT
                 a.client_id
                ,UPPER(b.adrnam) AS adrnam
                ,COALESCE(RTRIM(LTRIM(UPPER(b.host_ext_id))),'') AS host_ext_id
                ,CAST(1 AS BIT) AS activo
            FROM [$(ttcwmsprd)].dbo.client a
            INNER JOIN [$(ttcwmsprd)].dbo.adrmst b ON
                b.adr_id = a.adr_id
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
        WHERE
            a.host_ext_id NOT LIKE '900987440%'
    END

    --MERGE
    BEGIN
        UPDATE a
        SET a.id = b.id,
            a.operacion = 'U',
            a.fecha_creacion = b.fecha_creacion
        FROM #source a
        INNER JOIN dbo.clientes b ON
            b.client_id = a.client_id
        WHERE NOT (
            a.adrnam = b.adrnam
        AND a.host_ext_id = b.host_ext_id)     
        
        UPDATE a
        SET a.operacion = 'C'
        FROM #source a
        LEFT OUTER JOIN dbo.clientes b ON
            b.client_id = a.client_id
        WHERE
            b.client_id IS NULL
    END

    --CONSOLIDACION DE REGISTROS inserted/deleted
    BEGIN
		IF OBJECT_ID('tempdb..#not_matched') IS NOT NULL BEGIN
			DROP TABLE #not_matched
		END

        SELECT
            a.*
        INTO #not_matched
        FROM dbo.clientes a
        LEFT OUTER JOIN [$(ttcwmsprd)].dbo.client b ON
            b.client_id = a.client_id
        WHERE
            b.client_id IS NULL
        AND a.operacion <> 'D'

		IF OBJECT_ID('tempdb..#deleted') IS NOT NULL BEGIN
			DROP TABLE #deleted
		END

        ;WITH
        cte_matched AS
        (
            SELECT
                b.*
            FROM #source a
            INNER JOIN dbo.clientes b ON
                b.client_id = a.client_id
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
		FROM dbo.clientes a
		INNER JOIN #deleted b ON
			b.id = a.id
        
		INSERT INTO dbo.clientes
			(operacion
            ,fecha_creacion
            ,fecha_modificacion

            ,client_id
            ,adrnam
            ,host_ext_id
            ,activo)
		SELECT
			 operacion
            ,fecha_creacion
            ,fecha_modificacion

            ,client_id
            ,adrnam
            ,host_ext_id
            ,activo
		FROM #inserted a
        WHERE
            a.operacion = 'C'

        SET IDENTITY_INSERT dbo.clientes ON

		INSERT INTO dbo.clientes
			(id
            ,operacion
            ,fecha_creacion
            ,fecha_modificacion

            ,client_id
            ,adrnam
            ,host_ext_id
            ,activo)
		SELECT
             id
            ,operacion
            ,fecha_creacion
            ,fecha_modificacion

            ,client_id
            ,adrnam
            ,host_ext_id
            ,activo
		FROM #inserted a
        WHERE
            a.operacion IN ('U','D')

        SET IDENTITY_INSERT dbo.clientes OFF

		INSERT INTO logs.clientes
			(id
            ,operacion
            ,cambio_notificado
            ,fecha_creacion
            ,fecha_modificacion

            ,client_id
            ,adrnam
            ,host_ext_id
            ,activo)
		SELECT
             id
            ,operacion
            ,cambio_notificado
            ,fecha_creacion
            ,fecha_modificacion

            ,client_id
            ,adrnam
            ,host_ext_id
            ,activo
		FROM #deleted a
	END
    
    COMMIT TRANSACTION
END TRY
BEGIN CATCH
    SELECT ERROR_MESSAGE()
	ROLLBACK TRANSACTION
    ;THROW;
END CATCH