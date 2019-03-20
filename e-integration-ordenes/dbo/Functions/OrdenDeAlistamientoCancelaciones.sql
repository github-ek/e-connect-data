-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE FUNCTION [dbo].[OrdenDeAlistamientoCancelaciones](
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
        ,a.cancod
        ,UPPER(COALESCE(c.lngdsc,'')) AS lngdsc
        ,a.remqty
        ,a.can_usr_id
        ,a.candte 
    FROM [$(ttcwmsprd)].dbo.canpck a
    INNER JOIN [$(eHistoricos)].dbo.causales_cancelacion_alistamientos b ON
        b.cancod = a.cancod
    LEFT OUTER JOIN [$(ttcwmsprd)].dbo.dscmst c ON
        c.colval = a.cancod
    AND c.colnam = 'codval'
    AND c.locale_id = 'ES-ES'
    WHERE
        a.client_id = @client_id
    AND a.wh_id = @wh_id
    AND a.ordnum = @ordnum
)