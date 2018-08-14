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
        FROM [$(eConnect)].dbo.solicitudes_ordenes a
        WHERE
            a.tipo_solicitud = 'TRASLADO'
        AND a.tipo_orden = 'RECIBO_ABASTECIMIENTO'
        AND a.resultado = 'NO_PROCESADA'

        IF OBJECT_ID('tempdb..#ordenes') IS NOT NULL BEGIN
            DROP TABLE #ordenes
        END

        SELECT
             b.id_orden_alistamiento

            ,IDENTITY(BIGINT,1,1) AS id
            ,CAST(NULL AS BIGINT) AS id_orden_recibo
            ,b.numero_orden
            ,'NO_PROCESADA' AS estado
            ,b.id_linea_negocio

            ,a.id_solicitud_orden
            ,a.id_solicitud
    
            ,c.id_bodega_traslado AS id_bodega
            ,b.id_cliente
            ,b.id_servicio
            ,b.id_tercero
            ,d.codigo AS tercero_identificacion
            ,d.nombre AS tercero_nombre
    
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
        INNER JOIN [$(eConnect)].dbo.ordenes_alistamiento b ON
            b.id_orden_alistamiento = a.id_orden_origen
        INNER JOIN [$(eConnect)].dbo.solicitudes c ON
            c.id_solicitud = a.id_solicitud
        INNER JOIN [$(eConnect)].dbo.bodegas d ON
            d.id_bodega = c.id_bodega

        IF OBJECT_ID('tempdb..#ordenes_lineas') IS NOT NULL BEGIN
            DROP TABLE #ordenes_lineas
        END
        
        --TODO SACAR DE EMBARQUES
        SELECT
             a.id

            ,ROW_NUMBER() OVER(PARTITION BY b.id_orden_alistamiento ORDER BY b.numero_linea) AS numero_linea
            ,b.id_producto
            ,b.producto_codigo
            ,b.id_estado_inventario
            ,b.id_unidad_medida
            ,b.unidades_despachadas AS unidades_solicitadas

            ,b.lote
            ,'' AS bl
            ,'' AS contenedor
        INTO #ordenes_lineas
        FROM #ordenes a
        INNER JOIN [$(eConnect)].dbo.ordenes_alistamiento_lineas b ON
            b.id_orden_alistamiento = a.id_orden_alistamiento
    END

    --CREACION DE LAS SOLICITUDES
    DECLARE @t AS TABLE(id_solicitud_orden BIGINT,id_orden_recibo BIGINT)
    BEGIN

        INSERT INTO [$(eConnect)].dbo.ordenes_recibo
            (numero_orden
            ,estado
            ,id_linea_negocio

            ,id_solicitud_orden
            ,id_solicitud

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
        OUTPUT inserted.id_solicitud_orden, inserted.id_orden_recibo
        INTO @t
        SELECT
             numero_orden
            ,estado
            ,id_linea_negocio

            ,id_solicitud_orden
            ,id_solicitud

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

        INSERT INTO [$(eConnect)].dbo.ordenes_recibo_lineas
           (id_orden_recibo

           ,numero_linea
           ,id_producto
           ,producto_codigo
           ,id_estado_inventario
           ,id_unidad_medida

           ,unidades_solicitadas

           ,lote
           ,bl
           ,contenedor

           ,usuario_creacion
           ,fecha_creacion
           ,usuario_modificacion
           ,fecha_modificacion)
        SELECT
             a.id_orden_recibo

            ,b.numero_linea
            ,b.id_producto
            ,b.producto_codigo
            ,b.id_estado_inventario
            ,b.id_unidad_medida

            ,unidades_solicitadas

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
        FROM [$(eConnect)].dbo.solicitudes_ordenes a
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