
CREATE PROCEDURE dbo.MergeSolicitudesFromTest2Satelite
AS
BEGIN
	BEGIN
		IF OBJECT_ID('tempdb..#solicitudes') IS NOT NULL BEGIN
			DROP TABLE #solicitudes
		END

		SELECT
			a.id_solicitud
		INTO #solicitudes
		FROM [$(eConnect)].dbo.ordenes_alistamiento a
		LEFT OUTER JOIN dbo.ordenes b ON
			b.id_solicitud = a.id_solicitud
		WHERE
			a.fecha_confirmacion_creacion IS NOT NULL
		AND b.id_solicitud IS NULL

		IF OBJECT_ID('tempdb..#ordenes') IS NOT NULL BEGIN
			DROP TABLE #ordenes
		END

		SELECT
			 a.id_solicitud 
			,CAST('NO_PROCESADO'   AS VARCHAR(50)) AS estado_integracion
			,140000+ CAST(a.id_solicitud AS INT) -  210000 AS id_orden
			,a.tipo_solicitud AS id_tipo_orden
			,a.numero_solicitud AS numero_documento_orden_cliente
			,CAST(COALESCE(c.numero_documento,'') AS VARCHAR(20)) AS numero_orden_compra
			,CAST(NULL AS INT) AS id_consolidado
			,CAST('EN_EJECCUCION'   AS VARCHAR(20)) AS id_estado_orden
			,CAST('SIN_SOLICITUD'   AS VARCHAR(50)) AS id_estado_distribucion
			,CAST('SIN_SOLICITUD'   AS VARCHAR(50)) AS id_estado_georeferenciacion
			,a.id_cliente
			,a.id_servicio AS id_tipo_servicio
			,LEFT(a.servicio_codigo_alterno,20) AS tipo_servicio_codigo_alterno
			,a.requiere_transporte AS requiere_servicio_distribucion
			,CAST(0 AS BIT) AS requiere_confirmacion_cita

			,a.fecha_minima_solicitada AS fecha_entrega_sugerida_minima
			,a.fecha_maxima_solicitada AS fecha_entrega_sugerida_maxima
			,a.hora_minima_solicitada AS hora_entrega_sugerida_minima
			,a.hora_maxima_solicitada AS hora_entrega_sugerida_maxima

			,a.id_bodega AS id_bodega_origen
			,CAST('' AS VARCHAR(20)) AS bodega_origen_codigo_alterno
			,a.id_bodega_traslado AS id_bodega_destino
			,CAST('' AS VARCHAR(20)) AS bodega_destino_codigo_alterno

			,a.id_canal AS id_segmento
			,LEFT(canal_codigo_alterno,20) AS segmento_codigo_alterno

			,CAST(NULL AS BIGINT) AS id_destinatario_remitente_destinatario
			,COALESCE(a.tercero_identificacion,'') AS destinatario_numero_identificacion_alterno
			,COALESCE(a.tercero_nombre,'') AS destinatario_nombre_alterno
			,CAST('' AS VARCHAR(50)) AS destinatario_contacto_telefonos
			,CAST('' AS VARCHAR(100)) AS destinatario_contacto_email
			,CAST('' AS VARCHAR(100)) AS destinatario_contacto_nombres

			,CAST(NULL AS BIGINT) AS id_destino_origen_destino
			,COALESCE(b.punto_destinatario_nombre,'') AS destino_nombre_alterno
			,'' AS destino_contacto_email
			,'' AS destino_contacto_nombres
			,'' AS destino_contacto_telefonos

			,b.id_ciudad_destinatario AS id_ciudad_destino
			,LEFT(COALESCE(b.ciudad_destinatario_codigo_alterno,''),100) AS destino_ciudad_nombre_alterno
			,LEFT(COALESCE(b.direccion_destinatario,''),100) AS destino_direccion
			,CAST('' AS VARCHAR(100)) AS destino_indicaciones_direccion
			,CAST(NULL AS INT) AS valor_declarado

			,a.nota AS notas
			,a.fecha_creacion AS fecha_confirmacion
			,a.usuario_creacion AS usuario_confirmacion
			,a.fecha_creacion AS fecha_aceptacion
			,a.usuario_creacion AS usuario_aceptacion
			,CAST(0 AS BIT) AS orden_recibo_wms_generada
			,CAST(0 AS BIT) AS orden_recibo_wms_confirmada
			,CAST(1 AS BIT) AS orden_salida_wms_generada
			,CAST(1 AS BIT) AS orden_salida_wms_confirmada
			,e.numero_orden AS ORDNUM
			,f.codigo AS ORD_WH_ID
			,e.fecha_confirmacion_creacion AS ORD_DTE
			,'' AS ORD_USR_ID
			,a.fecha_creacion
			,a.usuario_creacion
			,a.fecha_modificacion AS fecha_actualizacion
			,a.usuario_modificacion AS usuario_actualizacion
		INTO #ordenes
		FROM #solicitudes z
		INNER JOIN [$(eConnect)].dbo.solicitudes a ON
			a.id_solicitud = z.id_solicitud
		INNER JOIN [$(eConnect)].dbo.tipos_documento d ON
			d.codigo = 'OCCF'
		LEFT OUTER JOIN [$(eConnect)].dbo.solicitudes_transporte b ON
			b.id_solicitud = a.id_solicitud
		LEFT OUTER JOIN [$(eConnect)].dbo.solicitudes_documentos c ON
			c.id_solicitud = a.id_solicitud
		AND c.id_tipo_documento = d.id_tipo_documento
		INNER JOIN [$(eConnect)].dbo.ordenes_alistamiento e ON
			e.id_solicitud = a.id_solicitud
		INNER JOIN [$(eConnect)].dbo.bodegas f ON
			f.id_bodega = a.id_bodega

		IF OBJECT_ID('tempdb..#lineas_orden') IS NOT NULL BEGIN
			DROP TABLE #lineas_orden
		END

		SELECT
			 a.id_solicitud
			,b.numero_linea AS numero_item
			,'' AS notas
			,b.producto_nombre AS descripcion
			,b.unidades_solicitadas AS cantidad
			,b.id_producto
			,b.producto_codigo AS codigo_producto
			,b.id_unidad_medida AS id_unidad
			,COALESCE(c.codigo,'') AS codigo_unidad
			,a.id_bodega_origen
			,b.bodega_codigo_alterno AS bodega_origen_codigo_alterno
			,b.id_estado_inventario
			,b.id_estado_inventario AS bodega_origen_nombre_alterno
			,b.valor_unitario_declarado AS valor_declarado_por_unidad
			,b.predistribucion AS predistribucion_destino_final
			,'' AS predistribucion_rotulo
			,b.lote
			,'' AS requerimiento_bl
			,COALESCE(d.alto,1.0) AS alto_por_unidad
			,COALESCE(d.ancho,1.0) AS ancho_por_unidad
			,COALESCE(d.largo,1.0) AS largo_por_unidad
			,COALESCE(d.peso,1.0) AS peso_bruto_por_unidad
			,CAST(1 AS BIT) AS consistente
			,b.fecha_creacion
			,b.usuario_creacion
			,b.fecha_modificacion AS fecha_actualizacion
			,b.usuario_modificacion AS usuario_actualizacion
		INTO #lineas_orden
		FROM #ordenes a
		INNER JOIN [$(eConnect)].dbo.solicitudes_lineas b ON
			b.id_solicitud = a.id_solicitud
		LEFT OUTER JOIN [$(eConnect)].dbo.unidades_medida c ON
			c.id_unidad_medida = b.id_unidad_medida
		LEFT OUTER JOIN [$(eConnect)].dbo.productos_medidas d ON
			d.id_unidad_medida = b.id_unidad_medida
		AND d.id_producto = b.id_producto
		AND d.id_bodega = a.id_bodega_origen
	END

	BEGIN TRY
		BEGIN TRANSACTION

		INSERT INTO ordenes
			(id_solicitud
			,estado_integracion
			,id_orden
			,numero_documento_orden_cliente
			,numero_orden_compra
			,id_estado_orden
			,id_estado_distribucion
			,id_cliente
			,id_tipo_servicio
			,tipo_servicio_codigo_alterno
			,requiere_servicio_distribucion
			,requiere_confirmacion_cita
			,fecha_entrega_sugerida_minima
			,fecha_entrega_sugerida_maxima
			,hora_entrega_sugerida_minima
			,hora_entrega_sugerida_maxima
			,id_bodega_destino
			,bodega_destino_codigo_alterno
			,id_segmento
			,segmento_codigo_alterno
			,id_destinatario_remitente_destinatario
			,destinatario_numero_identificacion_alterno
			,destinatario_nombre_alterno
			,id_destino_origen_destino
			,destino_nombre_alterno
			,destino_contacto_email
			,destino_contacto_nombres
			,destino_contacto_telefonos
			,id_ciudad_destino
			,destino_ciudad_nombre_alterno
			,destino_direccion
			,valor_declarado
			,notas
			,fecha_confirmacion
			,usuario_confirmacion
			,fecha_aceptacion
			,usuario_aceptacion
			,orden_recibo_wms_generada
			,orden_recibo_wms_confirmada
			,orden_salida_wms_generada
			,orden_salida_wms_confirmada
			,ORDNUM
			,ORD_WH_ID
			,ORD_DTE
			,ORD_USR_ID
			,id_estado_georeferenciacion
			,fecha_creacion
			,usuario_creacion
			,fecha_actualizacion
			,usuario_actualizacion)
		SELECT
				id_solicitud
			,estado_integracion
			,id_orden
			,numero_documento_orden_cliente
			,numero_orden_compra
			,id_estado_orden
			,id_estado_distribucion
			,id_cliente
			,id_tipo_servicio
			,tipo_servicio_codigo_alterno
			,requiere_servicio_distribucion
			,requiere_confirmacion_cita
			,fecha_entrega_sugerida_minima
			,fecha_entrega_sugerida_maxima
			,hora_entrega_sugerida_minima
			,hora_entrega_sugerida_maxima
			,id_bodega_destino
			,bodega_destino_codigo_alterno
			,id_segmento
			,segmento_codigo_alterno
			,id_destinatario_remitente_destinatario
			,destinatario_numero_identificacion_alterno
			,destinatario_nombre_alterno
			,id_destino_origen_destino
			,destino_nombre_alterno
			,destino_contacto_email
			,destino_contacto_nombres
			,destino_contacto_telefonos
			,id_ciudad_destino
			,destino_ciudad_nombre_alterno
			,destino_direccion
			,valor_declarado
			,notas
			,fecha_confirmacion
			,usuario_confirmacion
			,fecha_aceptacion
			,usuario_aceptacion
			,orden_recibo_wms_generada
			,orden_recibo_wms_confirmada
			,orden_salida_wms_generada
			,orden_salida_wms_confirmada
			,ORDNUM
			,ORD_WH_ID
			,ORD_DTE
			,ORD_USR_ID
			,id_estado_georeferenciacion
			,fecha_creacion
			,usuario_creacion
			,fecha_actualizacion
			,usuario_actualizacion
		FROM #ordenes

		INSERT INTO lineas_orden
			(id_solicitud
			,numero_item
			,notas
			,descripcion
			,cantidad
			,id_producto
			,codigo_producto
			,id_unidad
			,codigo_unidad
			,bodega_origen_codigo_alterno
			,id_bodega_origen
			,id_estado_inventario
			,bodega_origen_nombre_alterno
			,valor_declarado_por_unidad
			,predistribucion_rotulo
			,predistribucion_destino_final
			,lote
			,fecha_actualizacion
			,usuario_actualizacion
			,alto_por_unidad
			,ancho_por_unidad
			,largo_por_unidad
			,peso_bruto_por_unidad
			,consistente)
		SELECT
				id_solicitud
			,numero_item
			,notas
			,descripcion
			,cantidad
			,id_producto
			,codigo_producto
			,id_unidad
			,codigo_unidad
			,bodega_origen_codigo_alterno
			,id_bodega_origen
			,id_estado_inventario
			,bodega_origen_nombre_alterno
			,valor_declarado_por_unidad
			,predistribucion_rotulo
			,predistribucion_destino_final
			,lote
			,fecha_actualizacion
			,usuario_actualizacion
			,alto_por_unidad
			,ancho_por_unidad
			,largo_por_unidad
			,peso_bruto_por_unidad
			,consistente
		FROM #lineas_orden 
		
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
        DECLARE @ErrorMessage NVARCHAR(MAX), @ErrorSeverity INT, @ErrorState INT;
        
        SELECT @ErrorMessage = ERROR_MESSAGE() + ' Line ' + CAST(ERROR_LINE() AS NVARCHAR(5)), @ErrorSeverity = ERROR_SEVERITY(), @ErrorState = ERROR_STATE();

        IF @@TRANCOUNT > 0 BEGIN
            ROLLBACK TRANSACTION
        END

        RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
	END CATCH

	BEGIN TRY
		INSERT INTO [$(SERVER_MASTER_DATA)].[$(SateliteMasterData)].dbo.ordenes
			(id_solicitud
			,estado_integracion
			,id_orden
			,numero_documento_orden_cliente
			,numero_orden_compra
			,id_estado_orden
			,id_estado_distribucion
			,id_cliente
			,id_tipo_servicio
			,tipo_servicio_codigo_alterno
			,requiere_servicio_distribucion
			,requiere_confirmacion_cita
			,fecha_entrega_sugerida_minima
			,fecha_entrega_sugerida_maxima
			,hora_entrega_sugerida_minima
			,hora_entrega_sugerida_maxima
			,id_bodega_destino
			,bodega_destino_codigo_alterno
			,id_segmento
			,segmento_codigo_alterno
			,id_destinatario_remitente_destinatario
			,destinatario_numero_identificacion_alterno
			,destinatario_nombre_alterno
			,id_destino_origen_destino
			,destino_nombre_alterno
			,destino_contacto_email
			,destino_contacto_nombres
			,destino_contacto_telefonos
			,id_ciudad_destino
			,destino_ciudad_nombre_alterno
			,destino_direccion
			,valor_declarado
			,notas
			,fecha_confirmacion
			,usuario_confirmacion
			,fecha_aceptacion
			,usuario_aceptacion
			,orden_recibo_wms_generada
			,orden_recibo_wms_confirmada
			,orden_salida_wms_generada
			,orden_salida_wms_confirmada
			,ORDNUM
			,ORD_WH_ID
			,ORD_DTE
			,ORD_USR_ID
			,id_estado_georeferenciacion
			,fecha_creacion
			,usuario_creacion
			,fecha_actualizacion
			,usuario_actualizacion)
		SELECT
			 id_solicitud
			,estado_integracion
			,id_orden
			,numero_documento_orden_cliente
			,numero_orden_compra
			,id_estado_orden
			,id_estado_distribucion
			,id_cliente
			,id_tipo_servicio
			,tipo_servicio_codigo_alterno
			,requiere_servicio_distribucion
			,requiere_confirmacion_cita
			,fecha_entrega_sugerida_minima
			,fecha_entrega_sugerida_maxima
			,hora_entrega_sugerida_minima
			,hora_entrega_sugerida_maxima
			,id_bodega_destino
			,bodega_destino_codigo_alterno
			,id_segmento
			,segmento_codigo_alterno
			,id_destinatario_remitente_destinatario
			,destinatario_numero_identificacion_alterno
			,destinatario_nombre_alterno
			,id_destino_origen_destino
			,destino_nombre_alterno
			,destino_contacto_email
			,destino_contacto_nombres
			,destino_contacto_telefonos
			,id_ciudad_destino
			,destino_ciudad_nombre_alterno
			,destino_direccion
			,valor_declarado
			,notas
			,fecha_confirmacion
			,usuario_confirmacion
			,fecha_aceptacion
			,usuario_aceptacion
			,orden_recibo_wms_generada
			,orden_recibo_wms_confirmada
			,orden_salida_wms_generada
			,orden_salida_wms_confirmada
			,ORDNUM
			,ORD_WH_ID
			,ORD_DTE
			,ORD_USR_ID
			,id_estado_georeferenciacion
			,fecha_creacion
			,usuario_creacion
			,fecha_actualizacion
			,usuario_actualizacion
		FROM #ordenes

		INSERT INTO [$(SERVER_MASTER_DATA)].[$(SateliteMasterData)].dbo.lineas_orden
			(id_solicitud
			,numero_item
			,notas
			,descripcion
			,cantidad
			,id_producto
			,codigo_producto
			,id_unidad
			,codigo_unidad
			,bodega_origen_codigo_alterno
			,id_bodega_origen
			,id_estado_inventario
			,bodega_origen_nombre_alterno
			,valor_declarado_por_unidad
			,predistribucion_rotulo
			,predistribucion_destino_final
			,lote
			,fecha_actualizacion
			,usuario_actualizacion
			,alto_por_unidad
			,ancho_por_unidad
			,largo_por_unidad
			,peso_bruto_por_unidad
			,consistente)
		SELECT
			 id_solicitud
			,numero_item
			,notas
			,descripcion
			,cantidad
			,id_producto
			,codigo_producto
			,id_unidad
			,codigo_unidad
			,bodega_origen_codigo_alterno
			,id_bodega_origen
			,id_estado_inventario
			,bodega_origen_nombre_alterno
			,valor_declarado_por_unidad
			,predistribucion_rotulo
			,predistribucion_destino_final
			,lote
			,fecha_actualizacion
			,usuario_actualizacion
			,alto_por_unidad
			,ancho_por_unidad
			,largo_por_unidad
			,peso_bruto_por_unidad
			,consistente
		FROM #lineas_orden 

		UPDATE a
		SET a.estado_integracion = 'ENVIADO'
		FROM ordenes a
		INNER JOIN #ordenes b ON
			b.id_solicitud = a.id_solicitud
	END TRY
	BEGIN CATCH
		UPDATE a
		SET a.estado_integracion = 'ERROR EN TRANSACCION DISTRIBUIDA',a.fecha_actualizacion = GETDATE()
		FROM ordenes a
		INNER JOIN #ordenes b ON
			b.id_solicitud = a.id_solicitud
	END CATCH
END


