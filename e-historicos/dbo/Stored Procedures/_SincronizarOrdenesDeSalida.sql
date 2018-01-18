--EXEC dbo.SincronizarOrdenesDeSalida

CREATE PROCEDURE [dbo].[_SincronizarOrdenesDeSalida]
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
			a.codigo = 'SALIDAS'

        SELECT
		    @fecha_ultimo_pull = a.fecha_ultimo_pull
		FROM @t a
	END

    --CONSOLIDACION TARGET
    BEGIN
		IF OBJECT_ID('tempdb..#target') IS NOT NULL BEGIN
			DROP TABLE #target
		END
        
        ;WITH
        cte_00 AS
        (
            SELECT DISTINCT
                a.client_id,
                a.wh_id,
                a.ordnum
            FROM dbo.salidas a
            WHERE
                a.shpsts NOT IN ('C','B')
        )
        SELECT
            a.*
        INTO #target
        FROM dbo.salidas a
        INNER JOIN cte_00 b ON
            b.client_id = a.client_id
        AND b.wh_id = a.wh_id
        AND b.ordnum = a.ordnum
    END

	--CONSOLIDACION ORD
	BEGIN
		IF OBJECT_ID('tempdb..#ord') IS NOT NULL BEGIN
			DROP TABLE #ord
		END

		;WITH
		cte_00 AS
		(
		    SELECT DISTINCT
                a.client_id,
                a.wh_id,
                a.ordnum
		    FROM #target a
        ),
		cte_01 AS
		(
            SELECT
                a.client_id,
                a.wh_id,
                a.ordnum
            FROM dbo.ord a
            INNER JOIN dbo.clientes b ON
                b.client_id = a.client_id
            LEFT OUTER JOIN cte_00 c ON
                c.client_id = a.client_id
            AND c.wh_id = a.wh_id
            AND c.ordnum = a.ordnum
            WHERE 0 = 0
            AND a.adddte >= @fecha_ultimo_pull
            AND a.adddte < @fecha_pull
            AND c.ordnum IS NULL
		),
        cte_02 AS
        (
            SELECT a.* FROM cte_00 a
            UNION
            SELECT a.* FROM cte_01 a
        )
		SELECT
            '' AS operacion,
            @fecha_pull AS fecha_creacion,
            @fecha_pull AS fecha_modificacion,
			a.*
		INTO #ord
		FROM cte_02 a
    END

	--CONSOLIDACION SOURCE
    BEGIN
		IF OBJECT_ID('tempdb..#source') IS NOT NULL BEGIN
			DROP TABLE #source
		END

        SELECT
            CAST(NULL AS BIGINT) AS id,
            a.operacion,
            a.fecha_creacion,
            a.fecha_modificacion,

            b.client_id,
            b.wh_id,
            b.ordnum,
            COALESCE(b.rmanum,'') AS rmanum,
            b.ordtyp,
            COALESCE(b.bus_grp,'') AS bus_grp,
            COALESCE(b.stcust,'') AS stcust,
            COALESCE(b.wave_flg,0) AS wave_flg,
            b.adddte,
            b.moddte,
            b.mod_usr_id,

            c.ordlin,
            COALESCE(c.prtnum,'') AS prtnum,
            c.ordqty,
            c.shpqty,
            c.invsts_prg,
            COALESCE(c.moddte,CAST('1900-01-01' AS DATETIME)) AS ordlin_moddte,
            COALESCE(c.mod_usr_id,'') AS ordlin_mod_usr_id,

            COALESCE(f.value,'') AS lotnum,
            COALESCE(f.last_upd_dt,CAST('1900-01-01' AS DATETIME)) AS lotnum_last_upd_dt,
            COALESCE(f.last_upd_user_id,'') AS lotnum_last_upd_user_id,

            COALESCE(e.shpsts,'') AS shpsts,
            COALESCE(e.loddte,CAST('1900-01-01' AS DATETIME)) AS shipment_loddte,
            COALESCE(e.moddte,CAST('1900-01-01' AS DATETIME)) AS shipment_moddte,
            COALESCE(e.mod_usr_id,'') AS shipment_mod_usr_id,

            COALESCE(d.linsts,'') AS linsts,
            COALESCE(d.stgqty,0) AS shipment_line_stgqty,
            COALESCE(d.shpqty,0) AS shipment_line_shpqty,
            COALESCE(d.moddte,CAST('1900-01-01' AS DATETIME)) AS shipment_line_moddte,
            COALESCE(d.mod_usr_id,'') AS shipment_line_mod_usr_id
        INTO #source
        FROM #ord a
        INNER JOIN dbo.ord b ON
            b.client_id = a.client_id
        AND b.wh_id = a.wh_id
        AND b.ordnum = a.ordnum
        INNER JOIN dbo.ord_line c ON 
            c.client_id = b.client_id
        AND c.wh_id = b.wh_id
        AND c.ordnum = b.ordnum
        LEFT OUTER JOIN dbo.shipment_line d ON 
            d.client_id = c.client_id
        AND d.wh_id = c.wh_id
        AND d.ordnum = c.ordnum
        AND d.ordlin = c.ordlin
        AND d.linsts NOT IN ('B')
        LEFT OUTER JOIN dbo.shipment e ON 
            e.wh_id = d.wh_id
        AND e.ship_id = d.ship_id
        LEFT OUTER JOIN dbo.alloc_rule_dtl f ON 
            f.rule_nam = c.rule_nam
        AND f.wh_id = c.wh_id
        AND f.field_name = 'lotnum'
        ------------------------------------------------------------------------------------
        --BEGIN TODO cambiar modelo debido a que una linea puede aparecer en varios shipment line
        ------------------------------------------------------------------------------------
        ;WITH
        cte_00 AS
        (
            SELECT DISTINCT
                client_id,wh_id,ordnum
            FROM #source
            GROUP BY
                client_id,wh_id,ordnum,ordlin
            HAVING COUNT(1)>1
        )
        DELETE a
        FROM #source a
        INNER JOIN cte_00 b ON
            b.client_id = a.client_id
        AND b.wh_id = a.wh_id
        AND b.ordnum = a.ordnum
        ------------------------------------------------------------------------------------
        --END TODO
        ------------------------------------------------------------------------------------

        CREATE UNIQUE INDEX ix_source_01 ON #source(client_id,wh_id,ordnum,ordlin)
    END

    --CORRECION SHPSTS
    BEGIN
		IF OBJECT_ID('tempdb..#correccion_shpsts') IS NOT NULL BEGIN
			DROP TABLE #correccion_shpsts
		END

        ;WITH
        cte_00 AS
        (
            SELECT
                 a.client_id
                ,a.wh_id
                ,a.ordnum
                ,MIN(a.shpsts) AS min_shpsts
                ,MAX(a.shpsts) AS max_shpsts
                ,COUNT(DISTINCT a.shpsts) AS n
            FROM #source a
            GROUP BY
                 a.client_id
                ,a.wh_id
                ,a.ordnum
            HAVING
                COUNT(DISTINCT a.shpsts) > 1
        )
        SELECT
            a.*
        INTO #correccion_shpsts
        FROM cte_00 a

        UPDATE a
        SET a.shpsts = b.max_shpsts
        FROM #source a
        INNER JOIN #correccion_shpsts b ON
            b.client_id = a.client_id
        AND b.wh_id = a.wh_id
        AND b.ordnum = a.ordnum
        AND b.min_shpsts = a.shpsts             
        WHERE
            b.n = 2 AND b.min_shpsts = ''
    END

    --MERGE
    BEGIN
        UPDATE a
        SET a.id = b.id,
            a.operacion = 'U',
            a.fecha_creacion = b.fecha_creacion
        FROM #source a
        INNER JOIN #target b ON
			b.client_id = a.client_id
		AND b.wh_id = a.wh_id
		AND b.ordnum = a.ordnum
		AND b.ordlin = a.ordlin
        WHERE NOT (
            b.moddte = a.moddte 
        AND b.ordlin_moddte = a.ordlin_moddte
        AND b.lotnum_last_upd_user_id = a.lotnum_last_upd_user_id
        AND b.shipment_moddte = a.shipment_moddte
        AND b.shipment_line_moddte = a.shipment_line_moddte)     
        
        UPDATE a
        SET a.operacion = 'C'
        FROM #source a
        LEFT OUTER JOIN #target b ON
			b.client_id = a.client_id
		AND b.wh_id = a.wh_id
		AND b.ordnum = a.ordnum
		AND b.ordlin = a.ordlin
        WHERE
            b.ordnum IS NULL
    END

	--dboSOLIDACION DE REGISTROS inserted/deleted
    BEGIN
		IF OBJECT_ID('tempdb..#inserted') IS NOT NULL BEGIN
			DROP TABLE #inserted
		END

		SELECT
			a.*
		INTO #inserted
		FROM #source a
		WHERE
			a.operacion IN  ('C','U')

		IF OBJECT_ID('tempdb..#deleted') IS NOT NULL BEGIN
			DROP TABLE #deleted
		END

        SELECT
            a.*
        INTO #deleted
        FROM #target a
        LEFT OUTER JOIN #source b ON
			b.client_id = a.client_id
		AND b.wh_id = a.wh_id
		AND b.ordnum = a.ordnum
		AND b.ordlin = a.ordlin
        WHERE
            b.operacion IN  ('U') OR b.ordnum IS NULL
    END
    
    --ACTUALIZACION TARGET/LOGS
    BEGIN
		DELETE a
		FROM dbo.salidas a
		INNER JOIN #deleted b ON
			b.id = a.id
        
		INSERT INTO dbo.salidas
			(operacion
            ,fecha_creacion
            ,fecha_modificacion
            ,client_id
            ,wh_id
            ,ordnum
            ,rmanum
            ,ordtyp
            ,bus_grp
            ,stcust
            ,wave_flg
            ,adddte
            ,moddte
            ,mod_usr_id
            ,ordlin
            ,prtnum
            ,ordqty
            ,shpqty
            ,invsts_prg
            ,ordlin_moddte
            ,ordlin_mod_usr_id
            --,lotnum
            --,lotnum_last_upd_dt
            --,lotnum_last_upd_user_id
            --,shpsts
            --,shipment_loddte
            --,shipment_moddte
            --,shipment_mod_usr_id
            --,linsts
            --,shipment_line_stgqty
            --,shipment_line_shpqty
            --,shipment_line_moddte
            --,shipment_line_mod_usr_id
            )
		SELECT
			 a.operacion
            ,a.fecha_creacion
            ,a.fecha_modificacion
            ,a.client_id
            ,a.wh_id
            ,a.ordnum
            ,a.rmanum
            ,a.ordtyp
            ,a.bus_grp
            ,a.stcust
            ,a.wave_flg
            ,a.adddte
            ,a.moddte
            ,a.mod_usr_id
            ,a.ordlin
            ,a.prtnum
            ,a.ordqty
            ,a.shpqty
            ,a.invsts_prg
            ,a.ordlin_moddte
            ,a.ordlin_mod_usr_id
            ,a.lotnum
            ,a.lotnum_last_upd_dt
            ,a.lotnum_last_upd_user_id
            ,a.shpsts
            ,a.shipment_loddte
            ,a.shipment_moddte
            ,a.shipment_mod_usr_id
            ,a.linsts
            ,a.shipment_line_stgqty
            ,a.shipment_line_shpqty
            ,a.shipment_line_moddte
            ,a.shipment_line_mod_usr_id
		FROM #inserted a
        WHERE
            a.operacion = 'C'

        SET IDENTITY_INSERT dbo.salidas ON

		INSERT INTO dbo.salidas
			(id
            ,operacion
            ,fecha_creacion
            ,fecha_modificacion
            ,client_id
            ,wh_id
            ,ordnum
            ,rmanum
            ,ordtyp
            ,bus_grp
            ,stcust
            ,wave_flg
            ,adddte
            ,moddte
            ,mod_usr_id
            ,ordlin
            ,prtnum
            ,ordqty
            ,shpqty
            ,invsts_prg
            ,ordlin_moddte
            ,ordlin_mod_usr_id
            ,lotnum
            ,lotnum_last_upd_dt
            ,lotnum_last_upd_user_id
            ,shpsts
            ,shipment_loddte
            ,shipment_moddte
            ,shipment_mod_usr_id
            ,linsts
            ,shipment_line_stgqty
            ,shipment_line_shpqty
            ,shipment_line_moddte
            ,shipment_line_mod_usr_id)
		SELECT
             a.id
			,a.operacion
            ,a.fecha_creacion
            ,a.fecha_modificacion
            ,a.client_id
            ,a.wh_id
            ,a.ordnum
            ,a.rmanum
            ,a.ordtyp
            ,a.bus_grp
            ,a.stcust
            ,a.wave_flg
            ,a.adddte
            ,a.moddte
            ,a.mod_usr_id
            ,a.ordlin
            ,a.prtnum
            ,a.ordqty
            ,a.shpqty
            ,a.invsts_prg
            ,a.ordlin_moddte
            ,a.ordlin_mod_usr_id
            ,a.lotnum
            ,a.lotnum_last_upd_dt
            ,a.lotnum_last_upd_user_id
            ,a.shpsts
            ,a.shipment_loddte
            ,a.shipment_moddte
            ,a.shipment_mod_usr_id
            ,a.linsts
            ,a.shipment_line_stgqty
            ,a.shipment_line_shpqty
            ,a.shipment_line_moddte
            ,a.shipment_line_mod_usr_id
		FROM #inserted a
        WHERE
            a.operacion = 'U'

        SET IDENTITY_INSERT dbo.salidas OFF

		INSERT INTO logs.salidas
			(id
            ,operacion
            ,fecha_creacion
            ,fecha_modificacion
            ,client_id
            ,wh_id
            ,ordnum
            ,rmanum
            ,ordtyp
            ,bus_grp
            ,stcust
            ,wave_flg
            ,adddte
            ,moddte
            ,mod_usr_id
            ,ordlin
            ,prtnum
            ,ordqty
            ,shpqty
            ,invsts_prg
            ,ordlin_moddte
            ,ordlin_mod_usr_id
            ,lotnum
            ,lotnum_last_upd_dt
            ,lotnum_last_upd_user_id
            ,shpsts
            ,shipment_loddte
            ,shipment_moddte
            ,shipment_mod_usr_id
            ,linsts
            ,shipment_line_stgqty
            ,shipment_line_shpqty
            ,shipment_line_moddte
            ,shipment_line_mod_usr_id)
		SELECT
             a.id
			,a.operacion
            ,a.fecha_creacion
            ,a.fecha_modificacion
            ,a.client_id
            ,a.wh_id
            ,a.ordnum
            ,a.rmanum
            ,a.ordtyp
            ,a.bus_grp
            ,a.stcust
            ,a.wave_flg
            ,a.adddte
            ,a.moddte
            ,a.mod_usr_id
            ,a.ordlin
            ,a.prtnum
            ,a.ordqty
            ,a.shpqty
            ,a.invsts_prg
            ,a.ordlin_moddte
            ,a.ordlin_mod_usr_id
            ,a.lotnum
            ,a.lotnum_last_upd_dt
            ,a.lotnum_last_upd_user_id
            ,a.shpsts
            ,a.shipment_loddte
            ,a.shipment_moddte
            ,a.shipment_mod_usr_id
            ,a.linsts
            ,a.shipment_line_stgqty
            ,a.shipment_line_shpqty
            ,a.shipment_line_moddte
            ,a.shipment_line_mod_usr_id
		FROM #deleted a
	END
    */
	COMMIT TRANSACTION
END TRY
BEGIN CATCH
    SELECT ERROR_MESSAGE()
	ROLLBACK TRANSACTION
    ;THROW;
END CATCH
