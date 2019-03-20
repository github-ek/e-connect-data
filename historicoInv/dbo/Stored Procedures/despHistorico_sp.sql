CREATE PROCEDURE [dbo].[despHistorico_sp] AS
SET NOCOUNT ON;
BEGIN
    BEGIN
        IF OBJECT_ID('tempdb..#shipment_line') IS NOT NULL BEGIN
            DROP TABLE #shipment_line
        END

        ;WITH
        cte_00 AS
        (
            SELECT
                a.trlr_num,
                b.client_id,
                b.wh_id,
                b.ordnum,
                c.prtnum,
                MAX(CAST(a.loddte AS DATE)) AS loddte,
                SUM(b.shpqty) AS shpqty
            FROM [$(ttcwmsprd)].dbo.ship_struct_view a
            INNER JOIN [$(ttcwmsprd)].dbo.shipment_line b ON 
                b.ship_id = a.ship_id
            INNER JOIN [$(ttcwmsprd)].dbo.ord_line c ON
                c.client_id = b.client_id
            AND c.wh_id = b.wh_id
            AND c.ordnum = b.ordnum
            AND c.ordlin = b.ordlin
            AND c.ordsln = b.ordsln
            WHERE 
                a.shpsts = 'C'
            AND CAST(a.loddte AS DATE) >= CAST(GETDATE() - 5 AS DATE)
            GROUP BY
                a.trlr_num,
                b.client_id,
                b.wh_id,
                b.ordnum,
                c.prtnum
        )
        SELECT
            *
        INTO #shipment_line
        FROM cte_00 a
    END

    BEGIN
        IF OBJECT_ID('tempdb..#ord_line') IS NOT NULL BEGIN
            DROP TABLE #ord_line
        END

        ;WITH
        cte_00 AS
        (
            SELECT DISTINCT
                a.client_id,
                a.wh_id,
                a.ordnum
            FROM #shipment_line a
        )
        SELECT
            a.client_id,
            a.wh_id,
            a.ordnum,
            a.prtnum,
            SUM(a.ordqty) AS ordqty,
		    MAX(COALESCE(a.pckgr3,'')) AS pckgr3
        INTO #ord_line
        FROM [$(ttcwmsprd)].dbo.ord_line a
        INNER JOIN cte_00 b ON 
            b.client_id = a.client_id
        AND b.wh_id = a.wh_id
        AND b.ordnum = a.ordnum
        GROUP BY 
            a.client_id,
            a.wh_id,
            a.ordnum,
            a.prtnum
    END

    BEGIN
        IF OBJECT_ID('tempdb..#despachos_hist') IS NOT NULL BEGIN
            DROP TABLE #despachos_hist
        END

        SELECT
            COALESCE(b.trlr_num,'') AS trlr_num,
            COALESCE(a.client_id,b.client_id) AS client_id,
            COALESCE(a.wh_id,b.wh_id) AS wh_id,
            COALESCE(a.ordnum,b.ordnum) AS ordnum,
            COALESCE(a.pckgr3,'') AS pckgr3,
            COALESCE(a.prtnum,b.prtnum) AS prtnum,
            COALESCE(a.ordqty,0) AS ordqty,
            COALESCE(b.shpqty,0) AS shpqty,
            b.loddte
        INTO #despachos_hist
        FROM #ord_line a
        FULL OUTER JOIN #shipment_line b ON
            b.client_id = a.client_id
        AND b.ordnum = a.ordnum
        AND b.prtnum = a.prtnum
    END        

    BEGIN TRY
        BEGIN TRANSACTION

        ;WITH
        cte_00 AS
        (
            SELECT DISTINCT
                client_id, wh_id, ordnum
            FROM #despachos_hist a
        )
        DELETE a
        FROM dbo.despachos_Hist a
        INNER JOIN cte_00 b ON
            b.client_id = a.client_id
        AND b.wh_id = a.wh_id
        AND b.ordnum = a.ordnum

        INSERT INTO dbo.despachos_Hist 
            (trlr_num
            ,client_id
            ,wh_id
            ,ordnum
            ,pckgr3
            ,prtnum
            ,ordqty
            ,shpqty
            ,loddte)
        SELECT
             trlr_num
            ,client_id
            ,wh_id
            ,ordnum
            ,pckgr3
            ,prtnum
            ,ordqty
            ,shpqty
            ,loddte
        FROM #despachos_hist

        COMMIT TRANSACTION
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION
    END CATCH

    --INSERT INTO dbo.despachos_Hist (trlr_num, client_id, wh_id, loddte, ordnum, prtnum, ordqty, shpqty, pckgr3)
--select ship_struct_view.trlr_num,
--        shipment_line.client_id cliente,
--        shipment_line.wh_id almacen,
--        cast(ship_struct_view.loddte as date) "fecha despacho",
--        shipment_line.ordnum Orden,
--        ord_line.prtnum producto,
--        sum(ord_line.ordqty) as Pedida,
--        sum(shipment_line.shpqty) as Despachado,
--		ord_line.pckgr3
--   from [$(ttcwmsprd)].dbo.shipment_line
--   left
--   join [$(ttcwmsprd)].dbo.ship_struct_view
--     on ship_struct_view.ship_id = shipment_line.ship_id
--   full outer
--   join [$(ttcwmsprd)].dbo.ord_line
--     on ord_line.ordnum = shipment_line.ordnum
--    and ord_line.ordlin = shipment_line.ordlin
--    and ord_line.ordsln = shipment_line.ordsln
--    and ord_line.client_id = shipment_line.client_id
--  where ship_struct_view.shpsts = 'C'
--    and CONVERT(date, ship_struct_view.loddte) < CONVERT(date, getdate())
--  group by ship_struct_view.trlr_num,
--        shipment_line.client_id,
--        shipment_line.wh_id,
--        ship_struct_view.loddte,
--        shipment_line.ordnum,
--        ord_line.prtnum,
--		ord_line.pckgr3
--  order by ship_struct_view.loddte,
--        ship_struct_view.trlr_num,
--        shipment_line.client_id,
--        shipment_line.wh_id
END

