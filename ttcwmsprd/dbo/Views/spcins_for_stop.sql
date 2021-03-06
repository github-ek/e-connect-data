﻿create view dbo.spcins_for_stop as 
    select insmst.*, dscmst.short_dsc, dscmst.lngdsc, shipment.stop_id,
	   shipment_ins.cmpl_flg, shipment_ins.client_id, shipment_ins.ordnum,
	   cast(null as nvarchar(10) ) ordlin, 
           cast(null as nvarchar(10) ) ordsln, shipment_ins.ship_id, 
           cast(null as nvarchar(10) ) ship_line_id, 
           dscmst.locale_id
      from dscmst right outer join insmst 
        on (dscmst.colval = insmst.inskey) 
       and (dscmst.colnam = N'inskey')
      join shipment_ins 
        on (insmst.inskey = shipment_ins.inskey )
      join shipment 
        on (shipment_ins.ship_id = shipment.ship_id) 
     UNION
    select insmst.*, dscmst.short_dsc, dscmst.lngdsc, shipment.stop_id,
           shipment_line_ins.cmpl_flg, shipment_line.client_id, 
           shipment_line.ordnum, shipment_line.ordlin, shipment_line.ordsln,
	   shipment_line.ship_id, shipment_line.ship_line_id, dscmst.locale_id
      from dscmst right outer join insmst 
        on (dscmst.colval = insmst.inskey)
       and (dscmst.colnam = N'inskey') 
      join shipment_line_ins 
        on (insmst.inskey = shipment_line_ins.inskey)
      join shipment_line 
        on (shipment_line.ship_line_id = shipment_line_ins.ship_line_id)
      join shipment 
        on (shipment_line.ship_id = shipment.ship_id)