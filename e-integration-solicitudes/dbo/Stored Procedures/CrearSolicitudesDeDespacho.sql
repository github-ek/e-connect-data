CREATE PROCEDURE [dbo].[CrearSolicitudesDeDespacho]
     @integracion VARCHAR(50)
    ,@correlacion VARCHAR(100)
AS
BEGIN TRY
    BEGIN
        IF OBJECT_ID('tempdb..#solicitudes') IS NOT NULL BEGIN
            DROP TABLE #solicitudes
        END

        SELECT DISTINCT
             b.id_solicitud_despacho 
            ,CAST(NULL AS BIGINT) AS id_solicitud
			,a.integracion
			,a.correlacion
			,a.id_externo
            ,f.codigo AS tipo_solicitud
            ,'NO_PROCESADO' AS estado_solicitud
            ,'' AS subestado_solicitud
            
            ,b.numero_solicitud
            ,b.prefijo
            ,b.numero_solicitud_sin_prefijo

            ,b.id_cliente
            ,b.id_servicio
            ,b.servicio_codigo_alterno
            ,c.id_bodega
            ,CAST(NULL AS BIGINT) AS id_bodega_traslado

            ,b.id_tercero
            ,b.tercero_identificacion
            ,b.tercero_nombre
            ,b.id_canal
            ,b.canal_codigo_alterno

            ,b.femi AS fecha_minima_solicitada
            ,b.fema AS fecha_maxima_solicitada
            ,b.homi AS hora_minima_solicitada
            ,b.homi AS hora_maxima_solicitada

            ,CAST(1 AS BIT) AS requiere_transporte
            ,CAST(0 AS BIT) AS requiere_recaudo
            ,b.nota

            ,'' AS usuario_creacion
            ,b.fecha_creacion
            ,'' AS usuario_modificacion
            ,b.fecha_modificacion

            ,CASE WHEN d.id_solicitud IS NOT NULL THEN 1 ELSE 0 END AS solicitud_existente
        INTO #solicitudes
        FROM dbo.actualizaciones a
        INNER JOIN dbo.solicitudes_despacho b ON
            b.integracion = a.integracion
        AND b.id_externo = a.id_externo
        AND b.correlacion = a.correlacion
		INNER JOIN dbo.solicitudes_despacho_lineas c ON
			c.id_solicitud_despacho = b.id_solicitud_despacho
        LEFT OUTER JOIN [$(eConnect)].dbo.solicitudes d ON
            d.id_cliente = b.id_cliente
        AND d.numero_solicitud = b.numero_solicitud

        INNER JOIN [$(eConnect)].dbo.servicios e ON
            e.id_servicio = b.id_servicio
        INNER JOIN [$(eConnect)].dbo.tipos_solicitud f ON
            f.id_tipo_solicitud = e.id_tipo_solicitud
        AND f.codigo = 'SALIDA'
        WHERE
            a.estado_integracion = 'VALIDADO'
        AND a.integracion = @integracion
		AND a.correlacion = @correlacion

        --TODO DETECTAR SOLICITUDES CON ERRORES Y MARCARLAS COMO ERROR
        --DUPLICADAS POR DATOS QUE DEBIERAN SER UNICOS
        --EXISTENTES EN LA BASE DE DATOS 
        
        CREATE UNIQUE INDEX ix_solicitudes_01 ON #solicitudes(id_cliente,numero_solicitud)

        UPDATE a
        SET a.id_solicitud = NEXT VALUE FOR [$(eConnect)].dbo.hibernate_sequence
        FROM #solicitudes a

        IF OBJECT_ID('tempdb..#solicitudes_lineas') IS NOT NULL BEGIN
            DROP TABLE #solicitudes_lineas
        END

        SELECT
             NEXT VALUE FOR [$(eConnect)].dbo.hibernate_sequence AS id
            ,a.id_solicitud
            ,b.numero_linea
            ,b.numero_linea_externo
            ,b.numero_sublinea_externo

            ,b.id_producto
            ,c.codigo AS producto_codigo
            ,c.nombre AS producto_nombre
            ,b.id_estado_inventario
            ,b.cantidad AS unidades_solicitadas
            ,d.id_unidad_medida
            ,b.lote
            ,b.predistribucion
            ,CAST(b.valor_unitario_declarado AS DEC(10,2)) AS valor_unitario_declarado
            
            ,d.id_unidad_medida AS id_unidad_medida_solicitada
            ,'' AS unidad_medida_solicitada_codigo_alterno
            ,b.cantidad AS cantidad_solicitada
            ,1 AS factor_conversion

            ,b.bodega_codigo_alterno
            ,b.estado_inventario_codigo_alterno
            ,'' AS bodega_traslado_codigo_alterno
            ,'' AS estado_traslado_inventario_codigo_alterno

            ,a.usuario_creacion
            ,a.fecha_creacion
            ,a.usuario_modificacion
            ,a.fecha_modificacion 
        INTO #solicitudes_lineas
        FROM #solicitudes a
		INNER JOIN dbo.solicitudes_despacho_lineas b ON
			b.id_solicitud_despacho = a.id_solicitud_despacho
		INNER JOIN [$(eConnect)].dbo.productos c ON
			c.id_producto = b.id_producto
        LEFT OUTER JOIN [$(eConnect)].dbo.productos_medidas d ON
			d.id_producto = b.id_producto
		AND d.id_bodega = b.id_bodega
		AND d.rcv_flg = 1

        IF OBJECT_ID('tempdb..#solicitudes_transporte') IS NOT NULL BEGIN
            DROP TABLE #solicitudes_transporte
        END

        SELECT
             NEXT VALUE FOR [$(eConnect)].dbo.hibernate_sequence AS id_solicitud_transporte
            ,a.id_solicitud

            ,c.id_ciudad AS id_ciudad_remitente
            ,d.codigo AS ciudad_remitente_codigo_alterno
            ,c.direccion AS direccion_remitente
            ,c.codigo AS punto_remitente_codigo_alterno
            ,c.nombre AS punto_remitente_nombre
            ,CAST(0 AS BIT) AS requiere_cita_remitente
            ,a.fecha_minima_solicitada AS fecha_cita_remitente
            ,CAST(NULL AS TIME(0)) AS hora_cita_minima_remitente
            ,CAST(NULL AS TIME(0)) AS hora_cita_maxima_remitente

            ,b.id_ciudad AS id_ciudad_destinatario
            ,b.ciudad_codigo_alterno AS ciudad_destinatario_codigo_alterno
            ,b.direccion AS direccion_destinatario
            ,b.punto_codigo_alterno AS punto_destinatario_codigo_alterno
            ,b.punto_nombre AS punto_destinatario_nombre
            ,CAST(0 AS BIT) AS requiere_cita_destinatario
            ,a.fecha_maxima_solicitada AS fecha_cita_destinatario
            ,CAST(NULL AS TIME(0)) AS hora_cita_minima_destinatario
            ,CAST(NULL AS TIME(0)) AS hora_cita_maxima_destinatario

            ,CAST(NULL AS BIGINT) AS id_tipo_ruta
            ,CAST(NULL AS BIGINT) AS id_tipo_vehiculo

            ,a.usuario_creacion
            ,a.fecha_creacion
            ,a.usuario_modificacion
            ,a.fecha_modificacion 
        INTO #solicitudes_transporte
        FROM #solicitudes a
        INNER JOIN dbo.solicitudes_despacho b ON
            b.id_solicitud_despacho = a.id_solicitud_despacho
        INNER JOIN [$(eConnect)].dbo.bodegas c ON
            c.id_bodega = a.id_bodega
        INNER JOIN [$(eConnect)].dbo.ciudades d ON
            d.id_ciudad = c.id_ciudad
        WHERE
            a.requiere_transporte = 1
    
    
        IF OBJECT_ID('tempdb..#solicitudes_documentos') IS NOT NULL BEGIN
            DROP TABLE #solicitudes_documentos
        END

        SELECT
             NEXT VALUE FOR [$(eConnect)].dbo.hibernate_sequence AS id
            ,a.id_solicitud

            ,c.id_tipo_documento
            ,b.numero_orden_compra AS numero_documento
            ,b.fecha_orden_compra AS fecha_documento

            ,a.usuario_creacion
            ,a.fecha_creacion
            ,a.usuario_modificacion
            ,a.fecha_modificacion 
        INTO #solicitudes_documentos
        FROM #solicitudes a
        INNER JOIN dbo.solicitudes_despacho b ON
            b.id_solicitud_despacho = a.id_solicitud_despacho
        INNER JOIN [$(eConnect)].dbo.tipos_documento c ON
            c.codigo = 'OCCF'
        WHERE
            b.numero_orden_compra <> ''
    END

	BEGIN
		BEGIN TRANSACTION

        INSERT INTO [$(eConnect)].dbo.solicitudes
            (id_solicitud
            ,integracion
            ,correlacion
            ,id_externo
            ,tipo_solicitud
            ,estado_solicitud
            ,subestado_solicitud

            ,numero_solicitud
            ,prefijo
            ,numero_solicitud_sin_prefijo
            ,id_cliente
            ,id_servicio
            ,servicio_codigo_alterno

            ,id_bodega
            ,id_bodega_traslado
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
        SELECT
             id_solicitud
            ,integracion
            ,correlacion
            ,id_externo
            ,tipo_solicitud
            ,estado_solicitud
            ,subestado_solicitud

            ,numero_solicitud
            ,prefijo
            ,numero_solicitud_sin_prefijo
            ,id_cliente
            ,id_servicio
            ,servicio_codigo_alterno

            ,id_bodega
            ,id_bodega_traslado
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

        INSERT INTO [$(eConnect)].dbo.solicitudes_lineas
            (id
            ,id_solicitud
            ,numero_linea
            ,numero_linea_externo
            ,numero_sublinea_externo

            ,id_producto
            ,producto_codigo
            ,producto_nombre
            ,id_estado_inventario
            ,unidades_solicitadas
            ,id_unidad_medida

            ,lote
            ,predistribucion
            ,valor_unitario_declarado

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
             id
            ,id_solicitud
            ,numero_linea
            ,numero_linea_externo
            ,numero_sublinea_externo

            ,id_producto
            ,producto_codigo
            ,producto_nombre
            ,id_estado_inventario
            ,unidades_solicitadas
            ,id_unidad_medida

            ,lote
            ,predistribucion
            ,valor_unitario_declarado

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
            ,fecha_modificacion
        FROM #solicitudes_lineas

        INSERT INTO [$(eConnect)].dbo.solicitudes_transporte
            (id_solicitud_transporte
            ,id_solicitud

            ,id_ciudad_remitente
            ,ciudad_remitente_codigo_alterno
            ,direccion_remitente
            ,punto_remitente_codigo_alterno
            ,punto_remitente_nombre
            ,requiere_cita_remitente
            ,fecha_cita_remitente
            ,hora_cita_minima_remitente
            ,hora_cita_maxima_remitente

            ,id_ciudad_destinatario
            ,ciudad_destinatario_codigo_alterno
            ,direccion_destinatario
            ,punto_destinatario_codigo_alterno
            ,punto_destinatario_nombre
            ,requiere_cita_destinatario
            ,fecha_cita_destinatario
            ,hora_cita_minima_destinatario
            ,hora_cita_maxima_destinatario

            ,id_tipo_ruta
            ,id_tipo_vehiculo

            ,usuario_creacion
            ,fecha_creacion
            ,usuario_modificacion
            ,fecha_modificacion)
        SELECT
             id_solicitud_transporte
            ,id_solicitud

            ,id_ciudad_remitente
            ,ciudad_remitente_codigo_alterno
            ,direccion_remitente
            ,punto_remitente_codigo_alterno
            ,punto_remitente_nombre
            ,requiere_cita_remitente
            ,fecha_cita_remitente
            ,hora_cita_minima_remitente
            ,hora_cita_maxima_remitente

            ,id_ciudad_destinatario
            ,ciudad_destinatario_codigo_alterno
            ,direccion_destinatario
            ,punto_destinatario_codigo_alterno
            ,punto_destinatario_nombre
            ,requiere_cita_destinatario
            ,fecha_cita_destinatario
            ,hora_cita_minima_destinatario
            ,hora_cita_maxima_destinatario

            ,id_tipo_ruta
            ,id_tipo_vehiculo

            ,usuario_creacion
            ,fecha_creacion
            ,usuario_modificacion
            ,fecha_modificacion
        FROM #solicitudes_transporte

        INSERT INTO [$(eConnect)].dbo.solicitudes_documentos
            (id
            ,id_solicitud
            ,id_tipo_documento
            ,numero_documento
            ,fecha_documento

            ,usuario_creacion
            ,fecha_creacion
            ,usuario_modificacion
            ,fecha_modificacion)
        SELECT
             id
            ,id_solicitud
            ,id_tipo_documento
            ,numero_documento
            ,fecha_documento

            ,usuario_creacion
            ,fecha_creacion
            ,usuario_modificacion
            ,fecha_modificacion
        FROM #solicitudes_documentos

		UPDATE a
		SET  a.estado_integracion = CASE WHEN b.solicitud_existente = 0 THEN 'CARGADO' ELSE 'DESCARTADO' END
			,a.estado_notificacion = 'NOTIFICAR'
			,a.[version] = a.[version] + 1
			,a.fecha_modificacion = SYSDATETIME()
		FROM dbo.actualizaciones a
		INNER JOIN #solicitudes b ON
			b.integracion = a.integracion
		AND b.correlacion = a.correlacion
		AND b.id_externo = a.id_externo

		COMMIT TRANSACTION
	END
END TRY
BEGIN CATCH
    SELECT ERROR_MESSAGE()
    IF @@TRANCOUNT > 0 BEGIN
	    ROLLBACK TRANSACTION
    END
    ;THROW;
END CATCH