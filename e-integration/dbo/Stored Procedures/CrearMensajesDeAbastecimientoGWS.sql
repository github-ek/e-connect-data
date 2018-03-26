CREATE PROCEDURE [dbo].[CrearMensajesDeAbastecimientoGWS]
AS
BEGIN TRY
    --SET NOCOUNT ON;

    BEGIN TRANSACTION

    --MAPAS
    BEGIN
        IF OBJECT_ID('tempdb..#mapa_ciudades_sap') IS NOT NULL BEGIN
            DROP TABLE #mapa_ciudades_sap
        END

        SELECT
            b.clave, b.valor
        INTO #mapa_ciudades_sap
        FROM map.mapas a
        INNER JOIN map.mapas_valores b ON
            b.id_mapa = a.id_mapa
        WHERE
            a.codigo = 'BODEGAS_WMS_CIUDADES_SAP'

        IF OBJECT_ID('tempdb..#mapa_series_ciudades_sap') IS NOT NULL BEGIN
            DROP TABLE #mapa_series_ciudades_sap
        END

        SELECT
            b.clave, b.valor
        INTO #mapa_series_ciudades_sap
        FROM map.mapas a
        INNER JOIN map.mapas_valores b ON
            b.id_mapa = a.id_mapa
        WHERE
            a.codigo = 'BODEGAS_WMS_SERIES_CIUDADES_SAP'

        IF OBJECT_ID('tempdb..#mapa_bodegas_transito_sap') IS NOT NULL BEGIN
            DROP TABLE #mapa_bodegas_transito_sap
        END

        SELECT
            b.clave, b.valor
        INTO #mapa_bodegas_transito_sap
        FROM map.mapas a
        INNER JOIN map.mapas_valores b ON
            b.id_mapa = a.id_mapa
        WHERE
            a.codigo = 'BODEGAS_WMS_BODEGAS_TRANSITO_SAP'


        IF OBJECT_ID('tempdb..#mapa_proyectos_sap') IS NOT NULL BEGIN
            DROP TABLE #mapa_proyectos_sap
        END

        SELECT
            b.clave, b.valor
        INTO #mapa_proyectos_sap
        FROM map.mapas a
        INNER JOIN map.mapas_valores b ON
            b.id_mapa = a.id_mapa
        WHERE
            a.codigo = 'BODEGAS_WMS_PROYECTOS_SAP'

        IF OBJECT_ID('tempdb..#mapa_bodegas_sap') IS NOT NULL BEGIN
            DROP TABLE #mapa_bodegas_sap
        END 

        SELECT
            b.clave, b.valor
        INTO #mapa_bodegas_sap
        FROM map.mapas a
        INNER JOIN map.mapas_valores b ON
            b.id_mapa = a.id_mapa
        WHERE
            a.codigo = 'BODEGAS_ESTADOS_WMS_BODEGAS_SAP'
    END
       
    --SOURCE
    BEGIN
        IF OBJECT_ID('tempdb..#source_lineas') IS NOT NULL BEGIN
            DROP TABLE #source_lineas
        END 

        ;WITH
        cte_00 AS
        (
            SELECT
                 a.id_orden_recibo
                ,a.numero_orden
                ,'NO_PROCESADO' AS estado
                ,b.id_solicitud
                ,b.numero_solicitud
                ,b.id_bodega
                ,d.codigo AS bodega_codigo
                ,b.id_bodega_traslado
                ,e.codigo AS bodega_traslado_codigo
                ,b.fecha_creacion AS fecha_documento
                ,c.numero_linea
                ,c.id_producto
                ,c.producto_codigo
                ,CASE WHEN c.id_estado_inventario = 'REN' THEN 'A' ELSE c.id_estado_inventario END AS id_estado_inventario
                ,CONCAT(e.codigo,'-',CASE WHEN c.id_estado_inventario = 'REN' THEN 'A' ELSE c.id_estado_inventario END) AS bodega_sap_codigo_alterno
                --,c.id_estado_inventario
                --,CONCAT(e.codigo,'-',c.id_estado_inventario) AS bodega_sap_codigo_alterno
                ,c.unidades_conformes
            FROM [$(eConnect)].dbo.ordenes_recibo a
            INNER JOIN [$(eConnect)].dbo.solicitudes b ON
                b.id_solicitud = a.id_solicitud
            INNER JOIN [$(eConnect)].dbo.ordenes_recibo_lineas_confirmadas c ON
                c.id_orden_recibo = a.id_orden_recibo
            AND c.unidades_conformes > 0
            INNER JOIN [$(eConnect)].dbo.bodegas d ON
                d.id_bodega = b.id_bodega
            INNER JOIN [$(eConnect)].dbo.bodegas e ON
                e.id_bodega = b.id_bodega_traslado
            WHERE
                a.cerrada = 1
            AND a.cierre_notificado = 0
        )
        SELECT
             a.*

            ,b.valor AS ciudad_sap_destino
            ,c.valor AS serie_sap_destino
            ,d.valor AS bodega_transito_sap_codigo
            ,e.valor AS bodega_sap_codigo
            ,f.valor AS proyecto_sap_destino_codigo

            ,SYSTEM_USER AS usuario_creacion
            ,SYSDATETIME() AS fecha_creacion
            ,SYSTEM_USER AS usuario_modificacion
            ,SYSDATETIME() AS fecha_modificacion
        INTO #source_lineas
        FROM cte_00 a
        INNER JOIN #mapa_ciudades_sap b ON
            b.clave = a.bodega_traslado_codigo
        INNER JOIN #mapa_series_ciudades_sap c ON
            c.clave = a.bodega_traslado_codigo
        INNER JOIN #mapa_bodegas_transito_sap d ON
            d.clave = a.bodega_traslado_codigo
        INNER JOIN #mapa_bodegas_sap e ON
            e.clave = a.bodega_sap_codigo_alterno
        INNER JOIN #mapa_proyectos_sap f ON
            f.clave = a.bodega_traslado_codigo

    END

    --MENSAJES
    BEGIN
        IF OBJECT_ID('tempdb..#mensajes') IS NOT NULL BEGIN
            DROP TABLE #mensajes
        END 

        SELECT DISTINCT
             CAST(NULL AS BIGINT) AS id_mensaje
            ,a.id_orden_recibo
            ,a.numero_orden
            ,a.estado
            ,a.id_solicitud
            ,a.numero_solicitud
            ,a.id_bodega
            ,a.bodega_codigo
            ,a.id_bodega_traslado
            ,a.bodega_traslado_codigo
            ,a.fecha_documento

            ,LEFT(FORMAT(a.fecha_documento,'yyyyMMdd'),10) AS DocDate
            ,'' AS DueDate
            ,LEFT('CN830074144',20) AS CardCode
            ,LEFT(a.serie_sap_destino,20) AS Series
            ,LEFT(a.bodega_transito_sap_codigo,50) AS FromWarehouse
            ,LEFT(FORMAT(a.fecha_documento,'yyyyMMdd'),10) AS TaxDate
            ,'' AS [Address]
            ,'' AS Comments
            ,67 AS DocObjectCode
            ,CAST(a.id_orden_recibo AS VARCHAR(20)) AS U_BKV_UID
            ,'' AS U_GW_Fecha1
            ,'' AS U_GW_Fecha2
            ,'' AS U_Ocompra
            ,'' AS U_GW_PRE_DOC_ORG
            ,a.numero_solicitud AS U_GW_NU_DOC_ORG
            ,'' AS U_GW_PRE_DOC_ANT
            ,a.numero_orden AS U_GW_NU_DOC_ANT

            ,a.usuario_creacion
            ,a.fecha_creacion
            ,a.usuario_modificacion
            ,a.fecha_modificacion
        INTO #mensajes
        FROM #source_lineas a

        IF OBJECT_ID('tempdb..#mensajes_lineas') IS NOT NULL BEGIN
            DROP TABLE #mensajes_lineas
        END 

        SELECT DISTINCT
             a.id_orden_recibo
            ,a.numero_linea
            ,a.numero_linea - 1 AS LineNum
            ,a.producto_codigo AS ItemCode
            ,a.unidades_conformes AS Quantity
            ,'' AS U_VuCadena
            ,'' AS U_VIcoCadena
            ,LEFT(a.bodega_sap_codigo,50) AS WarehouseCode
            ,LEFT(a.proyecto_sap_destino_codigo,50) AS ProjectCode
            ,'' AS U_Comentariosl

            ,a.usuario_creacion
            ,a.fecha_creacion
            ,a.usuario_modificacion
            ,a.fecha_modificacion
        INTO #mensajes_lineas
        FROM #source_lineas a
    END

    --CREACION DE LOS MENSAJES
    BEGIN
        DECLARE @t AS TABLE(id_mensaje BIGINT,id_orden_recibo BIGINT)
        BEGIN
    
            INSERT INTO [$(eStage)].dbo.mensajes_abastecimientos_gws
                (id_orden_recibo
                ,estado

                ,DocDate
                ,DueDate
                ,CardCode
                ,Series
                ,FromWarehouse
                ,TaxDate
                ,[Address]
                ,Comments
                ,DocObjectCode
                ,U_BKV_UID
                ,U_GW_Fecha1
                ,U_GW_Fecha2
                ,U_Ocompra
                ,U_GW_PRE_DOC_ORG
                ,U_GW_NU_DOC_ORG
                ,U_GW_PRE_DOC_ANT
                ,U_GW_NU_DOC_ANT

                ,usuario_creacion
                ,fecha_creacion
                ,usuario_modificacion
                ,fecha_modificacion)
            OUTPUT inserted.id_mensaje, inserted.id_orden_recibo
            INTO @t
            SELECT
                 id_orden_recibo
                ,estado

                ,DocDate
                ,DueDate
                ,CardCode
                ,Series
                ,FromWarehouse
                ,TaxDate
                ,[Address]
                ,Comments
                ,DocObjectCode
                ,U_BKV_UID
                ,U_GW_Fecha1
                ,U_GW_Fecha2
                ,U_Ocompra
                ,U_GW_PRE_DOC_ORG
                ,U_GW_NU_DOC_ORG
                ,U_GW_PRE_DOC_ANT
                ,U_GW_NU_DOC_ANT

                ,usuario_creacion
                ,fecha_creacion
                ,usuario_modificacion
                ,fecha_modificacion
            FROM #mensajes a

            UPDATE a
            SET a.id_mensaje = b.id_mensaje
            FROM #mensajes a 
            INNER JOIN @t b ON
                b.id_orden_recibo = a.id_orden_recibo

            INSERT INTO [$(eStage)].dbo.mensajes_abastecimientos_gws_lineas
                (id_mensaje
                ,numero_linea

                ,LineNum
                ,ItemCode
                ,Quantity
                ,U_VuCadena
                ,U_VIcoCadena
                ,WarehouseCode
                ,ProjectCode
                ,U_Comentariosl)
            SELECT
                 a.id_mensaje
                ,b.numero_linea
                ,b.LineNum
                ,b.ItemCode
                ,b.Quantity
                ,b.U_VuCadena
                ,b.U_VIcoCadena
                ,b.WarehouseCode
                ,b.ProjectCode
                ,b.U_Comentariosl            
            FROM #mensajes a
            INNER JOIN #mensajes_lineas b ON
                b.id_orden_recibo = a.id_orden_recibo
        END

        BEGIN
            UPDATE a
            SET  a.estado = 'MENSAJE_CREADO'

                ,a.[version] = a.[version] + 1
                ,a.fecha_modificacion = b.fecha_modificacion
                ,a.usuario_modificacion = b.usuario_modificacion
            FROM [$(eConnect)].dbo.ordenes_recibo a
            INNER JOIN #mensajes b ON
                b.id_orden_recibo = a.id_orden_recibo

            UPDATE c
            SET  c.estado = a.estado

                ,c.[version] = a.[version] + 1
                ,c.fecha_modificacion = a.fecha_modificacion
                ,c.usuario_modificacion = a.usuario_modificacion
            FROM [$(eConnect)].dbo.ordenes_recibo a
            INNER JOIN #mensajes b ON
                b.id_orden_recibo = a.id_orden_recibo
            INNER JOIN [$(eConnect)].dbo.solicitudes_ordenes c ON
                c.id_solicitud_orden = a.id_solicitud_orden
        END
    END

	COMMIT TRANSACTION
END TRY
BEGIN CATCH
    SELECT ERROR_MESSAGE()
    IF @@TRANCOUNT > 0 BEGIN
	    ROLLBACK TRANSACTION
    END
    ;THROW;
END CATCH