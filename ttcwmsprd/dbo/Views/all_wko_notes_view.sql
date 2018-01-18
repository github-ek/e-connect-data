create view dbo.all_wko_notes_view as 
  (select * from wkohdr_note_view
      union
   select * from wkodtl_note_view)