create view dbo.receipt_detail_view as 
    select rcvlin.rcvkey, rcvlin.trknum, rcvlin.supnum, rcvlin.wh_id, 
           coalesce(rcvlin.client_id, prtmst_view.prt_client_id) client_id,
           rcvlin.invnum, rcvinv.invtyp, rcvlin.seqnum, invdtl.prtnum,
           invdtl.invsts, invdtl.orgcod, invdtl.revlvl, invdtl.lotnum, 
           invdtl.sup_lotnum, invsub.lodnum, invsub.subnum, rcvlin.blind_flg,
           invdtl.dtlnum,
           sum(invdtl.untqty) trnqty
      from invsub join invdtl 
        on (invsub.subnum = invdtl.subnum)
      join invlod 
        on (invsub.lodnum = invlod.lodnum)
      join prtmst_view 
        on (invdtl.prt_client_id = prtmst_view.prt_client_id) 
       and (invdtl.prtnum = prtmst_view.prtnum) 
       and (invlod.wh_id = prtmst_view.wh_id)
      left outer join rcvlin 
        on (invdtl.rcvkey = rcvlin.rcvkey)
      left outer join rcvinv 
        on (rcvinv.supnum = rcvlin.supnum)
       and (rcvinv.invnum = rcvlin.invnum)
       and (rcvinv.trknum = rcvlin.trknum)
       and (rcvinv.client_id = rcvlin.client_id)
       and (rcvinv.wh_id = rcvlin.wh_id)
  group by rcvlin.rcvkey, rcvlin.trknum, rcvlin.supnum, rcvlin.wh_id,
           rcvlin.client_id, prtmst_view.prt_client_id,
           rcvlin.invnum, rcvinv.invtyp, rcvlin.seqnum, invdtl.prtnum,
           invdtl.invsts, invdtl.orgcod, invdtl.revlvl, invdtl.lotnum, 
           invdtl.sup_lotnum, invsub.lodnum, invsub.subnum, rcvlin.blind_flg,
           invdtl.dtlnum