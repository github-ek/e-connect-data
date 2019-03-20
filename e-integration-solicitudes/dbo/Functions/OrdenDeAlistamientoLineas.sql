CREATE FUNCTION [dbo].[OrdenDeAlistamientoLineas](
     @id_orden_alistamiento	BIGINT
) 
RETURNS TABLE 
AS
RETURN 
(
    SELECT
         a.id_orden_alistamiento
        ,b.numero_linea
        ,b.numero_linea_externo
        ,b.numero_sublinea_externo
        ,b.producto_codigo
        ,b.bodega_codigo_alterno
        ,d.codigo AS bodega_codigo
        ,b.id_estado_inventario
        ,b.cantidad_solicitada
        ,c.unidades_alistadas
    FROM [$(eConnect)].dbo.ordenes_alistamiento a
    INNER JOIN [$(eConnect)].dbo.solicitudes_lineas b ON
        b.id_solicitud = a.id_solicitud
    INNER JOIN [$(eConnect)].dbo.ordenes_alistamiento_lineas_alistadas c ON
        c.id_orden_alistamiento = a.id_orden_alistamiento
    AND c.numero_linea = b.numero_linea
    INNER JOIN [$(eConnect)].dbo.bodegas d ON
        d.id_bodega = a.id_bodega
    WHERE
        a.id_orden_alistamiento = @id_orden_alistamiento
)