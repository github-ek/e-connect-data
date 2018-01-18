create view dbo.inventory_pckwrk_view as 
(select inv.*,
            ph.wrktyp, ph.schbat, ph.srcloc, pd.dstloc, ph.srcare,
            pd.dstare, pd.ship_id, pd.client_id,
            pd.ordnum, pd.ordlin, pd.ordsln, pd.stcust, pd.rtcust,
            pd.concod, pd.cmbcod, ph.lblbat, ph.lblseq, ph.devcod,
            ph.pckqty, ph.appqty, ph.pcksts, ph.ftpcod, ph.ctncod,
            ph.ctnnum, ph.ctnseg, pd.ship_ctncod, pd.ship_ctnnum,
            ph.visflg, ph.splflg, ph.locflg, ph.lodflg, ph.subflg,
            ph.dtlflg, ph.prtflg, ph.orgflg, ph.revflg, ph.lotflg,
            ph.qtyflg, ph.catch_qty_flg, pd.wkonum, pd.wkorev, pd.wkolin,
            ph.ackdevcod, pd.cur_cas, pd.tot_cas_cnt, ph.pipflg, ph.frsflg,
            ph.min_shelf_hrs, ph.prtdte, ph.clst_seq, pd_stk.len untlen,
            pd_stk.wid untwid, pd_stk.hgt unthgt, pd_pak.len paklen, pd_pak.wid pakwid, pd_pak.hgt pakhgt,
            pd_cas.len caslen, pd_cas.wid caswid, pd_cas.hgt cashgt, pf.caslvl, pf.nstlen,
            pf.nstwid, pf.nsthgt
    from
          (select il.lodnum, il.wh_id, il.stoloc, il.lodwgt, il.prmflg, il.unkflg,
                      il.mvlflg, il.adddte, il.lstmov, il.lstdte, il.lstcod,
                      il.lst_usr_id, il.loducc, il.uccdte, il.palpos,
                      ib.subnum, ib.subwgt, ib.phyflg, ib.mvsflg,
                      ib.ctnflg, ib.idmflg, id.wrkref, ib.tagdev,  ib.subucc,
                      id.dtlnum, id.phdflg, id.prtnum, id.prt_client_id,
                      id.orgcod, id.revlvl,  id.lotnum, id.invsts,
                      id.age_pflnam, id.fifdte, id.mandte, id.expire_dte,
                      id.untqty, id.untcas, id.untpak, id.rcvkey,
                      id.ship_line_id, id.rcvdte, id.cmpkey,
                      id.alcflg, id.catch_qty, id.wrkref_dtl
             from  invdtl id,
                       invsub ib,
                       invlod il
           where ib.subnum = id.subnum
               and il.lodnum = ib.lodnum) inv
           left outer join pckwrk_hdr ph on ph.wrkref = inv.wrkref
           left outer join pckwrk_dtl pd on pd.wrkref = inv.wrkref
            and pd.wrkref_dtl = inv.wrkref_dtl
           left outer join prtftp pf on pf.prtnum = ph.prtnum
            and pf.prt_client_id = ph.prt_client_id
            and pf.wh_id = ph.wh_id
            and pf.ftpcod = ph.ftpcod
           left outer join prtftp_dtl pd_cas
             on (pf.prtnum = pd_cas.prtnum)
            and (pf.prt_client_id = pd_cas.prt_client_id)
            and (pf.wh_id = pd_cas.wh_id)
            and (pf.ftpcod = pd_cas.ftpcod)
            and (pd_cas.cas_flg = 1)
           left outer join prtftp_dtl pd_pak
             on (pf.prtnum = pd_pak.prtnum)
            and (pf.prt_client_id = pd_pak.prt_client_id)
            and (pf.wh_id = pd_pak.wh_id)
            and (pf.ftpcod = pd_pak.ftpcod)
            and (pd_pak.pak_flg = 1)
           left outer join prtftp_dtl pd_stk
             on (pf.prtnum = pd_stk.prtnum)
            and (pf.prt_client_id = pd_stk.prt_client_id)
            and (pf.wh_id = pd_stk.wh_id)
            and (pf.ftpcod = pd_stk.ftpcod)
            and (pd_stk.stk_flg = 1))