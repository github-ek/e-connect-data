create view dbo.loclod_view as 
    select aremst.bldg_id, locmst.arecod, locmst.locsts, locmst.useflg,
           locmst.wrkzon, locmst.stoloc, locmst.wh_id, aremst.fwiflg,
           aremst.sigflg, prtmst_view.prtnum, prtmst_view.prt_client_id,
           prtmst_view.prtfam, invsub.lodnum,  invdtl.subnum, locmst.cntdte,
           locmst.lstdte, invdtl.fifdte,  invdtl.mandte, invlod.adddte,
           invlod.uccdte, prtmst_view.moddte
      from aremst join locmst 
        on (aremst.arecod = locmst.arecod)
       and (aremst.wh_id  = locmst.wh_id)
      left outer join invlod 
        on (locmst.stoloc = invlod.stoloc)
       and (locmst.wh_id = invlod.wh_id) 
      left outer join invsub 
        on (invlod.lodnum = invsub.lodnum)
      left outer join invdtl 
        on (invsub.subnum = invdtl.subnum)
      left outer join prtmst_view 
        on (invdtl.prtnum = prtmst_view.prtnum)
       and (invdtl.prt_client_id = prtmst_view.prt_client_id)
       and (invlod.wh_id = prtmst_view.wh_id)
  group by aremst.bldg_id, locmst.arecod, locmst.locsts, locmst.useflg,
           locmst.wrkzon, locmst.stoloc, locmst.wh_id, aremst.fwiflg,
           aremst.sigflg, prtmst_view.prtnum, prtmst_view.prt_client_id,
           prtmst_view.prtfam, invsub.lodnum,  invdtl.subnum, locmst.cntdte,
           locmst.lstdte, invdtl.fifdte, invdtl.mandte, invlod.adddte,
           invlod.uccdte, prtmst_view.moddte