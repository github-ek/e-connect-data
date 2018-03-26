CREATE VIEW prom_salidas_mes AS

SELECT   a.[client_id]
        ,a.[wh_id]
        ,a.prtnum
        ,AVG(a.[sum cajas]) prom_mes
        ,AVG(a.[sum unt]) prom_mesU
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
      ,a.[rmanum]
      ,a.[ordtyp]
      ,a.[moddte]
      ,DATEPART(yy,a.[moddte]) año
      ,DATEPART(mm,a.[moddte]) mes 
      ,DATEPART(ww,a.[moddte]) semana
      ,DATEPART(dd,a.[moddte]) dia
      ,a.[prtnum]
      ,e.factor_conversion
      ,SUM(a.[ordqty]) ordqty
      ,SUM(a.[shpqty]) shpqty
      ,CAST(SUM(a.[shpqty]) AS FLOAT)/e.factor_conversion cajas
  FROM [dbo].[ordenes_salida] a
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
 -- WHERE a.client_id = 'KOBA COLOMBIA S.A.S'

  GROUP BY a.[client_id]
          ,a.[wh_id]
          ,a.[ordnum]
          ,a.[rmanum]
          ,a.[ordtyp]
          ,a.[moddte]
          ,a.[prtnum]
          ,e.factor_conversion
          )a
GROUP BY   a.[client_id]
          ,a.[wh_id]
          ,a.año
          ,a.mes
          ,a.prtnum
     )a
GROUP BY   a.[client_id]
          ,a.[wh_id]
          ,a.prtnum