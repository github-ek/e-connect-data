create view dbo.prtmst_view as 
  select prtmst.*, 
         prtmst.wh_id_tmpl wh_id
  from prtmst