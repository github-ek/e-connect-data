create view dbo.wkodtl_note_view as 
  select distinct wkonum, client_id, wkorev,  
         wkolin,
	 notlin,
	 nottxt,
	 edtflg,
	 wkolin wkolin_order_by,
	 wh_id
    from wkodtl_note