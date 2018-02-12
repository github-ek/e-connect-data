﻿CREATE PROCEDURE [dbo].[SincronizarEmbarques]
AS
BEGIN TRY
	DECLARE @fecha_desde DATETIME
	DECLARE @fecha_hasta DATETIME

    BEGIN TRANSACTION

    EXECUTE dbo.GetFechasIntegracion 'EMBARQUES', @fecha_desde OUTPUT, @fecha_hasta OUTPUT

    --CONSOLIDACION TARGET: Las ordenes que continúan ABIERTAS en la tabla destino
    BEGIN
		IF OBJECT_ID('tempdb..#target') IS NOT NULL BEGIN
			DROP TABLE #target
		END
        
        SELECT
            a.*
        INTO #target
        FROM dbo.embarques a
        WHERE
            a.estado = 'ABIERTA'
        AND a.fecha_creacion >= CAST(DATEADD(MONTH,-1,GETDATE()) AS DATE) 

        CREATE UNIQUE INDEX ix_target_01 ON #target(record_key)
    END

	--CONSOLIDACION #source_shipment: Del origen, se toman las ordenes nuevas y/o modificadas recientemente y aquellas que crucen contra el target (ABIERTAS en el destino)
	BEGIN
        IF OBJECT_ID('tempdb..#source_shipment') IS NOT NULL BEGIN
			DROP TABLE #source_shipment
		END

		;WITH
		cte_00 AS
		(
            SELECT
                a.ship_id
            FROM [$(ttcwmsprd)].dbo.shipment_line a
            INNER JOIN dbo.clientes b ON
                b.client_id = a.client_id
            AND b.activo = 1
            WHERE 0 = 0
            AND a.moddte >= @fecha_desde
            AND a.moddte <= @fecha_hasta
        ),
        cte_01 AS
        (
		    SELECT
                a.ship_id
		    FROM #target a
            UNION
		    SELECT
                a.ship_id
		    FROM cte_00 a
        )
		SELECT
            CAST('' AS NVARCHAR(1)) AS operacion,
            @fecha_hasta AS fecha_creacion,
            @fecha_hasta AS fecha_modificacion,
			a.*
		INTO #source_shipment
        FROM cte_01 a
    END

    --CONSOLIDACION SOURCE
    BEGIN
        IF OBJECT_ID('tempdb..#source') IS NOT NULL BEGIN
            DROP TABLE #source
        END

        SELECT DISTINCT
             CAST(NULL AS BIGINT) AS id
            ,b.ship_id AS record_key
             
            ,a.operacion
            ,'ABIERTA' AS estado
            ,CAST(0 AS BIT) AS cambio_notificado
            ,a.fecha_creacion
            ,a.fecha_modificacion

            ,b.ship_id

            ,b.shpsts
            ,b.moddte AS shipment_moddte 
            ,b.mod_usr_id AS shipment_mod_usr_id
    
            ,COALESCE(e.trlr_id,'') AS trlr_id
            ,COALESCE(e.trlr_stat,'') AS trlr_stat
            ,COALESCE(e.trlr_typ,'') AS trlr_typ
            ,COALESCE(e.trlr_seal1,'') AS trlr_seal1
            ,COALESCE(e.trlr_seal2,'') AS trlr_seal2
            ,COALESCE(e.trlr_seal3,'') AS trlr_seal3
            ,COALESCE(e.trlr_seal4,'') AS trlr_seal4
            ,COALESCE(e.driver_nam,'') AS driver_nam
            ,COALESCE(e.driver_lic_num,'') AS driver_lic_num
            ,COALESCE(e.tractor_num,'') AS tractor_num

            ,e.arrdte
            ,e.close_dte
            ,e.dispatch_dte

            ,COALESCE(e.moddte,CAST('1900-01-01' AS DATE)) AS trlr_moddte 
            ,COALESCE(e.mod_usr_id,'') AS trlr_mod_usr_id
        INTO #source
        FROM #source_shipment a
        INNER JOIN [$(ttcwmsprd)].dbo.shipment b ON 
            b.ship_id = a.ship_id
        INNER JOIN [$(ttcwmsprd)].dbo.stop c ON 
            c.stop_id = b.stop_id
        INNER JOIN [$(ttcwmsprd)].dbo.car_move d ON
            d.car_move_id = c.car_move_id
        INNER JOIN [$(ttcwmsprd)].dbo.trlr e ON
            e.trlr_id = d.trlr_id
        WHERE
            b.shpsts IN ('B','C')

        CREATE UNIQUE INDEX ix_source_01 ON #source(record_key)
        CREATE UNIQUE INDEX ix_source_02 ON #source(ship_id)

        IF OBJECT_ID('tempdb..#source_lines') IS NOT NULL BEGIN
			DROP TABLE #source_lines
		END

        SELECT
             a.record_key

            ,b.ship_id
            ,b.ship_line_id
            ,c.dtlnum

            ,b.client_id
            ,b.wh_id
            ,b.ordnum
            ,b.ordlin
            ,b.linsts

            ,b.shpqty
            ,c.lotnum
            ,c.untqty

            ,b.moddte
            ,b.mod_usr_id
        INTO #source_lines
        FROM #source a
        INNER JOIN [$(ttcwmsprd)].dbo.shipment_line b ON
            b.ship_id = a.ship_id
        INNER JOIN [$(ttcwmsprd)].dbo.invdtl c ON
            c.ship_line_id = b.ship_line_id
    
        CREATE UNIQUE INDEX ix_source_lines_01 ON #source_lines(ship_id,ship_line_id,dtlnum)
    END

    --DETECCION DE CIERRES
    BEGIN
        UPDATE a
        SET a.estado = 'CERRADA'
        FROM #source a
        WHERE
            a.shpsts IN ('B','C')
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
            b.record_key = a.record_key
        WHERE NOT (
            b.shipment_moddte = a.shipment_moddte 
        AND b.trlr_moddte = a.trlr_moddte)
        
        --Si no cruzan contra la tabla target por PK => CREATE
        UPDATE a
        SET a.operacion = 'C'
        FROM #source a
        LEFT OUTER JOIN #target b ON
            b.record_key = a.record_key
        WHERE
            b.record_key IS NULL
        
        --Un registro que hasta este punto corresponda a una operación CREATE (no cruzar contra el target), 
        --se debe cruzar contra todas las ordenes en el destino para verificar que no este cruzando contra una orden CERRADA
        --Las ordenes CERRADAS no se incluyen en el target, por tanto los registros que crucen serán modificaciones posteriores al cierre de la orden
        --y serán un error. 
        UPDATE a
        SET a.id = b.id,
            a.operacion = 'E',
            a.fecha_creacion = b.fecha_creacion
        FROM #source a
        INNER JOIN dbo.embarques b ON
            b.record_key = a.record_key
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
                b.record_key = a.record_key
            WHERE
                b.operacion IN  ('U') OR b.operacion IS NULL
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
        DELETE b
		FROM dbo.embarques a
		INNER JOIN dbo.embarques_lineas b ON
			b.record_key = a.record_key
		INNER JOIN #deleted c ON
			c.record_key = a.record_key
        WHERE
            a.operacion NOT IN ('E')

		DELETE a
		FROM dbo.embarques a
		INNER JOIN #deleted b ON
			b.id = a.id
        WHERE
            a.operacion NOT IN ('E')

        --CREATE
		INSERT INTO dbo.embarques
			(record_key
            ,operacion
            ,estado
            ,cambio_notificado
            ,fecha_creacion
            ,fecha_modificacion

            ,ship_id

            ,shpsts
            ,shipment_moddte
            ,shipment_mod_usr_id

            ,trlr_id
            ,trlr_stat
            ,trlr_typ
            ,trlr_seal1
            ,trlr_seal2
            ,trlr_seal3
            ,trlr_seal4
            ,driver_nam
            ,driver_lic_num
            ,tractor_num

            ,arrdte
            ,close_dte
            ,dispatch_dte
            ,trlr_moddte
            ,trlr_mod_usr_id)
		SELECT
             record_key
            ,operacion
            ,estado
            ,cambio_notificado
            ,fecha_creacion
            ,fecha_modificacion

            ,ship_id

            ,shpsts
            ,shipment_moddte
            ,shipment_mod_usr_id

            ,trlr_id
            ,trlr_stat
            ,trlr_typ
            ,trlr_seal1
            ,trlr_seal2
            ,trlr_seal3
            ,trlr_seal4
            ,driver_nam
            ,driver_lic_num
            ,tractor_num

            ,arrdte
            ,close_dte
            ,dispatch_dte
            ,trlr_moddte
            ,trlr_mod_usr_id
		FROM #inserted a
        WHERE
            a.operacion = 'C'

        --UPDATE
        SET IDENTITY_INSERT dbo.embarques ON

		INSERT INTO dbo.embarques
			(id
            ,record_key
            ,operacion
            ,estado
            ,cambio_notificado
            ,fecha_creacion
            ,fecha_modificacion

            ,ship_id

            ,shpsts
            ,shipment_moddte
            ,shipment_mod_usr_id

            ,trlr_id
            ,trlr_stat
            ,trlr_typ
            ,trlr_seal1
            ,trlr_seal2
            ,trlr_seal3
            ,trlr_seal4
            ,driver_nam
            ,driver_lic_num
            ,tractor_num

            ,arrdte
            ,close_dte
            ,dispatch_dte
            ,trlr_moddte
            ,trlr_mod_usr_id)
		SELECT
             id
            ,record_key
            ,operacion
            ,estado
            ,cambio_notificado
            ,fecha_creacion
            ,fecha_modificacion

            ,ship_id

            ,shpsts
            ,shipment_moddte
            ,shipment_mod_usr_id

            ,trlr_id
            ,trlr_stat
            ,trlr_typ
            ,trlr_seal1
            ,trlr_seal2
            ,trlr_seal3
            ,trlr_seal4
            ,driver_nam
            ,driver_lic_num
            ,tractor_num

            ,arrdte
            ,close_dte
            ,dispatch_dte
            ,trlr_moddte
            ,trlr_mod_usr_id
		FROM #inserted a
        WHERE
            a.operacion = 'U'

        SET IDENTITY_INSERT dbo.embarques OFF

        --LOGS
		INSERT INTO logs.embarques
			(id
            ,record_key
            ,operacion
            ,estado
            ,cambio_notificado
            ,fecha_creacion
            ,fecha_modificacion

            ,ship_id

            ,shpsts
            ,shipment_moddte
            ,shipment_mod_usr_id

            ,trlr_id
            ,trlr_stat
            ,trlr_typ
            ,trlr_seal1
            ,trlr_seal2
            ,trlr_seal3
            ,trlr_seal4
            ,driver_nam
            ,driver_lic_num
            ,tractor_num

            ,arrdte
            ,close_dte
            ,dispatch_dte
            ,trlr_moddte
            ,trlr_mod_usr_id)
		SELECT
             id
            ,record_key
            ,operacion
            ,estado
            ,cambio_notificado
            ,fecha_creacion
            ,fecha_modificacion

            ,ship_id

            ,shpsts
            ,shipment_moddte
            ,shipment_mod_usr_id

            ,trlr_id
            ,trlr_stat
            ,trlr_typ
            ,trlr_seal1
            ,trlr_seal2
            ,trlr_seal3
            ,trlr_seal4
            ,driver_nam
            ,driver_lic_num
            ,tractor_num

            ,arrdte
            ,close_dte
            ,dispatch_dte
            ,trlr_moddte
            ,trlr_mod_usr_id
		FROM #deleted a
	END

    --LINEAS
    BEGIN
        INSERT INTO dbo.embarques_lineas
            (record_key

            ,ship_id
            ,ship_line_id
            ,dtlnum

            ,client_id
            ,wh_id
            ,ordnum
            ,ordlin
            ,linsts

            ,shpqty
            ,lotnum
            ,untqty

            ,moddte
            ,mod_usr_id)
        SELECT
             record_key

            ,ship_id
            ,ship_line_id
            ,dtlnum

            ,client_id
            ,wh_id
            ,ordnum
            ,ordlin
            ,linsts

            ,shpqty
            ,lotnum
            ,untqty

            ,moddte
            ,mod_usr_id            
        FROM #source_lines a
    END

	COMMIT TRANSACTION
END TRY
BEGIN CATCH
    SELECT ERROR_MESSAGE()
	ROLLBACK TRANSACTION
    ;THROW;
END CATCH