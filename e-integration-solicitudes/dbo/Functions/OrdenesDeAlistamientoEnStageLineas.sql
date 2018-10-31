
CREATE FUNCTION [dbo].[OrdenesDeAlistamientoEnStageLineas](
     @id_solicitud_despacho	BIGINT
)
RETURNS TABLE 
AS
RETURN 
(
    SELECT
         FORMAT(a.numero_linea+1,'0000') AS ordlin
        ,a.numero_linea
        ,a.numero_linea_externo
        ,a.numero_sublinea_externo

        ,a.producto_codigo_alterno
        ,a.producto_nombre
        ,a.bodega_codigo_alterno
        ,a.estado_inventario_codigo_alterno
        ,a.cantidad
    FROM dbo.solicitudes_despacho_lineas a 
    WHERE
        a.id_solicitud_despacho = @id_solicitud_despacho
)