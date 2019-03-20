-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE FUNCTION [dbo].[OrdenDeAlistamientoLotes](
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
        ,b.prtnum
        ,b.lotnum
        ,b.invsts
        ,b.orgcod
        ,b.expire_dte
        ,b.untqty
    FROM [$(ttcwmsprd)].dbo.shipment_line a
    INNER JOIN [$(ttcwmsprd)].dbo.invdtl b ON
        b.ship_line_id = a.ship_line_id
    WHERE
        a.client_id = @client_id
    AND a.wh_id = @wh_id
    AND a.ordnum = @ordnum
)