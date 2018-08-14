﻿CREATE PROCEDURE [dbo].[CrearSolicitudesEstandar]
AS
BEGIN TRY
    --CONSOLIDAR DATOS DE LAS SOLICITUDES
    BEGIN
        IF OBJECT_ID('tempdb..#solicitudes') IS NOT NULL BEGIN
            DROP TABLE #solicitudes
        END
        
        SELECT
             IDENTITY(BIGINT,1,1) AS id

            ,a.id_solicitud
            ,a.tipo_solicitud
            ,a.numero_solicitud
            ,a.prefijo
            ,a.numero_solicitud_sin_prefijo
            ,'NO_PROCESADA' estado

            ,a.id_bodega
            ,a.id_bodega_traslado
            ,a.id_cliente
            ,a.id_servicio
            ,a.servicio_codigo_alterno
            ,a.id_tercero
            ,a.tercero_identificacion
            ,a.tercero_nombre
            ,a.id_canal
            ,a.canal_codigo_alterno

            ,a.fecha_minima_solicitada
            ,a.fecha_maxima_solicitada
            ,a.hora_minima_solicitada
            ,a.hora_maxima_solicitada
            
            ,a.requiere_transporte
            ,a.requiere_recaudo
            ,a.nota

            ,a.usuario_creacion
            ,a.fecha_creacion
            ,a.usuario_modificacion
            ,a.fecha_modificacion

            ,CASE WHEN b.id_solicitud IS NOT NULL THEN 1 ELSE 0 END AS solicitud_existente
        INTO #solicitudes
        FROM #source a
        LEFT OUTER JOIN [$(eConnect)].dbo.solicitudes b ON
            b.id_cliente = a.id_cliente
        AND b.numero_solicitud = a.numero_solicitud
        WHERE
            a.numero_linea = 1

        CREATE UNIQUE INDEX ix_solicitudes_01 ON #solicitudes(id_cliente,numero_solicitud)

        IF OBJECT_ID('tempdb..#solicitudes_lineas') IS NOT NULL BEGIN
            DROP TABLE #solicitudes_lineas
        END
        
        SELECT
             a.id

            ,b.numero_linea
            ,c.id_producto
            ,c.codigo AS producto_codigo
            ,b.id_estado_inventario
            ,e.id_unidad_medida
            ,b.cantidad_solicitada / COALESCE(d.factor_conversion,1) AS unidades
            ,CAST((b.valor_unitario_declarado / COALESCE(d.factor_conversion,1)) AS DECIMAL(10,2)) AS valor_unitario_declarado
            ,b.lote

            ,b.id_unidad_medida_solicitada
            ,b.unidad_medida_solicitada_codigo_alterno
            ,b.cantidad_solicitada
            ,COALESCE(d.factor_conversion,1) AS factor_conversion

            ,b.bodega_codigo_alterno
            ,b.estado_inventario_codigo_alterno
            ,b.bodega_traslado_codigo_alterno
            ,b.estado_inventario_traslado_codigo_alterno
        INTO #solicitudes_lineas
        FROM #solicitudes a
        INNER JOIN #source b ON
            b.id_cliente = a.id_cliente
        AND b.numero_solicitud = a.numero_solicitud
        INNER JOIN [$(eConnect)].dbo.productos c ON
            c.id_producto = b.id_producto
        LEFT OUTER JOIN [$(eConnect)].dbo.productos_medidas d ON
            d.id_producto = b.id_producto
        AND d.id_bodega = b.id_bodega
        AND d.id_unidad_medida = b.id_unidad_medida_solicitada
        LEFT OUTER JOIN [$(eConnect)].dbo.productos_medidas e ON
            e.id_producto = b.id_producto
        AND e.id_bodega = b.id_bodega
        AND e.rcv_flg = 1
        WHERE
            a.solicitud_existente = 0
    END

    --CREACION DE LAS SOLICITUDES
    BEGIN
        DECLARE @t AS TABLE(id_cliente BIGINT,numero_solicitud VARCHAR(20),id_solicitud BIGINT)

        INSERT INTO [$(eConnect)].dbo.solicitudes
            (tipo_solicitud
            ,numero_solicitud
            ,prefijo
            ,numero_solicitud_sin_prefijo
            ,estado

            ,id_bodega
            ,id_bodega_traslado
            ,id_cliente
            ,id_servicio
            ,servicio_codigo_alterno
            ,id_tercero
            ,tercero_identificacion
            ,tercero_nombre
            ,id_canal
            ,canal_codigo_alterno

            ,fecha_minima_solicitada
            ,fecha_maxima_solicitada
            ,hora_minima_solicitada
            ,hora_maxima_solicitada

            ,requiere_transporte
            ,requiere_recaudo
            ,nota

            ,usuario_creacion
            ,fecha_creacion
            ,usuario_modificacion
            ,fecha_modificacion)
        OUTPUT inserted.id_cliente,inserted.numero_solicitud,inserted.id_solicitud
        INTO @t
        SELECT
             tipo_solicitud
            ,numero_solicitud
            ,prefijo
            ,numero_solicitud_sin_prefijo
            ,estado

            ,id_bodega
            ,id_bodega_traslado
            ,id_cliente
            ,id_servicio
            ,servicio_codigo_alterno
            ,id_tercero
            ,tercero_identificacion
            ,tercero_nombre
            ,id_canal
            ,canal_codigo_alterno

            ,fecha_minima_solicitada
            ,fecha_maxima_solicitada
            ,hora_minima_solicitada
            ,hora_maxima_solicitada

            ,requiere_transporte
            ,requiere_recaudo
            ,nota

            ,usuario_creacion
            ,fecha_creacion
            ,usuario_modificacion
            ,fecha_modificacion
        FROM #solicitudes a
        WHERE
            a.solicitud_existente = 0

        UPDATE a
        SET a.id_solicitud = b.id_solicitud
        FROM #solicitudes a 
        INNER JOIN @t b ON
            b.id_cliente = a.id_cliente
        AND b.numero_solicitud = a.numero_solicitud

        UPDATE a
        SET a.id_solicitud = b.id_solicitud
        FROM #source a 
        INNER JOIN @t b ON
            b.id_cliente = a.id_cliente
        AND b.numero_solicitud = a.numero_solicitud

        INSERT INTO [$(eConnect)].dbo.solicitudes_lineas
            (id_solicitud
            ,numero_linea
            ,id_producto
            ,producto_codigo
            ,id_estado_inventario
            ,id_unidad_medida
            ,unidades
            ,valor_unitario_declarado
            ,lote

            ,id_unidad_medida_solicitada
            ,unidad_medida_solicitada_codigo_alterno
            ,cantidad_solicitada
            ,factor_conversion

            ,bodega_codigo_alterno
            ,estado_inventario_codigo_alterno
            ,bodega_traslado_codigo_alterno
            ,estado_traslado_inventario_codigo_alterno

            ,usuario_creacion
            ,fecha_creacion            
            ,usuario_modificacion
            ,fecha_modificacion)
        SELECT
             a.id_solicitud
            ,b.numero_linea
            ,b.id_producto
            ,b.producto_codigo
            ,b.id_estado_inventario
            ,b.id_unidad_medida
            ,b.unidades
            ,b.valor_unitario_declarado

            ,b.lote

            ,b.id_unidad_medida_solicitada
            ,b.unidad_medida_solicitada_codigo_alterno
            ,b.cantidad_solicitada
            ,b.factor_conversion

            ,b.bodega_codigo_alterno
            ,b.estado_inventario_codigo_alterno
            ,b.bodega_traslado_codigo_alterno
            ,b.estado_inventario_traslado_codigo_alterno

            ,a.usuario_creacion
            ,a.fecha_creacion
            ,a.usuario_modificacion
            ,a.fecha_modificacion
        FROM #solicitudes a
        INNER JOIN #solicitudes_lineas b ON
            b.id = a.id
    END
END TRY
BEGIN CATCH
    SELECT ERROR_MESSAGE()
    ;THROW;
END CATCH