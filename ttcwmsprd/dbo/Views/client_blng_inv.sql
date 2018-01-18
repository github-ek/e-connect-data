create view dbo.client_blng_inv as 
select l.arecod arecod, a.fwiflg fwiflg, a.expflg expflg, a.stgflg stgflg,
       a.rnwl_sto_flg,
       a.shpflg shpflg, a.wipflg wipflg, a.bldg_id bldg_id, l.stoloc stoloc,
       l.loclen loclen, l.locwid locwid, l.lochgt lochgt, l.wh_id wh_id,
       d.prtnum prtnum, coalesce(p.prtfam, N'----') prtfam,
       d.prt_client_id prt_client_id, 
       d.orgcod orgcod, d.revlvl revlvl,
       d.lotnum lotnum, d.sup_lotnum sup_lotnum,
       d.inv_attr_str1, d.inv_attr_str2,
       d.inv_attr_str3, d.inv_attr_str4,
       d.inv_attr_str5, d.inv_attr_str6,
       d.inv_attr_str7, d.inv_attr_str8,
       d.inv_attr_str9, d.inv_attr_str10,
       d.inv_attr_str11, d.inv_attr_str12,
       d.inv_attr_str13, d.inv_attr_str14,
       d.inv_attr_str15, d.inv_attr_str16,
       d.inv_attr_str17, d.inv_attr_str18,
       d.inv_attr_int1, d.inv_attr_int2,
       d.inv_attr_int3, d.inv_attr_int4,
       d.inv_attr_int5, d.inv_attr_flt1,
       d.inv_attr_flt2, d.inv_attr_flt3,
       d.inv_attr_dte1, d.inv_attr_dte2,
       d.untpak untpak, d.untcas untcas,
       pd_pal.untqty untpal, pd_cas.grswgt untwgt, sum(d.untqty) untqty,
       sum(d.catch_qty) catch_qty
from   locmst l,
       aremst a,
       invdtl d,
       prtmst_view p,
       prtftp_dtl pd_cas,
       prtftp_dtl pd_pal,
       invsub s,
       invlod i
where  l.stoloc = i.stoloc
and    l.wh_id  = i.wh_id
and    l.arecod = a.arecod
and    l.wh_id  = a.wh_id
and    l.wh_id  = p.wh_id
and    s.lodnum = i.lodnum
and    s.subnum = d.subnum
and    d.prtnum = p.prtnum
and    d.prt_client_id = p.prt_client_id
and    pd_cas.prtnum = d.prtnum
and    pd_cas.prt_client_id = d.prt_client_id
and    pd_cas.wh_id = p.wh_id
and    pd_cas.ftpcod = d.ftpcod
and    pd_cas.cas_flg = 1
and    pd_pal.prtnum = d.prtnum
and    pd_pal.prt_client_id = d.prt_client_id
and    pd_pal.wh_id = p.wh_id
and    pd_pal.ftpcod = d.ftpcod
and    pd_pal.pal_flg = 1
group by l.arecod, a.fwiflg, a.expflg, a.stgflg, 
         a.rnwl_sto_flg,
         a.shpflg, a.wipflg, a.bldg_id,
         l.stoloc, l.loclen, l.locwid, l.lochgt, l.wh_id, d.prtnum, p.prtfam,
         d.prt_client_id,
         d.orgcod, d.revlvl, d.lotnum, d.sup_lotnum,
         d.inv_attr_str1, d.inv_attr_str2,
         d.inv_attr_str3, d.inv_attr_str4,
         d.inv_attr_str5, d.inv_attr_str6,
         d.inv_attr_str7, d.inv_attr_str8,
         d.inv_attr_str9, d.inv_attr_str10,
         d.inv_attr_str11, d.inv_attr_str12,
         d.inv_attr_str13, d.inv_attr_str14,
         d.inv_attr_str15, d.inv_attr_str16,
         d.inv_attr_str17, d.inv_attr_str18,
         d.inv_attr_int1, d.inv_attr_int2,
         d.inv_attr_int3, d.inv_attr_int4,
         d.inv_attr_int5, d.inv_attr_flt1,
         d.inv_attr_flt2, d.inv_attr_flt3,
         d.inv_attr_dte1, d.inv_attr_dte2,
         d.untpak, d.untcas, 
         pd_pal.untqty, pd_cas.grswgt