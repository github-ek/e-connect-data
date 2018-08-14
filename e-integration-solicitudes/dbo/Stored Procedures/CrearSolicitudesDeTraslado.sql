CREATE PROCEDURE [dbo].[CrearSolicitudesDeTraslado]
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

            ,a.femi AS fecha_minima_solicitada
            ,a.fema AS fecha_maxima_solicitada
            ,CAST(NULL AS TIME(0)) AS hora_minima_solicitada
            ,CAST(NULL AS TIME(0)) AS hora_maxima_solicitada

            ,CAST(NULL AS BIGINT) AS id_tercero
            ,b.codigo AS tercero_identificacion
            ,b.nombre AS tercero_nombre
            ,CAST(NULL AS BIGINT) AS id_canal
            ,'' AS canal_codigo_alterno

            ,CAST(1 AS BIT) AS requiere_transporte
            ,CAST(0 AS BIT) AS requiere_recaudo
            ,'' AS nota

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
            ,a.bodega_traslado_codigo_alterno
            ,a.estado_inventario_traslado_codigo_alterno
        INTO #source
        FROM dbo.traslados a
        INNER JOIN [$(eConnect)].dbo.bodegas b ON
            b.id_bodega = a.id_bodega_traslado
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
        FROM #source a
        INNER JOIN [$(eConnect)].dbo.bodegas b ON
            b.id_bodega = a.id_bodega
        INNER JOIN [$(eConnect)].dbo.ciudades c ON
            c.id_ciudad = b.id_ciudad
        INNER JOIN [$(eConnect)].dbo.bodegas d ON
            d.id_bodega = a.id_bodega_traslado
        INNER JOIN [$(eConnect)].dbo.ciudades e ON
            e.id_ciudad = d.id_ciudad
        WHERE
            a.numero_linea = 1
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
        FROM dbo.traslados a
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
            INNER JOIN dbo.traslados b ON
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
        FROM [eIntegration].dbo.archivos a
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