create view dbo.wkohdr_note_view as 
  select distinct wkonum, client_id, wkorev,
         cast(null as nvarchar(10) ) wkolin,
	 notlin,
	 nottxt,
	 edtflg,
	 N'0' wkolin_order_by,
	 wh_id
    from wkohdr_note