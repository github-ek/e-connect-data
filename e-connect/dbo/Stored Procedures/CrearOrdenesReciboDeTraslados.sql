CREATE PROCEDURE [dbo].[CrearOrdenesReciboDeTraslados]
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
        AND a.tipo_orden = 'RECIBO_ABASTECIMIENTO'
        AND a.resultado = 'NO_PROCESADA'

        IF OBJECT_ID('tempdb..#ordenes') IS NOT NULL BEGIN
            DROP TABLE #ordenes
        END

        SELECT
             IDENTITY(BIGINT,1,1) AS id
            ,CAST(NULL AS BIGINT) AS id_orden_recibo
            ,c.numero_orden
            ,'NO_PROCESADA' AS estado

            ,a.id_solicitud_orden
            ,a.id_solicitud
            ,b.numero_solicitud
    
            ,b.id_linea_negocio
            ,c.id_bodega_traslado AS id_bodega
            ,c.id_cliente
            ,c.id_servicio
            ,c.id_tercero
            ,c.tercero_identificacion
            ,c.tercero_nombre
    
            ,b.fecha_minima_solicitada
            ,b.fecha_maxima_solicitada
            ,b.hora_minima_solicitada
            ,b.hora_maxima_solicitada

            ,b.nota

            ,SYSTEM_USER AS usuario_creacion
            ,SYSDATETIME() AS fecha_creacion
            ,SYSTEM_USER AS usuario_modificacion
            ,SYSDATETIME() AS fecha_modificacion
        INTO #ordenes
        FROM #source a
        INNER JOIN dbo.ordenes_alistamiento b ON
            b.id_solicitud_orden = a.id_orden_origen
        INNER JOIN dbo.solicitudes c ON
            c.id_solicitud = a.id_solicitud

        IF OBJECT_ID('tempdb..#ordenes_lineas') IS NOT NULL BEGIN
            DROP TABLE #ordenes_lineas
        END
        
        --TODO SACAR DE EMBARQUES
        SELECT
             a.id

            ,ROW_NUMBER() OVER(PARTITION BY b.id_orden_alistamiento ORDER BY b.numero_linea) AS numero_linea
            ,b.id_producto
            ,b.producto_codigo
            ,b.producto_nombre
            ,b.id_estado_inventario
            ,b.id_unidad_medida
            ,b.unidades_despachadas AS unidades_solicitadas
            ,CAST(0 AS INT) AS unidades_recibidas
            ,CAST(0 AS INT) AS unidades_canceladas

            ,b.lote
            ,'' AS bl
            ,'' AS contenedor
        INTO #ordenes_lineas
        FROM #ordenes a
        INNER JOIN dbo.ordenes_alistamiento_lineas b ON
            b.id_orden_alistamiento = a.id_orden_alistamiento
    END

    --CREACION DE LAS SOLICITUDES
    DECLARE @t AS TABLE(id_orden_recibo BIGINT,id_solicitud_orden BIGINT)
    BEGIN

        INSERT INTO dbo.ordenes_recibo
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

            ,fecha_minima_solicitada
            ,fecha_maxima_solicitada
            ,hora_minima_solicitada
            ,hora_maxima_solicitada

            ,nota

            ,usuario_creacion
            ,fecha_creacion
            ,usuario_modificacion
            ,fecha_modificacion)
        OUTPUT inserted.id_orden_recibo,inserted.id_solicitud_orden
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

            ,fecha_minima_solicitada
            ,fecha_maxima_solicitada
            ,hora_minima_solicitada
            ,hora_maxima_solicitada

            ,nota

            ,usuario_creacion
            ,fecha_creacion
            ,usuario_modificacion
            ,fecha_modificacion
        FROM #ordenes a

        UPDATE a
        SET a.id_orden_recibo = b.id_orden_recibo
        FROM #ordenes a 
        INNER JOIN @t b ON
            b.id_solicitud_orden = a.id_solicitud_orden

        INSERT INTO dbo.ordenes_recibo_lineas
           (id_orden_recibo
           ,numero_linea
           ,id_producto
           ,producto_codigo
           ,producto_nombre
           ,id_estado_inventario
           ,id_unidad_medida

           ,unidades_solicitadas
           ,unidades_recibidas
           ,unidades_canceladas

           ,lote
           ,bl
           ,contenedor

           ,fecha_creacion
           ,usuario_creacion
           ,fecha_modificacion
           ,usuario_modificacion)
        SELECT
             a.id_orden_recibo
            ,b.numero_linea
            ,b.id_producto
            ,b.producto_codigo
            ,b.producto_nombre
            ,b.id_estado_inventario
            ,b.id_unidad_medida

            ,unidades_solicitadas
            ,unidades_recibidas
            ,unidades_canceladas

            ,lote
            ,bl
            ,contenedor

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
        SET  a.id_orden = b.id_orden_recibo
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