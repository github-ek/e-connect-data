
CREATE FUNCTION [dbo].[OrdenesDeAlistamientoEnStage](
     @client_id VARCHAR(32)
    ,@ordnum VARCHAR(35)
    ,@wh_id VARCHAR(32)
)
RETURNS TABLE 
AS
RETURN 
(
    WITH
    cte_00 AS
    (
    SELECT 
         @client_id AS client_id
        ,@ordnum AS ordnum
        ,@wh_id AS wh_id
    )
    SELECT
         a.*
        ,b.id_cliente
        ,c.id_orden_alistamiento
        ,d.id_bodega
        ,z.id_solicitud_despacho
        ,z.integracion
        ,z.id_externo
        ,z.correlacion
        ,'NO_PROCESADO' AS estado
    FROM cte_00 a
    LEFT OUTER JOIN [$(eConnect)].dbo.clientes b ON
        b.codigo_alterno_wms = a.client_id
    LEFT OUTER JOIN [$(eConnect)].dbo.ordenes_alistamiento c ON
        c.id_cliente  = b.id_cliente
    AND c.numero_orden = a.ordnum
    LEFT OUTER JOIN [$(eConnect)].dbo.solicitudes d ON
        d.id_solicitud = c.id_solicitud
    LEFT OUTER JOIN dbo.solicitudes_despacho z on
        z.id_cliente = c.id_cliente
    AND z.numero_solicitud = d.numero_solicitud
    --AND z.estado_integracion = 'PROCESADO'
    AND z.integracion = 'SOLICITUDES_SALIDAS_GWS'    
)