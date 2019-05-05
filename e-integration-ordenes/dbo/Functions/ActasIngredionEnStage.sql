
CREATE FUNCTION [dbo].[ActasIngredionEnStage]() 
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
            ,CAST(a.arg1 AS VARCHAR(32)) AS client_id
            ,CAST(a.arg2 AS VARCHAR(32)) AS wh_id
            ,CAST(a.arg3 AS VARCHAR(35)) AS ordnum
        FROM dbo.suscripciones a
        WHERE
            a.suscripcion = 'ORDENES_DE_ALISTAMIENTO_ACTAS_INGREDION'
        AND a.estado_suscripcion = 'ORDEN_ALISTAMIENTO_NOTIFICADA'
    ),
    cte_01 AS
    (
        SELECT DISTINCT
             a.*
            ,c.stgdte
            ,CASE WHEN c.shpsts IN ('C','S') THEN 'STAGE' ELSE c.shpsts END AS shpsts
        FROM cte_00 a
        INNER JOIN [$(ttcwmsprd)].dbo.shipment_line b ON
            b.wh_id = a.wh_id
        AND b.client_id = a.client_id
        AND b.ordnum = a.ordnum
        INNER JOIN [$(ttcwmsprd)].dbo.shipment c ON
            c.ship_id = b.ship_id
		AND c.shpsts NOT IN ('B')
    )
    SELECT
         a.suscripcion
        ,a.id_externo
        ,a.wh_id
        ,a.client_id
        ,a.ordnum
        ,COALESCE(MIN(a.stgdte),GETDATE()) AS stgdte
    FROM cte_01 a
    GROUP BY
         a.suscripcion
        ,a.id_externo
        ,a.wh_id
        ,a.client_id
        ,a.ordnum
    HAVING COUNT(DISTINCT a.shpsts) = 1 AND MAX(a.shpsts) = 'STAGE'
)