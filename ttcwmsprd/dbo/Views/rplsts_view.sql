create view dbo.rplsts_view as 
  select rplwrk.parref,
         rplwrk.rplref,
         shipment_line.ship_id,
         rplwrk.ship_line_id,
         shipment_line.ordnum,
         shipment_line.ordlin,
         cast(null as nvarchar(20) ) wkonum,
         shipment_line.client_id,
         shipment_line.wh_id,
         cast(null as nvarchar(10) ) wkorev,
         cast(null as nvarchar(10) ) wkolin,
         rplwrk.rplsts,
         rplwrk.prtnum,
         rplwrk.prt_client_id,
         rplwrk.rule_nam,
         rplwrk.supnum,
         rplwrk.alcqty,
         rplwrk.pckqty,
	 rplwrk.untcas,
	 rplwrk.splflg,
         rplwrk.dstare,
         rplwrk.dstloc,
         rplwrk.rplmsg,
         rplwrk.schbat,
         rplwrk.alcdte,
         rplwrk.rplcnt,
         rplwrk.ftpcod,
         ord_line.parflg,
         stop.car_move_id,
         cast(null as nvarchar(25) ) revlvl
    from shipment_line, 
         ord_line,
         rplwrk,
         shipment left outer join stop
         on (shipment.stop_id = stop.stop_id)
   where rplwrk.ship_line_id is not null
     and shipment_line.ship_line_id = rplwrk.ship_line_id
     and shipment_line.client_id = ord_line.client_id
     and shipment_line.ordnum = ord_line.ordnum
     and shipment_line.ordlin = ord_line.ordlin
     and shipment_line.ordsln = ord_line.ordsln
     and shipment_line.wh_id  = ord_line.wh_id
     and shipment_line.ship_id = shipment.ship_id
UNION
  select rplwrk.parref,
         rplwrk.rplref,
         cast(null as nvarchar(30) ) ship_id,
         cast(null as nvarchar(10) ) ship_line_id,
         cast(null as nvarchar(35) ) ordnum,
         cast(null as nvarchar(10) ) ordlin,
         wkodtl.wkonum,
         wkodtl.client_id,
         wkodtl.wh_id,
         wkodtl.wkorev,
         wkodtl.wkolin,
         rplwrk.rplsts,
         rplwrk.prtnum,
         rplwrk.prt_client_id,
         rplwrk.rule_nam,
         rplwrk.supnum,
         rplwrk.alcqty,
         rplwrk.pckqty,
	 rplwrk.untcas,
	 rplwrk.splflg,
         rplwrk.dstare,
         rplwrk.dstloc,
         rplwrk.rplmsg,
         rplwrk.schbat,
         rplwrk.alcdte,
         rplwrk.rplcnt,
         rplwrk.ftpcod,
         0 parflg,
         cast(null as nvarchar(10) ) car_move_id,
         wkodtl.revlvl
    from wkodtl, rplwrk
   where rplwrk.wkonum is not null
     and rplwrk.client_id is not null
     and rplwrk.ship_line_id is null
     and rplwrk.wkorev is not null
     and rplwrk.wkonum    = wkodtl.wkonum
     and rplwrk.client_id = wkodtl.client_id
     and rplwrk.wkorev    = wkodtl.wkorev
     and rplwrk.wkolin    = wkodtl.wkolin
     and rplwrk.wh_id     = wkodtl.wh_id
UNION
  select rplwrk.parref,
         rplwrk.rplref,
         cast(null as nvarchar(30) ) ship_id,
         cast(null as nvarchar(10) ) ship_line_id,
         cast(null as nvarchar(35) ) ordnum,
         cast(null as nvarchar(10) ) ordlin,
         wkohdr.wkonum,
         wkohdr.client_id,
         wkohdr.wh_id,
         wkohdr.wkorev,
         cast(null as nvarchar(10) ) wkolin,
         rplwrk.rplsts,
         rplwrk.prtnum,
         rplwrk.prt_client_id,
         rplwrk.rule_nam,
         rplwrk.supnum,
         rplwrk.alcqty,
         rplwrk.pckqty,
	 rplwrk.untcas,
	 rplwrk.splflg,
         rplwrk.dstare,
         rplwrk.dstloc,
         rplwrk.rplmsg,
         rplwrk.schbat,
         rplwrk.alcdte,
         rplwrk.rplcnt,
         rplwrk.ftpcod,
         0 parflg,
         cast(null as nvarchar(10) ) car_move_id,
         wkohdr.revlvl
    from wkohdr, rplwrk
   where rplwrk.wkonum is not null
     and rplwrk.client_id is not null
     and rplwrk.ship_line_id is null
     and rplwrk.wkorev is not null
     and rplwrk.wkolin is null
     and rplwrk.wkonum    = wkohdr.wkonum
     and rplwrk.client_id = wkohdr.client_id
     and rplwrk.wkorev    = wkohdr.wkorev
     and rplwrk.wh_id     = wkohdr.wh_id