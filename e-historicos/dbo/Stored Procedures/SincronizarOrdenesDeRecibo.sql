CREATE PROCEDURE [dbo].[SincronizarOrdenesDeRecibo]
AS
BEGIN TRY
	DECLARE @fecha_desde DATETIME
	DECLARE @fecha_hasta DATETIME

    BEGIN TRANSACTION

    EXECUTE dbo.GetFechasIntegracion 'RECIBOS', @fecha_desde OUTPUT, @fecha_hasta OUTPUT

    --CONSOLIDACION TARGET: Las ordenes que continúan ABIERTAS en la tabla destino
    BEGIN
		IF OBJECT_ID('tempdb..#target') IS NOT NULL BEGIN
			DROP TABLE #target
		END
        
        ;WITH
        cte_00 AS
        (
            SELECT DISTINCT
                 a.record_key
            FROM dbo.ordenes_recibo a
            WHERE
                a.estado = 'ABIERTA'
            AND a.fecha_creacion >= CAST(DATEADD(MONTH,-1,GETDATE()) AS DATE) 
        )
        SELECT
             a.*
        INTO #target
        FROM dbo.ordenes_recibo a
        INNER JOIN cte_00 b ON
            b.record_key = a.record_key

        CREATE UNIQUE INDEX ix_target_01 ON #target(record_key,line_key)
    END
    
    --CONSOLIDACION #source_ord: Del origen, se toman los registros nuevos y/o modificados recientemente y aquellos que crucen contra el target (ABIERTAS en el destino)
	BEGIN
		IF OBJECT_ID('tempdb..#source_rcvlin') IS NOT NULL BEGIN
			DROP TABLE #source_rcvlin
		END

        SELECT DISTINCT
             a.client_id
            ,a.wh_id
            ,a.supnum
            ,a.invnum
            ,a.trknum
        INTO #source_rcvlin
        FROM [$(ttcwmsprd)].dbo.rcvlin a
        INNER JOIN dbo.clientes b ON
            b.client_id = a.client_id
        WHERE 0 = 0
        AND a.moddte >= @fecha_desde
        AND a.moddte <= @fecha_hasta

		IF OBJECT_ID('tempdb..#source_ord') IS NOT NULL BEGIN
			DROP TABLE #source_ord
		END

		;WITH
		cte_00 AS
		(
		    SELECT
                 a.client_id
                ,a.wh_id
                ,a.supnum
                ,a.invnum
                ,a.trknum
		    FROM #target a
            UNION
		    SELECT
                 a.client_id
                ,a.wh_id
                ,a.supnum
                ,a.invnum
                ,a.trknum
		    FROM #source_rcvlin a
        )
		SELECT
            CAST('' AS NVARCHAR(1)) AS operacion,
            @fecha_hasta AS fecha_creacion,
            @fecha_hasta AS fecha_modificacion,
			a.*
		INTO #source_ord
        FROM cte_00 a
    END

	--CONSOLIDACION SOURCE: Del origen, se toman las ordenes nuevas y/o modificadas recientemente y aquellas que crucen contra el target (ABIERTAS en el destino)
	BEGIN
		IF OBJECT_ID('tempdb..#source') IS NOT NULL BEGIN
			DROP TABLE #source
		END

		SELECT
             CAST(NULL AS BIGINT) AS id
            ,CONCAT(b.client_id,'|',b.wh_id,'|',b.supnum,'|',b.invnum,'|',b.trknum) AS record_key
            ,CONCAT(c.invlin,'|',c.invsln,'|',c.seqnum) AS line_key

            ,a.operacion
            ,'ABIERTA' AS estado
            ,CAST(0 AS BIT) AS cambio_notificado
            ,a.fecha_creacion
            ,a.fecha_modificacion

            ,b.client_id
            ,b.wh_id
            ,b.supnum
            ,b.invnum
            ,b.trknum

            ,b.po_num
            ,b.invtyp
            ,b.invdte
            ,b.moddte
            ,b.mod_usr_id

            ,c.invlin	
            ,c.invsln	
            ,c.seqnum	
            ,c.prtnum
            ,c.rcvsts
            ,c.expqty	
            ,c.rcvqty	
            ,COALESCE(c.lotnum,'') AS lotnum
            ,COALESCE(c.mandte,CAST('1900-01-01' AS DATETIME)) AS mandte
            ,COALESCE(c.expire_dte,CAST('1900-01-01' AS DATETIME)) AS expire_dte
            ,COALESCE(c.inv_attr_str7,'') AS inv_attr_str7
            ,c.rcvkey
            ,COALESCE(c.edtflg,0) AS edtflg
            ,COALESCE(c.blind_flg,0) AS blind_flg
            ,COALESCE(c.moddte,CAST('1900-01-01' AS DATETIME)) AS rcvlin_moddte
            ,COALESCE(c.mod_usr_id,'') AS rcvlin_mod_usr_id

            ,d.rcvtrk_stat
            ,COALESCE(d.devcod,'') AS devcod
            ,COALESCE(d.clsdte,CAST('1900-01-01' AS DATETIME)) AS rcvtrk_clsdte
            ,COALESCE(d.moddte,CAST('1900-01-01' AS DATETIME)) AS rcvtrk_moddte
            ,COALESCE(d.mod_usr_id,'') AS rcvtrk_mod_usr_id

            ,e.trlr_id
            ,e.trlr_num
            ,COALESCE(e.trlr_stat,'') AS trlr_stat
            ,COALESCE(e.trlr_typ,'') AS trlr_typ
            ,COALESCE(e.trlr_size,0) AS trlr_size
            ,COALESCE(e.refrig_flg,0) AS refrig_flg
            ,e.trlr_cod AS trlr_cod
            ,COALESCE(e.trlr_cond,'') AS trlr_cond
            ,e.safe_sts
            ,COALESCE(e.carcod,'') AS carcod
            ,COALESCE(e.tractor_num,'') AS tractor_num
            ,COALESCE(e.driver_nam,'') AS driver_nam
            ,COALESCE(e.driver_lic_num,'') AS driver_lic_num
            ,COALESCE(e.arrdte,CAST('1900-01-01' AS DATETIME)) AS arrdte
            ,COALESCE(e.close_dte,CAST('1900-01-01' AS DATETIME)) AS close_dte
            ,COALESCE(e.dispatch_dte,CAST('1900-01-01' AS DATETIME)) AS dispatch_dte
            ,COALESCE(e.trlr_seal1,'') AS trlr_seal1
            ,COALESCE(e.trlr_seal2,'') AS trlr_seal2
            ,COALESCE(e.trlr_seal3,'') AS trlr_seal3
            ,COALESCE(e.trlr_seal4,'') AS trlr_seal4
            ,COALESCE(e.moddte,CAST('1900-01-01' AS DATETIME)) AS trlr_moddte
            ,COALESCE(e.mod_usr_id,'') AS trlr_mod_usr_id
        INTO #source
		FROM #source_ord a
        INNER JOIN [$(ttcwmsprd)].dbo.rcvinv b ON
            b.client_id = a.client_id
        AND b.wh_id = a.wh_id
        AND b.supnum = a.supnum
        AND b.invnum = a.invnum
        AND b.trknum = a.trknum
        INNER JOIN [$(ttcwmsprd)].dbo.rcvlin c ON
            c.client_id = b.client_id
        AND c.wh_id = b.wh_id
        AND c.supnum = b.supnum
        AND c.invnum = b.invnum
        AND c.trknum = b.trknum
        INNER JOIN [$(ttcwmsprd)].dbo.rcvtrk d ON 
            d.wh_id = c.wh_id
        AND d.trknum = c.trknum
        INNER JOIN [$(ttcwmsprd)].dbo.trlr e ON 
            e.trlr_id = d.trlr_id

        CREATE UNIQUE INDEX ix_source_01 ON #source(client_id,wh_id,supnum,invnum,trknum,invlin,invsln,seqnum)
        CREATE UNIQUE INDEX ix_source_02 ON #source(record_key,line_key)
    END

    --DETECCION DE REGISTROS CERRADOS
    BEGIN
        --Cuando el estado (rcvtrk_stat) del rcvtrk del rcvinv sea igual C,
        --en ese momento la orden pasará al estado CERRADA
        UPDATE a
        SET a.estado = 'CERRADA'
        FROM #source a
        WHERE
            a.rcvtrk_stat = 'C'
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
        AND b.line_key = a.line_key
        WHERE NOT (
            b.moddte = a.moddte 
        AND b.rcvlin_moddte = a.rcvlin_moddte
        AND b.rcvtrk_moddte = a.rcvtrk_moddte
        AND b.trlr_moddte = a.trlr_moddte

        AND b.rcvtrk_clsdte = a.rcvtrk_clsdte
        AND b.arrdte = a.arrdte
        AND b.close_dte = a.close_dte
        AND b.dispatch_dte = a.dispatch_dte
        )

        --Si no cruzan contra la tabla target por PK => CREATE
        UPDATE a
        SET a.operacion = 'C'
        FROM #source a
        LEFT OUTER JOIN #target b ON
            b.record_key = a.record_key
        AND b.line_key = a.line_key
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
        INNER JOIN dbo.ordenes_recibo b ON
            b.record_key = a.record_key
        AND b.line_key = a.line_key
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
            AND b.line_key = a.line_key
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
		DELETE a
		FROM dbo.ordenes_recibo a
		INNER JOIN #deleted b ON
			b.id = a.id
        WHERE
            a.operacion NOT IN ('E')
        
        --CREATE
		INSERT INTO dbo.ordenes_recibo
			(record_key
            ,line_key
            ,operacion
            ,estado
            ,cambio_notificado
            ,fecha_creacion
            ,fecha_modificacion

            ,client_id
            ,wh_id
            ,supnum
            ,invnum
            ,trknum
            ,po_num
            ,invtyp
            ,invdte
            ,moddte
            ,mod_usr_id

            ,invlin
            ,invsln
            ,seqnum
            ,prtnum
            ,rcvsts
            ,expqty
            ,rcvqty
            ,lotnum
            ,mandte
            ,expire_dte
            ,inv_attr_str7
            ,rcvkey
            ,edtflg
            ,blind_flg
            ,rcvlin_moddte
            ,rcvlin_mod_usr_id
            
            ,rcvtrk_stat
            ,devcod
            ,rcvtrk_clsdte
            ,rcvtrk_moddte
            ,rcvtrk_mod_usr_id
            
            ,trlr_id
            ,trlr_num
            ,trlr_stat
            ,trlr_typ
            ,trlr_size
            ,refrig_flg
            ,trlr_cod
            ,trlr_cond
            ,safe_sts
            ,carcod
            ,tractor_num
            ,driver_nam
            ,driver_lic_num
            ,arrdte
            ,close_dte
            ,dispatch_dte
            ,trlr_seal1
            ,trlr_seal2
            ,trlr_seal3
            ,trlr_seal4
            ,trlr_moddte
            ,trlr_mod_usr_id)
		SELECT
             record_key
            ,line_key
            ,operacion
            ,estado
            ,cambio_notificado
            ,fecha_creacion
            ,fecha_modificacion

            ,client_id
            ,wh_id
            ,supnum
            ,invnum
            ,trknum
            ,po_num
            ,invtyp
            ,invdte
            ,moddte
            ,mod_usr_id

            ,invlin
            ,invsln
            ,seqnum
            ,prtnum
            ,rcvsts
            ,expqty
            ,rcvqty
            ,lotnum
            ,mandte
            ,expire_dte
            ,inv_attr_str7
            ,rcvkey
            ,edtflg
            ,blind_flg
            ,rcvlin_moddte
            ,rcvlin_mod_usr_id
            
            ,rcvtrk_stat
            ,devcod
            ,rcvtrk_clsdte
            ,rcvtrk_moddte
            ,rcvtrk_mod_usr_id
            
            ,trlr_id
            ,trlr_num
            ,trlr_stat
            ,trlr_typ
            ,trlr_size
            ,refrig_flg
            ,trlr_cod
            ,trlr_cond
            ,safe_sts
            ,carcod
            ,tractor_num
            ,driver_nam
            ,driver_lic_num
            ,arrdte
            ,close_dte
            ,dispatch_dte
            ,trlr_seal1
            ,trlr_seal2
            ,trlr_seal3
            ,trlr_seal4
            ,trlr_moddte
            ,trlr_mod_usr_id
		FROM #inserted a
        WHERE
            a.operacion = 'C'

        --UPDATE
        SET IDENTITY_INSERT dbo.ordenes_recibo ON

		INSERT INTO dbo.ordenes_recibo
			(id
            ,record_key
            ,line_key
            ,operacion
            ,estado
            ,cambio_notificado
            ,fecha_creacion
            ,fecha_modificacion
            
            ,client_id
            ,wh_id
            ,supnum
            ,invnum
            ,trknum
            ,po_num
            ,invtyp
            ,invdte
            ,moddte
            ,mod_usr_id
            
            ,invlin
            ,invsln
            ,seqnum
            ,prtnum
            ,rcvsts
            ,expqty
            ,rcvqty
            ,lotnum
            ,mandte
            ,expire_dte
            ,inv_attr_str7
            ,rcvkey
            ,edtflg
            ,blind_flg
            ,rcvlin_moddte
            ,rcvlin_mod_usr_id
            
            ,rcvtrk_stat
            ,devcod
            ,rcvtrk_clsdte
            ,rcvtrk_moddte
            ,rcvtrk_mod_usr_id
            
            ,trlr_id
            ,trlr_num
            ,trlr_stat
            ,trlr_typ
            ,trlr_size
            ,refrig_flg
            ,trlr_cod
            ,trlr_cond
            ,safe_sts
            ,carcod
            ,tractor_num
            ,driver_nam
            ,driver_lic_num
            ,arrdte
            ,close_dte
            ,dispatch_dte
            ,trlr_seal1
            ,trlr_seal2
            ,trlr_seal3
            ,trlr_seal4
            ,trlr_moddte
            ,trlr_mod_usr_id)
		SELECT
             id
            ,record_key
            ,line_key
            ,operacion
            ,estado
            ,cambio_notificado
            ,fecha_creacion
            ,fecha_modificacion
            
            ,client_id
            ,wh_id
            ,supnum
            ,invnum
            ,trknum
            ,po_num
            ,invtyp
            ,invdte
            ,moddte
            ,mod_usr_id
            
            ,invlin
            ,invsln
            ,seqnum
            ,prtnum
            ,rcvsts
            ,expqty
            ,rcvqty
            ,lotnum
            ,mandte
            ,expire_dte
            ,inv_attr_str7
            ,rcvkey
            ,edtflg
            ,blind_flg
            ,rcvlin_moddte
            ,rcvlin_mod_usr_id
            
            ,rcvtrk_stat
            ,devcod
            ,rcvtrk_clsdte
            ,rcvtrk_moddte
            ,rcvtrk_mod_usr_id
            
            ,trlr_id
            ,trlr_num
            ,trlr_stat
            ,trlr_typ
            ,trlr_size
            ,refrig_flg
            ,trlr_cod
            ,trlr_cond
            ,safe_sts
            ,carcod
            ,tractor_num
            ,driver_nam
            ,driver_lic_num
            ,arrdte
            ,close_dte
            ,dispatch_dte
            ,trlr_seal1
            ,trlr_seal2
            ,trlr_seal3
            ,trlr_seal4
            ,trlr_moddte
            ,trlr_mod_usr_id
		FROM #inserted a
        WHERE
            a.operacion = 'U'

        SET IDENTITY_INSERT dbo.ordenes_recibo OFF

        --LOGS
		INSERT INTO logs.ordenes_recibo
			(id
            ,record_key
            ,line_key
            ,operacion
            ,estado
            ,cambio_notificado
            ,fecha_creacion
            ,fecha_modificacion
            
            ,client_id
            ,wh_id
            ,supnum
            ,invnum
            ,trknum
            ,po_num
            ,invtyp
            ,invdte
            ,moddte
            ,mod_usr_id
            
            ,invlin
            ,invsln
            ,seqnum
            ,prtnum
            ,rcvsts
            ,expqty
            ,rcvqty
            ,lotnum
            ,mandte
            ,expire_dte
            ,inv_attr_str7
            ,rcvkey
            ,edtflg
            ,blind_flg
            ,rcvlin_moddte
            ,rcvlin_mod_usr_id
            
            ,rcvtrk_stat
            ,devcod
            ,rcvtrk_clsdte
            ,rcvtrk_moddte
            ,rcvtrk_mod_usr_id
            
            ,trlr_id
            ,trlr_num
            ,trlr_stat
            ,trlr_typ
            ,trlr_size
            ,refrig_flg
            ,trlr_cod
            ,trlr_cond
            ,safe_sts
            ,carcod
            ,tractor_num
            ,driver_nam
            ,driver_lic_num
            ,arrdte
            ,close_dte
            ,dispatch_dte
            ,trlr_seal1
            ,trlr_seal2
            ,trlr_seal3
            ,trlr_seal4
            ,trlr_moddte
            ,trlr_mod_usr_id)
		SELECT
             id
            ,record_key
            ,line_key
            ,operacion
            ,estado
            ,cambio_notificado
            ,fecha_creacion
            ,fecha_modificacion
            
            ,client_id
            ,wh_id
            ,supnum
            ,invnum
            ,trknum
            ,po_num
            ,invtyp
            ,invdte
            ,moddte
            ,mod_usr_id
            
            ,invlin
            ,invsln
            ,seqnum
            ,prtnum
            ,rcvsts
            ,expqty
            ,rcvqty
            ,lotnum
            ,mandte
            ,expire_dte
            ,inv_attr_str7
            ,rcvkey
            ,edtflg
            ,blind_flg
            ,rcvlin_moddte
            ,rcvlin_mod_usr_id
            
            ,rcvtrk_stat
            ,devcod
            ,rcvtrk_clsdte
            ,rcvtrk_moddte
            ,rcvtrk_mod_usr_id
            
            ,trlr_id
            ,trlr_num
            ,trlr_stat
            ,trlr_typ
            ,trlr_size
            ,refrig_flg
            ,trlr_cod
            ,trlr_cond
            ,safe_sts
            ,carcod
            ,tractor_num
            ,driver_nam
            ,driver_lic_num
            ,arrdte
            ,close_dte
            ,dispatch_dte
            ,trlr_seal1
            ,trlr_seal2
            ,trlr_seal3
            ,trlr_seal4
            ,trlr_moddte
            ,trlr_mod_usr_id
		FROM #deleted a
	END

	COMMIT TRANSACTION

END TRY
BEGIN CATCH
    SELECT ERROR_MESSAGE()
	ROLLBACK TRANSACTION
    ;THROW
END CATCH