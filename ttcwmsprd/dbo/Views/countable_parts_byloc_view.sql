create view dbo.countable_parts_byloc_view as 
  select distinct prtmst_view.abccod, prtmst_wh.numcnt, prtmst_view.prtnum, 
                  prtmst_view.prt_client_id,
	          invsum.arecod, invsum.stoloc, invsum.wh_id
    from aremst, prtmst_wh, prtmst_view, invsum
   where invsum.prtnum = prtmst_view.prtnum
     and invsum.prt_client_id = prtmst_view.prt_client_id
     and aremst.cntflg = 1
     and prtmst_view.prdflg = 1
     and prtmst_wh.prtnum = prtmst_view.prtnum
     and prtmst_wh.prt_client_id = prtmst_view.prt_client_id
     and prtmst_wh.wh_id = prtmst_view.wh_id
     and aremst.arecod = invsum.arecod
     and aremst.wh_id = invsum.wh_id
     and aremst.wh_id = prtmst_view.wh_id
union
  select distinct prtmst_view.abccod, prtmst_wh.numcnt, prtmst_view.prtnum,
                  prtmst_view.prt_client_id,
	          locmst.arecod, locmst.stoloc, locmst.wh_id
    from invdtl, prtmst_wh, prtmst_view, invsub, invlod, locmst, aremst
   where aremst.cntflg = 1
     and aremst.pckcod = N'0'
     and prtmst_view.prdflg = 1
     and aremst.arecod = locmst.arecod
     and aremst.wh_id  = locmst.wh_id 
     and locmst.stoloc = invlod.stoloc
     and locmst.wh_id  = invlod.wh_id
     and prtmst_view.wh_id  = invlod.wh_id
     and prtmst_wh.prtnum = prtmst_view.prtnum
     and prtmst_wh.prt_client_id = prtmst_view.prt_client_id
     and prtmst_wh.wh_id = prtmst_view.wh_id
     and invlod.lodnum = invsub.lodnum
     and invsub.subnum = invdtl.subnum
     and invdtl.prtnum = prtmst_view.prtnum
     and invdtl.prt_client_id = prtmst_view.prt_client_id