CREATE PROCEDURE [dbo].[CrearMensajesDeAlistamientoJda]
AS
BEGIN TRY
    --SET NOCOUNT ON;

    BEGIN
        IF OBJECT_ID('tempdb..#mensajes') IS NOT NULL BEGIN
            DROP TABLE #mensajes
        END

        SELECT
             NEXT VALUE FOR dbo.hibernate_sequence  AS id_mensaje
            ,a.id_solicitud
            ,a.id_orden_alistamiento
            ,a.numero_orden AS id_externo
            ,'NO_PROCESADO' AS estado_mensaje

            ,b.codigo AS cliente_codigo
            ,c.codigo AS servicio_codigo
            ,a.id_bodega
            ,a.id_ciudad_destinatario

            ,d.codigo AS whse_id
            ,b.codigo_alterno_wms AS client_id
            
            ,g.codigo_wms AS ordtyp
            
            ,a.numero_orden AS ordnum
            ,'ordnum' AS shipby
            ,RTRIM(LTRIM(f.numero_solicitud_sin_prefijo)) AS rmanum

            ,COALESCE(e.codigo,'') AS bus_grp
            ,COALESCE(a.tercero_identificacion,'') AS cstnum

            ,a.fecha_maxima_solicitada AS cpodte

            ,SYSTEM_USER AS usuario_creacion
            ,SYSDATETIME() AS fecha_creacion
            ,SYSTEM_USER AS usuario_modificacion
            ,SYSDATETIME() AS fecha_modificacion
        INTO #mensajes
        FROM [$(eConnect)].dbo.ordenes_alistamiento a
        INNER JOIN [$(eConnect)].dbo.clientes b ON
            b.id_cliente = a.id_cliente
        INNER JOIN [$(eConnect)].dbo.servicios c ON
            c.id_servicio = a.id_servicio
        INNER JOIN [$(eConnect)].dbo.bodegas d ON
            d.id_bodega = a.id_bodega
        LEFT OUTER JOIN [$(eConnect)].dbo.canales e ON
            e.id_canal = a.id_canal
        INNER JOIN [$(eConnect)].dbo.solicitudes f ON
            f.id_solicitud = a.id_solicitud
        INNER JOIN [$(eConnect)].dbo.tipos_wms_orden g ON
            g.id_tipo_orden_wms = a.id_tipo_orden_wms
        WHERE
            a.estado_orden = 'NO_PROCESADO'

        IF OBJECT_ID('tempdb..#mensajes_cstmst') IS NOT NULL BEGIN
            DROP TABLE #mensajes_cstmst
        END

        ;WITH
        cte_00 AS
        (
            SELECT
                 a.id_orden_alistamiento
                ,a.client_id
                ,a.cstnum
                ,1 AS ordinal
            FROM #mensajes a
            UNION
            SELECT
                 a.id_orden_alistamiento
                ,a.client_id
                ,a.cliente_codigo AS cstnum
                ,2 AS ordinal
            FROM #mensajes a
        ),
        cte_01 AS(
            SELECT
                 a.id_orden_alistamiento
                ,b.client_id AS CLIENT_ID
                ,b.cstnum AS STCUST
                ,b.adr_id AS ST_HOST_ADR_ID
                ,b.cstnum AS RTCUST
                ,b.adr_id AS RT_HOST_ADR_ID
                ,b.cstnum AS BTCUST
                ,b.adr_id AS BT_HOST_ADR_ID
                ,a.ordinal
            FROM cte_00 a
            INNER JOIN [$(WMS_DB_SERVER)].[$(ttcwmsprd)].dbo.cstmst b ON
                b.client_id = a.client_id
            AND b.cstnum = a.cstnum
        )
        SELECT
             a.id_orden_alistamiento
            ,COALESCE(b.stcust,c.stcust) AS stcust
            ,COALESCE(b.st_host_adr_id,c.st_host_adr_id) AS st_host_adr_id
            ,c.rtcust
            ,c.rt_host_adr_id
            ,c.btcust
            ,c.bt_host_adr_id
        INTO #mensajes_cstmst
        FROM #mensajes a
        LEFT OUTER JOIN cte_01 b ON
            b.id_orden_alistamiento = a.id_orden_alistamiento
        AND b.ordinal = 1
        INNER JOIN cte_01 c ON
            c.id_orden_alistamiento = a.id_orden_alistamiento
        AND c.ordinal = 2

        IF OBJECT_ID('tempdb..#mensajes_documentos') IS NOT NULL BEGIN
            DROP TABLE #mensajes_documentos
        END

        SELECT
             a.id_orden_alistamiento
            ,b.numero_documento
        INTO #mensajes_documentos
        FROM #mensajes a
        INNER JOIN [$(eConnect)].dbo.solicitudes_documentos b ON
            b.id_solicitud = a.id_solicitud
        INNER JOIN [$(eConnect)].dbo.tipos_documento c ON
            c.id_tipo_documento = c.id_tipo_documento
        AND c.codigo = 'OCCF'

        IF OBJECT_ID('tempdb..#mensajes_lineas') IS NOT NULL BEGIN
            DROP TABLE #mensajes_lineas
        END

        SELECT
             a.id_orden_alistamiento
            ,b.numero_linea

            ,FORMAT(b.numero_linea,'0000') AS ordlin
            ,CAST('0000' AS NVARCHAR(10)) AS ordsln
            ,CAST(b.producto_codigo AS NVARCHAR(50)) AS prtnum
            ,b.unidades_solicitadas AS ordqty
            ,CAST(b.id_estado_inventario AS NVARCHAR(4)) AS invsts
            ,CAST(b.id_estado_inventario AS NVARCHAR(4)) AS invsts_prg
            
            ,CAST(b.lote AS NVARCHAR(30)) AS lotnum
            ,1 AS splflg
            ,'GENERAL' AS carcod
            ,'GENERAL' AS srvlvl
            ,CAST('' AS NVARCHAR(50)) AS ordinv
            ,CONCAT(a.client_id,'|',a.whse_id,'|',LEFT(COALESCE(c.valor,''),5),'|',CASE WHEN b.lote <> '' THEN 'S' ELSE 'N' END) AS clave_ordinv

            ,CAST(LEFT(COALESCE(b.predistribucion,''),20) AS NVARCHAR(20)) AS pckgr1
            ,CAST('' AS NVARCHAR(20)) AS pckgr2
            ,CAST(LEFT(COALESCE(e.numero_documento,''),20) AS NVARCHAR(20)) AS pckgr3
            ,CAST(LEFT(COALESCE(d.nombre_alterno,''),20) AS NVARCHAR(20)) AS pckgr4
        INTO #mensajes_lineas
        FROM #mensajes a
        INNER JOIN [$(eConnect)].dbo.ordenes_alistamiento_lineas b ON
            b.id_orden_alistamiento = a.id_orden_alistamiento
        LEFT OUTER JOIN [$(eConnect)].dbo.productos_atributos c ON
            c.id_producto = b.id_producto
        AND c.id_bodega = a.id_bodega
        AND c.codigo = 'DTE_CODE'
        LEFT OUTER JOIN [$(eConnect)].dbo.ciudades d ON
            d.id_ciudad = a.id_ciudad_destinatario
        LEFT OUTER JOIN #mensajes_documentos e ON
            e.id_orden_alistamiento = a.id_orden_alistamiento

        IF OBJECT_ID('tempdb..#mensajes_lineas_ordinv') IS NOT NULL BEGIN
            DROP TABLE #mensajes_lineas_ordinv
        END

        ;WITH
        cte_00 AS
        (
            SELECT
                 b.clave
                ,b.valor
                ,LEN(b.clave) - LEN(REPLACE(b.clave,'%','')) AS prioridad
            FROM  [$(eIntegration)].dbo.mapas a
            INNER JOIn [$(eIntegration)].dbo.mapas_valores b ON
                b.id_mapa = a.id_mapa
            WHERE
                a.codigo = 'ORDINV'
        ),
        cte_01 AS
        (
            SELECT
                 a.id_orden_alistamiento
                ,a.numero_linea
                ,a.clave_ordinv
                ,b.clave
                ,CAST(LEFT(b.valor,30) AS NVARCHAR(30)) AS ordinv
                ,ROW_NUMBER() OVER(PARTITION BY  a.id_orden_alistamiento, a.numero_linea ORDER BY prioridad) AS orden
            FROM #mensajes_lineas a
            LEFT OUTER JOIN cte_00 b ON
                a.clave_ordinv LIKE b.clave
        )
        SELECT
            a.*
        INTO #mensajes_lineas_ordinv
        FROM cte_01 a
        WHERE
            a.orden = 1
    END
   
    --CREACION DE LOS MENSAJES
    BEGIN TRANSACTION

    BEGIN
        INSERT INTO dbo.mensajes_alistamiento_jda
            (id_mensaje
            ,id_orden_alistamiento
            ,id_externo
            ,estado_mensaje

            ,cliente_codigo
            ,servicio_codigo

            ,whse_id
            ,client_id
            ,ordtyp
            ,ordnum
            ,wh_id
            ,shipby
            ,rmanum
            ,bus_grp
            ,btcust
            ,stcust
            ,rtcust
            ,bt_host_adr_id
            ,st_host_adr_id
            ,rt_host_adr_id
            ,cpodte

            ,usuario_creacion
            ,fecha_creacion
            ,usuario_modificacion
            ,fecha_modificacion)
        SELECT
             a.id_mensaje
            ,a.id_orden_alistamiento
            ,a.id_externo
            ,CASE WHEN b.id_orden_alistamiento IS NOT NULL THEN a.estado_mensaje ELSE 'ERROR_CSTMST' END estado_mensaje

            ,cliente_codigo
            ,servicio_codigo

            ,a.whse_id
            ,a.client_id
            ,a.ordtyp
            ,a.ordnum
            ,a.whse_id
            ,a.shipby
            ,a.rmanum
            ,a.bus_grp
            ,b.btcust
            ,b.stcust
            ,b.rtcust
            ,b.bt_host_adr_id
            ,b.st_host_adr_id
            ,b.rt_host_adr_id
            ,a.cpodte
                
            ,a.usuario_creacion
            ,a.fecha_creacion
            ,a.usuario_modificacion
            ,a.fecha_modificacion
        FROM #mensajes a
        LEFT OUTER JOIN #mensajes_cstmst b ON
            b.id_orden_alistamiento = a.id_orden_alistamiento

        INSERT INTO dbo.mensajes_alistamiento_jda_lineas
            (id_mensaje
            ,numero_linea

            ,ordlin
            ,ordsln
            ,prtnum
            ,ordqty
            ,invsts
            ,invsts_prg
            ,lotnum
            ,splflg
            ,carcod
            ,srvlvl
            ,ordinv

            ,pckgr1
            ,pckgr2
            ,pckgr3
            ,pckgr4)
        SELECT
             a.id_mensaje
            ,b.numero_linea

            ,b.ordlin
            ,b.ordsln
            ,b.prtnum
            ,b.ordqty
            ,b.invsts
            ,b.invsts_prg
            ,b.lotnum
            ,b.splflg
            ,b.carcod
            ,b.srvlvl
            ,c.ordinv

            ,b.pckgr1
            ,b.pckgr2
            ,b.pckgr3
            ,b.pckgr4
        FROM #mensajes a
        INNER JOIN #mensajes_lineas b ON
            b.id_orden_alistamiento = a.id_orden_alistamiento
        LEFT OUTER JOIN #mensajes_lineas_ordinv c ON
            c.id_orden_alistamiento = b.id_orden_alistamiento
        AND c.numero_linea = b.numero_linea

        UPDATE a
        SET  a.estado_orden = 'MENSAJE_CREADO'

            ,a.[version] = a.[version] + 1
            ,a.fecha_modificacion = b.fecha_modificacion
            ,a.usuario_modificacion = b.usuario_modificacion
        FROM [$(eConnect)].dbo.ordenes_alistamiento a
        INNER JOIN #mensajes b ON
            b.id_orden_alistamiento = a.id_orden_alistamiento
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
