create view dbo.pndinv_view as 
(select invdtl.prtnum, invdtl.prt_client_id,
    invdtl.orgcod, invdtl.revlvl, invdtl.lotnum, invdtl.sup_lotnum,
    invdtl.inv_attr_str1, invdtl.inv_attr_str2,
    invdtl.inv_attr_str3, invdtl.inv_attr_str4,
    invdtl.inv_attr_str5, invdtl.inv_attr_str6,
    invdtl.inv_attr_str7, invdtl.inv_attr_str8,
    invdtl.inv_attr_str9, invdtl.inv_attr_str10,
    invdtl.inv_attr_str11, invdtl.inv_attr_str12,
    invdtl.inv_attr_str13, invdtl.inv_attr_str14,
    invdtl.inv_attr_str15, invdtl.inv_attr_str16,
    invdtl.inv_attr_str17, invdtl.inv_attr_str18,
    invdtl.inv_attr_int1, invdtl.inv_attr_int2,
    invdtl.inv_attr_int3, invdtl.inv_attr_int4,
    invdtl.inv_attr_int5, invdtl.inv_attr_flt1,
    invdtl.inv_attr_flt2, invdtl.inv_attr_flt3,
    invdtl.inv_attr_dte1, invdtl.inv_attr_dte2,
    invdtl.invsts, invdtl.untcas, invdtl.untpak, invdtl.untqty,
    invdtl.ftpcod, invsub.phyflg, invsub.idmflg, invdtl.wrkref, 
    invdtl.rcvkey, invdtl.ship_line_id, invdtl.fifdte, invdtl.mandte,
    invdtl.dtlnum, invsub.subnum, invlod.lodnum,
    invlod.stoloc, invmov.stoloc pndloc, invmov.seqnum, invdtl.adddte,
    locmst.arecod nxtare, invmov.lodlvl, locmst.wh_id,
    invlod.asset_typ, invdtl.distro_id, invdtl.expire_dte,
    invdtl.rttn_id
  from invdtl, invsub, locmst, invlod, invmov
 where invlod.lodnum = invmov.lodnum
   and invmov.lodlvl = N'L'
   and locmst.stoloc = invmov.stoloc
   and locmst.wh_id  = invmov.wh_id
   and invsub.lodnum = invlod.lodnum
   and invdtl.subnum = invsub.subnum
 union all
  select invdtl.prtnum, invdtl.prt_client_id,
     invdtl.orgcod, invdtl.revlvl, invdtl.lotnum, invdtl.sup_lotnum,
     invdtl.inv_attr_str1, invdtl.inv_attr_str2,
     invdtl.inv_attr_str3, invdtl.inv_attr_str4,
     invdtl.inv_attr_str5, invdtl.inv_attr_str6,
     invdtl.inv_attr_str7, invdtl.inv_attr_str8,
     invdtl.inv_attr_str9, invdtl.inv_attr_str10,
     invdtl.inv_attr_str11, invdtl.inv_attr_str12,
     invdtl.inv_attr_str13, invdtl.inv_attr_str14,
     invdtl.inv_attr_str15, invdtl.inv_attr_str16,
     invdtl.inv_attr_str17, invdtl.inv_attr_str18,
     invdtl.inv_attr_int1, invdtl.inv_attr_int2,
     invdtl.inv_attr_int3, invdtl.inv_attr_int4,
     invdtl.inv_attr_int5, invdtl.inv_attr_flt1,
     invdtl.inv_attr_flt2, invdtl.inv_attr_flt3,
     invdtl.inv_attr_dte1, invdtl.inv_attr_dte2,
     invdtl.invsts, invdtl.untcas, invdtl.untpak, invdtl.untqty,
     invdtl.ftpcod, invsub.phyflg, invsub.idmflg, invdtl.wrkref, 
     invdtl.rcvkey, invdtl.ship_line_id, invdtl.fifdte, invdtl.mandte,
     invdtl.dtlnum, invsub.subnum, invlod.lodnum, 
     invlod.stoloc, invmov.stoloc pndloc, invmov.seqnum, invdtl.adddte,
     locmst.arecod nxtare, invmov.lodlvl, locmst.wh_id,
    cast(NULL as char) asset_typ, invdtl.distro_id, invdtl.expire_dte,
    invdtl.rttn_id
    from invdtl, locmst, invlod, invsub, invmov
   where invsub.subnum = invmov.lodnum
     and invmov.lodlvl = N'S'
     and locmst.stoloc = invmov.stoloc
     and locmst.wh_id  = invmov.wh_id
     and invsub.lodnum = invlod.lodnum
     and invdtl.subnum = invsub.subnum
 union all
  select invdtl.prtnum, invdtl.prt_client_id,
     invdtl.orgcod, invdtl.revlvl, invdtl.lotnum, invdtl.sup_lotnum,
     invdtl.inv_attr_str1, invdtl.inv_attr_str2,
     invdtl.inv_attr_str3, invdtl.inv_attr_str4,
     invdtl.inv_attr_str5, invdtl.inv_attr_str6,
     invdtl.inv_attr_str7, invdtl.inv_attr_str8,
     invdtl.inv_attr_str9, invdtl.inv_attr_str10,
     invdtl.inv_attr_str11, invdtl.inv_attr_str12,
     invdtl.inv_attr_str13, invdtl.inv_attr_str14,
     invdtl.inv_attr_str15, invdtl.inv_attr_str16,
     invdtl.inv_attr_str17, invdtl.inv_attr_str18,
     invdtl.inv_attr_int1, invdtl.inv_attr_int2,
     invdtl.inv_attr_int3, invdtl.inv_attr_int4,
     invdtl.inv_attr_int5, invdtl.inv_attr_flt1,
     invdtl.inv_attr_flt2, invdtl.inv_attr_flt3,
     invdtl.inv_attr_dte1, invdtl.inv_attr_dte2,
     invdtl.invsts, invdtl.untcas, invdtl.untpak, invdtl.untqty,
     invdtl.ftpcod, invsub.phyflg, invsub.idmflg, invdtl.wrkref, 
     invdtl.rcvkey, invdtl.ship_line_id, invdtl.fifdte, invdtl.mandte,
     invdtl.dtlnum, invsub.subnum, invlod.lodnum, 
     invlod.stoloc, invmov.stoloc pndloc, invmov.seqnum, invdtl.adddte,
     locmst.arecod nxtare, invmov.lodlvl, locmst.wh_id,
    cast(NULL as char) asset_typ, invdtl.distro_id, invdtl.expire_dte,
    invdtl.rttn_id
    from locmst, invlod, invsub, invdtl,  invmov
   where invdtl.dtlnum = invmov.lodnum
     and invmov.lodlvl = N'D'
     and invmov.stoloc = locmst.stoloc
     and invmov.wh_id  = locmst.wh_id
     and invsub.lodnum = invlod.lodnum
     and invdtl.subnum = invsub.subnum)