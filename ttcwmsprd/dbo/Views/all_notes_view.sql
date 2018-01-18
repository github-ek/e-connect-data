create view dbo.all_notes_view as 
  (select * from ord_line_note_view
      union
   select * from ord_note_view)