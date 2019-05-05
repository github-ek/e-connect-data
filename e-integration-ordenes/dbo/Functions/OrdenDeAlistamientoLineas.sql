CREATE FUNCTION [dbo].[OrdenDeAlistamientoLineas](
     @client_id	nvarchar(32)
    ,@ordnum nvarchar(35)
    ,@wh_id	nvarchar(32)
) 
RETURNS TABLE 
AS
RETURN 
(
    SELECT
         a.client_id
        ,a.wh_id
        ,a.ordnum
        ,a.ordlin
        ,a.prtnum
        ,a.invsts_prg
        ,a.ordqty
        ,COALESCE(SUM(b.stgqty),0) AS stgqty
        ,COALESCE(SUM(b.shpqty),SUM(b.stgqty),0) AS shpqty
    FROM [$(ttcwmsprd)].dbo.ord_line a
    LEFT OUTER JOIN [$(ttcwmsprd)].dbo.shipment_line b ON
        b.ordnum = a.ordnum
    AND b.ordlin = a.ordlin
    AND b.ordsln = a.ordsln
    AND b.wh_id = a.wh_id
    AND b.client_id = a.client_id
    WHERE
        a.client_id = @client_id
    AND a.wh_id = @wh_id
    AND a.ordnum = @ordnum
    GROUP BY
         a.client_id
        ,a.wh_id
        ,a.ordnum
        ,a.ordlin
        ,a.prtnum
        ,a.invsts_prg
        ,a.ordqty
)