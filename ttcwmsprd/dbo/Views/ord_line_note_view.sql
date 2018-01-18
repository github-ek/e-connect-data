create view dbo.ord_line_note_view as 
   select shipment_line.ship_id, shipment_line.ship_line_id,
          ord_line_note.wh_id,   
          ord_line_note.client_id, ord_line_note.ordnum,
          ord_line_note.ordlin,    ord_line_note.ordsln,
	  ord_line_note.notlin,
	  ord_line_note.nottxt,
	  ord_line_note.edtflg,
	  ord_line_note.ordlin ordlin_order_by,
	  ord_line_note.ordsln ordsln_order_by
    from shipment_line, ord_line_note
   where shipment_line.client_id = ord_line_note.client_id
     and shipment_line.ordnum = ord_line_note.ordnum
     and shipment_line.ordlin = ord_line_note.ordlin
     and shipment_line.ordsln = ord_line_note.ordsln
     and shipment_line.wh_id  = ord_line_note.wh_id