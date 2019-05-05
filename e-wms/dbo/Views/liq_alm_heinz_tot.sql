

CREATE VIEW [dbo].[liq_alm_heinz_tot] AS
SELECT CONCAT(a.año,'-',a.mes) concat 
      ,CONCAT(a.año,a.mes,a.wh_id,a.codigo) [key]
      ,a.año
      ,a.mes
      ,a.wh_id
      ,a.prt_client_id
      ,a.codigo
      ,CEILING(AVG(a.Cantidad)) AS [Prom cantidad]
      ,CEILING(AVG(a.pos)) AS [prom pos]
      ,CEILING(AVG(a.pos))*27820 AS [prom pos*cost]
      
FROM
( 
SELECT *
       ,ROW_NUMBER() OVER(PARTITION BY a.wh_id,a.codigo,a.prt_client_id,a.año,a.mes ORDER BY a.pos DESC) AS orden 
FROM (
SELECT a.fecha_corte
      ,a.año
      ,a.mes
      ,a.wh_id
      ,a.codigo
      ,a.prt_client_id
      ,SUM(a.Cantidad) Cantidad
      --,a.es_piso
      ,SUM(a.pos) pos 

FROM (
SELECT a.fecha_corte
      ,a.año
      ,a.mes
      ,a.wh_id
      ,a.codigo
      ,a.prt_client_id
      ,CEILING(CAST(SUM(a.Cantidad) AS FLOAT)/COUNT(DISTINCT a.fecha_corte)) Cantidad
      ,a.es_piso
      ,CASE WHEN a.es_piso=1 
            THEN  CEILING(SUM(a.[Ubicaciones calc round])/ COUNT(DISTINCT a.fecha_corte)) 
            ELSE  CEILING(COUNT(DISTINCT CONCAT(a.dia,a.stoloc))/COUNT(DISTINCT a.fecha_corte))
            END AS  pos
FROM (SELECT 
       DISTINCT   a.[fecha] fecha_corte
                ,CASE WHEN DATEPART(mm,a.[fecha])=12 and DATEPART(dd,a.[fecha]) > 15
                      THEN DATEPART(yy,a.[fecha])+1
                      ELSE DATEPART(yy,a.[fecha]) END AS año
                ,CASE WHEN DATEPART(dd,a.[fecha]) > 15 
                      THEN CASE WHEN DATEPART(mm,a.[fecha]) = 12
                           THEN 1
                           ELSE DATEPART(mm,a.[fecha]) + 1 END
                      ELSE DATEPART(mm,a.[fecha]) END  AS mes 
                ,DATEPART(ww,a.[fecha]) semana
                ,DATEPART(dd,a.[fecha]) dia
                ,CASE WHEN a.[prt_client_id] ='HEINZDEV'
                 THEN 'HEINZ COLOMBIA SAS'
                 ELSE a.[prt_client_id] END AS [prt_client_id]
                ,b.codigo
                ,a.[wh_id]
                ,a.[lst_arecod]
                ,a.[prtnum]
                ,a.stoloc
                ,f.wrkzon
                ,CASE WHEN f.wrkzon IN ('STAGE','PISO','STG') OR a.lst_arecod='ACP' OR f.wrkzon IS NULL
                      THEN 1 
                      ELSE 0 
                 END AS es_piso
                ,c.id_producto
                ,c.nombre
                ,e.factor_conversion
                ,e.huella_codigo
                ,SUM(a.[untqty]) AS Cantidad
                ,SUM(CAST(a.[untqty] AS FLOAT))/CAST(e.factor_conversion AS FLOAT) AS [Ubicaciones calc]
                ,CASE WHEN SUM(CAST(a.[untqty] AS FLOAT))/CAST(e.factor_conversion AS FLOAT) > 0.2
                 THEN (CEILING(SUM(CAST(a.[untqty] AS FLOAT))/CAST(e.factor_conversion AS FLOAT))) 
                 ELSE  ((SUM(CAST(a.[untqty] AS FLOAT)))/CAST(e.factor_conversion AS FLOAT))  
                 END AS [Ubicaciones calc round]
                ,CEILING(SUM(CAST(a.[untqty] AS FLOAT))/CAST(e.factor_conversion AS FLOAT))*27820 AS [valor]
                ,COUNT( DISTINCT a.[stoloc]) AS [Conteo de ubicaciones]
                ,CEILING(SUM(CAST(a.[untqty] AS FLOAT))/CAST(e.factor_conversion AS FLOAT)) as  [Ubicaciones calc round2]

        FROM [$(WMS_DB_SERVER)].[$(historicoInv)].[dbo].[corteInv_Hist] a
            LEFT OUTER JOIN dbo.clientes b ON 
                       a.prt_client_id = b.client_id
            LEFT OUTER JOIN dbo.productos c ON 
                       a.prtnum = c.prtnum
                   AND a.prt_client_id=c.prt_client_id
            LEFT OUTER JOIN dbo.bodegas d ON 
                       a.wh_id = d.wh_id
            LEFT OUTER JOIN dbo.ubicaciones f ON 
                       a.wh_id = f.wh_id
                   AND a.stoloc = f.stoloc
                   AND f.activo=1
            LEFT OUTER JOIN [$(eConnect)].dbo.productos_medidas e ON 
                       c.id_producto=e.id_producto
                   AND d.id_bodega=e.id_bodega
                   AND e.[pal_flg] =1 
                   AND (e.huella_codigo <> 'GENERICA' 
                     OR e.huella_codigo IS NULL)
      
    WHERE 0=0
             AND a.fecha >= '11/22/2017'
             AND a.[prt_client_id] IN ('HEINZ COLOMBIA SAS','HEINZDEV')

    GROUP BY a.[fecha]
            ,b.codigo
            ,a.[prt_client_id]
            ,a.[wh_id]
            ,a.[lst_arecod]
            ,a.[prtnum]
            ,c.nombre
            ,e.factor_conversion
            ,e.huella_codigo
            ,c.id_producto   
            ,a.stoloc
            ,f.wrkzon) a
    WHERE 0=0
    GROUP BY a.fecha_corte
            ,a.año
            ,a.wh_id
            ,a.mes
            ,a.codigo
            ,a.prt_client_id
            ,a.es_piso)a
 GROUP BY a.fecha_corte
            ,a.año
            ,a.wh_id
            ,a.mes
            ,a.codigo
            ,a.prt_client_id
  
)a

           )a 
    WHERE 0=0
--    AND a.orden <= 3
    AND a.año=YEAR(GETDATE())
    AND a.mes=MONTH(GETDATE())

    GROUP BY a.mes
            ,a.año
            ,a.wh_id
            ,a.prt_client_id
      ,a.codigo