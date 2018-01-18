create view dbo.com_inv_sum_view as 
  select lm.wh_id, lm.arecod, pw.srcloc, pw.prtnum, pw.prt_client_id,
          pw.orgcod, pw.revlvl, pw.lotnum, pw.invsts,
          pw.inv_attr_str1, pw.inv_attr_str2,pw.inv_attr_str3,
          pw.inv_attr_str4, pw.inv_attr_str5, pw.inv_attr_str6,
          pw.inv_attr_str7, pw.inv_attr_str8, pw.inv_attr_str9,
          pw.inv_attr_str10, pw.inv_attr_str11, pw.inv_attr_str12,
          pw.inv_attr_str13, pw.inv_attr_str14, pw.inv_attr_str15,
          pw.inv_attr_str16, pw.inv_attr_str17, pw.inv_attr_str18,
          pw.inv_attr_int1, pw.inv_attr_int2,
          pw.inv_attr_int3, pw.inv_attr_int4, pw.inv_attr_int5,
          pw.inv_attr_flt1, pw.inv_attr_flt2, pw.inv_attr_flt3,
          pw.inv_attr_dte1, pw.inv_attr_dte2,
          pw.untcas, pw.untpak,
          cast(null as datetime) olddte, cast(null as datetime) newdte, 0 untqty,
          sum(pw.pckqty - pw.appqty) comqty, 0 pndqty,
          pw.rttn_id
     from locmst lm, pckwrk_hdr pw, aremst am 
    where am.pckcod != N'N'
      and am.arecod = lm.arecod
      and am.wh_id  = lm.wh_id
      and lm.stoloc = pw.srcloc
      and lm.wh_id  = pw.wh_id
    group by lm.wh_id, lm.arecod, pw.srcloc, pw.prtnum, pw.prt_client_id,
             pw.orgcod, pw.revlvl, pw.lotnum, pw.invsts,
             pw.untcas, pw.untpak, pw.inv_attr_str1, pw.inv_attr_str2,
             pw.inv_attr_str3, pw.inv_attr_str4, pw.inv_attr_str5,
             pw.inv_attr_str6, pw.inv_attr_str7, pw.inv_attr_str8,
             pw.inv_attr_str9, pw.inv_attr_str10, pw.inv_attr_str11,
             pw.inv_attr_str12, pw.inv_attr_str13, pw.inv_attr_str14,
             pw.inv_attr_str15, pw.inv_attr_str16, pw.inv_attr_str17,
             pw.inv_attr_str18, pw.inv_attr_int1, pw.inv_attr_int2,
             pw.inv_attr_int3, pw.inv_attr_int4, pw.inv_attr_int5,
             pw.inv_attr_flt1, pw.inv_attr_flt2, pw.inv_attr_flt3,
             pw.inv_attr_dte1, pw.inv_attr_dte2, pw.rttn_id