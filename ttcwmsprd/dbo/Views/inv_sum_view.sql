create view dbo.inv_sum_view as 
(select lm.wh_id, lm.arecod, il.stoloc, id.prtnum, id.prt_client_id,
        id.orgcod, id.revlvl, id.lotnum, id.sup_lotnum,
        id.inv_attr_str1, id.inv_attr_str2, id.inv_attr_str3,
        id.inv_attr_str4, id.inv_attr_str5, id.inv_attr_str6,
        id.inv_attr_str7, id.inv_attr_str8, id.inv_attr_str9,
        id.inv_attr_str10,id.inv_attr_str11,id.inv_attr_str12,
        id.inv_attr_str13,id.inv_attr_str14,id.inv_attr_str15,
        id.inv_attr_str16,id.inv_attr_str17,id.inv_attr_str18,
        id.inv_attr_int1, id.inv_attr_int2,
        id.inv_attr_int3, id.inv_attr_int4, id.inv_attr_int5,
        id.inv_attr_flt1, id.inv_attr_flt2, id.inv_attr_flt3,
        id.inv_attr_dte1, id.inv_attr_dte2,
        id.invsts, id.untcas, id.untpak,
        min(id.adddte) olddte, max(id.adddte) newdte,
        sum(id.untqty) untqty, 0 comqty, 0 pndqty,
        id.rttn_id 
   from invdtl id, invsub ivs, invlod il, locmst lm, aremst am
  where am.pckcod != N'N' 
    and am.arecod = lm.arecod
    and am.wh_id  = lm.wh_id
    and lm.stoloc = il.stoloc
    and lm.wh_id  = il.wh_id
    and il.lodnum = ivs.lodnum 
    and ivs.subnum = id.subnum
  group by lm.wh_id, lm.arecod, il.stoloc, il.lodnum, 
           id.prtnum, id.prt_client_id,
           id.orgcod, id.revlvl, id.lotnum, id.sup_lotnum,
           id.inv_attr_str1, id.inv_attr_str2, id.inv_attr_str3,
           id.inv_attr_str4, id.inv_attr_str5, id.inv_attr_str6,
           id.inv_attr_str7, id.inv_attr_str8, id.inv_attr_str9,
           id.inv_attr_str10, id.inv_attr_str11, id.inv_attr_str12, 
           id.inv_attr_str13, id.inv_attr_str14, id.inv_attr_str15, 
           id.inv_attr_str16, id.inv_attr_str17, id.inv_attr_str18, 
           id.inv_attr_int1, id.inv_attr_int2, id.inv_attr_int3,
           id.inv_attr_int4, id.inv_attr_int5, id.inv_attr_flt1,
           id.inv_attr_flt2, id.inv_attr_flt3, id.inv_attr_dte1, 
           id.inv_attr_dte2, id.invsts, id.untcas, id.untpak,
           id.rttn_id)