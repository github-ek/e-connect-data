
CREATE PROCEDURE [dbo].[ConsultarSaldosPorLoteWms]
AS
BEGIN
    ;WITH
    cte_00 AS
    (
    SELECT 
         [fecha_creacion]
        ,[fecha_corte]
        ,[prt_client_id]
        ,[wh_id]
        ,[prtnum]
        ,[invsts]
        ,[lotnum]
        ,[expire_dte]
        ,SUM([untqty]) AS [untqty]
    FROM eWms.dbo.saldos_inventario
    WHERE [fecha_corte] = CAST(GETDATE() AS DATE)
    AND prt_client_id = 'GLOBAL WINE & SPIRITS LTDA'
    GROUP BY
         [fecha_creacion]
        ,[fecha_corte]
        ,[prt_client_id]
        ,[wh_id]
        ,[prtnum]
        ,[invsts]
        ,[lotnum]
        ,[expire_dte]
    ),
    cte_01 AS
    (
    SELECT
         d.*
        ,ROW_NUMBER() OVER(PARTITION BY id_bodega,id_estado_inventario ORDER BY codigo_alterno) AS orden
     FROM dbo.clientes_bodegas d
     WHERE
        d.id_cliente = 18
    AND d.habilitado_conversion_cliente_wms = 1
    )
    SELECT 
         CONVERT(VARCHAR(20),a.[fecha_creacion],120) AS fecha_creacion
        ,LEFT(CONVERT(VARCHAR(20),a.[fecha_corte],120),10) AS fecha_corte
        ,a.[prt_client_id]
        ,a.[wh_id]
        ,b.nombre AS wh_nombre
        ,a.[prtnum]
        ,c.nombre AS prt_nombre
        ,a.[invsts]
        ,COALESCE(a.[lotnum],'') AS [lotnum]
        ,LEFT(COALESCE(CONVERT(VARCHAR(120),a.expire_dte,120),''),10) AS expire_dte
        ,a.[untqty]
        ,COALESCE(d.codigo_alterno,'') AS bodega_sap_codigo
        ,COALESCE(d.bodega_cliente_nombre,'') AS bodega_sap_nombre
    FROM cte_00 a
    INNER JOIN eWms.dbo.bodegas b ON
        b.wh_id = a.wh_id
    INNER JOIN eWms.dbo.productos c ON
        c.prt_client_id = a.prt_client_id
    AND c.prtnum = a.prtnum
    LEFT OUTER JOIN cte_01 d ON
        d.id_bodega = b.id_bodega
    AND d.id_estado_inventario = a.invsts
    AND d.orden = 1

END
