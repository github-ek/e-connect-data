
CREATE VIEW [dbo].[manufacturas]
AS
SELECT 
    a.wh_id,
    a.client_id,
    a.wkonum,
    a.wkorev,
    a.wko_typ,
    a.prtnum,
    a.invsts,
    a.wkosts,
    b.lngdsc,
    a.adddte,
    a.wkoqty,
    a.prdqty,
    a.clsdte
FROM [$(WMS_DB_SERVER)].[$(ttcwmsprd)].dbo.wkohdr a
INNER JOIN [$(WMS_DB_SERVER)].[$(ttcwmsprd)].dbo.dscmst b ON 
    b.colval = a.wkosts
AND b.colnam = 'wkosts'
AND b.locale_id = 'ES-ES'