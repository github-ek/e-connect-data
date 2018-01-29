CREATE PROCEDURE [dbo].[CrearOrdenesManufacturaDeTraslados]
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
        AND a.tipo_orden = 'ESTAMPILLADO'
        AND a.resultado = 'NO_PROCESADA'
        
        IF OBJECT_ID('tempdb..#ordenes') IS NOT NULL BEGIN
            DROP TABLE #ordenes
        END

        SELECT
             IDENTITY(BIGINT,1,1) AS id
            ,CAST(NULL AS BIGINT) AS id_orden_manufactura
            ,a.tipo_orden
            ,CONCAT(FORMAT(b.id_cliente,'0000'),'-',b.numero_solicitud_sin_prefijo) AS numero_orden
            ,'NO_PROCESADA' AS estado
            ,d.id_linea_negocio

            ,a.id_solicitud_orden
            ,a.id_solicitud
            ,b.numero_solicitud

            ,b.id_bodega
            ,b.id_cliente
            ,b.id_servicio

            ,b.fecha_minima_solicitada
            ,b.fecha_maxima_solicitada

            ,b.nota

            ,SYSTEM_USER AS usuario_creacion
            ,SYSDATETIME() AS fecha_creacion
            ,SYSTEM_USER AS usuario_modificacion
            ,SYSDATETIME() AS fecha_modificacion
        INTO #ordenes
        FROM #source a
        INNER JOIN dbo.solicitudes b ON
            b.id_solicitud = a.id_solicitud
        INNER JOIN dbo.lineas_negocio d ON
            d.nombre = 'ALMACENAMIENTO'

        IF OBJECT_ID('tempdb..#ordenes_lineas') IS NOT NULL BEGIN
            DROP TABLE #ordenes_lineas
        END

        SELECT
             a.id

            ,CONCAT(a.numero_orden,'-',FORMAT(b.numero_linea, '000')) AS numero_suborden
            ,b.numero_linea

            ,b.id_producto
            ,b.producto_codigo
            ,b.producto_nombre
            ,b.id_estado_inventario
            ,b.id_unidad_medida

            ,b.cantidad AS unidades_solicitadas
            ,CAST(0 AS INT) AS unidades_manufacturadas
            ,CAST(0 AS INT) AS unidades_canceladas
            
            ,b.lote
        INTO #ordenes_lineas
        FROM #ordenes a
        INNER JOIN dbo.solicitudes_lineas b ON
            b.id_solicitud = a.id_solicitud
    END

    --CREACION DE LAS SOLICITUDES
    BEGIN
        DECLARE @t AS TABLE(id_orden_manufactura BIGINT,id_solicitud_orden BIGINT)

        INSERT INTO dbo.ordenes_manufactura
            (tipo_orden
            ,numero_orden
            ,estado
            ,id_linea_negocio

            ,id_solicitud_orden
            ,id_solicitud
            ,numero_solicitud

            ,id_bodega
            ,id_cliente
            ,id_servicio
            ,fecha_minima_solicitada
            ,fecha_maxima_solicitada
            ,nota

            ,usuario_creacion
            ,fecha_creacion
            ,usuario_modificacion
            ,fecha_modificacion)
        OUTPUT inserted.id_orden_manufactura,inserted.id_solicitud_orden
        INTO @t
        SELECT
             tipo_orden
            ,numero_orden
            ,estado
            ,id_linea_negocio

            ,id_solicitud_orden
            ,id_solicitud
            ,numero_solicitud

            ,id_bodega
            ,id_cliente
            ,id_servicio
            ,fecha_minima_solicitada
            ,fecha_maxima_solicitada
            ,nota

            ,usuario_creacion
            ,fecha_creacion
            ,usuario_modificacion
            ,fecha_modificacion
        FROM #ordenes a

        UPDATE a
        SET a.id_orden_manufactura = b.id_orden_manufactura
        FROM #ordenes a 
        INNER JOIN @t b ON
            b.id_solicitud_orden = a.id_solicitud_orden

        INSERT INTO dbo.ordenes_manufactura_lineas
            (id_orden_manufactura
            ,numero_suborden
            ,numero_linea

            ,id_producto
            ,producto_codigo
            ,producto_nombre
            ,id_estado_inventario
            ,id_unidad_medida

            ,unidades_solicitadas
            ,unidades_manufacturadas
            ,unidades_canceladas

            ,lote
            
            ,usuario_creacion
            ,fecha_creacion
            ,usuario_modificacion
            ,fecha_modificacion)
        SELECT
             a.id_orden_manufactura
            ,b.numero_suborden
            ,b.numero_linea

            ,b.id_producto
            ,b.producto_codigo
            ,b.producto_nombre
            ,b.id_estado_inventario
            ,b.id_unidad_medida

            ,b.unidades_solicitadas
            ,b.unidades_manufacturadas
            ,b.unidades_canceladas

            ,b.lote
            
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
        SET  a.id_orden = b.id_orden_manufactura
            ,a.numero_orden = b.numero_orden
            ,a.estado = b.estado
            ,a.resultado = 'CREADA'

            ,a.[version] = a.[version] + 1
            ,a.fecha_modificacion = b.fecha_modificacion
            ,a.usuario_modificacion = b.usuario_modificacion
        FROM dbo.solicitudes_ordenes a
        INNER JOIN #ordenes b ON
            b.id_solicitud_orden = a.id_solicitud_orden
    END

	COMMIT TRANSACTION
END TRY
BEGIN CATCH
    SELECT ERROR_MESSAGE()
	ROLLBACK TRANSACTION
    ;THROW;
END CATCH