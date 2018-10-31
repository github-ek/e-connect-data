CREATE PROCEDURE [dbo].[CrearSolicitudesDeSalida]
    @id_archivo BIGINT
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
             a.id AS id_registro_stage
            ,a.id_archivo

            ,CAST(NULL AS BIGINT) AS id_solicitud
            ,'SALIDA' AS tipo_solicitud
            ,a.numero_solicitud
            ,a.prefijo
            ,a.numero_solicitud_sin_prefijo

            ,a.id_bodega
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

            ,a.usuario_creacion
            ,a.fecha_creacion
            ,a.usuario_modificacion
            ,a.fecha_modificacion

            ,ROW_NUMBER() OVER(PARTITION BY a.id_cliente, a.numero_solicitud ORDER BY a.numero_linea) AS numero_linea

            ,a.id_producto
            ,a.id_estado_inventario
            ,a.id_unidad_medida AS id_unidad_medida_solicitada
            ,a.unidad_medida_codigo_alterno AS unidad_medida_solicitada_codigo_alterno
            ,a.cantidad AS cantidad_solicitada
            ,a.valor_unitario_declarado
            ,a.lote

            ,a.bodega_codigo_alterno
            ,a.estado_inventario_codigo_alterno
            ,'' AS bodega_traslado_codigo_alterno
            ,'' AS estado_inventario_traslado_codigo_alterno
        INTO #source
        FROM dbo.salidas a
        WHERE
            a.estado = 'VALIDADO'
        AND a.id_archivo = @id_archivo

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
        INNER JOIN dbo.salidas b ON
            b.id = a.id_registro_stage
        INNER JOIN [$(eConnect)].dbo.bodegas c ON
            c.id_bodega = a.id_bodega
        INNER JOIN [$(eConnect)].dbo.ciudades d ON
            d.id_ciudad = c.id_ciudad
        WHERE
            a.numero_linea = 1
        AND a.requiere_transporte = 1
    END

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
        UPDATE a
        SET  a.estado = CASE WHEN b.id_solicitud IS NOT NULL THEN 'PROCESADO' ELSE 'DESCARTADA' END
            ,a.[version] = a.[version] + 1
            ,a.fecha_modificacion = SYSDATETIME()
            ,a.usuario_modificacion = SYSTEM_USER
        FROM dbo.salidas a
        INNER JOIN #source b ON
            b.id_registro_stage = a.id

        ;WITH
        cte_00 AS
        (
            SELECT DISTINCT
                a.id_archivo
            FROM #source a
        ),
        cte_01 AS
        (
            SELECT
                a.id_archivo
            FROM cte_00 a
            INNER JOIN dbo.salidas b ON
                b.id_archivo = a.id_archivo
            GROUP BY
                a.id_archivo
            HAVING
                COUNT(1) = SUM(CASE WHEN b.estado IN ('PROCESADO','DESCARTADA') THEN 1 ELSE 0 END) 
        )
        UPDATE a
        SET  a.estado = 'PROCESADO'
            ,a.[version] = a.[version] + 1
            ,a.fecha_modificacion = SYSDATETIME()
            ,a.usuario_modificacion = SYSTEM_USER
        FROM dbo.archivos a
        INNER JOIN cte_01 b ON
            b.id_archivo = a.id_archivo
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
