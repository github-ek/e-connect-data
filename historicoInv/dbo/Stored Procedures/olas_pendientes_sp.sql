CREATE PROCEDURE [dbo].[olas_pendientes_sp] AS
SET NOCOUNT ON;

TRUNCATE TABLE DBO.olas_pendientes

INSERT INTO dbo.olas_pendientes (schbat, wh_id, adddte, numsls, totpcs, palvol, estwgt, batsts, client_id,
appqty, pckqty, partes)
select pckbat.schbat,
        pckbat.wh_id,
        pckbat.adddte,
        pckbat.numsls,
        pckbat.totpcs,
        pckbat.palvol,
        pckbat.estwgt,
        dscmst.lngdsc batsts,
        shipment_line.client_id,
        pck.appqty,
        pck.pckqty,
        count(distinct ord_line.prtnum) parts
   from [$(ttcwmsprd)].dbo.pckbat
  inner
   join [$(ttcwmsprd)].dbo.shipment_line
     on pckbat.schbat = shipment_line.schbat
  inner
   join [$(ttcwmsprd)].dbo.ord_line
     on shipment_line.wh_id = ord_line.wh_id
    and shipment_line.client_id = ord_line.client_id
    and shipment_line.ordnum = ord_line.ordnum
    and shipment_line.ordlin = ord_line.ordlin
    and shipment_line.ordsln = ord_line.ordsln
  inner
   join [$(ttcwmsprd)].dbo.dscmst
     on dscmst.colnam = 'batsts'
    and dscmst.colval = pckbat.batsts
    and dscmst.locale_id = 'es-es'
   left outer
   join (select wh_id,
                schbat,
                client_id,
                sum(dtl_appqty) appqty,
                sum(dtl_pckqty) pckqty
           from [$(ttcwmsprd)].dbo.pckwrk_view
          group by wh_id,
                schbat,
                client_id) pck
     on shipment_line.wh_id = pck.wh_id
    and shipment_line.client_id = pck.client_id
    and pckbat.schbat = pck.schbat
  where shipment_line.linsts != 'B'
    and pckbat.wave_prc_flg = 1
    AND pckbat.batsts != 'CMPL'
  group by pckbat.schbat,
        pckbat.wh_id,
        pckbat.adddte,
        pckbat.numsls,
        pckbat.totpcs,
        pckbat.palvol,
        pckbat.estwgt,
        dscmst.lngdsc,
        pck.appqty,
        pck.pckqty,
        shipment_line.client_id