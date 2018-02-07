CREATE PROCEDURE [dbo].[CrearSolicitudesDeEstampillado]
AS
BEGIN TRY
    --SET NOCOUNT ON;

    BEGIN TRANSACTION

    --CONSOLIDACION DE INFORMACION DE NUEVAS SOLICITUDES
    BEGIN
        IF OBJECT_ID('tempdb..#source') IS NOT NULL BEGIN
            DROP TABLE #source
        END

        SELECT 
             a.*
            ,ROW_NUMBER() OVER(PARTITION BY a.id_cliente, a.numero_orden ORDER BY a.numero_linea) AS orden
        INTO #source
        FROM [$(eStage)].oms.manufacturas a
        WHERE
            a.estado = 'VALIDADO'

        IF OBJECT_ID('tempdb..#solicitudes') IS NOT NULL BEGIN
            DROP TABLE #solicitudes
        END
        
        SELECT
             IDENTITY(BIGINT,1,1) AS id
            ,CAST(NULL AS BIGINT) AS id_solicitud
            ,'MANUFACTURA' AS tipo_solicitud
            ,a.numero_orden AS numero_solicitud
            ,a.prefijo_orden AS prefijo
            ,a.numero_orden_sin_prefijo AS numero_solicitud_sin_prefijo
            ,'NO_PROCESADA' estado

            ,a.id_bodega_origen AS id_bodega
            
            ,a.id_cliente
            ,a.id_servicio
            ,a.servicio_codigo_alterno

            ,a.femi AS fecha_minima_solicitada
            ,a.fema AS fecha_maxima_solicitada
            
            ,CAST(0 AS BIT) AS requiere_transporte
            ,CAST(0 AS BIT) AS requiere_recaudo
            ,a.notas AS nota

            ,a.usuario_creacion
            ,a.fecha_creacion
            ,a.usuario_modificacion
            ,a.fecha_modificacion
        INTO #solicitudes
        FROM #source a
        INNER JOIN [$(eConnect)].dbo.bodegas b ON
            b.id_bodega = a.id_bodega_destino
        WHERE
            a.orden = 1
         
        CREATE UNIQUE INDEX ix_solicitudes_01 ON #solicitudes(id_cliente,numero_solicitud)

        UPDATE a
        SET
            a.id_unidad = b.id_unidad_medida
        FROM #source a
        LEFT OUTER JOIN [$(eConnect)].dbo.productos_medidas b ON
            b.id_producto = a.id_producto
        AND b.id_bodega = a.id_bodega_origen
        AND b.rcv_flg = 1
        WHERE
            a.id_unidad IS NULL

        IF OBJECT_ID('tempdb..#solicitudes_lineas') IS NOT NULL BEGIN
            DROP TABLE #solicitudes_lineas
        END

        SELECT
             a.id

            ,ROW_NUMBER() OVER(PARTITION BY a.id ORDER BY b.numero_linea) AS numero_linea
            ,c.id_producto
            ,c.codigo AS producto_codigo
            ,b.id_estado_inventario_origen AS id_estado_inventario
            ,e.id_unidad_medida
            ,b.cantidad / d.factor_conversion AS unidades
            ,CAST(0 AS DECIMAL(10,2)) AS valor_unitario_declarado
            ,b.lote

            ,b.id_unidad AS id_unidad_medida_solicitada
            ,b.unidad_codigo_alterno AS unidad_medida_solicitada_codigo_alterno
            ,b.cantidad AS cantidad_solicitada
            ,d.factor_conversion

            ,b.bodega_origen_codigo_alterno AS bodega_codigo_alterno
            ,b.estado_inventario_origen_codigo_alterno AS estado_inventario_codigo_alterno
            ,b.bodega_destino_codigo_alterno AS bodega_traslado_codigo_alterno
            ,b.estado_inventario_destino_codigo_alterno AS estado_traslado_inventario_codigo_alterno
        INTO #solicitudes_lineas
        FROM #solicitudes a
        INNER JOIN #source b ON
            b.id_cliente = a.id_cliente
        AND b.numero_orden = a.numero_solicitud
        INNER JOIN [$(eConnect)].dbo.productos c ON
            c.id_producto = b.id_producto
        LEFT OUTER JOIN [$(eConnect)].dbo.productos_medidas d ON
            d.id_producto = b.id_producto
        AND d.id_bodega = b.id_bodega_origen
        AND d.id_unidad_medida = b.id_unidad
        LEFT OUTER JOIN [$(eConnect)].dbo.productos_medidas e ON
            e.id_producto = b.id_producto
        AND e.id_bodega = b.id_bodega_origen
        AND e.rcv_flg = 1

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
            ,id_cliente
            ,id_servicio
            ,servicio_codigo_alterno

            ,fecha_minima_solicitada
            ,fecha_maxima_solicitada

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
            ,id_cliente
            ,id_servicio
            ,servicio_codigo_alterno

            ,fecha_minima_solicitada
            ,fecha_maxima_solicitada

            ,requiere_transporte
            ,requiere_recaudo
            ,nota

            ,usuario_creacion
            ,fecha_creacion
            ,usuario_modificacion
            ,fecha_modificacion
        FROM #solicitudes a

        UPDATE a
        SET a.id_solicitud = b.id_solicitud
        FROM #solicitudes a 
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
            ,b.estado_traslado_inventario_codigo_alterno

            ,a.usuario_creacion
            ,a.fecha_creacion
            ,a.usuario_modificacion
            ,a.fecha_modificacion
        FROM #solicitudes a
        INNER JOIN #solicitudes_lineas b ON
            b.id = a.id
    END

    --ACTUALIZAR PROGRAMACION DE ORDENES
    BEGIN
        INSERT INTO [$(eConnect)].dbo.solicitudes_ordenes
            (tipo_solicitud
            ,id_solicitud
            
            ,tipo_orden

            ,usuario_creacion
            ,fecha_creacion
            ,usuario_modificacion
            ,fecha_modificacion)
        SELECT
             a.tipo_solicitud
            ,a.id_solicitud
            --TODO
            ,servicio_codigo_alterno AS tipo_orden

            ,a.usuario_creacion
            ,a.fecha_creacion
            ,a.usuario_modificacion
            ,a.fecha_modificacion
        FROM #solicitudes a
    END

    --ACTUALIZACION DE LOS REGISTROS EN STAGE
    BEGIN
        UPDATE a
        SET  a.estado = 'PROCESADO'
            ,a.[version] = a.[version] + 1
            ,a.fecha_modificacion = SYSDATETIME()
            ,a.usuario_modificacion = SYSTEM_USER
        FROM [$(eStage)].oms.traslados a
        INNER JOIN #source b ON
            b.id = a.id
    END

	COMMIT TRANSACTION
END TRY
BEGIN CATCH
    SELECT ERROR_MESSAGE()
	ROLLBACK TRANSACTION
    ;THROW;
END CATCH