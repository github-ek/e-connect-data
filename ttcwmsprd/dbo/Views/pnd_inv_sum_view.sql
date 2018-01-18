create view dbo.pnd_inv_sum_view as 
   (select piv.wh_id, piv.nxtare arecod, piv.pndloc stoloc, piv.prtnum,
           piv.prt_client_id, piv.orgcod, piv.revlvl, 
           piv.lotnum,piv.inv_attr_str1, piv.inv_attr_str2,
           piv.inv_attr_str3, piv.inv_attr_str4, piv.inv_attr_str5,
           piv.inv_attr_str6,piv.inv_attr_str7, piv.inv_attr_str8,
           piv.inv_attr_str9,piv.inv_attr_str10,piv.inv_attr_str11,
           piv.inv_attr_str12,piv.inv_attr_str13,piv.inv_attr_str14,
           piv.inv_attr_str15,piv.inv_attr_str16,piv.inv_attr_str17,
           piv.inv_attr_str18, piv.inv_attr_int1, piv.inv_attr_int2,
           piv.inv_attr_int3, piv.inv_attr_int4, piv.inv_attr_int5,
           piv.inv_attr_flt1, piv.inv_attr_flt2, piv.inv_attr_flt3,
           piv.inv_attr_dte1, piv.inv_attr_dte2, piv.invsts, 
           piv.untcas, piv.untpak, 0 untqty,
           0 comqty, sum(piv.untqty) pndqty,
           piv.rttn_id
      from pndinv_view piv, aremst am 
     where am.arecod = piv.nxtare 
       and am.wh_id  = piv.wh_id
       and am.pckcod != N'N'
     group by piv.wh_id, piv.nxtare, piv.pndloc, piv.prtnum,
           piv.prt_client_id, piv.orgcod, piv.revlvl, 
           piv.lotnum, piv.inv_attr_str1, piv.inv_attr_str2,
           piv.inv_attr_str3, piv.inv_attr_str4, piv.inv_attr_str5,
           piv.inv_attr_str6,piv.inv_attr_str7, piv.inv_attr_str8,
           piv.inv_attr_str9,piv.inv_attr_str10,piv.inv_attr_str10,
           piv.inv_attr_str11,piv.inv_attr_str12,piv.inv_attr_str13,
           piv.inv_attr_str14,piv.inv_attr_str15,piv.inv_attr_str16,
           piv.inv_attr_str17,piv.inv_attr_str18,piv.inv_attr_int1,
           piv.inv_attr_int2,piv.inv_attr_int3, piv.inv_attr_int4,
           piv.inv_attr_int5,piv.inv_attr_flt1, piv.inv_attr_flt2,
           piv.inv_attr_flt3,piv.inv_attr_dte1, piv.inv_attr_dte2,
           piv.invsts, piv.untcas, piv.untpak,
           piv.rttn_id)