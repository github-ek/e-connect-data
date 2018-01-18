create view dbo.wrkopr_view as 
  select wrkopr.*, 
         wh.wh_id wh_id, 
         0 ovrd_flg
    from wrkopr, 
         wh
   where wrkopr.wh_id_tmpl = N'----'
     and not exists
         (select N'x' 
           from wrkopr wrkopr2
          where wrkopr2.wh_id_tmpl = wh.wh_id 
            and wrkopr2.oprcod = wrkopr.oprcod)
   UNION ALL
  select wrkopr.*,
         wrkopr.wh_id_tmpl wh_id, 
         1 ovrd_flg
    from wrkopr