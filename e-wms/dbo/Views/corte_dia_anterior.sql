
/****** Script for SelectTopNRows command from SSMS  ******/
CREATE VIEW [dbo].[corte_dia_anterior] AS 
SELECT distinct
       a.[fecha_corte]
      ,a.[prt_client_id]
      ,a.[wh_id]
      ,a.[prtnum]
      ,a.[invsts]
      ,a.[lotnum]
      ,SUM(a.[untqty]) untqty
      --,a.[lst_arecod]
      ,a.[expire_dte]
      ,a.[inv_attr_str7]
    --  ,a.[stoloc]
      --,a.[lodnum]
--      ,a.[orgcod]

  FROM [dbo].[saldos_inventario] a
  WHERE 0=0
    AND fecha_corte > GETDATE()-2
    AND fecha_corte < GETDATE()-1
    AND prt_client_id IN ('HEINZ COLOMBIA SAS','HEINZDEV')

        group by 
           a.[fecha_corte]
      ,a.[prt_client_id]
      ,a.[wh_id]
      ,a.[prtnum]
      ,a.[invsts]
      ,a.[lotnum]
      ,a.[expire_dte]
      ,a.[inv_attr_str7]