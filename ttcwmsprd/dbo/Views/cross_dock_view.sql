create view dbo.cross_dock_view as 
	select  xdkwrk.xdktyp, xdkwrk.xdkref, shipment_line.prcpri, 
	        xdkwrk.adddte, xdkwrk.dstare, xdkwrk.dstloc, 
		xdkwrk.prt_client_id, xdkwrk.prtnum, 
		xdkwrk.invsts_prg, xdkwrk.pckqty-xdkwrk.alcqty remqty, 
		xdkwrk.xdkqty, xdkwrk.alcqty,
		xdkwrk.rule_nam, 
		xdkwrk.rplref, xdkwrk.ship_id, xdkwrk.ship_line_id, 
		xdkwrk.client_id, xdkwrk.ordnum, 
		xdkwrk.ordlin, xdkwrk.ordsln, xdkwrk.splflg,
		xdkwrk.wkonum, xdkwrk.wkorev, xdkwrk.wkolin,
		xdkwrk.untpal, xdkwrk.untcas, xdkwrk.untpak, 
		xdkwrk.stcust, xdkwrk.schbat, xdkwrk.rpqflg,
		shipment_line.ovrcod, shipment_line.ovramt,
		shipment_line.wh_id,
		ol.distro_id,
		xdkwrk.min_shelf_hrs
	from    xdkwrk join shipment_line
		         on xdkwrk.ship_line_id = shipment_line.ship_line_id
		        and shipment_line.linsts in ( N'P', N'I')
		        and xdkwrk.xdkqty < xdkwrk.pckqty
		left outer join ord_line ol
		             on shipment_line.ordnum = ol.ordnum
		            and shipment_line.ordlin = ol.ordlin
		            and shipment_line.ordsln = ol.ordsln
		            and shipment_line.wh_id = ol.wh_id
		            and shipment_line.client_id = ol.client_id
	union all
	select  N'R' xdktyp, cast(null as nvarchar(10) ) xdkref, 
                shipment_line.prcpri, 
	        rplwrk.adddte, rplwrk.dstare, rplwrk.dstloc, 
		rplwrk.prt_client_id, rplwrk.prtnum, 
		rplwrk.invsts_prg, rplwrk.pckqty remqty, 
		0 xdkqty, 0 alcqty, rplwrk.rule_nam, 
		rplwrk.rplref, shipment_line.ship_id, rplwrk.ship_line_id, 
		shipment_line.client_id, shipment_line.ordnum, 
		shipment_line.ordlin, shipment_line.ordsln, rplwrk.splflg, 
		rplwrk.wkonum, rplwrk.wkorev, rplwrk.wkolin,
		0 untpal, rplwrk.untcas, rplwrk.untpak,
		rplwrk.stcust, rplwrk.schbat, 0 rpqflg,
		shipment_line.ovrcod, shipment_line.ovramt,
		shipment_line.wh_id,
		cast(null as nvarchar(35) ) distro_id,
		rplwrk.min_shelf_hrs
	from 	shipment_line, rplwrk
	where	not exists (select rplref from xdkwrk where
				      rplref=rplwrk.rplref)
		and rplwrk.rplsts not in ( N'C', N'D', N'A')
		and rplwrk.parref is null
		and rplwrk.ship_line_id = shipment_line.ship_line_id
		and shipment_line.linsts in ( N'P', N'I')
	union all
	select  xdkwrk.xdktyp, xdkwrk.xdkref, wkohdr.prcpri, 
	        xdkwrk.adddte, xdkwrk.dstare, xdkwrk.dstloc, 
		xdkwrk.prt_client_id, xdkwrk.prtnum, 
		xdkwrk.invsts_prg, xdkwrk.pckqty-xdkwrk.alcqty remqty, 
		xdkwrk.xdkqty, xdkwrk.alcqty, xdkwrk.rule_nam, 
		xdkwrk.rplref, xdkwrk.ship_id, xdkwrk.ship_line_id, 
		xdkwrk.client_id, xdkwrk.ordnum, 
		xdkwrk.ordlin, xdkwrk.ordsln, xdkwrk.splflg,
		xdkwrk.wkonum, xdkwrk.wkorev, xdkwrk.wkolin,
		xdkwrk.untpal, xdkwrk.untcas, xdkwrk.untpak, 
		xdkwrk.stcust, xdkwrk.schbat, xdkwrk.rpqflg,
		wkodtl.ovrcod, wkodtl.ovramt, wkohdr.wh_id,
		cast(null as nvarchar(35) ) distro_id,
		xdkwrk.min_shelf_hrs
	from 	wkohdr, wkodtl, xdkwrk
	where	xdkwrk.xdkqty < xdkwrk.pckqty
		and wkohdr.client_id = wkodtl.client_id
		and wkohdr.wkonum = wkodtl.wkonum
		and wkohdr.wkorev = wkodtl.wkorev
		and wkohdr.wh_id  = wkodtl.wh_id
		and xdkwrk.client_id = wkodtl.client_id
		and xdkwrk.wkonum = wkodtl.wkonum
		and xdkwrk.wkorev = wkodtl.wkorev
		and xdkwrk.wkolin = wkodtl.wkolin
		and xdkwrk.wh_id  = wkodtl.wh_id
		and wkodtl.seqnum = 0
		and wkodtl.linsts in ( N'P', N'I')
	union all
	select  xdkwrk.xdktyp, xdkwrk.xdkref, wkohdr.prcpri, 
	        xdkwrk.adddte, xdkwrk.dstare, xdkwrk.dstloc, 
		xdkwrk.prt_client_id, xdkwrk.prtnum, 
		xdkwrk.invsts_prg, xdkwrk.pckqty-xdkwrk.alcqty remqty, 
		xdkwrk.xdkqty, xdkwrk.alcqty, xdkwrk.rule_nam,
		xdkwrk.rplref, xdkwrk.ship_id, xdkwrk.ship_line_id, 
		xdkwrk.client_id, xdkwrk.ordnum, 
		xdkwrk.ordlin, xdkwrk.ordsln, xdkwrk.splflg,
		xdkwrk.wkonum, xdkwrk.wkorev, xdkwrk.wkolin,
		xdkwrk.untpal, xdkwrk.untcas, xdkwrk.untpak, 
		xdkwrk.stcust, xdkwrk.schbat, xdkwrk.rpqflg,
		wkohdr.ovrcod, wkohdr.ovramt, wkohdr.wh_id,
		cast(null as nvarchar(35) ) distro_id,
		xdkwrk.min_shelf_hrs
	from 	wkohdr, xdkwrk
	where	xdkwrk.xdkqty < xdkwrk.pckqty
		and xdkwrk.client_id = wkohdr.client_id
		and xdkwrk.wkonum = wkohdr.wkonum
		and xdkwrk.wkorev = wkohdr.wkorev
		and xdkwrk.wh_id  = wkohdr.wh_id
		and wkohdr.wkosts in ( N'P', N'I')
	union all
	select  N'R' xdktyp, cast(null as nvarchar(10) ) xdkref,
                wkohdr.prcpri, 
	        rplwrk.adddte, rplwrk.dstare, rplwrk.dstloc, 
		rplwrk.prt_client_id, rplwrk.prtnum, 
		rplwrk.invsts_prg, rplwrk.pckqty remqty, 
		0 xdkqty, 0 alcqty,rplwrk.rule_nam, 
		rplwrk.rplref, cast(null as nvarchar(30) ) ship_id, 
                rplwrk.ship_line_id, wkodtl.client_id, 
                cast(null as nvarchar(35) ) ordnum, 
		cast(null as nvarchar(10) ) ordlin, 
                cast(null as nvarchar(10) ) ordsln, rplwrk.splflg, 
		rplwrk.wkonum, rplwrk.wkorev, rplwrk.wkolin,
		0 untpal, rplwrk.untcas, rplwrk.untpak,
		rplwrk.stcust, rplwrk.schbat, 0 rpqflg,
		wkodtl.ovrcod, wkodtl.ovramt, wkohdr.wh_id,
	        cast(null as nvarchar(35) ) distro_id,
	        rplwrk.min_shelf_hrs
	from 	wkohdr, wkodtl, rplwrk
	where	not exists (select rplref from xdkwrk where
				      rplref=rplwrk.rplref)
		and rplwrk.rplsts not in ( N'C', N'D', N'A')
		and rplwrk.parref is null
		and wkohdr.client_id = wkodtl.client_id
		and wkohdr.wkonum = wkodtl.wkonum
		and wkohdr.wkorev = wkodtl.wkorev
		and wkohdr.wh_id  = wkodtl.wh_id
		and rplwrk.client_id = wkodtl.client_id
		and rplwrk.wkonum = wkodtl.wkonum
		and rplwrk.wkorev = wkodtl.wkorev
		and rplwrk.wkolin = wkodtl.wkolin
		and rplwrk.wh_id  = wkodtl.wh_id
		and wkodtl.seqnum = 0
		and wkodtl.linsts in ( N'P', N'I')