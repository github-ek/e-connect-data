create view dbo.inv_snap_rimlin_rcvlin_view as 
       select rm.wh_id wh_id,
              rm.prtnum prtnum,
              rm.prt_client_id prt_client_id,
              sum(rm.expqty) rimlin_expqty,
              sum(rm.idnqty) rimlin_idnqty,
              0 rcvlin_rcvqty
         from rimlin rm
     group by rm.wh_id,
              rm.prtnum, 
              rm.prt_client_id
        union
       select rcvl.wh_id wh_id,
              rcvl.prtnum prtnum,
              rcvl.prt_client_id prt_client_id,
              0 rimlin_expqty,
              0 rimlin_idnqty,
              sum(rcvl.rcvqty) rcvlin_rcvqty
         from rcvlin rcvl,
              rcvinv rcvi
        where rcvl.trknum = rcvi.trknum
          and rcvl.invnum = rcvi.invnum
          and rcvl.supnum = rcvi.supnum
          and rcvl.client_id = rcvi.client_id
          and rcvl.wh_id = rcvi.wh_id
          and rcvl.wh_id+rcvl.invnum+rcvl.supnum+rcvl.invlin+rcvl.invsln in 
                          (select wh_id+invnum+supnum+invlin+invsln 
                             from rimlin)
          and rcvi.invtyp not in (select coalesce(rtstr2, N'W') invtyp
                                    from poldat_view
                                   where polcod = N'WORK-ORDER-PROCESSING'
                                     and polvar = N'MISCELLANEOUS'
                                     and polval = N'RECEIVING-DEFAULTS'
                                     and rtstr1 = N'invtyp'
                                     and wh_id = N'----')
     group by rcvl.wh_id,
              rcvl.prtnum, 
              rcvl.prt_client_id