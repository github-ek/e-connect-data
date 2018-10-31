CREATE PROCEDURE [dbo].[CrearSolicitudesDeSalidaV2]
     @integracion VARCHAR(50)
    ,@correlacion VARCHAR(100)
AS
BEGIN TRY
    --SET NOCOUNT ON;
    --CONSOLIDACION DE INFORMACION DE NUEVAS SOLICITUDES
    BEGIN
        IF OBJECT_ID('tempdb..#source') IS NOT NULL BEGIN
            DROP TABLE #source
        END

        SELECT 
             a.id_solicitud_despacho AS id_registro_stage
			,a.integracion
			,a.correlacion
			,a.id_externo
            ,0 AS id_archivo

            ,CAST(NULL AS BIGINT) AS id_solicitud
            ,'SALIDA' AS tipo_solicitud
            ,a.numero_solicitud
            ,a.prefijo
            ,a.numero_solicitud_sin_prefijo

            ,b.id_bodega
            ,CAST(NULL AS BIGINT) AS id_bodega_traslado
            ,a.id_cliente
            ,a.id_servicio
            ,a.servicio_codigo_alterno

            ,a.femi AS fecha_minima_solicitada
            ,a.fema AS fecha_maxima_solicitada
            ,a.homi AS hora_minima_solicitada
            ,a.homi AS hora_maxima_solicitada

            ,a.id_tercero
            ,a.tercero_identificacion
            ,a.tercero_nombre
            ,a.id_canal
            ,a.canal_codigo_alterno

            ,CAST(1 AS BIT) AS requiere_transporte
            ,CAST(0 AS BIT) AS requiere_recaudo
            ,a.nota

            ,'' AS usuario_creacion
            ,a.fecha_creacion
            ,'' AS usuario_modificacion
            ,SYSDATETIME() AS fecha_modificacion

            ,ROW_NUMBER() OVER(PARTITION BY a.id_cliente, a.numero_solicitud ORDER BY b.numero_linea) AS numero_linea

            ,b.id_producto
            ,b.id_estado_inventario
            ,c.id_unidad_medida AS id_unidad_medida_solicitada
            ,CONCAT(b.numero_linea_externo,'|',b.numero_sublinea_externo) AS unidad_medida_solicitada_codigo_alterno
            ,b.cantidad AS cantidad_solicitada
            ,COALESCE(b.valor_unitario_declarado,0) AS valor_unitario_declarado
            ,b.lote

            ,b.bodega_codigo_alterno
            ,b.estado_inventario_codigo_alterno
            ,'' AS bodega_traslado_codigo_alterno
            ,'' AS estado_inventario_traslado_codigo_alterno
        INTO #source
        FROM dbo.solicitudes_despacho a
		INNER JOIN dbo.solicitudes_despacho_lineas b ON
			b.id_solicitud_despacho = a.id_solicitud_despacho
		INNER JOIN [$(eConnect)].dbo.productos_medidas c ON
			c.id_producto = b.id_producto
		AND c.id_bodega = b.id_bodega
		AND c.rcv_flg = 1
        INNER JOIN dbo.integraciones_actualizaciones z ON
            z.integracion = a.integracion
        AND z.id_externo = a.id_externo
        AND z.correlacion = a.correlacion
        WHERE
            z.estado_integracion = 'VALIDADO'
        AND a.integracion = @integracion
		AND a.correlacion = @correlacion

        IF OBJECT_ID('tempdb..#solicitudes_transporte') IS NOT NULL BEGIN
            DROP TABLE #solicitudes_transporte
        END

        SELECT
             a.id_cliente
            ,a.numero_solicitud

            ,CAST(NULL AS BIGINT) AS id_tipo_ruta
            ,CAST(NULL AS BIGINT) AS id_tipo_vehiculo

            ,c.id_ciudad AS id_ciudad_remitente
            ,d.codigo AS ciudad_remitente_codigo_alterno
            ,c.direccion AS direccion_remitente
            ,c.id_direccion AS id_direccion_remitente
            ,CAST(NULL AS BIGINT) AS id_punto_remitente
            ,c.codigo AS punto_remitente_codigo_alterno
            ,c.nombre AS punto_remitente_nombre
            ,CAST(0 AS BIT) AS requiere_cita_remitente
            ,a.fecha_minima_solicitada AS fecha_cita_remitente
            ,CAST(NULL AS TIME(0)) AS hora_cita_minima_remitente
            ,CAST(NULL AS TIME(0)) AS hora_cita_maxima_remitente

            ,b.id_ciudad AS id_ciudad_destinatario
            ,b.ciudad_codigo_alterno AS ciudad_destinatario_codigo_alterno
            ,b.direccion AS direccion_destinatario
            ,CAST(NULL AS BIGINT) AS id_direccion_destinatario
            ,b.id_punto AS id_punto_destinatario
            ,b.punto_codigo_alterno AS punto_destinatario_codigo_alterno
            ,b.punto_nombre AS punto_destinatario_nombre
            ,CAST(0 AS BIT) AS requiere_cita_destinatario
            ,a.fecha_maxima_solicitada AS fecha_cita_destinatario
            ,CAST(NULL AS TIME(0)) AS hora_cita_minima_destinatario
            ,CAST(NULL AS TIME(0)) AS hora_cita_maxima_destinatario
        INTO #solicitudes_transporte
        FROM #source a
        INNER JOIN dbo.solicitudes_despacho b ON
            b.id_solicitud_despacho = a.id_registro_stage
        INNER JOIN [$(eConnect)].dbo.bodegas c ON
            c.id_bodega = a.id_bodega
        INNER JOIN [$(eConnect)].dbo.ciudades d ON
            d.id_ciudad = c.id_ciudad
        WHERE
            a.numero_linea = 1
        AND a.requiere_transporte = 1
    END


	BEGIN
		BEGIN TRANSACTION

		--CREAR NUEVAS SOLICITUDES ESTANDAR
		BEGIN
			EXEC dbo.CrearSolicitudesEstandar

			EXEC dbo.CrearSolicitudesEstandarDeTransporte
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
			FROM #source a
			WHERE
				a.id_solicitud IS NOT NULL
			AND a.numero_linea = 1
		END

		--ACTUALIZACION DE LOS REGISTROS EN STAGE
		BEGIN
			--UPDATE a
			--SET  a.estado_integracion = CASE WHEN b.id_solicitud IS NOT NULL THEN 'PROCESADO' ELSE 'DESCARTADO' END
   --             ,a.[version] = a.[version] + 1
			--	,a.fecha_modificacion = SYSDATETIME()
			--FROM dbo.solicitudes_despacho a
			--INNER JOIN #source b ON
			--	b.id_registro_stage = a.id_solicitud_despacho

			UPDATE a
			SET  a.estado_integracion = CASE WHEN b.id_solicitud IS NOT NULL THEN 'PROCESADO' ELSE 'DESCARTADO' END
				,a.estado_notificacion = 'NOTIFICAR'
				,a.[version] = a.[version] + 1
				,a.fecha_modificacion = SYSDATETIME()
			FROM dbo.integraciones_actualizaciones a
			INNER JOIN #source b ON
				b.integracion = a.integracion
			AND b.correlacion = a.correlacion
			AND b.id_externo = a.id_externo
		END

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
