CREATE PROCEDURE [dbo].[pedidos_pendientes_sp] AS
SET NOCOUNT ON;

TRUNCATE TABLE dbo.pedidos_pendientes

INSERT INTO dbo.pedidos_pendientes (fecha_add,cliente,orden_tac,orden_cli,nro_lineas,cnt_ordenada,cnt_programada, cnt_stage,
cajas, nro_ola, trailer, fecha_femi, tipo_orden, destinatario, almacen)
select o.adddte fecha_add,
        o.client_id cliente,
        o.ordnum orden_tac,
        o.rmanum orden_cli,
        count(ol.ordlin) nro_lineas,
        sum(ol.ordqty) cnt_ordenada,
        sum(respck.pckqty) cnt_programada,
        sum(respck.appqty) cnt_stage,
        round(sum(cast(respck.pckqty as dec) / cast(respck.untcas as dec)), 2) cajas,
        max(respck.schbat) nro_ola,
        max(respck.trlr_num) trailer,
        o.cpodte fecha_femi,
        dscmst.lngdsc tipo_orden,
        o.stcust destinatario,
        o.wh_id almacen
   from [$(ttcwmsprd)].dbo.ord o
  inner
   join [$(ttcwmsprd)].dbo.ord_line ol
     on o.wh_id = ol.wh_id
    and o.client_id = ol.client_id
    and o.ordnum = ol.ordnum
   left outer
   join (select sv.wh_id,
                sv.ordnum,
                sv.prt_client_id,
                sv.ordlin,
                sv.ordsln,
                sv.prtnum,
                sv.shpsts,
                sv.schbat,
                sv.pcksts,
                sv.invsts,
                max(sv.untcas) untcas,
                t.trlr_num,
                t.dispatch_dte,
                sum(d.pckqty) pckqty,
                sum(d.appqty) appqty
           from [$(ttcwmsprd)].dbo.shipping_pckwrk_view sv
          inner
           join [$(ttcwmsprd)].dbo.pckwrk_dtl d
             on sv.wrkref_dtl = d.wrkref_dtl
            and sv.wrkref = d.wrkref
            and sv.concod = d.concod
           left outer
           join [$(ttcwmsprd)].dbo.trlr t
             on sv.trlr_id = t.trlr_id
            and sv.wh_id = t.stoloc_wh_id
          where sv.shpsts <> 'B'
          group by sv.wh_id,
                sv.ordnum,
                sv.prt_client_id,
                sv.ordlin,
                sv.ordsln,
                sv.prtnum,
                sv.shpsts,
                sv.schbat,
                sv.pcksts,
                sv.invsts,
                t.trlr_num,
                t.dispatch_dte) respck
     on ol.ordnum = respck.ordnum
    and ol.wh_id = respck.wh_id
    and ol.prt_client_id = respck.prt_client_id
    and ol.ordlin = respck.ordlin
    and ol.ordsln = respck.ordsln
    and ol.prtnum = respck.prtnum
  inner
   join [$(ttcwmsprd)].dbo.dscmst
     on dscmst.colnam = 'ordtyp|wh_id'
    and dscmst.colval = o.ordtyp + '|' + o.wh_id
    and dscmst.locale_id = 'es-es'
  where /*@+o.ordnum
    and @+o.adddte
    and @+respck.schbat
    and @+ol.invsts_prg
    and @+respck.dispatch_dte
    and @+ol.prtnum
    and @+o.ordtyp
    and @+ol.pckgr1
    and @+o.cpodte
    and o.wh_id = 'TL-BOG-SIB-01'
    AND*/ o.wave_flg = 1
    and ol.ordqty > 0
  group by o.adddte,
        o.wh_id,
        o.client_id,
        o.ordnum,
        o.rmanum,
        dscmst.lngdsc,
        o.stcust,
        o.cpodte
 having sum(ol.shpqty) = 0