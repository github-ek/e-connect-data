





CREATE VIEW [dbo].[retencion_bi] AS 

SELECT *
FROM
(
SELECT DATEPART(yy,hlddte) año
      ,DATEPART(mm,hlddte) mes 
      ,DATEPART(ww,hlddte) semana
      ,DATEPART(dd,hlddte) dia
      ,[hldhst_id] id
      ,CAST([hlddte] AS INT) [fecha retencion]
      ,[hlddte]
      ,[acttyp] [estado retencion]
      ,CASE WHEN [acttyp]='A' 
       THEN 'Retenido'
       ELSE 'Liberado' END AS estado2
      --,[hldpfx]
      ,[hldnum] [proceso]
      --,[hldtyp]
      ,[wh_id] 
      ,[hld_usr_id] [usuario]
      ,[prtnum] [articulo]
      ,[prt_client_id] [cliente]
      ,[lotnum] [lote]
      ,[fr_invsts] [estado desde]
      ,[to_invsts] [estado hasta]
      ,[lodnum] lpn
      ,CASE WHEN prt_client_id = 'GLOBAL WINE & SPIRITS LTDA'
              AND prtnum IN ('310206','310207','310208','310212')
            THEN [untqty]*24
            ELSE 
                CASE WHEN prt_client_id = 'GLOBAL WINE & SPIRITS LTDA' 
                      AND prtnum ='310209' 
                     THEN [untqty]*20
                     ELSE [untqty] END END AS  [untqty]
,      CASE WHEN [inv_attr_str7]='SZO00001908-CTG'
      THEN 'ZLO00001908-CTG'
      ELSE [inv_attr_str7] end as bl
,CASE WHEN [inv_attr_str7] IN 
        ('SUDU28001AAD9029'
        ,'ZIMUNYC933123'
        ,'ZIMUNYC932551'
        ,'SUDU28001AAHV3YK'
        ,'HLCUBSC180392026'
        ,'ZLO00001924-CTG'
        ,'ZLO00001921-CTG'
        ,'ZLO00001923-CTG'
        ,'SUDU28001AAHV3YK'
        ,'SUDU28001AAD9VD0'
        ,'ZLO00001924-CTG'
        ,'ZLO00001953-CTG'
        ,'ZLO00001921-CTG'
        ,'ZLO00001929-CTG'
        ,'ZLO00001928-CTG'
        ,'ZLO00001930-CTG'
        ,'HLCUBSC1807BKOO3'
        ,'SUDU28001ABEF9X3'
        ,'SUDU28001ABIQAR5'
        ,'ZLO00001959-CTG'
        ,'ZLO00001960-CTG'
        ,'ZLO00001967-CTG'
        ,'ZLO00001968-CTG'
        ,'ZLO00001973-CTG'
        ,'EWR178997694'
        ,'SUDU27001A5NJBSE'
        ,'SUDU27001A88GGXE'
        ,'SUDU27001A8LOES2'
        ,'SUDU28001AAWAFDK'
        ,'SUDU28001ABKR0MK'
        ,'D180610839'
        ,'D180610924'
        ,'BQEGARM051048'
        ,'BQEGARM051049'
        ,'BQEGARM051681'
        ,'BQEGCLS159300'
        ,'BQEGCLS168041'
        ,'BQEGCLS168045'
        ,'BQEGCLS168046'
        ,'BQEGCLS168047'
        ,'BQEGCLS168048'
        ,'BQEGCLS168051'
        ,'BQEGCLS168052'
        ,'BQEGCLS168054'
        ,'BQEGCLS168057'
        ,'BQEGITF046059'
        ,'SUDU27003A8LST6Y'
        ,'SUDU28003A94AK7H'


) OR ([inv_attr_str7] IN ('94248','D180812364','D180812450-B','SUDU28003AC3LSSV') AND hldnum='ETQ')

THEN 1 ELSE 0 END AS ERROR
,CASE WHEN ([inv_attr_str7] IN ('94248','1572-9105-808.031','BL009194','BQEGITF050488','D180812364','D180812450-B','HEL31103062','MNBOMOE06231','SM00010721','SUDU28003AC3LSSV','HLCUBSC1807AUHL4','HLCUBSC1807BCGL0','HLCUBSC1807BJDO5','HLCUBSC1807BKOO3','HLCUBSC1808BRRN9','HLCUBSC1808BTAW0','HLCUBSC180919184','HLCUBSC1809AOVH7','ZIMUNYC935857','ZIMUNYC935859','ZIMUNYC936806','ZIMUORF0810440')
                            AND hldnum='ETQ')
            OR ([inv_attr_str7] IN ('ZLO00002022-CTG','ZLO00002023-CTG','ZLO00002024-CTG','ZLO00002026-CTG')
                            AND hldnum='REV')
        THEN 1 
        ELSE 0 END AS borrar
  FROM [dbo].[retenciones]
    WHERE hlddte >='11/01/2017'
        AND hldnum <> 'inmv'
        AND [inv_attr_str7] is not null
        AND [inv_attr_str7]<>'BQEGARMO46732'
        AND [inv_attr_str7]<>'MAP006936' 


UNION

SELECT
       DATEPART(yy,ha.hlddte) año
      ,DATEPART(mm,ha.hlddte) mes 
      ,DATEPART(ww,ha.hlddte) semana
      ,DATEPART(dd,ha.hlddte) dia
      ,ha.[hldhst_id] id
      ,CAST(ha.[hlddte] AS INT) [fecha retencion]
      ,ha.[hlddte]
      ,'R'[estado retencion]
      ,'Liberado' AS estado2
      ,ha.[hldnum] [proceso]
      ,ha.[wh_id] 
      ,ha.[hld_usr_id] [usuario]
      ,ha.[prtnum] [articulo]
      ,ha.[prt_client_id] [cliente]
      ,ha.[lotnum] [lote]
      ,ha.[fr_invsts] [estado desde]
      ,ha.[to_invsts] [estado hasta]
      ,ha.[lodnum] lpn
      ,CASE WHEN ha.prt_client_id = 'GLOBAL WINE & SPIRITS LTDA'
              AND ha.prtnum IN ('310206','310207','310208','310212')
            THEN ha.[untqty]*24
            ELSE 
                CASE WHEN ha.prt_client_id = 'GLOBAL WINE & SPIRITS LTDA' 
                      AND ha.prtnum ='310209' 
                     THEN ha.[untqty]*20
                     ELSE ha.[untqty] END END AS  [untqty]
      ,ha.[inv_attr_str7] bl
,CASE WHEN ha.[inv_attr_str7] IN 
        ('SUDU28001AAD9029'
        ,'ZIMUNYC933123'
        ,'ZIMUNYC932551'
        ,'SUDU28001AAHV3YK'
        ,'HLCUBSC180392026'
        ,'ZLO00001924-CTG'
        ,'ZLO00001921-CTG'
        ,'ZLO00001923-CTG'
        ,'SUDU28001AAHV3YK'
        ,'SUDU28001AAD9VD0'
        ,'ZLO00001924-CTG'
        ,'ZLO00001953-CTG'
        ,'ZLO00001921-CTG'
        ,'ZLO00001929-CTG'
        ,'ZLO00001928-CTG'
        ,'ZLO00001930-CTG'
        ,'HLCUBSC1807BKOO3'
        ,'SUDU28001ABEF9X3'
        ,'SUDU28001ABIQAR5'
        ,'ZLO00001959-CTG'
        ,'ZLO00001960-CTG'
        ,'ZLO00001967-CTG'
        ,'ZLO00001968-CTG'
        ,'ZLO00001973-CTG'
        ,'EWR178997694'
        ,'SUDU27001A5NJBSE'
        ,'SUDU27001A88GGXE'
        ,'SUDU27001A8LOES2'
        ,'SUDU28001AAWAFDK'
        ,'SUDU28001ABKR0MK'
        ,'D180610839'
        ,'D180610924'
        ,'BQEGARM051048'
        ,'BQEGARM051049'
        ,'BQEGARM051681'
        ,'BQEGCLS159300'
        ,'BQEGCLS168041'
        ,'BQEGCLS168045'
        ,'BQEGCLS168046'
        ,'BQEGCLS168047'
        ,'BQEGCLS168048'
        ,'BQEGCLS168051'
        ,'BQEGCLS168052'
        ,'BQEGCLS168054'
        ,'BQEGCLS168057'
        ,'BQEGITF046059'
        ,'SUDU27003A8LST6Y'
        ,'SUDU28003A94AK7H'

) OR (ha.[inv_attr_str7] IN('94248','D180812364','D180812450-B','SUDU28003AC3LSSV') AND ha.hldnum='ETQ')

THEN 1 ELSE 0 END AS ERROR
,CASE WHEN (ha.[inv_attr_str7] IN ('94248','1572-9105-808.031','BL009194','BQEGITF050488','D180812364','D180812450-B','HEL31103062','MNBOMOE06231','SM00010721','SUDU28003AC3LSSV','HLCUBSC1807AUHL4','HLCUBSC1807BCGL0','HLCUBSC1807BJDO5','HLCUBSC1807BKOO3','HLCUBSC1808BRRN9','HLCUBSC1808BTAW0','HLCUBSC180919184','HLCUBSC1809AOVH7','ZIMUNYC935857','ZIMUNYC935859','ZIMUNYC936806','ZIMUORF0810440')
                            AND ha.hldnum='ETQ')
            OR (ha.[inv_attr_str7] IN ('ZLO00002022-CTG','ZLO00002023-CTG','ZLO00002024-CTG','ZLO00002026-CTG')
                            AND ha.hldnum='REV')
        THEN 1 
        ELSE 0 END AS borrar


   FROM [$(WMS_DB_SERVER)].[$(ttcwmsprd)].dbo.hldhst ha
   LEFT OUTER
   JOIN [$(WMS_DB_SERVER)].[$(ttcwmsprd)].dbo.hldhst hr
     ON hr.dtlnum = ha.dtlnum
    AND hr.acttyp = 'R'
   LEFT OUTER
   JOIN [$(WMS_DB_SERVER)].[$(ttcwmsprd)].dbo.invhld ih
     ON ih.dtlnum = ha.dtlnum
  WHERE 0=0
    AND ha.acttyp = 'A'
    AND hr.dtlnum IS NULL
    AND ih.dtlnum IS NULL
AND ha.hlddte >='11/01/2017'
AND ha.hldnum <> 'inmv'

AND ha.[inv_attr_str7] is not null
AND ha.[inv_attr_str7]<>'BQEGARMO46732'
AND ha.[inv_attr_str7]<>'MAP006936' 
) a

WHERE borrar=0