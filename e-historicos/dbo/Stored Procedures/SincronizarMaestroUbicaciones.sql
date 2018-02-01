
CREATE PROCEDURE [dbo].[SincronizarMaestroUbicaciones]
AS
BEGIN TRY
	DECLARE @fecha_desde DATETIME
	DECLARE @fecha_hasta DATETIME

    BEGIN TRANSACTION

    EXECUTE dbo.GetFechasIntegracion 'UBICACIONES', @fecha_desde OUTPUT, @fecha_hasta OUTPUT

    --CONSOLIDACION SOURCE
	BEGIN
		IF OBJECT_ID('tempdb..#source') IS NOT NULL BEGIN
			DROP TABLE #source
		END

		;WITH
		cte_00 AS
		(
            SELECT
                a.wh_id,
                a.arecod,
                a.stoloc,
                a.wrkzon,
                COALESCE(a.last_upd_dt,a.ins_dt,CAST('1900-01-01' AS DATETIME)) AS last_upd_dt,
                COALESCE(a.last_upd_user_id,a.ins_user_id,'') AS last_upd_user_id
            FROM [$(ttcwmsprd)].dbo.locmst a
            INNER JOIN [$(ttcwmsprd)].dbo.aremst b ON
                a.wh_id = b.wh_id
            AND a.arecod = b.arecod
            WHERE 
                (b.fwiflg = 1 OR b.prd_stgflg = 1)
            AND b.rdtflg = 0
            AND b.shp_dck_flg = 0
            AND b.rcv_dck_flg = 0
            AND b.adjflg = 0
            AND b.shpflg = 0
            AND b.def_rplcfg_pctflg = 1
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
        INNER JOIN dbo.ubicaciones b ON
            b.wh_id = a.wh_id
        AND b.stoloc = a.stoloc
        WHERE NOT (
            a.last_upd_dt = b.last_upd_dt)     
        
        UPDATE a
        SET a.operacion = 'C'
        FROM #source a
        LEFT OUTER JOIN dbo.ubicaciones b ON
            b.wh_id = a.wh_id
        AND b.stoloc = a.stoloc
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
        FROM dbo.ubicaciones a
        RIGHT OUTER JOIN #source b ON
            b.wh_id = a.wh_id
        AND b.stoloc = a.stoloc
        WHERE
            b.wh_id IS NULL
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
            INNER JOIN dbo.ubicaciones b ON
                b.wh_id = a.wh_id
            AND b.stoloc = a.stoloc
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
		FROM dbo.ubicaciones a
		INNER JOIN #deleted b ON
			b.id = a.id
        
		INSERT INTO dbo.ubicaciones
			(operacion
            ,fecha_creacion
            ,fecha_modificacion

            ,wh_id
            ,arecod
            ,stoloc
            ,wrkzon
            ,last_upd_dt
            ,last_upd_user_id)
		SELECT
			 operacion
            ,fecha_creacion
            ,fecha_modificacion

            ,wh_id
            ,arecod
            ,stoloc
            ,wrkzon
            ,last_upd_dt
            ,last_upd_user_id
		FROM #inserted a
        WHERE
            a.operacion = 'C'

        SET IDENTITY_INSERT dbo.ubicaciones ON

		INSERT INTO dbo.ubicaciones
			(id
            ,operacion
            ,fecha_creacion
            ,fecha_modificacion

            ,wh_id
            ,arecod
            ,stoloc
            ,wrkzon
            ,last_upd_dt
            ,last_upd_user_id)
		SELECT
             id
            ,operacion
            ,fecha_creacion
            ,fecha_modificacion

            ,wh_id
            ,arecod
            ,stoloc
            ,wrkzon
            ,last_upd_dt
            ,last_upd_user_id
		FROM #inserted a
        WHERE
            a.operacion IN ('U','D')

        SET IDENTITY_INSERT dbo.ubicaciones OFF

		INSERT INTO logs.ubicaciones
			(id
            ,operacion
            ,fecha_creacion
            ,fecha_modificacion

            ,wh_id
            ,arecod
            ,stoloc
            ,wrkzon
            ,last_upd_dt
            ,last_upd_user_id)
		SELECT
             id
            ,operacion
            ,fecha_creacion
            ,fecha_modificacion
            
            ,wh_id
            ,arecod
            ,stoloc
            ,wrkzon
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