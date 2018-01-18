create view dbo.rpl_slt_prf_view as 
   SELECT  sum(pckqty) item_demand,
           prof_name
     FROM  rpl_slotprof_link
    WHERE  prof_name is not null
 GROUP BY  prof_name,
           slot_uom