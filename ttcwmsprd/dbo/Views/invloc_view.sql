create view dbo.invloc_view as 
  (select lm.wh_id, lm.arecod, il.stoloc, id.prtnum, id.prt_client_id,
          id.orgcod, id.revlvl, id.lotnum, id.sup_lotnum, id.mandte,
          id.expire_dte, id.inv_attr_str1, id.inv_attr_str2,
          id.inv_attr_str3, id.inv_attr_str4, id.inv_attr_str5,
          id.inv_attr_str6, id.inv_attr_str7, id.inv_attr_str8,
          id.inv_attr_str9, id.inv_attr_str10, id.inv_attr_str11,
          id.inv_attr_str12, id.inv_attr_str13, id.inv_attr_str14,
          id.inv_attr_str15, id.inv_attr_str16, id.inv_attr_str17,
          id.inv_attr_str18, id.inv_attr_int1, id.inv_attr_int2,
          id.inv_attr_int3, id.inv_attr_int4, id.inv_attr_int5,
          id.inv_attr_flt1, id.inv_attr_flt2, id.inv_attr_flt3,
          id.inv_attr_dte1, id.inv_attr_dte2,
          id.invsts, id.untcas, id.untpak,
          min(id.adddte) olddte, max(id.adddte) newdte,
          sum(id.untqty) untqty, 0 comqty, 0.0 com_catch_qty,
          0 pndqty, id.rttn_id, id.alcflg
     from invdtl id, invsub ivs, invlod il, locmst lm, aremst am
    where am.pckcod != N'N'
      and am.arecod  = lm.arecod
      and am.wh_id   = lm.wh_id
      and lm.stoloc  = il.stoloc
      and lm.wh_id   = il.wh_id
      and il.lodnum  = ivs.lodnum
      and ivs.subnum = id.subnum
 group by lm.wh_id, lm.arecod, il.stoloc, id.prtnum, id.prt_client_id,
          id.orgcod, id.revlvl, id.lotnum, id.sup_lotnum, id.mandte,
          id.expire_dte, id.inv_attr_str1, id.inv_attr_str2,
          id.inv_attr_str3, id.inv_attr_str4, id.inv_attr_str5,
          id.inv_attr_str6, id.inv_attr_str7, id.inv_attr_str8,
          id.inv_attr_str9, id.inv_attr_str10, id.inv_attr_str11,
          id.inv_attr_str12, id.inv_attr_str13, id.inv_attr_str14,
          id.inv_attr_str15, id.inv_attr_str16, id.inv_attr_str17,
          id.inv_attr_str18, id.inv_attr_int1, id.inv_attr_int2,
          id.inv_attr_int3, id.inv_attr_int4, id.inv_attr_int5,
          id.inv_attr_flt1, id.inv_attr_flt2, id.inv_attr_flt3,
          id.inv_attr_dte1, id.inv_attr_dte2,
          id.invsts, id.untcas, id.untpak,
          id.rttn_id, id.alcflg
   union
   select lm.wh_id, lm.arecod, pw.srcloc stoloc, pw.prtnum, pw.prt_client_id,
          coalesce(pw.orgcod, N'----'), coalesce(pw.revlvl, N'----'), coalesce(pw.lotnum, N'----'),
          pw.sup_lotnum, pw.mandte, pw.expire_dte,
          pw.inv_attr_str1, pw.inv_attr_str2, pw.inv_attr_str3,
          pw.inv_attr_str4, pw.inv_attr_str5, pw.inv_attr_str6,
          pw.inv_attr_str7, pw.inv_attr_str8, pw.inv_attr_str9,
          pw.inv_attr_str10, pw.inv_attr_str11, pw.inv_attr_str12,
          pw.inv_attr_str13, pw.inv_attr_str14, pw.inv_attr_str15,
          pw.inv_attr_str16, pw.inv_attr_str17, pw.inv_attr_str18,
          pw.inv_attr_int1, pw.inv_attr_int2, pw.inv_attr_int3,
          pw.inv_attr_int4, pw.inv_attr_int5, pw.inv_attr_flt1,
          pw.inv_attr_flt2, pw.inv_attr_flt3, pw.inv_attr_dte1,
          pw.inv_attr_dte2, pw.invsts, pw.untcas,
          pw.untpak, cast(null as datetime) olddte,
          cast(null as datetime) newdte, 0 untqty,
          sum(pw.pckqty - pw.appqty) comqty,
          sum(pw.pck_catch_qty - pw.app_catch_qty) com_catch_qty,
          0 pndqty,
          pw.rttn_id, 1 alcflg
     from locmst lm, pckwrk_hdr pw, aremst am
    where am.arecod  = lm.arecod
      and am.wh_id   = lm.wh_id
      and lm.stoloc  = pw.srcloc
      and lm.wh_id   = pw.wh_id
      and am.pckcod != N'N'
      and pw.pipflg  = 0
    group by lm.wh_id, lm.arecod, pw.srcloc, pw.prtnum, pw.prt_client_id,
             pw.orgcod, pw.revlvl, pw.lotnum, pw.sup_lotnum, pw.mandte,
             pw.expire_dte, pw.inv_attr_str1, pw.inv_attr_str2,
             pw.inv_attr_str3, pw.inv_attr_str4, pw.inv_attr_str5,
             pw.inv_attr_str6, pw.inv_attr_str7, pw.inv_attr_str8,
             pw.inv_attr_str9, pw.inv_attr_str10, pw.inv_attr_str11,
             pw.inv_attr_str12, pw.inv_attr_str13, pw.inv_attr_str14,
             pw.inv_attr_str15, pw.inv_attr_str16, pw.inv_attr_str17,
             pw.inv_attr_str18, pw.inv_attr_int1, pw.inv_attr_int2,
             pw.inv_attr_int3, pw.inv_attr_int4, pw.inv_attr_int5,
             pw.inv_attr_flt1, pw.inv_attr_flt2, pw.inv_attr_flt3,
             pw.inv_attr_dte1, pw.inv_attr_dte2, pw.invsts, pw.untcas,
             pw.untpak, pw.rttn_id
   union
   select lm.wh_id, lm.arecod, pd.dstloc stoloc, ph.prtnum, ph.prt_client_id,
          coalesce(ph.orgcod, N'----'), coalesce(ph.revlvl, N'----'), coalesce(ph.lotnum, N'----'),
          ph.sup_lotnum, ph.mandte, ph.expire_dte,
          ph.inv_attr_str1, ph.inv_attr_str2, ph.inv_attr_str3,
          ph.inv_attr_str4, ph.inv_attr_str5, ph.inv_attr_str6,
          ph.inv_attr_str7, ph.inv_attr_str8, ph.inv_attr_str9,
          ph.inv_attr_str10, ph.inv_attr_str11, ph.inv_attr_str12,
          ph.inv_attr_str13, ph.inv_attr_str14, ph.inv_attr_str15,
          ph.inv_attr_str16, ph.inv_attr_str17, ph.inv_attr_str18,
          ph.inv_attr_int1, ph.inv_attr_int2, ph.inv_attr_int3,
          ph.inv_attr_int4, ph.inv_attr_int5, ph.inv_attr_flt1,
          ph.inv_attr_flt2, ph.inv_attr_flt3, ph.inv_attr_dte1,
          ph.inv_attr_dte2, ph.invsts, ph.untcas,
          ph.untpak, cast(null as datetime) olddte,
          cast(null as datetime) newdte, 0 untqty,
          0 comqty,
          0 com_catch_qty,
          sum(ph.pckqty - ph.appqty) pndqty,
          ph.rttn_id, 1 alcflg
     from locmst lm, pckwrk_hdr ph, pckwrk_dtl pd, aremst am
    where ph.wrkref  = pd.wrkref
      and ph.wh_id   = pd.wh_id
      and am.arecod  = lm.arecod
      and am.wh_id   = lm.wh_id
      and lm.stoloc  = pd.dstloc
      and lm.wh_id   = ph.wh_id
      and am.pckcod != N'N'
      and ph.pipflg  = 0
      and ph.wrktyp in ( N'D', N'E', N'T', N'G', N'M')
    group by lm.wh_id, lm.arecod, pd.dstloc, ph.prtnum, ph.prt_client_id,
             ph.orgcod, ph.revlvl, ph.lotnum, ph.sup_lotnum, ph.mandte,
             ph.expire_dte, ph.inv_attr_str1, ph.inv_attr_str2,
             ph.inv_attr_str3, ph.inv_attr_str4, ph.inv_attr_str5,
             ph.inv_attr_str6, ph.inv_attr_str7, ph.inv_attr_str8,
             ph.inv_attr_str9, ph.inv_attr_str10, ph.inv_attr_str11,
             ph.inv_attr_str12, ph.inv_attr_str13, ph.inv_attr_str14,
             ph.inv_attr_str15, ph.inv_attr_str16, ph.inv_attr_str17,
             ph.inv_attr_str18, ph.inv_attr_int1, ph.inv_attr_int2,
             ph.inv_attr_int3, ph.inv_attr_int4, ph.inv_attr_int5,
             ph.inv_attr_flt1, ph.inv_attr_flt2, ph.inv_attr_flt3,
             ph.inv_attr_dte1, ph.inv_attr_dte2, ph.invsts, ph.untcas,
             ph.untpak, ph.rttn_id
   union
   select wh_id, nxtare arecod, pndloc stoloc, prtnum, prt_client_id,
          orgcod, revlvl, lotnum, sup_lotnum, mandte, expire_dte,
          inv_attr_str1, inv_attr_str2,
          inv_attr_str3, inv_attr_str4, inv_attr_str5,
          inv_attr_str6, inv_attr_str7, inv_attr_str8,
          inv_attr_str9, inv_attr_str10, inv_attr_str11,
          inv_attr_str12, inv_attr_str13, inv_attr_str14,
          inv_attr_str15, inv_attr_str16, inv_attr_str17,
          inv_attr_str18, inv_attr_int1, inv_attr_int2,
          inv_attr_int3, inv_attr_int4, inv_attr_int5,
          inv_attr_flt1, inv_attr_flt2, inv_attr_flt3,
          inv_attr_dte1, inv_attr_dte2, invsts, untcas,
          untpak, cast(null as datetime) olddte,
          cast(null as datetime) newdte, 0 untqty,
          0 comqty,
          0.0 com_catch_qty,
          sum(untqty) pndqty,
          rttn_id, 1 alcflg
     from pndinv_view
    group by wh_id, nxtare, pndloc, prtnum,
             prt_client_id, orgcod, revlvl, lotnum,
             sup_lotnum, mandte, expire_dte,
             inv_attr_str1, inv_attr_str2, inv_attr_str3,
             inv_attr_str4, inv_attr_str5, inv_attr_str6,
             inv_attr_str7, inv_attr_str8, inv_attr_str9,
             inv_attr_str10,inv_attr_str11,inv_attr_str12,
             inv_attr_str13,inv_attr_str14,inv_attr_str15,
             inv_attr_str16,inv_attr_str17,inv_attr_str18,
             inv_attr_int1, inv_attr_int2, inv_attr_int3,
             inv_attr_int4, inv_attr_int5, inv_attr_flt1,
             inv_attr_flt2, inv_attr_flt3, inv_attr_dte1,
             inv_attr_dte2, invsts, untpak, untcas,
             rttn_id)