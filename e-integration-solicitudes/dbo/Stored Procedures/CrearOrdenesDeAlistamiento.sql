CREATE PROCEDURE [dbo].[CrearOrdenesDeAlistamiento]
AS
BEGIN TRY
    --SET NOCOUNT ON;

    --CONSOLIDACION DE INFORMACION DE NUEVAS ORDENES
    BEGIN
        IF OBJECT_ID('tempdb..#source') IS NOT NULL BEGIN
            DROP TABLE #source
        END

        ;WITH
        cte_00 AS
        (
            SELECT
                c.id_servicio,c.id_tipo_orden_wms
            FROM [$(eConnect)].dbo.tipos_wms_integracion a
            INNER JOIN [$(eConnect)].dbo.tipos_wms_orden b ON
                b.id_tipo_wms_integracion = a.id_tipo_wms_integracion
            INNER JOIN [$(eConnect)].dbo.servicios_tipos_wms_orden c ON
                c.id_tipo_orden_wms = b.id_tipo_orden_wms
            WHERE
                a.codigo = 'ALISTAMIENTO'
            AND c.generacion_automatica = 1
        )
        SELECT 
              b.id_tipo_orden_wms
             ,a.*
        INTO #source
        FROM [$(eConnect)].dbo.solicitudes a
        INNER JOIN cte_00 b ON
            b.id_servicio = a.id_servicio
        WHERE
            a.estado_solicitud = 'NO_PROCESADO'
            
        IF OBJECT_ID('tempdb..#ordenes') IS NOT NULL BEGIN
            DROP TABLE #ordenes
        END

        SELECT
             NEXT VALUE FOR [$(eConnect)].dbo.hibernate_sequence  AS id_orden_alistamiento
            ,a.id_solicitud
            ,a.numero_solicitud

            ,'NO_PROCESADO' AS estado_orden
            ,CAST('' AS VARCHAR(35)) AS numero_orden

            ,a.id_cliente
            ,a.id_servicio
            ,a.id_tipo_orden_wms
            ,a.id_bodega
            ,a.id_tercero
            ,a.tercero_identificacion
            ,a.tercero_nombre
            ,a.id_canal

            ,a.fecha_minima_solicitada
            ,a.fecha_maxima_solicitada

            ,a.requiere_transporte
            ,b.id_ciudad_destinatario
            ,COALESCE(b.direccion_destinatario,'') AS direccion_destinatario

            ,a.nota
            ,0 AS [version]
            ,SYSTEM_USER AS usuario_creacion
            ,SYSDATETIME() AS fecha_creacion
            ,SYSTEM_USER AS usuario_modificacion
            ,SYSDATETIME() AS fecha_modificacion
        INTO #ordenes
        FROM #source a
        LEFT OUTER JOIN [$(eConnect)].dbo.solicitudes_transporte b ON
            b.id_solicitud = a.id_solicitud

        UPDATE a
        SET a.numero_orden = CONCAT('EC-',FORMAT(a.id_orden_alistamiento,'0000000000'),'-',a.numero_solicitud)
        FROM #ordenes a

        IF OBJECT_ID('tempdb..#ordenes_lineas') IS NOT NULL BEGIN
            DROP TABLE #ordenes_lineas
        END

        SELECT
             NEXT VALUE FOR [$(eConnect)].dbo.hibernate_sequence AS id
            ,a.id_orden_alistamiento

            ,b.numero_linea
            ,b.id_producto
            ,b.producto_codigo
            ,b.id_estado_inventario
            ,b.unidades_solicitadas
            ,b.id_unidad_medida
            ,b.lote
            ,b.predistribucion

            ,a.[version]
            ,a.usuario_creacion
            ,a.fecha_creacion
            ,a.usuario_modificacion
            ,a.fecha_modificacion
        INTO #ordenes_lineas
        FROM #ordenes a
        INNER JOIN [$(eConnect)].dbo.solicitudes_lineas b ON
            b.id_solicitud = a.id_solicitud
    END

    --CREACION DE LAS ORDENES
    BEGIN TRANSACTION

    BEGIN
        INSERT INTO [$(eConnect)].dbo.ordenes_alistamiento
            (id_orden_alistamiento
            ,id_solicitud
            ,estado_orden
            ,numero_orden
            
            ,id_cliente
            ,id_servicio
            ,id_tipo_orden_wms
            ,id_bodega
            ,id_tercero
            ,tercero_identificacion
            ,tercero_nombre
            ,id_canal

            ,fecha_minima_solicitada
            ,fecha_maxima_solicitada

            ,requiere_transporte
            ,id_ciudad_destinatario
            ,direccion_destinatario

            ,nota
            ,[version]
            ,usuario_creacion
            ,fecha_creacion
            ,usuario_modificacion
            ,fecha_modificacion)
        SELECT
             id_orden_alistamiento
            ,id_solicitud
            ,estado_orden
            ,numero_orden
            
            ,id_cliente
            ,id_servicio
            ,id_tipo_orden_wms
            ,id_bodega
            ,id_tercero
            ,tercero_identificacion
            ,tercero_nombre
            ,id_canal

            ,fecha_minima_solicitada
            ,fecha_maxima_solicitada

            ,requiere_transporte
            ,id_ciudad_destinatario
            ,direccion_destinatario

            ,nota
            ,[version]
            ,usuario_creacion
            ,fecha_creacion
            ,usuario_modificacion
            ,fecha_modificacion
        FROM #ordenes a

        INSERT INTO [$(eConnect)].dbo.ordenes_alistamiento_lineas
            (id
            ,id_orden_alistamiento
            
            ,numero_linea
            ,id_producto
            ,producto_codigo
            ,id_estado_inventario
            ,unidades_solicitadas
            ,id_unidad_medida
            ,lote
            ,predistribucion

            ,[version]
            ,usuario_creacion
            ,fecha_creacion
            ,usuario_modificacion
            ,fecha_modificacion)
        SELECT
             id
            ,id_orden_alistamiento
            
            ,numero_linea
            ,id_producto
            ,producto_codigo
            ,id_estado_inventario
            ,unidades_solicitadas
            ,id_unidad_medida
            ,lote
            ,predistribucion

            ,[version]
            ,usuario_creacion
            ,fecha_creacion
            ,usuario_modificacion
            ,fecha_modificacion
        FROM #ordenes_lineas

        UPDATE a
        SET  a.estado_solicitud = 'EN_PROCESO'
            ,a.subestado_solicitud = 'ORDEN_CREADA'

            ,a.[version] = a.[version] + 1
            ,a.usuario_modificacion = b.usuario_modificacion
            ,a.fecha_modificacion = b.fecha_modificacion
        FROM [$(eConnect)].dbo.solicitudes a
        INNER JOIN #ordenes b ON
            b.id_solicitud = a.id_solicitud
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