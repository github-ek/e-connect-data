

CREATE VIEW [dbo].[prom_salidas_mes_heinz] AS
SELECT   a.[client_id]
        ,a.[wh_id]
        ,a.prtnum
        ,AVG(a.[sum cajas]) prom_mes
        ,AVG(a.[sum unt]) prom_mesU
        ,STDEV(a.[sum cajas]) sd_mes
        ,STDEV(a.[sum unt]) sd_mesU
        ,CASE WHEN STDEV(a.[sum cajas]) IS NULL OR STDEV(a.[sum cajas])=0 THEN NULL ELSE 
        AVG(a.[sum cajas])/STDEV(a.[sum cajas]) end as  var_mes
        ,CASE WHEN STDEV(a.[sum unt]) IS NULL OR STDEV(a.[sum unt])=0 THEN NULL ELSE 
        AVG(a.[sum unt])/STDEV(a.[sum unt]) end as var_mesU


FROM(
SELECT a.[client_id]
      ,a.[wh_id]
      ,a.año
      ,a.mes
      ,a.prtnum
      ,SUM(a.cajas) [sum cajas]
      ,SUM(a.shpqty) [sum unt]

 FROM(

SELECT a.[client_id]
      ,a.[wh_id]
      ,a.[ordnum]
      ,SUBSTRING(a.[ordnum],11,1000) AS rmanum
--      ,a.[rmanum]
  --    ,a.[ordtyp]
      ,a.[loddte]
      ,DATEPART(yy,a.[loddte]) año
      ,DATEPART(mm,a.[loddte]) mes 
      ,DATEPART(ww,a.[loddte]) semana
      ,DATEPART(dd,a.[loddte]) dia
      ,a.[prtnum]
      ,e.factor_conversion
      ,SUM(a.[ordqty]) ordqty
      ,SUM(a.[shpqty]) shpqty
      ,CAST(SUM(a.[shpqty]) AS FLOAT)/e.factor_conversion cajas
  FROM [$(WMS_DB_SERVER)].[$(historicoInv)].dbo.[despachos_Hist] a
            LEFT OUTER JOIN dbo.clientes b ON 
                       a.client_id = b.client_id
            LEFT OUTER JOIN dbo.productos c ON 
                       a.prtnum = c.prtnum
                   AND a.client_id=c.prt_client_id
            LEFT OUTER JOIN dbo.bodegas d ON 
                       a.wh_id = d.wh_id
            LEFT OUTER JOIN [$(eConnect)].dbo.productos_medidas e ON 
                       c.id_producto=e.id_producto
                   AND d.id_bodega=e.id_bodega
                   AND e.[cas_flg] =1 
                   AND (e.huella_codigo <> 'GENERICA' 
                     OR e.huella_codigo IS NULL)
  WHERE 0=0
    
    AND a.client_id = 'HEINZ COLOMBIA SAS'
    AND a.[loddte] > GETDATE()-90      
    and e.factor_conversion IS NOT NULL
  GROUP BY a.[client_id]
          ,a.[wh_id]
          ,a.[ordnum]
  --        ,a.[rmanum]
          --,a.[ordtyp]
          ,a.[loddte]
          ,a.[prtnum]
          ,e.factor_conversion
          )a

WHERE 0=0
    AND a.rmanum NOT  LIKE 'T%'
    AND a.rmanum NOT  LIKE 'O%'
    AND a.rmanum NOT  LIKE 'S%'
    AND a.rmanum NOT  LIKE 'HEINZ%'
    AND a.rmanum NOT  LIKE 'S%'
    AND a.rmanum NOT  LIKE 'DESCTG%'
GROUP BY   a.[client_id]
          ,a.[wh_id]
          ,a.año
          ,a.mes
          ,a.prtnum
     )a
WHERE a.año>=2018
GROUP BY   a.[client_id]
          ,a.[wh_id]
          ,a.prtnum