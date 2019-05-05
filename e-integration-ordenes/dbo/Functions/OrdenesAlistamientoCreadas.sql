CREATE FUNCTION [dbo].[OrdenesAlistamientoCreadas]() 
RETURNS TABLE 
AS
RETURN 
(
WITH
cte_00 AS
(
    SELECT
         a.id
        ,a.[version]
        ,a.suscripcion
        ,a.id_externo
        ,a.arg0 AS wh_id
        ,a.arg1 AS client_id
        ,a.arg2 AS ordnum
        ,TRY_CAST(a.arg3 AS BIGINT) AS id_mensaje
        ,TRY_CAST(a.arg4 AS BIGINT) AS id_orden_alistamiento
    FROM suscripciones a
    WHERE
        a.suscripcion = 'ORDENES_DE_ALISTAMIENTO'
 )
SELECT
        a.*
    ,FORMAT(b.adddte,'yyyy-MM-dd hh:mm:ss') AS adddte
FROM cte_00 a
INNER JOIN [$(ttcwmsprd)].dbo.ord b ON
    b.wh_id = a.wh_id
AND b.ordnum = a.ordnum
AND b.client_id = a.client_id
)
