CREATE PROCEDURE [dbo].[DetectarCierreDeOrdenesAlistamientoDeTraslados]
AS
BEGIN TRY
    --SET NOCOUNT ON;

    BEGIN TRANSACTION

    --CONSOLIDAR DATOS DE WMS
    BEGIN
        IF OBJECT_ID('tempdb..#source') IS NOT NULL BEGIN
	        DROP TABLE #source
        END

        SELECT DISTINCT
             b.id_cliente
            ,a.client_id
            ,c.id_bodega
            ,a.wh_id
            ,d.id_orden_alistamiento
            ,a.ordnum
            ,d.estado
            ,e.id_solicitud_orden
            ,e.tipo_solicitud
            ,d.id_solicitud
            ,d.cerrada AS cerrada_en_destino
        INTO #source
        FROM [$(eWms)].dbo.salidas a
        LEFT OUTER JOIN [$(eWms)].dbo.clientes b ON
            b.client_id = a.client_id
        LEFT OUTER JOIN [$(eWms)].dbo.bodegas c ON
            c.wh_id = a.wh_id
        LEFT OUTER JOIN [$(eConnect)].dbo.ordenes_alistamiento d ON
            d.id_cliente = b.id_cliente
        AND d.id_bodega = c.id_bodega
        AND d.numero_orden = a.ordnum
        LEFT OUTER JOIN [$(eConnect)].dbo.solicitudes_ordenes e ON
            e.id_solicitud_orden = d.id_solicitud_orden
        WHERE
            a.ordtyp = 'TRS'
        AND a.estado = 'CERRADA'
        AND a.cambio_notificado = 0

        IF OBJECT_ID('tempdb..#source_lineas') IS NOT NULL BEGIN
	        DROP TABLE #source_lineas
        END

        SELECT
             a.*
            ,b.id
            ,CAST((CASE WHEN ISNUMERIC(b.ordlin) = 1 THEN b.ordlin ELSE NULL  END) AS INT) AS numero_linea
            ,b.prtnum
            ,b.invsts_prg
            ,b.ordqty	
            ,b.shpqty	
            ,b.remqty	
            ,b.ordlin_moddte	        
            ,b.ordlin_mod_usr_id
        INTO #source_lineas
        FROM #source a
        INNER JOIN [$(eWms)].dbo.salidas b ON
            b.client_id = a.client_id 
        AND b.wh_id = a.wh_id
        AND b.ordnum = a.ordnum

        IF OBJECT_ID('tempdb..#target_lineas') IS NOT NULL BEGIN
	        DROP TABLE #target_lineas
        END

        SELECT
             a.client_id
            ,a.wh_id
            ,a.ordnum

            ,b.id
            ,b.id_orden_alistamiento
            ,b.numero_linea
            ,b.id_producto
            ,b.producto_codigo
            ,b.id_estado_inventario
            ,b.unidades_solicitadas
        INTO #target_lineas
        FROM #source a
        INNER JOIN [$(eConnect)].dbo.ordenes_alistamiento_lineas b ON
            b.id_orden_alistamiento = a.id_orden_alistamiento
        WHERE
            a.id_orden_alistamiento IS NOT NULL
    END

    --DETECTAR INCONSISTENCIAS   
    BEGIN
        IF OBJECT_ID('tempdb..#source_inconsistencias') IS NOT NULL BEGIN
	        DROP TABLE #source_inconsistencias
        END

        ;WITH
        cte_00 AS
        (
            SELECT
                 COALESCE(a.client_id,b.client_id) AS client_id
                ,COALESCE(a.wh_id,b.wh_id) AS wh_id
                ,COALESCE(a.ordnum,b.ordnum) AS ordnum
                ,COALESCE(a.numero_linea,b.numero_linea) AS numero_linea

                ,a.id
                ,COALESCE(a.prtnum,'') AS prtnum
                ,COALESCE(b.producto_codigo,'') AS producto_codigo
                ,COALESCE(a.invsts_prg,'') AS invsts_prg
                ,COALESCE(b.id_estado_inventario,'') AS id_estado_inventario
                ,a.ordqty
                ,b.unidades_solicitadas
                ,a.ordlin_moddte
                ,a.ordlin_mod_usr_id

                ,CASE WHEN a.id IS NOT NULL AND a.id_cliente IS NULL                                        THEN 1 ELSE 0 END AS cliente_no_existe
                ,CASE WHEN a.id IS NOT NULL AND a.id_bodega IS NULL                                         THEN 1 ELSE 0 END AS bodega_no_existe
                ,CASE WHEN a.id IS NOT NULL AND a.id_orden_alistamiento IS NULL                             THEN 1 ELSE 0 END AS orden_no_existe
                ,CASE WHEN a.cerrada_en_destino = 1                                                         THEN 1 ELSE 0 END AS orden_cerrada_en_destino
                ,CASE WHEN a.numero_linea IS NULL     AND b.numero_linea IS NOT NULL                        THEN 1 ELSE 0 END AS linea_eliminada_en_wms
                ,CASE WHEN a.numero_linea IS NOT NULL AND b.numero_linea IS NULL                            THEN 1 ELSE 0 END AS linea_creada_en_wms
                ,CASE WHEN a.id IS NOT NULL AND b.id IS NOT NULL AND a.prtnum <> b.producto_codigo          THEN 1 ELSE 0 END AS codigos_no_coinciden
                ,CASE WHEN a.id IS NOT NULL AND b.id IS NOT NULL AND a.invsts_prg <> b.id_estado_inventario THEN 1 ELSE 0 END AS estados_no_coinciden
                ,CASE WHEN a.id IS NOT NULL AND b.id IS NOT NULL AND a.ordqty <> b.unidades_solicitadas     THEN 1 ELSE 0 END AS cantidades_no_coinciden
            FROM #source_lineas a
            FULL OUTER JOIN #target_lineas b ON
                b.id_orden_alistamiento = a.id_orden_alistamiento
            AND b.numero_linea = a.numero_linea
        )
        SELECT
            a.*
        INTO #source_inconsistencias
        FROM cte_00 a
        WHERE
            cliente_no_existe + bodega_no_existe + orden_no_existe + orden_cerrada_en_destino + linea_eliminada_en_wms + linea_creada_en_wms + codigos_no_coinciden + estados_no_coinciden + cantidades_no_coinciden > 0

        --TODO enviar errores a una tabla de error en errores
        DELETE a
        FROM #source_lineas a
        INNER JOIN #source_inconsistencias b ON
            b.client_id = a.client_id
        AND b.wh_id = a.wh_id
        AND b.ordnum = a.ordnum
    END

    --UPDATE SALIDAS EN EWMS
    BEGIN
        UPDATE a
        SET  a.cambio_notificado = 1
            ,a.cerrada_con_errores = 0
        FROM [$(eWms)].dbo.salidas a 
        INNER JOIN #source_lineas b ON
            b.client_id = a.client_id
        AND b.wh_id = a.wh_id
        AND b.ordnum = a.ordnum

        UPDATE a
        SET  a.cambio_notificado = 1
            ,a.cerrada_con_errores = 1
        FROM [$(eWms)].dbo.salidas a 
        INNER JOIN #source_inconsistencias b ON
            b.client_id = a.client_id
        AND b.wh_id = a.wh_id
        AND b.ordnum = a.ordnum
    END

    --UPDATE ORDENES ALISTAMIENTO
    BEGIN
        IF OBJECT_ID('tempdb..#ordenes_alistamiento') IS NOT NULL BEGIN
	        DROP TABLE #ordenes_alistamiento
        END

        ;WITH
        cte_00 AS
        (
            SELECT
                 a.id_solicitud_orden
                ,a.tipo_solicitud
                ,a.id_solicitud
                ,a.id_orden_alistamiento
                ,a.ordnum AS numero_orden
                ,SUM(a.remqty) OVER(PARTITION BY a.id_orden_alistamiento) AS remqty
                ,a.ordlin_moddte
                ,a.ordlin_mod_usr_id
                ,ROW_NUMBER() OVER(PARTITION BY a.id_orden_alistamiento ORDER BY a.ordlin_moddte DESC) AS orden
            FROM #source_lineas a    
        )
        SELECT
             a.id_solicitud_orden
            ,a.tipo_solicitud
            ,a.id_solicitud
            ,a.id_orden_alistamiento
            ,a.numero_orden
            ,CASE WHEN a.remqty = 0 THEN 'DESPACHADA' ELSE 'DESPACHADA_CON_NOVEDADES' END AS estado
            ,CASE WHEN a.remqty = 0 THEN 'OK' ELSE 'NOVEDADES' END AS resultado
            ,a.ordlin_moddte
            ,a.ordlin_mod_usr_id
        INTO #ordenes_alistamiento
        FROM cte_00 a
        WHERE
            a.orden = 1

        UPDATE a
        SET 
             a.estado = b.estado
            ,a.cerrada = 1
            ,a.cierre_notificado = 0

            ,a.[version] = a.[version] + 1
            ,a.usuario_modificacion = b.ordlin_mod_usr_id
            ,a.fecha_modificacion = b.ordlin_moddte
        FROM [$(eConnect)].dbo.ordenes_alistamiento a
        INNER JOIN #ordenes_alistamiento b ON
            b.id_orden_alistamiento = a.id_orden_alistamiento
                
        UPDATE a
        SET  a.unidades_despachadas = b.shpqty
            ,a.unidades_canceladas = b.remqty
            ,a.fecha_modificacion = b.ordlin_moddte
            ,a.usuario_modificacion = b.ordlin_mod_usr_id
        FROM [$(eConnect)].dbo.ordenes_alistamiento_lineas a
        INNER JOIN #source_lineas b ON
            b.id_orden_alistamiento = a.id_orden_alistamiento
        AND b.numero_linea = a.numero_linea

        UPDATE a
        SET  a.estado = b.estado
            ,a.resultado = b.resultado

            ,a.[version] = a.[version] + 1
            ,a.usuario_modificacion = b.ordlin_mod_usr_id
            ,a.fecha_modificacion = b.ordlin_moddte
        FROM [$(eConnect)].dbo.solicitudes_ordenes a
        INNER JOIN #ordenes_alistamiento b ON
            b.id_solicitud_orden = a.id_solicitud_orden
    END

    --CREACION DE RECIBOS
    BEGIN
        IF OBJECT_ID('tempdb..#solicitudes_ordenes') IS NOT NULL BEGIN
	        DROP TABLE #solicitudes_ordenes
        END

        ;WITH
        cte_00 AS
        (
            SELECT
                CAST(tipo_orden AS VARCHAR(50)) AS tipo_orden
            FROM 
            (
             VALUES
                ('RECIBO_ABASTECIMIENTO')
            )a(tipo_orden)
        )
        SELECT
             a.id_solicitud_orden
            ,a.tipo_solicitud
            ,a.id_solicitud

            ,b.tipo_orden
            ,a.id_orden_alistamiento AS id_orden_origen
            ,a.numero_orden AS numero_orden_origen

            ,a.ordlin_mod_usr_id AS usuario_creacion
            ,a.ordlin_moddte AS fecha_creacion
            ,a.ordlin_mod_usr_id AS usuario_modificacion
            ,a.ordlin_moddte AS fecha_modificacion
        INTO #solicitudes_ordenes
        FROM #ordenes_alistamiento a,cte_00 b

        INSERT INTO [$(eConnect)].dbo.solicitudes_ordenes
            (tipo_solicitud
            ,id_solicitud
            
            ,tipo_orden

            ,id_orden_origen
            ,numero_orden_origen

            ,usuario_creacion
            ,fecha_creacion
            ,usuario_modificacion
            ,fecha_modificacion)
        SELECT
             a.tipo_solicitud
            ,a.id_solicitud

            ,a.tipo_orden
            
            ,a.id_orden_origen
            ,a.numero_orden_origen

            ,a.usuario_creacion
            ,a.fecha_creacion
            ,a.usuario_modificacion
            ,a.fecha_modificacion
        FROM #solicitudes_ordenes a
    END

	COMMIT TRANSACTION
END TRY
BEGIN CATCH
    SELECT ERROR_MESSAGE()
	ROLLBACK TRANSACTION
    ;THROW;
END CATCH