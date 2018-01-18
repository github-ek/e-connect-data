CREATE PROCEDURE [dbo].[SincronizarOrdenesDeSalida]
AS
BEGIN TRY
    --SET NOCOUNT ON;

    BEGIN TRANSACTION

	DECLARE @t AS TABLE(fecha_ultimo_pull DATETIME)
	DECLARE @fecha_pull DATETIME
	DECLARE @fecha_ultimo_pull DATETIME

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

    --CONSOLIDACION TARGET: Las ordenes que continuan ABIERTAS en la tabla destino
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
                a.estado = 'ABIERTA'
            AND a.fecha_creacion >= CAST(DATEADD(MONTH,-1,GETDATE()) AS DATE) 
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

	--CONSOLIDACION ORD: Se toman del origen, las ordenes nuevas y/o modificadas recientemente y aquellas que crucen contra el target (ABIERTAS en el destino)
	BEGIN
		IF OBJECT_ID('tempdb..#source_ord_line') IS NOT NULL BEGIN
			DROP TABLE #source_ord_line
		END

        SELECT DISTINCT
            a.client_id,
            a.wh_id,
            a.ordnum
        INTO #source_ord_line
        FROM [$(ttcwmsprd)].dbo.ord_line a
        INNER JOIN dbo.clientes b ON
            b.client_id = a.client_id
        WHERE 0 = 0
        AND a.moddte >= @fecha_ultimo_pull
        AND a.moddte < @fecha_pull

		IF OBJECT_ID('tempdb..#source_canpck') IS NOT NULL BEGIN
			DROP TABLE #source_canpck
		END

        SELECT DISTINCT
            a.client_id,
            a.wh_id,
            a.ordnum
        INTO #source_canpck
        FROM [$(ttcwmsprd)].dbo.canpck a
        INNER JOIN dbo.clientes b ON
            b.client_id = a.client_id
        WHERE 0 = 0
        AND a.candte >= @fecha_ultimo_pull
        AND a.candte < @fecha_pull
        AND a.cancod IN ('M-F','P-AV','P-NC','NO-DESP3')

		IF OBJECT_ID('tempdb..#source_ord') IS NOT NULL BEGIN
			DROP TABLE #source_ord
		END

		;WITH
		cte_00 AS
		(
		    SELECT
                a.client_id,
                a.wh_id,
                a.ordnum
		    FROM #target a
            UNION
		    SELECT
                a.client_id,
                a.wh_id,
                a.ordnum
		    FROM #source_ord_line a
            UNION
		    SELECT
                a.client_id,
                a.wh_id,
                a.ordnum
		    FROM #source_canpck a
        )
		SELECT
            '' AS operacion,
            @fecha_pull AS fecha_creacion,
            @fecha_pull AS fecha_modificacion,
			a.*
		INTO #source_ord
        FROM cte_00 a
    END
    
	--CONSOLIDACION CANPCK
    BEGIN
		IF OBJECT_ID('tempdb..#canpck') IS NOT NULL BEGIN
			DROP TABLE #canpck
		END

        ;WITH
        cte_00 AS
        (
            SELECT
                 a.client_id
                ,a.wh_id	
                ,a.ordnum	
                ,a.ordlin	
                ,a.prtnum
                ,a.invsts
                ,a.invsts_prg
                ,a.cancod
                ,SUM(a.remqty) OVER(PARTITION BY a.client_id, a.wh_id, a.ordnum, a.ordlin, a.cancod) AS remqty
                ,a.candte
                ,a.can_usr_id
                ,ROW_NUMBER() OVER(PARTITION BY a.client_id, a.wh_id, a.ordnum, a.ordlin, a.cancod ORDER BY a.candte DESC) AS orden
            FROM [$(ttcwmsprd)].dbo.canpck a
            INNER JOIN #source_canpck b ON
                b.client_id = a.client_id
            AND b.wh_id	= a.wh_id
            AND b.ordnum = a.ordnum
            WHERE 0 = 0
            AND a.cancod IN ('M-F','P-AV','P-NC','NO-DESP3')
        )
        SELECT
            *
        INTO #canpck
        FROM cte_00 a
        WHERE
            a.orden = 1
    END

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
                ,a.wh_id	
                ,a.ordnum	
                ,a.ordlin	
                ,SUM(a.remqty) OVER(PARTITION BY a.client_id, a.wh_id, a.ordnum, a.ordlin) AS remqty
                ,a.candte
                ,a.can_usr_id
                ,ROW_NUMBER() OVER(PARTITION BY a.client_id, a.wh_id, a.ordnum, a.ordlin ORDER BY a.candte DESC) AS orden
            FROM #canpck a
        )
        SELECT
            CAST(NULL AS BIGINT) AS id,
            a.operacion,
            'ABIERTA' AS estado,
            CAST(0 AS BIT) AS cierre_notificado,
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
            c.invsts_prg,
            c.ordqty,
            c.shpqty,
            COALESCE(d.remqty,0) AS remqty,
            COALESCE(c.moddte,CAST('1900-01-01' AS DATETIME)) AS ordlin_moddte,
            COALESCE(c.mod_usr_id,'') AS ordlin_mod_usr_id,
            COALESCE(d.candte,CAST('1900-01-01' AS DATETIME)) AS canpck_candte,
            COALESCE(d.can_usr_id,'') AS canpck_can_usr_id
        INTO #source
        FROM #source_ord a
        INNER JOIN [$(ttcwmsprd)].dbo.ord b ON
            b.client_id = a.client_id
        AND b.wh_id = a.wh_id
        AND b.ordnum = a.ordnum
        INNER JOIN [$(ttcwmsprd)].dbo.ord_line c ON 
            c.client_id = b.client_id
        AND c.wh_id = b.wh_id
        AND c.ordnum = b.ordnum
        LEFT OUTER JOIN cte_00 d ON
            d.client_id = c.client_id
        AND d.wh_id = c.wh_id
        AND d.ordnum = c.ordnum
        AND d.ordlin = c.ordlin
        AND d.orden = 1

        CREATE UNIQUE INDEX ix_source_01 ON #source(client_id,wh_id,ordnum,ordlin)
    END

    --DETECCION DE ORDENES CERRADAS
    BEGIN
        --Cuando la cantidad solicitada (ordqty) sea igual a la cantidad despachada(shpqty) y la cancelada (remqty)
        --para todas las linea de una orden. En ese momento la orden pasará al estado CERRADA
        ;WITH
        cte_00 AS
        (
            SELECT
                 a.client_id
                ,a.wh_id
                ,a.ordnum
                ,SUM(CASE WHEN a.ordqty - (a.shpqty + a.remqty) <> 0 THEN 1 ELSE 0 END) AS lineas_abiertas
            FROM #source a
            GROUP BY
                 a.client_id
                ,a.wh_id
                ,a.ordnum
            HAVING
                SUM(CASE WHEN a.ordqty - (a.shpqty + a.remqty) <> 0 THEN 1 ELSE 0 END) = 0
        )
        UPDATE a
        SET a.estado = 'CERRADA'
        FROM #source a
        INNER JOIN cte_00 b ON
            b.client_id = a.client_id
        AND b.wh_id = a.wh_id
        AND b.ordnum = a.ordnum
    END
    
    --MERGE: Los cambios se detectan teniendo en cuenta unicamente las fechas de modificacion.
    BEGIN
        --Si cruzan contra la tabla target por PK pero difiere en las fechas de modificación => UPDATE
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
        AND b.canpck_candte = a.canpck_candte)     
        
        --Si no cruzan contra la tabla target por PK => CREATE
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
        
        --Un registro que hasta este punto corresponda a una operación CREATE (no cruzar contra el target), 
        --se debe cruzar contra todas las ordenes en el destino para verificar que no este cruzando contra una orden CERRADA
        --Las ordenes CERRADAS no se incluyen en el target, por tanto los registros que crucen serán modificaciones posteriores al cierre de la orden
        --y serán un error. 
        UPDATE a
        SET a.id = b.id,
            a.operacion = 'E',
            a.fecha_creacion = b.fecha_creacion
        FROM #source a
        INNER JOIN dbo.salidas b ON
			b.client_id = a.client_id
		AND b.wh_id = a.wh_id
		AND b.ordnum = a.ordnum
		AND b.ordlin = a.ordlin
        WHERE
            a.operacion = 'C'
    END

	--CONSOLIDACION DE REGISTROS inserted/deleted
    BEGIN
        --Las operaciones CREATE y UPDATE deben ser insertadas en la tabla destino
		IF OBJECT_ID('tempdb..#inserted') IS NOT NULL BEGIN
			DROP TABLE #inserted
		END

		SELECT
			a.*
		INTO #inserted
		FROM #source a
		WHERE
			a.operacion IN  ('C','U')

        --En la tabla destino se deben eliminar las versiones antiguas de los registros que se van a insertar
        --En la tabla destino solo se mantiene la ultima versión de cada registro.
        --Los registros eliminados de la tabla destino se pasarán luego al log
		IF OBJECT_ID('tempdb..#deleted') IS NOT NULL BEGIN
			DROP TABLE #deleted
		END

        ;WITH
        cte_00 AS
        (
            SELECT
                a.*
            FROM #target a
            LEFT OUTER JOIN #source b ON
			    b.client_id = a.client_id
		    AND b.wh_id = a.wh_id
		    AND b.ordnum = a.ordnum
		    AND b.ordlin = a.ordlin
            WHERE
                b.operacion IN  ('U') OR b.ordnum IS NULL
            --Si un registro en target no cruza con source, es porque ha sido eliminado en el origen y deberá ser eliminado del destino
            --Si un registro en target cruza con source, y la operación es un UPDATE, deberá ser eliminado del destino y pasado al log
        ),
        cte_01 AS
        (
		    SELECT
			    a.*
		    FROM #source a
		    WHERE
			    a.operacion IN  ('E')
            --Se incluyen los registros con errores (cambios despues de cerrada la orden) en este consolidado para luego incluirlo en el log.
            --Aunque los registros con error han sido incluidos en este consolidado, estos casos no serán eliminados de la tabla destino.
            --Se incluyen aqui porque todo lo "eliminado", se incluye luego en el log. 
            --La idea es que en el log queden todos los cambios, pero en la tabla destino solo quedará el ultimo cambio antes del cierre de la orden
        ),
        cte_02 AS
        (
            SELECT * 
            FROM cte_00 a
            UNION
            SELECT * 
            FROM cte_01 a
        )
        SELECT
            *
        INTO #deleted
        FROM cte_02 a
    END
    
    --ACTUALIZACION TARGET/LOGS
    BEGIN
        --Eliminar del destino todos los registros que esten en el consolidado de eliminados, excepto los errores por cambios posteriores al cierre. 
        --De este modo en la tabla destino solo queda la version con la que se hizo el cierre de la orden.
		DELETE a
		FROM dbo.salidas a
		INNER JOIN #deleted b ON
			b.id = a.id
        WHERE
            a.operacion NOT IN ('E')

        --CREATE
		INSERT INTO dbo.salidas
			(operacion
            ,estado
            ,cierre_notificado
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
            ,invsts_prg
            ,ordqty
            ,shpqty
            ,remqty
            ,ordlin_moddte
            ,ordlin_mod_usr_id
            ,canpck_candte
            ,canpck_can_usr_id)
		SELECT
			 a.operacion
            ,a.estado
            ,a.cierre_notificado
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
            ,a.invsts_prg
            ,a.ordqty
            ,a.shpqty
            ,a.remqty
            ,a.ordlin_moddte
            ,a.ordlin_mod_usr_id
            ,a.canpck_candte
            ,a.canpck_can_usr_id
		FROM #inserted a
        WHERE
            a.operacion = 'C'

        --UPDATE
        SET IDENTITY_INSERT dbo.salidas ON

		INSERT INTO dbo.salidas
			(id
            ,operacion
            ,estado
            ,cierre_notificado
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
            ,invsts_prg
            ,ordqty
            ,shpqty
            ,remqty
            ,ordlin_moddte
            ,ordlin_mod_usr_id
            ,canpck_candte
            ,canpck_can_usr_id)
		SELECT
             a.id
            ,a.operacion
            ,a.estado
            ,a.cierre_notificado
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
            ,a.invsts_prg
            ,a.ordqty
            ,a.shpqty
            ,a.remqty
            ,a.ordlin_moddte
            ,a.ordlin_mod_usr_id
            ,a.canpck_candte
            ,a.canpck_can_usr_id
		FROM #inserted a
        WHERE
            a.operacion = 'U'

        SET IDENTITY_INSERT dbo.salidas OFF

        --LOGS
		INSERT INTO logs.salidas
			(id
            ,operacion
            ,estado
            ,cierre_notificado
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
            ,invsts_prg
            ,ordqty
            ,shpqty
            ,remqty
            ,ordlin_moddte
            ,ordlin_mod_usr_id
            ,canpck_candte
            ,canpck_can_usr_id)
		SELECT
             a.id
			,a.operacion
            ,a.estado
            ,a.cierre_notificado
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
            ,a.invsts_prg
            ,a.ordqty
            ,a.shpqty
            ,a.remqty
            ,a.ordlin_moddte
            ,a.ordlin_mod_usr_id
            ,a.canpck_candte
            ,a.canpck_can_usr_id
		FROM #deleted a
	END

	COMMIT TRANSACTION
END TRY
BEGIN CATCH
    SELECT ERROR_MESSAGE()
	ROLLBACK TRANSACTION
    ;THROW;
END CATCH