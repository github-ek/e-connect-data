CREATE PROCEDURE [dbo].[SincronizarMaestroBodegas]
AS
BEGIN TRY
	DECLARE @fecha_desde DATETIME
	DECLARE @fecha_hasta DATETIME

    BEGIN TRANSACTION

    EXECUTE dbo.GetFechasIntegracion 'BODEGAS', @fecha_desde OUTPUT, @fecha_hasta OUTPUT

    --CONSOLIDACION SOURCE
	BEGIN
		IF OBJECT_ID('tempdb..#source') IS NOT NULL BEGIN
			DROP TABLE #source
		END

		;WITH
		cte_00 AS
		(
            SELECT
                 a.wh_id
                ,COALESCE(UPPER(b.adrnam),'') AS adrnam
                ,COALESCE(UPPER(b.adrln1),'') AS adrln1
                ,COALESCE(UPPER(b.adrcty),'') AS adrcty
                ,COALESCE(a.moddte,CAST('1900-01-01' AS DATETIME)) AS moddte
                ,COALESCE(a.mod_usr_id,'') AS mod_usr_id
            FROM [$(ttcwmsprd)].dbo.wh a
            INNER JOIN [$(ttcwmsprd)].dbo.adrmst b ON
                b.adr_id = a.adr_id
            WHERE 0 = 0
            AND a.wh_id NOT IN ('WMD1')
            AND a.moddte >= @fecha_desde
            AND a.moddte <= @fecha_hasta
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
        INNER JOIN dbo.bodegas b ON
            b.wh_id = a.wh_id
        WHERE NOT (1 = 1
        AND a.adrnam = b.adrnam
        AND a.adrln1 = b.adrln1
        AND a.adrcty = b.adrcty
        AND a.moddte = b.moddte)
        
        UPDATE a
        SET a.operacion = 'C'
        FROM #source a
        LEFT OUTER JOIN dbo.bodegas b ON
            b.wh_id = a.wh_id
        WHERE
            b.wh_id IS NULL
    END

    --CONSOLIDACION DE REGISTROS inserted/deleted
    BEGIN
		IF OBJECT_ID('tempdb..#not_matched') IS NOT NULL BEGIN
			DROP TABLE #not_matched
		END

        SELECT
            a.*
        INTO #not_matched
        FROM dbo.bodegas a
        LEFT OUTER JOIN [$(ttcwmsprd)].dbo.wh b ON
            b.wh_id = a.wh_id
        AND a.wh_id NOT IN ('WMD1')
        WHERE
            b.wh_id IS NULL
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
            INNER JOIN dbo.bodegas b ON
                b.wh_id = a.wh_id
            WHERE
                a.operacion IN  ('U')
        ),
        cte_01 AS
        (
            SELECT * FROM cte_matched
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
		FROM dbo.bodegas a
		INNER JOIN #deleted b ON
			b.id = a.id
        
		INSERT INTO dbo.bodegas
			(operacion
            ,fecha_creacion
            ,fecha_modificacion

            ,wh_id
            ,adrnam
            ,adrln1
            ,adrcty
            ,moddte
            ,mod_usr_id)
		SELECT
			 operacion
            ,fecha_creacion
            ,fecha_modificacion

            ,wh_id
            ,adrnam
            ,adrln1
            ,adrcty
            ,moddte
            ,mod_usr_id
		FROM #inserted a
        WHERE
            a.operacion = 'C'

        SET IDENTITY_INSERT dbo.bodegas ON

		INSERT INTO dbo.bodegas
			(id
            ,operacion
            ,fecha_creacion
            ,fecha_modificacion

            ,wh_id
            ,adrnam
            ,adrln1
            ,adrcty
            ,moddte
            ,mod_usr_id)
		SELECT
             id
            ,operacion
            ,fecha_creacion
            ,fecha_modificacion

            ,wh_id
            ,adrnam
            ,adrln1
            ,adrcty
            ,moddte
            ,mod_usr_id
		FROM #inserted a
        WHERE
            a.operacion IN ('U','D')

        SET IDENTITY_INSERT dbo.bodegas OFF

		INSERT INTO logs.bodegas
			(id
            ,operacion
            ,cambio_notificado
            ,fecha_creacion
            ,fecha_modificacion

            ,wh_id
            ,adrnam
            ,adrln1
            ,adrcty
            ,moddte
            ,mod_usr_id)
		SELECT
             id
            ,operacion
            ,cambio_notificado
            ,fecha_creacion
            ,fecha_modificacion

            ,wh_id
            ,adrnam
            ,adrln1
            ,adrcty
            ,moddte
            ,mod_usr_id
		FROM #deleted a
	END
    
    COMMIT TRANSACTION
END TRY
BEGIN CATCH
    SELECT ERROR_MESSAGE()
	ROLLBACK TRANSACTION
    ;THROW;
END CATCH