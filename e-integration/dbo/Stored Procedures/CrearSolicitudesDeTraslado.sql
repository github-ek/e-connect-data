CREATE PROCEDURE [dbo].[CrearSolicitudesDeTraslado]
AS
BEGIN TRY
    --SET NOCOUNT ON;

    BEGIN TRANSACTION

    --CONSOLIDACION DE REGISTROS VALIDADOS
    BEGIN
        IF OBJECT_ID('tempdb..#source') IS NOT NULL BEGIN
            DROP TABLE #source
        END

        SELECT 
             a.*
            ,ROW_NUMBER() OVER(PARTITION BY a.id_cliente, a.numero_orden ORDER BY a.numero_linea) AS orden
        INTO #source
        FROM [$(eStage)].oms.traslados a
        WHERE
            a.estado = 'VALIDADO'
        --TODO QUITAR
        AND a.id_cliente = 18
        AND a.prefijo_orden <> ''

        IF OBJECT_ID('tempdb..#solicitudes') IS NOT NULL BEGIN
            DROP TABLE #solicitudes
        END
        
        SELECT
             CAST(NULL AS BIGINT) AS id_solicitud
            ,'TRASLADO' AS tipo_solicitud
            ,a.numero_orden AS numero_solicitud
            ,a.prefijo_orden AS prefijo
            ,a.numero_orden_sin_prefijo AS numero_solicitud_sin_prefijo
            ,'NO_PROCESADA' estado

            ,a.id_bodega_origen AS id_bodega
            ,a.id_bodega_destino AS id_bodega_traslado
            ,a.id_cliente
            ,a.id_servicio
            ,a.servicio_codigo_alterno
            ,a.id_tercero
            ,a.tercero_codigo_alterno
            ,a.tercero_nombre
            ,CAST(NULL AS BIGINT) AS id_canal
            ,'' AS canal_codigo_alterno

            ,a.femi AS fecha_minima_solicitada
            ,a.fema AS fecha_maxima_solicitada
            ,CAST(NULL AS TIME(0)) AS hora_minima_solicitada
            ,CAST(NULL AS TIME(0)) AS hora_maxima_solicitada
            
            ,'S' AS requiere_transporte
            ,'N' AS requiere_recaudo
            ,'' AS nota

            ,'' AS numero_solicitud_anulado
            ,CAST(NULL AS BIGINT) AS id_causal_anulacion
            ,'' AS nota_anulacion
            ,'' AS usuario_anulacion
            ,CAST(NULL AS DATETIME2(0)) AS fecha_anulacion

            ,CAST(0 AS INT) AS [version]
            ,a.usuario_creacion
            ,a.fecha_creacion
            ,a.usuario_modificacion
            ,a.fecha_modificacion
        INTO #solicitudes
        FROM #source a
        WHERE
            a.orden = 1

        CREATE UNIQUE INDEX ix_solicitudes_01 ON #solicitudes(id_cliente,numero_solicitud)

        IF OBJECT_ID('tempdb..#solicitudes_lineas') IS NOT NULL BEGIN
            DROP TABLE #solicitudes_lineas
        END
        --TODO HACER LA CONVERSIÓN DE LA CANTIDAD CUANDO ENVUIEN OTGRA UNIDAD DE MEDIDA DIFERENTE A RECIVE FLAG = 1
        --TODO VALIDAR QUE EL ESTADO INVENTARIO ORIGEN Y DESTINO SENA IGUALES
        SELECT
             a.id
            ,a.id_cliente
            ,a.numero_orden AS numero_solicitud

            ,ROW_NUMBER() OVER(PARTITION BY a.id_cliente, a.numero_orden ORDER BY a.numero_linea) AS numero_linea
            ,a.id_producto
            ,a.producto_codigo_alterno AS producto_codigo
            ,COALESCE(b.nombre,'') AS producto_nombre
            ,a.id_estado_inventario_origen AS id_estado_inventario
            ,c.id_unidad_medida
            ,a.cantidad
            ,a.lote
            ,a.valor_unitario_declarado
            ,a.cantidad AS cantidad_solicitada
            ,COALESCE(a.id_unidad,c.id_unidad_medida) AS id_unidad_medida_solicitada
            ,a.unidad_codigo_alterno AS unidad_medida_solicitada_codigo_alterno
            ,a.bodega_origen_codigo_alterno AS bodega_codigo_alterno
            ,a.estado_inventario_origen_codigo_alterno AS estado_inventario_codigo_alterno
            ,a.bodega_destino_codigo_alterno AS bodega_traslado_codigo_alterno
            ,a.estado_inventario_destino_codigo_alterno AS estado_traslado_inventario_codigo_alterno

            ,CAST(0 AS INT) AS [version]
            ,a.usuario_creacion
            ,a.fecha_creacion
            ,a.usuario_modificacion
            ,a.fecha_modificacion
        INTO #solicitudes_lineas
        FROM #source a
        LEFT OUTER JOIN [$(eConnect)].dbo.productos b ON
            b.id_producto = a.id_producto
        LEFT OUTER JOIN [$(eConnect)].dbo.productos_medidas c ON
            c.id_producto = a.id_producto
        AND c.id_bodega = a.id_bodega_origen
        AND c.rcv_flg = 1

        IF OBJECT_ID('tempdb..#solicitudes_transporte') IS NOT NULL BEGIN
            DROP TABLE #solicitudes_transporte
        END

        SELECT
             a.id
            ,a.id_cliente
            ,a.numero_orden AS numero_solicitud

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
            ,a.femi AS fecha_cita_remitente
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
            ,a.fema AS fecha_cita_destinatario
            ,CAST(NULL AS TIME(0)) AS hora_cita_minima_destinatario
            ,CAST(NULL AS TIME(0)) AS hora_cita_maxima_destinatario

            ,CAST(0 AS INT) AS [version]
            ,a.usuario_creacion
            ,a.fecha_creacion
            ,a.usuario_modificacion
            ,a.fecha_modificacion
        INTO #solicitudes_transporte
        FROM #source a
        INNER JOIN [$(eConnect)].dbo.bodegas b ON
            b.id_bodega = a.id_bodega_origen
        INNER JOIN [$(eConnect)].dbo.ciudades c ON
            c.id_ciudad = b.id_ciudad
        INNER JOIN [$(eConnect)].dbo.bodegas d ON
            d.id_bodega = a.id_bodega_destino
        INNER JOIN [$(eConnect)].dbo.ciudades e ON
            e.id_ciudad = b.id_ciudad
        WHERE
            a.orden = 1

        IF OBJECT_ID('tempdb..#solicitudes_ordenes') IS NOT NULL BEGIN
            DROP TABLE #solicitudes_ordenes
        END

        ;WITH
        cte_00 AS
        (
            SELECT
                CAST(tipo_orden AS VARCHAR(50)) AS tipo_orden
            FROM 
            (
             VALUES
                ('ALISTAMIENTO')
            )a(tipo_orden)
        )
        SELECT
             a.id_cliente
            ,a.numero_solicitud
            ,b.tipo_orden
        INTO #solicitudes_ordenes
        FROM #solicitudes a,cte_00 b

    END

    --CREACION DE LAS SOLICITUDES
    DECLARE @t AS TABLE(id_solicitud BIGINT,id_cliente BIGINT,numero_solicitud VARCHAR(20))
    BEGIN

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
            ,tercero_codigo_alterno
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

            ,numero_solicitud_anulado
            ,id_causal_anulacion
            ,nota_anulacion
            ,usuario_anulacion
            ,fecha_anulacion

            ,[version]
            ,usuario_creacion
            ,fecha_creacion
            ,usuario_modificacion
            ,fecha_modificacion)
        OUTPUT inserted.id_solicitud,inserted.id_cliente,inserted.numero_solicitud
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
            ,tercero_codigo_alterno
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

            ,numero_solicitud_anulado
            ,id_causal_anulacion
            ,nota_anulacion
            ,usuario_anulacion
            ,fecha_anulacion

            ,[version]
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
            ,producto_nombre
            ,id_estado_inventario
            ,id_unidad_medida
            ,cantidad

            ,lote
            ,valor_unitario_declarado

            ,cantidad_solicitada
            ,id_unidad_medida_solicitada
            ,unidad_medida_solicitada_codigo_alterno
            ,bodega_codigo_alterno
            ,estado_inventario_codigo_alterno
            ,bodega_traslado_codigo_alterno
            ,estado_traslado_inventario_codigo_alterno

            ,[version]
            ,fecha_creacion
            ,usuario_creacion
            ,fecha_modificacion
            ,usuario_modificacion)
        SELECT
             a.id_solicitud
            ,b.numero_linea
            ,b.id_producto
            ,b.producto_codigo
            ,b.producto_nombre
            ,b.id_estado_inventario
            ,b.id_unidad_medida
            ,b.cantidad

            ,b.lote
            ,b.valor_unitario_declarado

            ,b.cantidad_solicitada
            ,b.id_unidad_medida_solicitada
            ,b.unidad_medida_solicitada_codigo_alterno
            ,b.bodega_codigo_alterno
            ,b.estado_inventario_codigo_alterno
            ,b.bodega_traslado_codigo_alterno
            ,b.estado_traslado_inventario_codigo_alterno

            ,b.[version]
            ,b.fecha_creacion
            ,b.usuario_creacion
            ,b.fecha_modificacion
            ,b.usuario_modificacion
        FROM #solicitudes a
        INNER JOIN #solicitudes_lineas b ON
            b.id_cliente = a.id_cliente
        AND b.numero_solicitud = a.numero_solicitud

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

            ,[version]
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

            ,b.[version]
            ,b.usuario_creacion
            ,b.fecha_creacion
            ,b.usuario_modificacion
            ,b.fecha_modificacion
        FROM @t a
        INNER JOIN #solicitudes_transporte b ON
            b.id_cliente = a.id_cliente
        AND b.numero_solicitud = a.numero_solicitud
    
        UPDATE a
        SET  a.estado = 'PROCESADO'
            ,a.[version] = a.[version] + 1
            ,a.fecha_modificacion = SYSDATETIME()
            ,a.usuario_modificacion = SYSTEM_USER
        FROM [$(eStage)].oms.traslados a
        INNER JOIN #source b ON
            b.id = a.id
        WHERE
            a.estado = 'VALIDADO'

        INSERT INTO [$(eConnect)].dbo.solicitudes_ordenes
            (tipo_solicitud
            ,id_solicitud
            
            ,tipo_orden

            ,[version]
            ,usuario_creacion
            ,fecha_creacion
            ,usuario_modificacion
            ,fecha_modificacion)
        SELECT
             a.tipo_solicitud
            ,a.id_solicitud

            ,b.tipo_orden

            ,a.[version]
            ,a.usuario_creacion
            ,a.fecha_creacion
            ,a.usuario_modificacion
            ,a.fecha_modificacion
        FROM #solicitudes a
        INNER JOIN #solicitudes_ordenes b ON
            b.id_cliente = a.id_cliente
        AND b.numero_solicitud = a.numero_solicitud
    END

	COMMIT TRANSACTION
END TRY
BEGIN CATCH
    SELECT ERROR_MESSAGE()
	ROLLBACK TRANSACTION
    ;THROW;
END CATCH