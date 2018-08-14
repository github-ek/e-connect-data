CREATE PROCEDURE [dbo].[CrearSolicitudesEstandarLineasBom]
AS
BEGIN TRY
    --CONSOLIDAR DATOS DE LAS SOLICITUDES
    BEGIN
        IF OBJECT_ID('tempdb..#solicitudes_lineas_bom') IS NOT NULL BEGIN
            DROP TABLE #solicitudes_lineas_bom
        END
        
        SELECT
             a.id_solicitud

            ,b.numero_linea
            ,b.id_producto
            ,b.producto_codigo
            ,b.id_estado_inventario
            ,b.id_subestado_inventario
            ,b.unidades
            ,b.lote

            ,b.estado_inventario_bom_codigo_alterno
            ,b.subestado_inventario_bom_codigo_alterno

            ,a.usuario_creacion
            ,a.fecha_creacion
            ,a.usuario_modificacion
            ,a.fecha_modificacion
        INTO #solicitudes_lineas_bom
        FROM #source a
        INNER JOIN #source_bom b ON
            b.id_registro_stage = a.id_registro_stage
        WHERE
            a.id_solicitud IS NOT NULL
    END

    --CREACION DE LAS SOLICITUDES
    BEGIN
        INSERT INTO [$(eConnect)].dbo.solicitudes_lineas_bom
           (id_solicitud
           ,numero_linea
           ,id_producto
           ,producto_codigo
           ,id_estado_inventario
           ,id_subestado_inventario
           ,unidades
           ,lote
           ,estado_inventario_bom_codigo_alterno
           ,subestado_inventario_bom_codigo_alterno

           ,usuario_creacion
           ,fecha_creacion
           ,usuario_modificacion
           ,fecha_modificacion)
        SELECT
            a.id_solicitud
           ,a.numero_linea
           ,a.id_producto
           ,a.producto_codigo
           ,a.id_estado_inventario
           ,a.id_subestado_inventario
           ,a.unidades
           ,a.lote
           ,a.estado_inventario_bom_codigo_alterno
           ,a.subestado_inventario_bom_codigo_alterno

           ,a.usuario_creacion
           ,a.fecha_creacion
           ,a.usuario_modificacion
           ,a.fecha_modificacion
        FROM #solicitudes_lineas_bom a
    END
END TRY
BEGIN CATCH
    SELECT ERROR_MESSAGE()
    ;THROW;
END CATCH