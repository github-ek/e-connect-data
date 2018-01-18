
CREATE PROCEDURE [dbo].[SincronizarUbicaciones]
AS
BEGIN TRY
    --SET NOCOUNT ON;

	DECLARE @t AS TABLE(fecha_ultimo_pull DATETIME)
	DECLARE @fecha_pull DATETIME
	DECLARE @fecha_ultimo_pull DATETIME
    /*
	BEGIN TRANSACTION

	--OBTENER FECHA DE ULTIMO PULL
	BEGIN
		SET @fecha_pull = GETDATE()

		UPDATE a
		SET a.fecha_ultimo_pull = @fecha_pull
		OUTPUT deleted.fecha_ultimo_pull
		INTO @t(fecha_ultimo_pull)
		FROM dbo.integraciones a
		WHERE
			a.codigo = 'UBICACIONES'

        SELECT
		    @fecha_ultimo_pull = a.fecha_ultimo_pull
		FROM @t a
	END

	--CONSOLIDACION UBICACIONES
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
                COALESCE(a.last_upd_dt,a.ins_dt) AS last_upd_dt,
                COALESCE(a.last_upd_user_id,a.ins_user_id) AS last_upd_user_id
            FROM ttcwmsprd.dbo.locmst a
            INNER JOIN ttcwmsprd.dbo.aremst b ON
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
            ' ' AS operacion,
            @fecha_pull AS fecha_creacion,
            @fecha_pull AS fecha_modificacion,
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
        AND b.arecod = a.arecod
        AND b.stoloc = a.stoloc
        WHERE NOT (
            a.last_upd_dt = b.last_upd_dt
        AND a.last_upd_user_id = b.last_upd_user_id)     
        
        UPDATE a
        SET a.operacion = 'C'
        FROM #source a
        LEFT OUTER JOIN dbo.ubicaciones b ON
            b.wh_id = a.wh_id
        AND b.arecod = a.arecod
        AND b.stoloc = a.stoloc
        WHERE
            b.wh_id IS NULL
    END

	--CONSOLIDACION DE REGISTROS inserted/deleted
    BEGIN
		IF OBJECT_ID('tempdb..#not_in_source') IS NOT NULL BEGIN
			DROP TABLE #not_in_source
		END

        SELECT
            b.*
        INTO #not_in_source
        FROM dbo.ubicaciones a
        RIGHT OUTER JOIN #source b ON
            b.wh_id = a.wh_id
        AND b.arecod = a.arecod
        AND b.stoloc = a.stoloc
        WHERE
            b.wh_id IS NULL
        AND a.operacion <> 'D'

        --Los registros de la tabla ubicaciones que 
        --Se deben eliminar por id y cuyos datos se deben respaldar en las tablas de logs
        --Estos registros seran reemplazados por los nuevos datos en #inserted
		IF OBJECT_ID('tempdb..#deleted') IS NOT NULL BEGIN
			DROP TABLE #deleted
		END

        ;WITH
        cte_00 AS
        (
            SELECT
                b.*
            FROM #source a
            INNER JOIN dbo.ubicaciones b ON
                b.wh_id = a.wh_id
            AND b.arecod = a.arecod
            AND b.stoloc = a.stoloc
            WHERE
                a.operacion IN  ('U','D')
        ),
        cte_01 AS
        (
            SELECT * FROM cte_00 a
            UNION
            SELECT * FROM #not_in_source
        )
        SELECT
            a.*
        INTO #deleted
        FROM cte_01 a

        --Los registros nuevos C
        --Los registros modificados U. Nuevos datos 
        --Los registros eliminados D. Los datos eliminados con operacion D
        IF OBJECT_ID('tempdb..#inserted') IS NOT NULL BEGIN
			DROP TABLE #inserted
		END

        ;WITH 
        cte_00 AS
        (
            SELECT
                a.id,
                'D' AS operacion,
                a.fecha_creacion,
                @fecha_pull AS fecha_modificacion,

                a.wh_id,
                a.arecod,
                a.stoloc,
                a.wrkzon,
                a.last_upd_dt,
                a.last_upd_user_id
            FROM #not_in_source a 
        ),
        cte_01 AS
        (
            SELECT * FROM #source a WHERE a.operacion IN  ('C','U')
            UNION
            SELECT * FROM cte_00 a
        )
		SELECT
			a.*
		INTO #inserted
		FROM cte_01 a
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
			 a.operacion
            ,a.fecha_creacion
            ,a.fecha_modificacion
            ,a.wh_id
            ,a.arecod
            ,a.stoloc
            ,a.wrkzon
            ,a.last_upd_dt
            ,a.last_upd_user_id
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
             a.id
            ,a.operacion
            ,a.fecha_creacion
            ,a.fecha_modificacion
            ,a.wh_id
            ,a.arecod
            ,a.stoloc
            ,a.wrkzon
            ,a.last_upd_dt
            ,a.last_upd_user_id
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
             a.id
            ,a.operacion
            ,a.fecha_creacion
            ,a.fecha_modificacion
            ,a.wh_id
            ,a.arecod
            ,a.stoloc
            ,a.wrkzon
            ,a.last_upd_dt
            ,a.last_upd_user_id
		FROM #deleted a
	END

	COMMIT TRANSACTION
    */

END TRY
BEGIN CATCH
    SELECT ERROR_MESSAGE()
	ROLLBACK TRANSACTION
    ;THROW;
END CATCH


EXEC [dbo].[SincronizarUbicaciones]