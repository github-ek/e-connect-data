CREATE PROCEDURE [dbo].[SincronizarEmbarques]
AS
BEGIN TRY
	DECLARE @fecha_desde DATETIME
	DECLARE @fecha_hasta DATETIME

    EXECUTE dbo.GetFechasIntegracion 'EMBARQUES', @fecha_desde OUTPUT, @fecha_hasta OUTPUT

    --CONSOLIDACION TARGET: Los embarques que continúan ABIERTAS en la tabla destino
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

	--CONSOLIDACION #source_shipment: Del origen, se toman los registros nuevos y/o modificados recientemente y aquellos que crucen contra el target (ABIERTAS en el destino)
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
            WHERE 0 = 0
            AND a.moddte >= @fecha_desde
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

        CREATE UNIQUE INDEX ix_source_01 ON #source(ship_id)
        CREATE UNIQUE INDEX ix_source_02 ON #source(record_key)
    END

    --DETECCION DE REGISTROS CERRADOS
    BEGIN
        --Cuando el embarque haya sido cancelado o cargado completamente
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
            a.fecha_modificacion = b.fecha_modificacion
        FROM #source a
        INNER JOIN #target b ON
            b.record_key = a.record_key
        WHERE NOT (
            b.estado = a.estado
        AND b.shipment_moddte = a.shipment_moddte 
        AND b.trlr_moddte = a.trlr_moddte)
        
        --Si no cruzan contra la tabla target por PK => CREATE
        UPDATE a
        SET a.operacion = 'C'
        FROM #source a
        LEFT OUTER JOIN #target b ON
            b.record_key = a.record_key
        LEFT OUTER JOIN dbo.embarques c ON
            c.record_key = a.record_key
        AND c.estado = 'CERRADA'
        WHERE
            b.record_key IS NULL
        AND c.record_key IS NULL
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
        )
        SELECT
            *
        INTO #deleted
        FROM cte_00 a
    END
    

    BEGIN
        IF OBJECT_ID('tempdb..#source_lines') IS NOT NULL BEGIN
			DROP TABLE #source_lines
		END

        SELECT
             a.record_key
            ,CONCAT(b.ship_line_id,'|',c.dtlnum) AS line_key

            ,b.ship_id
            ,b.ship_line_id
            ,c.dtlnum

            ,b.client_id
            ,b.wh_id
            ,b.ordnum
            ,b.ordlin
            ,c.prtnum
            ,b.linsts

            ,b.shpqty
            ,c.lotnum
            ,c.invsts
            ,c.untqty

            ,b.moddte
            ,b.mod_usr_id
        INTO #source_lines
        FROM #inserted a
        INNER JOIN [$(ttcwmsprd)].dbo.shipment_line b ON
            b.ship_id = a.ship_id
        INNER JOIN [$(ttcwmsprd)].dbo.invdtl c ON
            c.ship_line_id = b.ship_line_id
    
        CREATE UNIQUE INDEX ix_source_lines_01 ON #source_lines(ship_id,ship_line_id,dtlnum)
        CREATE UNIQUE INDEX ix_source_lines_02 ON #source_lines(record_key,line_key)
    END

    BEGIN TRANSACTION

    --ACTUALIZACION TARGET/LOGS
    BEGIN
        --Eliminar del destino todos los registros que esten en el consolidado de eliminados, excepto los errores por cambios posteriores al cierre. 
        --De este modo en la tabla destino solo queda la version con la que se hizo el cierre de la orden.
        DELETE c
		FROM dbo.embarques a
		INNER JOIN #deleted b ON
			b.record_key = a.record_key
		INNER JOIN dbo.embarques_lineas c ON
			c.record_key = a.record_key

		DELETE a
		FROM dbo.embarques a
		INNER JOIN #deleted b ON
			b.record_key = a.record_key

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
            ,line_key

            ,ship_id
            ,ship_line_id
            ,dtlnum

            ,client_id
            ,wh_id
            ,ordnum
            ,ordlin
            ,prtnum
            ,linsts

            ,shpqty
            ,lotnum
            ,invsts
            ,untqty

            ,moddte
            ,mod_usr_id)
        SELECT
             record_key
            ,line_key

            ,ship_id
            ,ship_line_id
            ,dtlnum

            ,client_id
            ,wh_id
            ,ordnum
            ,ordlin
            ,prtnum
            ,linsts

            ,shpqty
            ,lotnum
            ,invsts
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