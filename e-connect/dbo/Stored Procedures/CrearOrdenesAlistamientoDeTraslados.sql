CREATE PROCEDURE [dbo].[CrearOrdenesAlistamientoDeTraslados]
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
        INTO #source
        FROM dbo.solicitudes_ordenes a
        WHERE
            a.tipo_solicitud = 'TRASLADO'
        AND a.tipo_orden = 'ALISTAMIENTO'
        AND a.resultado = 'NO_PROCESADA'

        IF OBJECT_ID('tempdb..#ordenes') IS NOT NULL BEGIN
            DROP TABLE #ordenes
        END

        SELECT
             IDENTITY(BIGINT,1,1) AS id
            ,CAST(NULL AS BIGINT) AS id_orden_alistamiento
            ,CONCAT('EC-',b.id_solicitud,'-',b.numero_solicitud) AS numero_orden
            ,'NO_PROCESADA' AS estado

            ,a.id_solicitud_orden
            ,a.id_solicitud
            ,b.numero_solicitud

            ,d.id_linea_negocio
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

            ,b.requiere_transporte
            ,c.id_ciudad_destinatario
            ,COALESCE(c.direccion_destinatario,'') AS direccion_destinatario

            ,b.nota

            ,SYSTEM_USER AS usuario_creacion
            ,SYSDATETIME() AS fecha_creacion
            ,SYSTEM_USER AS usuario_modificacion
            ,SYSDATETIME() AS fecha_modificacion
        INTO #ordenes
        FROM #source a
        INNER JOIN dbo.solicitudes b ON
            b.id_solicitud = a.id_solicitud
        LEFT OUTER JOIN dbo.solicitudes_transporte c ON
            c.id_solicitud = a.id_solicitud
        INNER JOIN dbo.lineas_negocio d ON
            d.nombre = 'ALMACENAMIENTO'
        --TODO CAMBIAR LOS CODIGOSX

        IF OBJECT_ID('tempdb..#ordenes_lineas') IS NOT NULL BEGIN
            DROP TABLE #ordenes_lineas
        END

        SELECT
             a.id

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
        INTO #ordenes_lineas
        FROM #ordenes a
        INNER JOIN dbo.solicitudes_lineas b ON
            b.id_solicitud = a.id_solicitud

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
                ('PLANIFICACION_SECUNDARIA')
            )a(tipo_orden)
        )
        SELECT
             a.id_solicitud_orden
            ,a.tipo_solicitud
            ,a.id_solicitud

            ,b.tipo_orden
        INTO #solicitudes_ordenes
        FROM #source a, cte_00 b
    END

    --CREACION DE LAS SOLICITUDES
    BEGIN
        DECLARE @t AS TABLE(id_orden_alistamiento BIGINT,id_solicitud_orden BIGINT)

        INSERT INTO dbo.ordenes_alistamiento
            (numero_orden
            ,estado

            ,id_solicitud_orden
            ,id_solicitud
            ,numero_solicitud

            ,id_linea_negocio
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
           
            ,usuario_creacion
            ,fecha_creacion
            ,usuario_modificacion
            ,fecha_modificacion)
        OUTPUT inserted.id_orden_alistamiento,inserted.id_solicitud_orden
        INTO @t
        SELECT
             numero_orden
            ,estado

            ,id_solicitud_orden
            ,id_solicitud
            ,numero_solicitud

            ,id_linea_negocio
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

            ,usuario_creacion
            ,fecha_creacion
            ,usuario_modificacion
            ,fecha_modificacion
        FROM #ordenes a

        UPDATE a
        SET a.id_orden_alistamiento = b.id_orden_alistamiento
        FROM #ordenes a 
        INNER JOIN @t b ON
            b.id_solicitud_orden = a.id_solicitud_orden

        INSERT INTO dbo.ordenes_alistamiento_lineas
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

           ,usuario_creacion
           ,fecha_creacion
           ,usuario_modificacion
           ,fecha_modificacion)
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

            ,a.usuario_creacion
            ,a.fecha_creacion
            ,a.usuario_modificacion
            ,a.fecha_modificacion
        FROM #ordenes a
        INNER JOIN #ordenes_lineas b ON
            b.id = a.id
    END

    BEGIN
        UPDATE a
        SET  a.id_orden = b.id_orden_alistamiento
            ,a.numero_orden = b.numero_orden
            ,a.estado = b.estado
            ,a.resultado = 'CREADA'

            ,a.[version] = a.[version] + 1
            ,a.fecha_modificacion = b.fecha_modificacion
            ,a.usuario_modificacion = b.usuario_modificacion
        FROM dbo.solicitudes_ordenes a
        INNER JOIN #ordenes b ON
            b.id_solicitud_orden = a.id_solicitud_orden

        INSERT INTO dbo.solicitudes_ordenes
            (tipo_solicitud
            ,id_solicitud
            
            ,tipo_orden

            ,id_orden_origen
            ,numero_orden_origen

            ,usuario_creacion
            ,fecha_creacion
            ,usuario_modificacion
            ,fecha_modificacion)
        SELECT
             b.tipo_solicitud
            ,b.id_solicitud

            ,b.tipo_orden
            
            ,a.id_orden_alistamiento AS id_orden_origen
            ,a.numero_orden AS numero_orden_origen

            ,a.usuario_creacion
            ,a.fecha_creacion
            ,a.usuario_modificacion
            ,a.fecha_modificacion
        FROM #ordenes a
        INNER JOIN #solicitudes_ordenes b ON
            b.id_solicitud_orden = a.id_solicitud_orden
    END

	COMMIT TRANSACTION
END TRY
BEGIN CATCH
    SELECT ERROR_MESSAGE()
	ROLLBACK TRANSACTION
    ;THROW;
END CATCH