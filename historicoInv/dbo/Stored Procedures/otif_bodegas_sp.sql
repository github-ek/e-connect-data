CREATE PROCEDURE [dbo].[otif_bodegas_sp] AS
SET NOCOUNT ON;

TRUNCATE TABLE DBO.otif_bodegas

INSERT INTO dbo.otif_bodegas (adddte, client_id, ordnum, rmanum, invsts_prg, lin_ord, cnt_ord, cnt_env,
cnt_prg, cnt_stg, peso, cajas, schbat, trlr_num, cpodate, dispatch_date, ordtyp, stcust, wh_id)
select o.adddte,
        o.client_id,
        o.ordnum,
        o.rmanum,
        ol.invsts_prg,
        count(ol.ordlin) lin_ord,
        sum(ol.ordqty) cnt_ord,
        sum(ol.shpqty) cnt_env,
        sum(respck.pckqty) cnt_prg,
        sum(respck.appqty) cnt_stg,
        sum(pd.grswgt*respck.appqty) peso,
        round(sum(cast(respck.pckqty as dec) / cast(respck.untcas as dec)), 2) cajas,
        respck.schbat,
        respck.trlr_num,
        o.cpodte,
        respck.dispatch_dte,
        o.ordtyp,
        o.stcust,
        o.wh_id
   from [$(ttcwmsprd)].dbo.ord o
  inner
   join [$(ttcwmsprd)].dbo.ord_line ol
     on o.wh_id = ol.wh_id
    and o.client_id = ol.client_id
    and o.ordnum = ol.ordnum
  inner
   join [$(ttcwmsprd)].dbo.prtftp p
     on p.wh_id = ol.wh_id
    and p.prt_client_id = ol.prt_client_id
    and p.prtnum = ol.prtnum
  inner
   join [$(ttcwmsprd)].dbo.prtftp_dtl pd
     on pd.wh_id = p.wh_id
    and pd.prt_client_id = p.prt_client_id
    and pd.prtnum = p.prtnum
    and pd.ftpcod = p.ftpcod
   left outer
   join (select sv.wh_id,
                sv.ordnum,
                sv.prt_client_id,
                sv.ordlin,
                sv.ordsln,
                sv.prtnum,
                sv.shpsts,
                sv.schbat,
                sv.invsts,
                sv.untcas,
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
          --where sv.shpsts <> 'B'
          group by sv.wh_id,
                sv.ordnum,
                sv.prt_client_id,
                sv.ordlin,
                sv.ordsln,
                sv.prtnum,
                sv.shpsts,
                sv.schbat,
                sv.invsts,
                sv.untcas,
                t.trlr_num,
                t.dispatch_dte) respck
     on ol.ordnum = respck.ordnum
    and ol.wh_id = respck.wh_id
    and ol.prt_client_id = respck.prt_client_id
    and ol.ordlin = respck.ordlin
    and ol.ordsln = respck.ordsln
    and ol.prtnum = respck.prtnum
    /*and o.adddte between to_date('20170601012000', 'YYYYMMDDHH24MISS')
    and to_date('20170809230000', 'YYYYMMDDHH24MISS')*/
  where /*@+o.ordnum
    and @+o.adddte
    and @+respck.schbat
    and @+ol.invsts_prg
    and @+respck.dispatch_dte
    and @+ol.prtnum
    and @+o.ordtyp
    and @+ol.pckgr1
    and @+ol.pckgr2
    and @+ol.pckgr3
    and @+ol.pckgr4
    and @+o.cpodte
    and */p.defftp_flg = 1
    and pd.uomlvl = 0
  group by o.adddte,
        o.wh_id,
        o.client_id,
        o.ordnum,
        o.rmanum,
        o.ordtyp,
        ol.invsts_prg,
        respck.schbat,
        respck.trlr_num,
        o.stcust,
        o.cpodte,
        respck.dispatch_dte