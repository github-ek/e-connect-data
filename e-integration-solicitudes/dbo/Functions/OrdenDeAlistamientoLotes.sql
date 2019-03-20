CREATE FUNCTION [dbo].[OrdenDeAlistamientoLotes](
     @id_orden_alistamiento	BIGINT
) 
RETURNS TABLE 
AS
RETURN 
(
    SELECT
         a.id_orden_alistamiento
        ,b.numero_linea
        ,b.lote
        ,b.id_estado_inventario
        ,b.fecha_vencimiento
        ,b.orgcod
        ,b.unidades_alistadas
    FROM [$(eConnect)].dbo.ordenes_alistamiento a
    INNER JOIN [$(eConnect)].dbo.ordenes_alistamiento_lotes b ON
        b.id_orden_alistamiento = a.id_orden_alistamiento
    WHERE
        a.id_orden_alistamiento = @id_orden_alistamiento
)