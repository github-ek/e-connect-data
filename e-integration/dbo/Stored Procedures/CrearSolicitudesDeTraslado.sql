CREATE PROCEDURE [dbo].[CrearSolicitudesDeTraslado]
    @id_archivo BIGINT = 0
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
            ,ROW_NUMBER() OVER(PARTITION BY a.id_cliente, a.numero_solicitud ORDER BY a.numero_linea) AS orden
            ,CASE WHEN b.id_solicitud IS NOT NULL THEN 1 ELSE 0 END AS solicitud_existente
        INTO #source
        FROM [$(eStage)].dbo.traslados a
        LEFT OUTER JOIN [$(eConnect)].dbo.solicitudes b ON
            b.id_cliente = a.id_cliente
        AND b.numero_solicitud = a.numero_solicitud
        WHERE
            a.estado = 'VALIDADO'
        --AND a.id_archivo = @id_archivo
        AND a.id_archivo >= 400171


        IF OBJECT_ID('tempdb..#solicitudes') IS NOT NULL BEGIN
            DROP TABLE #solicitudes
        END
        
        SELECT
             IDENTITY(BIGINT,1,1) AS id
            ,CAST(NULL AS BIGINT) AS id_solicitud
            ,'TRASLADO' AS tipo_solicitud
            ,a.numero_solicitud
            ,a.prefijo
            ,a.numero_solicitud_sin_prefijo
            ,'NO_PROCESADA' estado

            ,a.id_bodega
            ,a.id_bodega_traslado
            ,a.id_cliente
            ,a.id_servicio
            ,a.servicio_codigo_alterno
            ,CAST(NULL AS BIGINT) AS id_tercero
            ,b.codigo AS tercero_identificacion
            ,b.nombre AS tercero_nombre
            ,CAST(NULL AS BIGINT) AS id_canal
            ,'' AS canal_codigo_alterno

            ,a.femi AS fecha_minima_solicitada
            ,a.fema AS fecha_maxima_solicitada
            ,CAST(NULL AS TIME(0)) AS hora_minima_solicitada
            ,CAST(NULL AS TIME(0)) AS hora_maxima_solicitada
            
            ,CAST(1 AS BIT) AS requiere_transporte
            ,CAST(0 AS BIT) AS requiere_recaudo
            ,'' AS nota

            ,a.usuario_creacion
            ,a.fecha_creacion
            ,a.usuario_modificacion
            ,a.fecha_modificacion
        INTO #solicitudes
        FROM #source a
        INNER JOIN [$(eConnect)].dbo.bodegas b ON
            b.id_bodega = a.id_bodega_traslado
        WHERE
            a.orden = 1
        AND a.solicitud_existente = 0

        CREATE UNIQUE INDEX ix_solicitudes_01 ON #solicitudes(id_cliente,numero_solicitud)

        IF OBJECT_ID('tempdb..#solicitudes_lineas') IS NOT NULL BEGIN
            DROP TABLE #solicitudes_lineas
        END
        
        SELECT
             a.id

            ,ROW_NUMBER() OVER(PARTITION BY a.id ORDER BY b.numero_linea) AS numero_linea
            ,c.id_producto
            ,c.codigo AS producto_codigo
            ,b.id_estado_inventario
            ,e.id_unidad_medida
            ,b.cantidad / d.factor_conversion AS unidades
            ,CAST((b.valor_unitario_declarado / d.factor_conversion) AS DECIMAL(10,2)) AS valor_unitario_declarado
            ,b.lote

            ,b.id_unidad_medida AS id_unidad_medida_solicitada
            ,b.unidad_medida_codigo_alterno AS unidad_medida_solicitada_codigo_alterno
            ,b.cantidad AS cantidad_solicitada
            ,d.factor_conversion

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
        AND d.id_bodega = b.id_bodega_origen
        AND d.id_unidad_medida = b.id_unidad_medida
        LEFT OUTER JOIN [$(eConnect)].dbo.productos_medidas e ON
            e.id_producto = b.id_producto
        AND e.id_bodega = b.id_bodega
        AND e.rcv_flg = 1

        IF OBJECT_ID('tempdb..#solicitudes_transporte') IS NOT NULL BEGIN
            DROP TABLE #solicitudes_transporte
        END

        SELECT
             a.id

            ,CAST(NULL AS BIGINT) AS id_tipo_ruta
            ,CAST(NULL AS BIGINT) AS id_tipo_vehiculo

            ,b.id_ciudad AS id_ciudad_remitente
            ,c.codigo AS ciudad_remitente_codigo_alterno
            ,b.direccion AS direccion_remitente
            ,b.id_direccion AS id_direccion_remitente
            ,CAST(NULL AS BIGINT) AS id_punto_remitente
            ,b.codigo AS punto_remitente_codigo_alterno
            ,b.nombre AS punto_remitente_nombre
            ,CAST(0 AS BIT) AS requiere_cita_remitente
            ,a.fecha_minima_solicitada AS fecha_cita_remitente
            ,CAST(NULL AS TIME(0)) AS hora_cita_minima_remitente
            ,CAST(NULL AS TIME(0)) AS hora_cita_maxima_remitente

            ,d.id_ciudad AS id_ciudad_destinatario
            ,e.codigo AS ciudad_destinatario_codigo_alterno
            ,d.direccion AS direccion_destinatario
            ,d.id_direccion AS id_direccion_destinatario
            ,CAST(NULL AS BIGINT) AS id_punto_destinatario
            ,d.codigo AS punto_destinatario_codigo_alterno
            ,d.nombre AS punto_destinatario_nombre
            ,CAST(0 AS BIT) AS requiere_cita_destinatario
            ,a.fecha_maxima_solicitada AS fecha_cita_destinatario
            ,CAST(NULL AS TIME(0)) AS hora_cita_minima_destinatario
            ,CAST(NULL AS TIME(0)) AS hora_cita_maxima_destinatario
        INTO #solicitudes_transporte
        FROM #solicitudes a
        INNER JOIN [$(eConnect)].dbo.bodegas b ON
            b.id_bodega = a.id_bodega
        INNER JOIN [$(eConnect)].dbo.ciudades c ON
            c.id_ciudad = b.id_ciudad
        INNER JOIN [$(eConnect)].dbo.bodegas d ON
            d.id_bodega = a.id_bodega_traslado
        INNER JOIN [$(eConnect)].dbo.ciudades e ON
            e.id_ciudad = d.id_ciudad
    END


    --DETECCION DE INCONSISTENCIAS

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
            ,b.estado_inventario_traslado_codigo_alterno

            ,a.usuario_creacion
            ,a.fecha_creacion
            ,a.usuario_modificacion
            ,a.fecha_modificacion
        FROM #solicitudes a
        INNER JOIN #solicitudes_lineas b ON
            b.id = a.id

        INSERT INTO [$(eConnect)].dbo.solicitudes_transporte
            (id_solicitud
            ,id_tipo_ruta
            ,id_tipo_vehiculo

            ,id_ciudad_remitente
            ,ciudad_remitente_codigo_alterno
            ,direccion_remitente
            ,id_direccion_remitente
            ,id_punto_remitente
            ,punto_remitente_codigo_alterno
            ,punto_remitente_nombre
            ,requiere_cita_remitente
            ,fecha_cita_remitente
            ,hora_cita_minima_remitente
            ,hora_cita_maxima_remitente

            ,id_ciudad_destinatario
            ,ciudad_destinatario_codigo_alterno
            ,direccion_destinatario
            ,id_direccion_destinatario
            ,id_punto_destinatario
            ,punto_destinatario_codigo_alterno
            ,punto_destinatario_nombre
            ,requiere_cita_destinatario
            ,fecha_cita_destinatario
            ,hora_cita_minima_destinatario
            ,hora_cita_maxima_destinatario

            ,usuario_creacion
            ,fecha_creacion
            ,usuario_modificacion
            ,fecha_modificacion)
        SELECT
             a.id_solicitud
            ,b.id_tipo_ruta
            ,b.id_tipo_vehiculo

            ,b.id_ciudad_remitente
            ,b.ciudad_remitente_codigo_alterno
            ,b.direccion_remitente
            ,b.id_direccion_remitente
            ,b.id_punto_remitente
            ,b.punto_remitente_codigo_alterno
            ,b.punto_remitente_nombre
            ,b.requiere_cita_remitente
            ,b.fecha_cita_remitente
            ,b.hora_cita_minima_remitente
            ,b.hora_cita_maxima_remitente

            ,b.id_ciudad_destinatario
            ,b.ciudad_destinatario_codigo_alterno
            ,b.direccion_destinatario
            ,b.id_direccion_destinatario
            ,b.id_punto_destinatario
            ,b.punto_destinatario_codigo_alterno
            ,b.punto_destinatario_nombre
            ,b.requiere_cita_destinatario
            ,b.fecha_cita_destinatario
            ,b.hora_cita_minima_destinatario
            ,b.hora_cita_maxima_destinatario

            ,a.usuario_creacion
            ,a.fecha_creacion
            ,a.usuario_modificacion
            ,a.fecha_modificacion
        FROM #solicitudes a
        INNER JOIN #solicitudes_transporte b ON
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

            ,'ALISTAMIENTO' AS tipo_orden

            ,a.usuario_creacion
            ,a.fecha_creacion
            ,a.usuario_modificacion
            ,a.fecha_modificacion
        FROM #solicitudes a
    END

    --ACTUALIZACION DE LOS REGISTROS EN STAGE
    BEGIN
        UPDATE a
        SET  a.estado = CASE WHEN b.solicitud_existente = 0 THEN 'PROCESADO' ELSE 'DESCARTADA' END
            ,a.[version] = a.[version] + 1
            ,a.fecha_modificacion = SYSDATETIME()
            ,a.usuario_modificacion = SYSTEM_USER
        FROM [$(eStage)].dbo.traslados a
        INNER JOIN #source b ON
            b.id = a.id
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