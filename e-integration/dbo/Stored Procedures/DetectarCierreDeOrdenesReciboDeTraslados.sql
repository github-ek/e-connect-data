CREATE PROCEDURE [dbo].[DetectarCierreDeOrdenesReciboDeTraslados]
AS
BEGIN TRY
    --SET NOCOUNT ON;

    BEGIN TRANSACTION
    
    --CONSOLIDAR DATOS DE E-WMS
    BEGIN
        IF OBJECT_ID('tempdb..#source') IS NOT NULL BEGIN
	        DROP TABLE #source
        END

        SELECT DISTINCT
             a.record_key
            
            ,a.client_id
            ,b.id_cliente
            
            ,a.wh_id
            ,c.id_bodega
            
            ,a.po_num
            ,d.id_orden_recibo
            ,d.numero_orden
            ,d.estado
            ,d.cerrada AS cerrada_en_destino
            ,CAST(0 AS BIT) AS requiere_estampillado

            ,e.id_solicitud_orden
            ,e.tipo_solicitud
            ,e.id_solicitud

            ,a.tractor_num
            ,a.driver_nam
            ,a.driver_lic_num
            ,a.arrdte
            ,a.close_dte
            ,a.dispatch_dte
        INTO #source
        FROM [$(eWms)].dbo.ordenes_recibo a
        LEFT OUTER JOIN [$(eWms)].dbo.clientes b ON
            b.client_id = a.client_id
        LEFT OUTER JOIN [$(eWms)].dbo.bodegas c ON
            c.wh_id = a.wh_id
        LEFT OUTER JOIN [$(eConnect)].dbo.ordenes_recibo d ON
            d.id_cliente = b.id_cliente
        AND d.id_bodega = c.id_bodega
        AND d.numero_orden = a.po_num
        LEFT OUTER JOIN [$(eConnect)].dbo.solicitudes_ordenes e ON
            e.id_solicitud_orden = d.id_solicitud_orden
        WHERE  0 = 0 
        AND a.estado = 'CERRADA'
        AND a.cambio_notificado = 0

        IF OBJECT_ID('tempdb..#source_lineas') IS NOT NULL BEGIN
	        DROP TABLE #source_lineas
        END

        ;WITH
        cte_00 AS
        (
            SELECT
                 a.id_cliente
                ,a.id_bodega
                ,a.id_orden_recibo
                
                ,b.record_key
                ,b.line_key
                ,b.id
                ,b.invlin
                ,b.invsln
                ,b.seqnum
                ,ROW_NUMBER()  OVER(PARTITION BY a.id_orden_recibo, b.prtnum, b.rcvsts ORDER BY b.rcvlin_moddte DESC) AS orden_sublinea

                ,b.prtnum
                ,c.id_producto
                ,c.codigo AS producto_codigo

                ,b.rcvsts
                ,d.id_estado_inventario

                ,b.expqty
                ,b.rcvqty
                ,SUM(b.expqty) OVER(PARTITION BY a.id_orden_recibo, b.prtnum, b.rcvsts) AS unidades_solicitadas
                ,SUM(b.rcvqty) OVER(PARTITION BY a.id_orden_recibo, b.prtnum, b.rcvsts) AS unidades_recibidas
                ,SUM(b.expqty) OVER(PARTITION BY a.id_orden_recibo, b.prtnum) AS total_unidades_solicitadas
                ,SUM(b.rcvqty) OVER(PARTITION BY a.id_orden_recibo, b.prtnum) AS total_unidades_recibidas

                ,b.rcvlin_moddte AS fecha_creacion
                ,b.rcvlin_mod_usr_id AS usuario_creacion
                ,b.rcvlin_moddte AS fecha_modificacion
                ,b.rcvlin_mod_usr_id AS usuario_modificacion
            FROM #source a
            INNER JOIN [$(eWms)].dbo.ordenes_recibo b ON
                b.record_key = a.record_key
            LEFT OUTER JOIN [$(eConnect)].dbo.productos c ON
                c.id_cliente = a.id_cliente
            AND c.codigo = b.prtnum
            LEFT OUTER JOIN [$(eConnect)].dbo.estados_inventario d ON
                d.id_estado_inventario = b.rcvsts
            WHERE
                a.id_orden_recibo IS NOT NULL
        ),
        cte_01 AS
        (
            SELECT
                 a.*
                ,ROW_NUMBER() OVER(PARTITION BY a.id_orden_recibo ORDER BY CASE WHEN a.unidades_solicitadas > 0 THEN 0 ELSE 1 END, a.line_key) AS numero_linea
                ,CAST(CASE WHEN a.unidades_solicitadas > 0 THEN 1 ELSE 0 END AS BIT) AS linea_original
                ,ROW_NUMBER() OVER(PARTITION BY a.id_orden_recibo ORDER BY a.fecha_modificacion DESC) AS orden_modificacion
                ,CASE WHEN unidades_solicitadas = 0 AND unidades_recibidas > 0 AND total_unidades_solicitadas > 0 THEN unidades_recibidas ELSE 0 END AS unidades_no_conformes
                ,CASE WHEN total_unidades_solicitadas > total_unidades_recibidas AND unidades_solicitadas = total_unidades_solicitadas THEN total_unidades_solicitadas - total_unidades_recibidas ELSE 0 END AS unidades_faltantes
                ,CASE WHEN total_unidades_solicitadas < total_unidades_recibidas AND unidades_solicitadas = total_unidades_solicitadas THEN unidades_recibidas - unidades_solicitadas ELSE 0 END AS unidades_sobrantes
            FROM cte_00 a
            WHERE
                a.orden_sublinea = 1
        ),
        cte_02 AS
        (
            SELECT
                 a.*
                ,CASE 
                WHEN unidades_solicitadas >= unidades_recibidas THEN unidades_recibidas
                WHEN unidades_solicitadas < unidades_recibidas THEN unidades_solicitadas
                ELSE 0 END unidades_conformes
                ,b.id_unidad_medida
                ,ROW_NUMBER() OVER(PARTITION BY a.id_orden_recibo,a.numero_linea ORDER BY b.nivel) AS orden_unidad_medida
            FROM cte_01 a
            LEFT OUTER JOIN [$(eConnect)].dbo.productos_medidas b ON
                b.id_producto = a.id_producto
            AND b.id_bodega = a.id_bodega
            AND b.factor_conversion = 1
            AND b.rcv_flg = 1
        )
        SELECT
             id_cliente
            ,id_bodega
            ,id_orden_recibo
            ,record_key
            ,line_key
            ,id
            ,invlin
            ,invsln
            ,seqnum
            ,numero_linea
            ,linea_original
            ,prtnum
            ,id_producto
            ,producto_codigo
            ,rcvsts
            ,id_estado_inventario
            ,id_unidad_medida
            ,unidades_solicitadas
            ,unidades_recibidas
            ,total_unidades_solicitadas
            ,total_unidades_recibidas
            ,unidades_conformes
            ,unidades_no_conformes
            ,unidades_faltantes
            ,unidades_sobrantes
            ,orden_modificacion
            ,fecha_creacion
            ,usuario_creacion
            ,fecha_modificacion
            ,usuario_modificacion
        INTO #source_lineas
        FROM cte_02 a
        WHERE
            a.orden_unidad_medida = 1

        IF OBJECT_ID('tempdb..#source_lineas_productos_rentas') IS NOT NULL BEGIN
	        DROP TABLE #source_lineas_productos_rentas
        END
    
        SELECT DISTINCT
            a.id_orden_recibo,a.id_producto
        INTO #source_lineas_productos_rentas
        FROM #source_lineas a
        INNER JOIN [$(eConnect)].dbo.estados_inventario b ON
            b.id_estado_inventario = a.id_estado_inventario
        AND b.prioridad_estampillado IS NOT NULL
        WHERE
            a.linea_original = 1

        UPDATE a
        SET a.requiere_estampillado = 1
        FROM #source a
        INNER JOIN #source_lineas_productos_rentas b ON
            b.id_orden_recibo = a.id_orden_recibo
    END

    --DETECTAR INCONSISTENCIAS   
    BEGIN
        IF OBJECT_ID('tempdb..#source_lineas_salio_rentas_no_entro_rentas') IS NOT NULL BEGIN
	        DROP TABLE #source_lineas_salio_rentas_no_entro_rentas
        END

        SELECT DISTINCT
             a.id_orden_recibo
            ,a.numero_linea
            ,a.id_producto
            ,a.producto_codigo
            ,a.id_estado_inventario
        INTO #source_lineas_salio_rentas_no_entro_rentas
        FROM #source_lineas a
        INNER JOIN #source_lineas_productos_rentas b ON
            b.id_orden_recibo = a.id_orden_recibo
        AND b.id_producto = a.id_producto
        INNER JOIN [$(eConnect)].dbo.estados_inventario c ON
            c.id_estado_inventario = a.id_estado_inventario
        AND c.id_estado_inventario IS NULL
        WHERE
            a.linea_original = 0

        IF OBJECT_ID('tempdb..#source_inconsistencias') IS NOT NULL BEGIN
	        DROP TABLE #source_inconsistencias
        END

        ;WITH
        cte_00 AS
        (
            SELECT
                 a.*

                ,CASE WHEN a.id_cliente IS NULL                                             THEN 1 ELSE 0 END AS cliente_no_existe
                ,CASE WHEN a.id_bodega IS NULL                                              THEN 1 ELSE 0 END AS bodega_no_existe
                ,CASE WHEN a.id_cliente IS NOT NULL AND a.id_bodega IS NOT NULL AND a.id_orden_recibo IS NULL THEN 1 ELSE 0 END AS orden_no_existe
                ,CASE WHEN a.id_orden_recibo IS NOT NULL AND a.cerrada_en_destino = 1       THEN 1 ELSE 0 END AS orden_cerrada_en_destino
                ,CASE WHEN a.id_orden_recibo IS NOT NULL AND b.id_producto IS NULL          THEN 1 ELSE 0 END AS producto_no_existe
                ,CASE WHEN a.id_orden_recibo IS NOT NULL AND b.id_estado_inventario IS NULL THEN 1 ELSE 0 END AS estado_no_existe
                ,CASE WHEN a.id_orden_recibo IS NOT NULL AND b.unidades_recibidas IS NULL   THEN 1 ELSE 0 END AS unidad_recibo_no_existe
                ,CASE WHEN a.id_orden_recibo IS NOT NULL AND c.id_orden_recibo IS NOT NULL  THEN 1 ELSE 0 END AS estado_destino_debe_ser_de_rentas
            FROM #source a
            LEFT OUTER JOIN #source_lineas b ON
                b.id_orden_recibo = a.id_orden_recibo
            LEFT OUTER JOIN #source_lineas_salio_rentas_no_entro_rentas c ON
                c.id_orden_recibo = b.id_orden_recibo
            AND c.numero_linea = b.numero_linea
        )
        SELECT
            a.*
        INTO #source_inconsistencias
        FROM cte_00 a
        WHERE
            cliente_no_existe + 
            bodega_no_existe + 
            orden_no_existe + 
            orden_cerrada_en_destino +
            producto_no_existe + 
            estado_no_existe + 
            unidad_recibo_no_existe +
            estado_destino_debe_ser_de_rentas > 0

        DELETE a
        FROM #source a
        INNER JOIN #source_inconsistencias b ON
            b.record_key = a.record_key

        --TODO enviar errores a una tabla de error en errores
        DELETE a
        FROM #source_lineas a
        INNER JOIN #source_inconsistencias b ON
            b.id_orden_recibo = a.id_orden_recibo
    END

    --UPDATE ordenes_recibo EN [$(eWms)].
    BEGIN
        UPDATE a
        SET  a.cambio_notificado = 1
            ,a.cerrada_con_errores = 0
        FROM [$(eWms)].dbo.ordenes_recibo a 
        INNER JOIN #source_lineas b ON
            b.record_key = a.record_key

        UPDATE a
        SET  a.cambio_notificado = 1
            ,a.cerrada_con_errores = 1
        FROM [$(eWms)].dbo.ordenes_recibo a 
        INNER JOIN #source_inconsistencias b ON
            b.record_key = a.record_key
    END

    --PRE UPDATE ORDENES 
    BEGIN

        IF OBJECT_ID('tempdb..#ordenes_recibo_lineas_confirmadas') IS NOT NULL BEGIN
	        DROP TABLE #ordenes_recibo_lineas_confirmadas
        END

        SELECT
             id_orden_recibo
            ,numero_linea
            ,linea_original
            ,id_producto
            ,producto_codigo
            ,id_estado_inventario
            ,id_unidad_medida
            ,unidades_solicitadas
            ,unidades_recibidas
            ,unidades_conformes
            ,unidades_no_conformes
            ,unidades_faltantes
            ,unidades_sobrantes
            ,orden_modificacion
            ,fecha_creacion
            ,usuario_creacion
            ,fecha_modificacion
            ,usuario_modificacion
        INTO #ordenes_recibo_lineas_confirmadas
        FROM #source_lineas a 

        IF OBJECT_ID('tempdb..#ordenes_recibo') IS NOT NULL BEGIN
	        DROP TABLE #ordenes_recibo
        END

        ;WITH
        cte_00 AS
        (
            SELECT
                 a.id_solicitud_orden
                ,a.tipo_solicitud
                ,a.id_solicitud

                ,a.id_orden_recibo
                ,a.numero_orden
                ,a.requiere_estampillado

                ,SUM(b.unidades_no_conformes + b.unidades_faltantes + b.unidades_sobrantes) OVER(PARTITION BY a.id_orden_recibo) AS unidades_novedades
                ,b.orden_modificacion
                ,b.fecha_modificacion
                ,b.usuario_modificacion
            FROM #source a
            INNER JOIN #ordenes_recibo_lineas_confirmadas b ON
                b.id_orden_recibo = a.id_orden_recibo
            )
        SELECT
             a.*
            
            ,CASE WHEN a.unidades_novedades = 0 THEN 'RECIBIDA' ELSE 'RECIBIDA_CON_NOVEDADES' END AS estado
            ,CASE WHEN a.unidades_novedades = 0 THEN 'OK' ELSE 'NOVEDADES' END AS resultado
        INTO #ordenes_recibo
        FROM cte_00 a
        WHERE
            a.orden_modificacion = 1

        IF OBJECT_ID('tempdb..#solicitudes_ordenes') IS NOT NULL BEGIN
	        DROP TABLE #solicitudes_ordenes
        END

        SELECT DISTINCT
             a.id_solicitud_orden
            ,a.tipo_solicitud
            ,a.id_solicitud

            ,'ESTAMPILLADO' AS tipo_orden
            ,a.id_orden_recibo AS id_orden_origen
            ,a.numero_orden AS numero_orden_origen

            ,a.usuario_modificacion AS usuario_creacion
            ,a.fecha_modificacion AS fecha_creacion
            ,a.usuario_modificacion
            ,a.fecha_modificacion
        INTO #solicitudes_ordenes
        FROM #ordenes_recibo a
        INNER JOIN #source_lineas_productos_rentas b ON
            b.id_orden_recibo = a.id_orden_recibo
    END

    --UPDATE ORDENES
    BEGIN
        UPDATE a
        SET 
             a.estado = b.estado
            ,a.cerrada = 1
            ,a.cierre_notificado = 0

            ,a.[version] = a.[version] + 1
            ,a.fecha_modificacion = b.fecha_modificacion
            ,a.usuario_modificacion = b.usuario_modificacion
        FROM [$(eConnect)].dbo.ordenes_recibo a
        INNER JOIN #ordenes_recibo b ON
            b.id_orden_recibo = a.id_orden_recibo

        DELETE a
        FROM [$(eConnect)].dbo.ordenes_recibo_lineas_confirmadas a
        INNER JOIN #ordenes_recibo b ON
            b.id_orden_recibo = a.id_orden_recibo

        INSERT INTO [$(eConnect)].dbo.ordenes_recibo_lineas_confirmadas
            (id_orden_recibo
            ,numero_linea
            ,linea_original
            ,id_producto
            ,producto_codigo
            ,id_estado_inventario
            ,id_unidad_medida
            ,unidades_solicitadas
            ,unidades_recibidas
            ,unidades_conformes
            ,unidades_no_conformes
            ,unidades_faltantes
            ,unidades_sobrantes
            ,fecha_creacion
            ,usuario_creacion
            ,fecha_modificacion
            ,usuario_modificacion)
        SELECT
             id_orden_recibo
            ,numero_linea
            ,linea_original
            ,id_producto
            ,producto_codigo
            ,id_estado_inventario
            ,id_unidad_medida
            ,unidades_solicitadas
            ,unidades_recibidas
            ,unidades_conformes
            ,unidades_no_conformes
            ,unidades_faltantes
            ,unidades_sobrantes
            ,fecha_creacion
            ,usuario_creacion
            ,fecha_modificacion
            ,usuario_modificacion
        FROM #ordenes_recibo_lineas_confirmadas

        UPDATE a
        SET  a.estado = b.estado
            ,a.resultado = b.resultado

            ,a.[version] = a.[version] + 1
            ,a.fecha_modificacion = b.fecha_modificacion
            ,a.usuario_modificacion = b.usuario_modificacion
        FROM [$(eConnect)].dbo.solicitudes_ordenes a
        INNER JOIN #ordenes_recibo b ON
            b.id_solicitud_orden = a.id_solicitud_orden
    END

    --CREACION DE ORDENES DE ESTAMPILLADO
    BEGIN

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