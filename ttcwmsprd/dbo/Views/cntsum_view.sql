create view dbo.cntsum_view as 
   select cntwrk.wh_id,
          cntwrk.cntbat, 
          count(*) total,  
          sum(CASE cnttyp.dtl_flg WHEN 0  THEN
	      CASE cntsts WHEN N'C' THEN 1
	      ELSE 0 END ELSE 0 END) cntcmp,
          sum(CASE cnttyp.dtl_flg WHEN 0  THEN
	      CASE cntsts WHEN N'D' THEN 1
	      ELSE 0 END ELSE 0 END) cntdef,
          sum(CASE cnttyp.dtl_flg WHEN 0  THEN
	      CASE cntsts WHEN N'N' THEN 1
	      ELSE 0 END ELSE 0 END) cntcnl,
          sum(CASE cnttyp.dtl_flg WHEN 0  THEN
	      CASE cntsts WHEN N'G' THEN 1 
	                  WHEN N'R' THEN 1
			  WHEN N'I' THEN 1
	      ELSE 0 END ELSE 0 END) cntrem,
          sum(CASE cnttyp.dtl_flg WHEN 1  THEN
	      CASE cntsts WHEN N'C' THEN 1
	      ELSE 0 END ELSE 0 END) audcmp,
          sum(CASE cnttyp.dtl_flg WHEN 1  THEN
	      CASE cntsts WHEN N'N' THEN 1
	      ELSE 0 END ELSE 0 END) audcnl,
          sum(CASE cnttyp.dtl_flg WHEN 1  THEN
	      CASE cntsts WHEN N'C' THEN 0
	                  WHEN N'N' THEN 0
	      ELSE 1 END ELSE 0 END) audrem 
     from cntwrk, cnttyp
     where cnttyp.cnttyp = cntwrk.cnttyp
     and cntwrk.cnttyp != N'MAN'
    group by wh_id, cntbat