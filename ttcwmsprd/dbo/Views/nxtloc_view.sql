create view dbo.nxtloc_view as 
     select invdtl.prtnum, invdtl.prt_client_id,
            invdtl.lotnum, invdtl.sup_lotnum, invdtl.orgcod, invdtl.revlvl,
            invdtl.invsts, invdtl.untcas, invdtl.untpak, invdtl.untqty,
            invdtl.ftpcod, invsub.phyflg, invdtl.phdflg, invdtl.wrkref,
            invdtl.rcvkey, invdtl.ship_line_id, invdtl.fifdte, invdtl.mandte,
            invdtl.dtlnum, invsub.subnum, invlod.lodnum,
            invlod.stoloc, invmov.lodlvl, invmov.stoloc pndloc, invmov.seqnum,
            invdtl.adddte, locmst.arecod nxtare, locmst.wh_id
       from invdtl, invsub, locmst, invlod, invmov
      where invmov.lodnum in (invlod.lodnum, invsub.subnum, invdtl.dtlnum)
        and locmst.stoloc = invmov.stoloc
        and locmst.wh_id = invmov.wh_id
        and invsub.lodnum = invlod.lodnum
        and invdtl.subnum = invsub.subnum
        and invmov.seqnum = (select min(im.seqnum)
                               from invmov im
                              where im.lodnum = invmov.lodnum
                                and im.lodlvl = invmov.lodlvl)