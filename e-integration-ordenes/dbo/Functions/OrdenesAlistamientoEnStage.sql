CREATE FUNCTION [dbo].[OrdenesAlistamientoEnStage]() 
RETURNS TABLE 
AS
RETURN 
(
    WITH
    cte_00 AS
    (
        SELECT
             a.suscripcion
            ,a.id_externo
            ,a.arg0 AS wh_id
            ,a.arg1 AS client_id
            ,a.arg2 AS ordnum
        FROM dbo.suscripciones a
        WHERE
            a.suscripcion = 'ORDENES_DE_ALISTAMIENTO'
        AND a.estado_suscripcion NOT IN ('STAGE_NOTIFICADO')
    ),
    cte_01 AS
    (
        SELECT DISTINCT
             a.id_externo
            ,CASE WHEN c.shpsts IN ('C','S') THEN 'STAGE' ELSE c.shpsts END AS shpsts
        FROM cte_00 a
        INNER JOIN [$(ttcwmsprd)].dbo.shipment_line b ON
            b.client_id = a.client_id
        AND b.wh_id = a.wh_id
        AND b.ordnum = a.ordnum
        INNER JOIN [$(ttcwmsprd)].dbo.shipment c ON
            c.ship_id = b.ship_id
		AND c.shpsts NOT IN ('B')
    )
    SELECT
         a.id_externo
    FROM cte_01 a
    GROUP BY
         a.id_externo
    HAVING COUNT(DISTINCT a.shpsts) = 1 AND MAX(a.shpsts) = 'STAGE'
)