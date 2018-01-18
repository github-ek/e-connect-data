create view dbo.pcksum_view as 
       select schbat,
              count(wrkref) numwrk,
              count(distinct cmbcod) numpck,
              sum(appqty) appqty,
              sum(pckqty) pckqty,
              wh_id
         from pckwrk_view
        where wrktyp = N'P'
        group by wh_id, schbat