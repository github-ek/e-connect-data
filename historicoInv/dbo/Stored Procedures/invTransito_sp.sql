CREATE PROCEDURE [dbo].[invTransito_sp] AS
SET NOCOUNT ON;

TRUNCATE TABLE dbo.InvTransito

INSERT INTO dbo.InvTransito (wh_id, arecod, stoloc, prt_client_id, prtnum, lodnum, adddate, untqty, schbat)
select invlod.wh_id Almacen,
        aremst.arecod Area,
        invlod.stoloc Ubicacion,
        invdtl.prt_client_id Cliente,
        invdtl.prtnum Producto,
        invlod.lodnum LPN,
        coalesce(invlod.lstmov, invdtl.lstmov) Fecha_Agregada,
        sum(invdtl.untqty) Cantidad,
        shipment_line.schbat numero_ola
   from [$(ttcwmsprd)].dbo.invlod
   join [$(ttcwmsprd)].dbo.invsub
     on invlod.lodnum = invsub.lodnum
   join [$(ttcwmsprd)].dbo.invdtl
     on invdtl.subnum = invsub.subnum
   join [$(ttcwmsprd)].dbo.locmst
     on locmst.stoloc = invlod.stoloc
    and locmst.wh_id = invlod.wh_id
   join [$(ttcwmsprd)].dbo.aremst
     on aremst.arecod = locmst.arecod
    and aremst.wh_id = locmst.wh_id
    and (aremst.stgflg = 1 or aremst.rcv_stgflg = 1 or aremst.expflg = 1 or aremst.rdtflg = 1)
   left outer
   join [$(ttcwmsprd)].dbo.shipment_line
     on invdtl.ship_line_id = shipment_line.ship_line_id
  --where invlod.wh_id = 'TL-BOG-ZF-01'
  group by aremst.arecod,
        invlod.stoloc,
        invdtl.invsts,
        invdtl.prt_client_id,
        invlod.wh_id,
        invdtl.prtnum,
        invlod.lodnum,
        shipment_line.schbat,
        coalesce(invlod.lstmov, invdtl.lstmov)
  order by 7