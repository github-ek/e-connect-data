CREATE PROCEDURE [dbo].[SincronizarMaestroProductosCodigos]
AS
BEGIN TRY
	DECLARE @fecha_desde DATETIME
	DECLARE @fecha_hasta DATETIME

    BEGIN TRANSACTION

    EXECUTE dbo.GetFechasIntegracion 'PRODUCTOS_CODIGOS', @fecha_desde OUTPUT, @fecha_hasta OUTPUT

    --CONSOLIDACION SOURCE
	BEGIN
		IF OBJECT_ID('tempdb..#source') IS NOT NULL BEGIN
			DROP TABLE #source
		END

		;WITH
		cte_00 AS
		(
            SELECT
                 a.prt_client_id
                ,a.prtnum
                ,a.alt_prtnum
                ,a.alt_prt_typ
				,COALESCE(a.last_upd_dt,CAST('1900-01-01' AS DATETIME)) AS last_upd_dt
				,COALESCE(a.last_upd_user_id,'') AS last_upd_user_id
            FROM [$(ttcwmsprd)].dbo.alt_prtmst a
            WHERE 0 = 0
            AND a.last_upd_dt >= @fecha_desde 
            AND a.last_upd_dt <= @fecha_hasta
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
        INNER JOIN dbo.productos_codigos b ON
            b.prt_client_id = a.prt_client_id
        AND b.prtnum = a.prtnum
        AND b.alt_prtnum = a.alt_prtnum
        AND b.alt_prt_typ = a.alt_prt_typ
        WHERE NOT (
            a.last_upd_dt = b.last_upd_dt)     
        
        UPDATE a
        SET a.operacion = 'C'
        FROM #source a
        LEFT OUTER JOIN dbo.productos_codigos b ON
            b.prt_client_id = a.prt_client_id
        AND b.prtnum = a.prtnum
        AND b.alt_prtnum = a.alt_prtnum
        AND b.alt_prt_typ = a.alt_prt_typ
        WHERE
            b.prt_client_id IS NULL
    END

    --CONSOLIDACION DE REGISTROS inserted/deleted
    BEGIN
		IF OBJECT_ID('tempdb..#not_matched') IS NOT NULL BEGIN
			DROP TABLE #not_matched
		END

        SELECT
            a.*
        INTO #not_matched
        FROM dbo.productos_codigos a
        LEFT OUTER JOIN [$(ttcwmsprd)].dbo.alt_prtmst b ON
            b.prt_client_id = a.prt_client_id
        AND b.prtnum = a.prtnum
        AND b.alt_prtnum = a.alt_prtnum
        AND b.alt_prt_typ = a.alt_prt_typ
        WHERE
            b.prt_client_id IS NULL
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
            INNER JOIN dbo.productos_codigos b ON
                b.prt_client_id = a.prt_client_id
            AND b.prtnum = a.prtnum
            AND b.alt_prtnum = a.alt_prtnum
            AND b.alt_prt_typ = a.alt_prt_typ
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
		FROM dbo.productos_codigos a
		INNER JOIN #deleted b ON
			b.id = a.id
        
		INSERT INTO dbo.productos_codigos
			(operacion
            ,fecha_creacion
            ,fecha_modificacion

            ,prt_client_id
            ,prtnum
            ,alt_prtnum
            ,alt_prt_typ
			,last_upd_dt
			,last_upd_user_id)
		SELECT
			 operacion
            ,fecha_creacion
            ,fecha_modificacion

            ,prt_client_id
            ,prtnum
            ,alt_prtnum
            ,alt_prt_typ
			,last_upd_dt
			,last_upd_user_id
		FROM #inserted a
        WHERE
            a.operacion = 'C'

        SET IDENTITY_INSERT dbo.productos_codigos ON

		INSERT INTO dbo.productos_codigos
			(id
            ,operacion
            ,fecha_creacion
            ,fecha_modificacion

            ,prt_client_id
            ,prtnum
            ,alt_prtnum
            ,alt_prt_typ
			,last_upd_dt
			,last_upd_user_id)
		SELECT
             id
            ,operacion
            ,fecha_creacion
            ,fecha_modificacion

            ,prt_client_id
            ,prtnum
            ,alt_prtnum
            ,alt_prt_typ
			,last_upd_dt
			,last_upd_user_id
		FROM #inserted a
        WHERE
            a.operacion IN ('U','D')

        SET IDENTITY_INSERT dbo.productos_codigos OFF

		INSERT INTO logs.productos_codigos
			(id
            ,operacion
            ,cambio_notificado
            ,fecha_creacion
            ,fecha_modificacion

            ,prt_client_id
            ,prtnum
            ,alt_prtnum
            ,alt_prt_typ
			,last_upd_dt
			,last_upd_user_id)
		SELECT
             id
            ,operacion
            ,cambio_notificado
            ,fecha_creacion
            ,fecha_modificacion

            ,prt_client_id
            ,prtnum
            ,alt_prtnum
            ,alt_prt_typ
			,last_upd_dt
			,last_upd_user_id
		FROM #deleted a
	END
    
    COMMIT TRANSACTION
END TRY
BEGIN CATCH
    SELECT ERROR_MESSAGE()
	ROLLBACK TRANSACTION
    ;THROW;
END CATCH