create view dbo.rplsum_view as 
            select schbat,
            count(rplref) numwrk,
            sum(pckqty) pckqty,
            sum(alcqty) alcqty,
            wh_id
            from rplwrk
            group by wh_id, schbat