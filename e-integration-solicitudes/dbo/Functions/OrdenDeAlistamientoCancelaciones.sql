CREATE FUNCTION [dbo].[OrdenDeAlistamientoCancelaciones](
     @id_orden_alistamiento	BIGINT
) 
RETURNS TABLE 
AS
RETURN 
(
    SELECT
         a.id_orden_alistamiento
        ,b.numero_linea
        ,b.cancelacion_codigo
        ,b.cancelacion_descripcion
        ,b.unidades_canceladas
    FROM [$(eConnect)].dbo.ordenes_alistamiento a
    INNER JOIN [$(eConnect)].dbo.ordenes_alistamiento_cancelaciones b ON
        b.id_orden_alistamiento = a.id_orden_alistamiento
    WHERE
        a.id_orden_alistamiento = @id_orden_alistamiento
)