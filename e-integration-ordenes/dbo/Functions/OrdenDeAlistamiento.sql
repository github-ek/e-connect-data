-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE FUNCTION [dbo].[OrdenDeAlistamiento](
     @client_id	nvarchar(32)
    ,@ordnum nvarchar(35)
    ,@wh_id	nvarchar(32)
) 
RETURNS TABLE 
AS
RETURN 
(
    SELECT DISTINCT
         a.client_id
        ,a.ordnum
        ,a.wh_id
        ,a.ordtyp
    FROM [$(ttcwmsprd)].dbo.ord a
    WHERE
        a.client_id = @client_id
    AND a.wh_id = @wh_id
    AND a.ordnum = @ordnum
)