CREATE PROCEDURE [dbo].[CrearOrdenesAlistamientoDeSolicitudesDeTraslado]
AS
BEGIN TRY
    --SET NOCOUNT ON;

    BEGIN TRANSACTION

    --CONSOLIDACION DE REGISTROS VALIDADOS
    BEGIN
        IF OBJECT_ID('tempdb..#base') IS NOT NULL BEGIN
            DROP TABLE #base
        END

        SELECT 
             id
            ,a.id_solicitud
            ,a.tipo_solicitud
            ,a.tipo_orden
            ,a.id_orden
            ,a.numero_orden
            ,a.estado
            ,a.resultado
            ,a.id_orden_origen
            ,a.numero_orden_origen
        INTO #base
        FROM [$(eConnect)].dbo.solicitudes_ordenes a
        WHERE
            a.tipo_solicitud = 'TRASLADO'
        AND a.tipo_orden = 'ALISTAMIENTO'
        AND a.resultado = 'NO_PROCESADA'

        IF OBJECT_ID('tempdb..#ordenes_alistamiento') IS NOT NULL BEGIN
            DROP TABLE #ordenes_alistamiento
        END

        SELECT
             CAST(NULL AS BIGINT) AS id_orden_alistamiento
            ,CONCAT('EC-',b.id_solicitud,'-',b.numero_solicitud) AS numero_orden
            ,'NO_PROCESADA' AS estado
            ,d.id_linea_negocio
            ,b.id_solicitud
            ,b.numero_solicitud
            ,b.id_bodega
            ,b.id_cliente
            ,b.id_servicio
            ,b.id_tercero
            ,b.tercero_codigo_alterno AS tercero_identificacion
            ,b.tercero_nombre
            ,b.id_canal
            ,b.fecha_minima_solicitada
            ,b.fecha_maxima_solicitada
            ,b.hora_minima_solicitada
            ,b.hora_maxima_solicitada
            ,CAST(NULL AS DATETIME2(0)) AS fecha_cita_entrega
            ,CAST(NULL AS TIME(0)) AS hora_cita_entrega_minima
            ,CAST(NULL AS TIME(0)) AS hora_cita_entrega_maxima
            ,'S' AS requiere_transporte
            ,c.id_ciudad_destinatario
            ,COALESCE(c.direccion_destinatario,'') AS direccion_destinatario
            ,b.nota
            ,b.id_causal_anulacion
            ,'' AS nota_cierre
            ,CAST(0 AS BIT) AS cerrada
            ,CAST(0 AS BIT) AS cierre_notificado
            ,'' AS usuario_cierre
            ,CAST(NULL AS DATETIME2(0)) AS fecha_cierre
            ,CAST(0 AS INT) AS [version]
            ,SYSTEM_USER AS usuario_creacion
            ,SYSDATETIME() AS fecha_creacion
            ,SYSTEM_USER AS usuario_modificacion
            ,SYSDATETIME() AS fecha_modificacion
        INTO #ordenes_alistamiento
        FROM #base a
        INNER JOIN [$(eConnect)].dbo.solicitudes b ON
            b.id_solicitud = a.id_solicitud
        LEFT OUTER JOIN [$(eConnect)].dbo.solicitudes_transporte c ON
            c.id_solicitud = a.id_solicitud
        LEFT OUTER JOIN [$(eConnect)].dbo.lineas_negocio d ON
            d.nombre = 'ALMACENAMIENTO'
            --TODO CAMBIAR LOS CODIGOSX

        IF OBJECT_ID('tempdb..#ordenes_alistamiento_lineas') IS NOT NULL BEGIN
            DROP TABLE #ordenes_alistamiento_lineas
        END

        SELECT
             b.id_solicitud
            ,b.numero_linea
            ,b.id_producto
            ,b.producto_codigo
            ,b.producto_nombre
            ,b.id_estado_inventario
            ,b.id_unidad_medida
            ,b.cantidad AS unidades_solicitadas
            ,CAST(0 AS INT) AS unidades_despachadas
            ,CAST(0 AS INT) AS unidades_canceladas
            ,b.lote
            ,'' AS predistribucion
        INTO #ordenes_alistamiento_lineas
        FROM #base a
        INNER JOIN [$(eConnect)].dbo.solicitudes_lineas b ON
            b.id_solicitud = a.id_solicitud

        IF OBJECT_ID('tempdb..#solicitudes_ordenes') IS NOT NULL BEGIN
            DROP TABLE #solicitudes_ordenes
        END
            
        SELECT
             a.id_cliente
            ,a.numero_solicitud
            
            ,CAST('ALISTAMIENTO' AS VARCHAR(50)) AS tipo_orden
            ,CAST(NULL AS BIGINT) AS id_orden
            ,CAST('' AS VARCHAR(50)) AS numero_orden
            ,CAST('' AS VARCHAR(50)) AS estado
            ,CAST('NO_PROCESADA' AS VARCHAR(50)) AS resultado

            ,CAST(NULL AS BIGINT) AS id_orden_origen
            ,CAST('' AS VARCHAR(50)) AS numero_orden_origen
        INTO #solicitudes_ordenes
        FROM #ordenes_alistamiento a
    END

    --CREACION DE LAS SOLICITUDES
    DECLARE @t AS TABLE(id_orden_alistamiento BIGINT,id_solicitud BIGINT)
    BEGIN

        INSERT INTO [$(eConnect)].dbo.ordenes_alistamiento
            (numero_orden
            ,estado
            ,id_linea_negocio
            ,id_solicitud
            ,numero_solicitud
            ,id_bodega
            ,id_cliente
            ,id_servicio
            ,id_tercero
            ,tercero_identificacion
            ,tercero_nombre
            ,id_canal
            ,fecha_minima_solicitada
            ,fecha_maxima_solicitada
            ,hora_minima_solicitada
            ,hora_maxima_solicitada
            ,fecha_cita_entrega
            ,hora_cita_entrega_minima
            ,hora_cita_entrega_maxima
            ,requiere_transporte
            ,id_ciudad_destinatario
            ,direccion_destinatario
            ,nota
            ,id_causal_anulacion
            ,nota_cierre
            ,cerrada
            ,cierre_notificado
            ,usuario_cierre
            ,fecha_cierre
            ,[version]
            ,usuario_creacion
            ,fecha_creacion
            ,usuario_modificacion
            ,fecha_modificacion)
        OUTPUT inserted.id_orden_alistamiento,inserted.id_solicitud
        INTO @t
        SELECT
             numero_orden
            ,estado
            ,id_linea_negocio
            ,id_solicitud
            ,numero_solicitud
            ,id_bodega
            ,id_cliente
            ,id_servicio
            ,id_tercero
            ,tercero_identificacion
            ,tercero_nombre
            ,id_canal
            ,fecha_minima_solicitada
            ,fecha_maxima_solicitada
            ,hora_minima_solicitada
            ,hora_maxima_solicitada
            ,fecha_cita_entrega
            ,hora_cita_entrega_minima
            ,hora_cita_entrega_maxima
            ,requiere_transporte
            ,id_ciudad_destinatario
            ,direccion_destinatario
            ,nota
            ,id_causal_anulacion
            ,nota_cierre
            ,cerrada
            ,cierre_notificado
            ,usuario_cierre
            ,fecha_cierre
            ,[version]
            ,usuario_creacion
            ,fecha_creacion
            ,usuario_modificacion
            ,fecha_modificacion
        FROM #ordenes_alistamiento a

        UPDATE a
        SET a.id_orden_alistamiento = b.id_orden_alistamiento
        FROM #ordenes_alistamiento a 
        INNER JOIN @t b ON
            b.id_solicitud = a.id_solicitud

        INSERT INTO [$(eConnect)].dbo.ordenes_alistamiento_lineas
           (id_orden_alistamiento
           ,numero_linea
           ,id_producto
           ,producto_codigo
           ,producto_nombre
           ,id_estado_inventario
           ,id_unidad_medida
           ,unidades_solicitadas
           ,unidades_despachadas
           ,unidades_canceladas
           ,lote
           ,predistribucion
           ,[version]
           ,fecha_creacion
           ,usuario_creacion
           ,fecha_modificacion
           ,usuario_modificacion)
        SELECT
             a.id_orden_alistamiento
            ,b.numero_linea
            ,b.id_producto
            ,b.producto_codigo
            ,b.producto_nombre
            ,b.id_estado_inventario
            ,b.id_unidad_medida
            ,unidades_solicitadas
            ,unidades_despachadas
            ,unidades_canceladas
            ,lote
            ,predistribucion
            ,[version]
            ,fecha_creacion
            ,usuario_creacion
            ,fecha_modificacion
            ,usuario_modificacion
        FROM #ordenes_alistamiento a
        INNER JOIN #ordenes_alistamiento_lineas b ON
            b.id_solicitud = a.id_solicitud

        UPDATE a
        SET  a.id_orden = c.id_orden_alistamiento
            ,a.numero_orden = c.numero_orden
            ,a.estado = c.estado
            ,a.resultado = 'CREADA'
            ,a.[version] = a.[version] + 1
            ,a.fecha_modificacion = SYSDATETIME()
            ,a.usuario_modificacion = SYSTEM_USER
        FROM [$(eConnect)].dbo.solicitudes_ordenes a
        INNER JOIN #base b ON
            b.id = a.id
        INNER JOIN #ordenes_alistamiento C ON
            c.id_solicitud = a.id_solicitud
    END

	COMMIT TRANSACTION
END TRY
BEGIN CATCH
    SELECT ERROR_MESSAGE()
	ROLLBACK TRANSACTION
    ;THROW;
END CATCH