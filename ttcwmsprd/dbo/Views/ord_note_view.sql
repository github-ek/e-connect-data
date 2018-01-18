create view dbo.ord_note_view as 
  select distinct shipment_line.ship_id, 
          cast(null as nvarchar(10) ) ship_line_id,
          ord_note.wh_id, 
          ord_note.client_id, ord_note.ordnum,
          cast(null as nvarchar(10) ) ordlin,  
          cast(null as nvarchar(10) ) ordsln,
	  ord_note.notlin,
	  ord_note.nottxt,
	  ord_note.edtflg,
	  N'0' ordlin_order_by,
	  N'0' ordsln_order_by
    from shipment_line, ord_note
   where shipment_line.client_id = ord_note.client_id
     and shipment_line.ordnum = ord_note.ordnum    
     and shipment_line.wh_id = ord_note.wh_id