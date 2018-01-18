create view dbo.prtftp_view as 
    select p.prtnum,
           p.prt_client_id,
           p.wh_id,
           p.ftpcod,
           coalesce(pd1.untqty, 0) untpal,
           coalesce(pd2.untqty, 0) untcas,
           coalesce(pd3.untqty, 0) untpak,
           pd1.uomcod paluom,
           pd2.uomcod casuom,
           pd3.uomcod pakuom,
           pd4.uomcod rcvuom,
           coalesce(pd2.grswgt, 0) grswgt,
           coalesce(pd2.netwgt, 0) netwgt,
           coalesce(pd1.grswgt, 0) palgrswgt,
           coalesce(pd1.netwgt, 0) palnetwgt,
           coalesce(pd5.grswgt, 0) untgrswgt,
           coalesce(pd5.netwgt, 0) untnetwgt,
           coalesce(pd1.len, 0) pallen,
           coalesce(pd1.wid, 0) palwid,
           coalesce(pd1.hgt, 0) palhgt, 
           coalesce(pd2.len, 0) caslen,
           coalesce(pd2.wid, 0) caswid,
           coalesce(pd2.hgt, 0) cashgt,           
           coalesce(pd3.len, 0) paklen,
           coalesce(pd3.wid, 0) pakwid,
           coalesce(pd3.hgt, 0) pakhgt,
           coalesce(pd5.len, 0) untlen,
           coalesce(pd5.wid, 0) untwid,
           coalesce(pd5.hgt, 0) unthgt,
           p.nstlen,
           p.nstwid,
           p.nsthgt,
           p.def_asset_typ,
           p.caslvl,
           p.pal_stck_hgt,
           p.defftp_flg,
           p.stkmtd
      from prtftp p 
      join prtftp_dtl pd1
        on (p.prtnum = pd1.prtnum)
       and (p.prt_client_id = pd1.prt_client_id)
       and (p.wh_id = pd1.wh_id)
       and (p.ftpcod = pd1.ftpcod)
       and (pd1.pal_flg = 1)
      left outer join prtftp_dtl pd2
        on (p.prtnum = pd2.prtnum)
       and (p.prt_client_id = pd2.prt_client_id)
       and (p.wh_id = pd2.wh_id)
       and (p.ftpcod = pd2.ftpcod)
       and (pd2.cas_flg = 1)
      left outer join prtftp_dtl pd3
        on (p.prtnum = pd3.prtnum)
       and (p.prt_client_id = pd3.prt_client_id)
       and (p.wh_id = pd3.wh_id)
       and (p.ftpcod = pd3.ftpcod)
       and (pd3.pak_flg = 1)
      left outer join prtftp_dtl pd4
        on (p.prtnum = pd4.prtnum)
       and (p.prt_client_id = pd4.prt_client_id)
       and (p.wh_id = pd4.wh_id)
       and (p.ftpcod = pd4.ftpcod)
       and (pd4.rcv_flg = 1)
      join prtftp_dtl pd5
        on (p.prtnum = pd5.prtnum)
       and (p.prt_client_id = pd5.prt_client_id)
       and (p.wh_id = pd5.wh_id)
       and (p.ftpcod = pd5.ftpcod)
       and (pd5.stk_flg = 1)