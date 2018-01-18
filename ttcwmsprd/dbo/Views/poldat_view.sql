create view dbo.poldat_view as 
  select wh.wh_id,
         poldat.*, 
         0 ovrd_flg
    from poldat, 
         wh
   where poldat.wh_id_tmpl = N'----'
     and NOT EXISTS
         (select N'x' 
           from poldat poldat2
          where poldat2.wh_id_tmpl = wh.wh_id 
            and poldat2.polcod = poldat.polcod 
            and poldat2.polvar = poldat.polvar
            and poldat2.polval = poldat.polval)
   UNION
  select wh_id_tmpl wh_id,
         poldat.*,
         1 ovrd_flg
    from poldat