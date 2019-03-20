CREATE FUNCTION [dbo].OrdenDeAlistamiento(
     @integracion VARCHAR(50)
    ,@id_externo VARCHAR(100)
)
RETURNS TABLE 
AS
RETURN 
(
    SELECT
         a.integracion
        ,a.id_externo
        ,c.id_solicitud
        ,c.id_orden_alistamiento
        ,c.numero_orden
        ,d.codigo AS tipo_orden
    FROM dbo.actualizaciones a
    INNER JOIN [$(eConnect)].dbo.solicitudes b ON
        b.integracion = a.integracion
    AND b.id_externo = a.id_externo    
    INNER JOIN [$(eConnect)].dbo.ordenes_alistamiento c ON
        c.id_solicitud = b.id_solicitud
    INNER JOIN [$(eConnect)].dbo.tipos_wms_orden d ON
        d.id_tipo_orden_wms = c.id_tipo_orden_wms
    WHERE
        a.integracion = @integracion
    AND a.id_externo = @id_externo
)