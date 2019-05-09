CREATE PROCEDURE dbo.MergeOrdenesDeTransporte
AS
BEGIN
	BEGIN TRY
		BEGIN
			IF OBJECT_ID('tempdb..#ordenes_alistamiento') IS NOT NULL BEGIN
				DROP TABLE #ordenes_alistamiento
			END

			SELECT
				 a.id_orden_alistamiento
				,a.id_orden_alistamiento AS id_orden_transporte
				,a.id_solicitud
				,'INTEGRAR_REMESA' AS estado_orden
				,b.numero_solicitud AS numero_orden
				,a.numero_orden AS numero_orden_wms
				,b.numero_solicitud AS numero_remesa
				,NULL AS numero_confirmacion_tms
				,NULL AS numero_remesa_tms

				,a.id_cliente
				,a.id_servicio
				,a.id_bodega
				,a.id_canal
				,4 AS id_tipo_remesa
				,'AAA000' AS placa
				,ROW_NUMBER() OVER(PARTITION BY a.id_bodega,b.fecha_maxima_solicitada ORDER BY b.numero_solicitud) AS secuencia_ruta

				,c.id_ciudad_remitente AS id_ciudad_remitente
				,c.direccion_remitente AS remitente_direccion
				,NULL AS id_direccion_remitente
				,0 AS remitente_cx
				,0 AS remitente_cy
				,'NI' AS id_tipo_identificacion_remitente
				,d.numero_identificacion AS remitente_identificacion
				,d.nombre AS remitente_nombre
				,e.telefono AS remitente_telefonos
				,e.contacto AS remitente_contacto
	
				,c.id_ciudad_destinatario AS id_ciudad_destinatario
				,c.direccion_destinatario AS destinatario_direccion
				,NULL AS id_direccion_destinatario
				,0 AS destinatario_cx
				,0 AS destinatario_cy
				,'NI' AS id_tipo_identificacion_destinatario
				,b.tercero_identificacion AS destinatario_identificacion
				,b.tercero_nombre AS destinatario_nombre
				,'NO SABE NO RESPONDE' AS destinatario_telefonos
				,'NO SABE NO RESPONDE' AS destinatario_contacto
	
				,b.fecha_minima_solicitada
				,b.fecha_maxima_solicitada
				,b.hora_minima_solicitada
				,b.hora_maxima_solicitada
	
				,0 AS version
				,a.usuario_creacion
				,a.fecha_creacion
				,a.usuario_modificacion
				,a.fecha_modificacion
			INTO #ordenes_alistamiento
			FROM [$(eConnect)].dbo.ordenes_alistamiento a
			INNER JOIN [$(eConnect)].dbo.solicitudes b ON
				b.id_solicitud = a.id_solicitud
			INNER JOIN [$(eConnect)].dbo.solicitudes_transporte c ON
				c.id_solicitud = b.id_solicitud
			--REMITENTE
			INNER JOIN [$(eConnect)].dbo.empresas d ON
				d.codigo = 'EGAKAT'
			INNER JOIN [$(eConnect)].dbo.bodegas e ON
				e.id_bodega = a.id_bodega
			LEFT OUTER JOIN [$(eConnect)].dbo.ordenes_transporte f ON
				f.id_orden_transporte = a.id_orden_alistamiento
			INNER JOIN [$(eIntegrationSolicitudes)].dbo.piloto_bodegas_habilitadas g ON
				g.bodega_codigo = e.codigo
			WHERE
				f.id_orden_transporte IS NULL
			AND a.estado_orden = 'STAGE'

			IF OBJECT_ID('tempdb..#ordenes_alistamiento_lineas') IS NOT NULL BEGIN
				DROP TABLE #ordenes_alistamiento_lineas
			END

			SELECT
				 a.id
				,a.id_orden_alistamiento AS id_orden_transporte
				,a.numero_linea
				,a.id_producto
				,a.producto_codigo
				,c.producto_nombre
				,1 AS id_tipo_naturaleza_producto
				,1 AS id_tipo_producto
				,'702' AS producto_codigo_ministerio
				,c.id_unidad_medida
				,c.unidades_solicitadas AS unidades
				,c.factor_conversion

				,d.id_unidad_medida AS id_unidad_medida_embalaje
				,CAST(c.unidades_solicitadas AS DEC(12,4))/CAST(c.factor_conversion AS DEC(12,4)) AS unidades_embalaje
				,e.peso AS peso_unitario
				,e.peso AS peso_bruto_unitario
				,e.volumen AS volumen_unitario

				,d.peso AS peso_embalaje
				,d.peso AS peso_bruto_embalaje
				,d.volumen AS volumen_embalaje
				,0 AS valor_declarado_unitario
				,a.predistribucion
				,a.version
				,a.usuario_creacion
				,a.fecha_creacion
				,a.usuario_modificacion
				,a.fecha_modificacion 
			INTO #ordenes_alistamiento_lineas
			FROM #ordenes_alistamiento z
			INNER JOIN  [$(eConnect)].dbo.ordenes_alistamiento_lineas a ON
				a.id_orden_alistamiento = z.id_orden_alistamiento
			INNER JOIN [$(eConnect)].dbo.ordenes_alistamiento b ON
				b.id_orden_alistamiento = a.id_orden_alistamiento
			INNER JOIN [$(eConnect)].dbo.solicitudes_lineas c ON
				c.id_solicitud = b.id_solicitud
			AND c.numero_linea = a.numero_linea
			INNER JOIN [$(eConnect)].dbo.productos_medidas d ON
				d.id_producto = c.id_producto
			AND d.id_bodega = b.id_bodega
			AND d.cas_flg = 1
			INNER JOIN [$(eConnect)].dbo.productos_medidas e ON
				e.id_producto = c.id_producto
			AND e.id_bodega = b.id_bodega
			AND e.rcv_flg = 1
		END

		BEGIN
			BEGIN TRANSACTION

			INSERT INTO [$(eConnect)].dbo.ordenes_transporte
			(id_orden_transporte
			,id_solicitud
			,estado_orden
			,numero_orden
			,numero_orden_wms
			,numero_remesa
			,numero_confirmacion_tms
			,numero_remesa_tms
			,id_cliente
			,id_servicio
			,id_bodega
			,id_canal
			,id_tipo_remesa
			,placa
			,secuencia_ruta
			,id_ciudad_remitente
			,remitente_direccion
			,id_direccion_remitente
			,remitente_cx
			,remitente_cy
			,id_tipo_identificacion_remitente
			,remitente_identificacion
			,remitente_nombre
			,remitente_telefonos
			,remitente_contacto
			,id_ciudad_destinatario
			,destinatario_direccion
			,id_direccion_destinatario
			,destinatario_cx
			,destinatario_cy
			,id_tipo_identificacion_destinatario
			,destinatario_identificacion
			,destinatario_nombre
			,destinatario_telefonos
			,destinatario_contacto
			,fecha_minima_solicitada
			,fecha_maxima_solicitada
			,hora_minima_solicitada
			,hora_maxima_solicitada
			,nota_novedad
			,version
			,usuario_creacion
			,fecha_creacion
			,usuario_modificacion
			,fecha_modificacion)
			SELECT
			 id_orden_transporte
			,id_solicitud
			,estado_orden
			,numero_orden
			,numero_orden_wms
			,numero_remesa
			,numero_confirmacion_tms
			,numero_remesa_tms
			,id_cliente
			,id_servicio
			,id_bodega
			,id_canal
			,id_tipo_remesa
			,placa
			,secuencia_ruta
			,id_ciudad_remitente
			,remitente_direccion
			,id_direccion_remitente
			,remitente_cx
			,remitente_cy
			,id_tipo_identificacion_remitente
			,remitente_identificacion
			,remitente_nombre
			,remitente_telefonos
			,remitente_contacto
			,id_ciudad_destinatario
			,destinatario_direccion
			,id_direccion_destinatario
			,destinatario_cx
			,destinatario_cy
			,id_tipo_identificacion_destinatario
			,destinatario_identificacion
			,destinatario_nombre
			,destinatario_telefonos
			,destinatario_contacto
			,fecha_minima_solicitada
			,fecha_maxima_solicitada
			,hora_minima_solicitada
			,hora_maxima_solicitada
			,'' AS nota_novedad
			,version
			,usuario_creacion
			,fecha_creacion
			,usuario_modificacion
			,fecha_modificacion
			FROM #ordenes_alistamiento

			INSERT INTO [$(eConnect)].dbo.ordenes_transporte_lineas
			(
			id
			,id_orden_transporte
			,numero_linea
			,id_producto
			,producto_codigo
			,producto_nombre
			,id_tipo_naturaleza_producto
			,id_tipo_producto
			,producto_codigo_ministerio
			,id_unidad_medida
			,unidades
			,factor_conversion
			,id_unidad_medida_embalaje
			,unidades_embalaje
			,peso_unitario
			,peso_bruto_unitario
			,volumen_unitario
			,peso_embalaje
			,peso_bruto_embalaje
			,volumen_embalaje
			,valor_declarado_unitario
			,predistribucion
			,version
			,usuario_creacion
			,fecha_creacion
			,usuario_modificacion
			,fecha_modificacion)
			SELECT
			 id
			,id_orden_transporte
			,numero_linea
			,id_producto
			,producto_codigo
			,producto_nombre
			,id_tipo_naturaleza_producto
			,id_tipo_producto
			,producto_codigo_ministerio
			,id_unidad_medida
			,unidades
			,factor_conversion
			,id_unidad_medida_embalaje
			,unidades_embalaje
			,peso_unitario
			,peso_bruto_unitario
			,volumen_unitario
			,peso_embalaje
			,peso_bruto_embalaje
			,volumen_embalaje
			,valor_declarado_unitario
			,predistribucion
			,version
			,usuario_creacion
			,fecha_creacion
			,usuario_modificacion
			,fecha_modificacion
			FROM #ordenes_alistamiento_lineas

			INSERT INTO [$(eConnect)].dbo.ordenes_transporte_lineas_alistadas
			(
			id
			,id_orden_transporte
			,numero_linea
			,id_producto
			,producto_codigo
			,producto_nombre
			,id_tipo_naturaleza_producto
			,id_tipo_producto
			,producto_codigo_ministerio
			,id_unidad_medida
			,unidades
			,factor_conversion
			,id_unidad_medida_embalaje
			,unidades_embalaje
			,peso_unitario
			,peso_bruto_unitario
			,volumen_unitario
			,peso_embalaje
			,peso_bruto_embalaje
			,volumen_embalaje
			,valor_declarado_unitario
			,predistribucion
			,version
			,usuario_creacion
			,fecha_creacion
			,usuario_modificacion
			,fecha_modificacion)
			SELECT
			 id
			,id_orden_transporte
			,numero_linea
			,id_producto
			,producto_codigo
			,producto_nombre
			,id_tipo_naturaleza_producto
			,id_tipo_producto
			,producto_codigo_ministerio
			,id_unidad_medida
			,unidades
			,factor_conversion
			,id_unidad_medida_embalaje
			,unidades_embalaje
			,peso_unitario
			,peso_bruto_unitario
			,volumen_unitario
			,peso_embalaje
			,peso_bruto_embalaje
			,volumen_embalaje
			,valor_declarado_unitario
			,predistribucion
			,version
			,usuario_creacion
			,fecha_creacion
			,usuario_modificacion
			,fecha_modificacion
			FROM #ordenes_alistamiento_lineas

			COMMIT TRANSACTION;
		END
	END TRY
	BEGIN CATCH
		IF @@TRANCOUNT > 0 BEGIN
			ROLLBACK;
		END
		;THROW
	END CATCH
END