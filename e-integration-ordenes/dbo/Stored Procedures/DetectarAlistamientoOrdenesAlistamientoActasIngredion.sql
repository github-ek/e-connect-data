
CREATE PROCEDURE DetectarAlistamientoOrdenesAlistamientoActasIngredion
AS
BEGIN
    BEGIN
        IF OBJECT_ID('tempdb..#base') IS NOT NULL BEGIN
            DROP TABLE #base
        END

        SELECT
             a.*
        INTO #base
        FROM dbo.ActasIngredionEnStage() a

        IF OBJECT_ID('tempdb..#invdtl') IS NOT NULL BEGIN
            DROP TABLE #invdtl
        END

        SELECT 
             a.suscripcion
            ,a.id_externo

            ,a.ordnum
            ,a.wh_id
            ,a.client_id
            ,a.stgdte
            ,b.rmanum

            ,d.prtnum
            ,d.ftpcod
            ,d.orgcod
            ,d.invsts
            ,d.lotnum
            ,d.expire_dte

            ,SUM(d.untqty) AS untqty
            ,MAX(d.untcas) AS untcas
            ,SUM(CAST(d.untqty AS DEC(23,8)) / CAST(CASE WHEN d.untcas = 0 THEN NULL ELSE d.untcas END AS DEC(23,8))) empaques
            ,CAST(NULL AS DEC(23,8)) AS peso_empaques
            ,CAST(NULL AS DEC(23,8)) AS volumen_empaques
        INTO #invdtl
        FROM #base a
        INNER JOIN [$(ttcwmsprd)].dbo.ord b ON
            b.ordnum = a.ordnum
        AND b.wh_id = a.wh_id
        AND b.client_id = a.client_id
        INNER JOIN [$(ttcwmsprd)].dbo.shipment_line c ON
            c.ordnum = a.ordnum
        AND c.wh_id = a.wh_id
        AND c.client_id = a.client_id
        INNER JOIN [$(ttcwmsprd)].dbo.invdtl d ON 
            d.ship_line_id = c.ship_line_id
        GROUP BY
             a.suscripcion
            ,a.id_externo

            ,a.ordnum
            ,a.wh_id
            ,a.client_id
            ,a.stgdte
            ,b.rmanum

            ,d.prtnum
            ,d.ftpcod
            ,d.orgcod
            ,d.invsts
            ,d.lotnum
            ,d.expire_dte

        UPDATE a
        SET  a.peso_empaques = a.empaques * b.grswgt
            ,a.volumen_empaques = a.empaques * b.[len] * b.[wid] * b.[hgt]
        FROM #invdtl a
        LEFT OUTER JOIN [$(ttcwmsprd)].dbo.prtftp_dtl b ON 
            b.wh_id = a.wh_id
        AND b.prt_client_id = a.client_id
        AND b.prtnum = a.prtnum
        AND b.ftpcod = a.ftpcod
        and b.cas_flg = 1
    END

    BEGIN TRY
        BEGIN TRANSACTION

        INSERT INTO dbo.solicitudes_actas_ingredion_lineas_alistadas
            (suscripcion
            ,id_externo

            ,ordnum
            ,wh_id
            ,client_id
            ,stgdte
            ,rmanum

            ,prtnum
            ,orgcod
            ,invsts
            ,lotnum
            ,expire_dte
            ,untqty
            ,untcas
            ,empaques
            ,peso_empaques
            ,volumen_empaques)
        SELECT
             suscripcion
            ,id_externo

            ,ordnum
            ,wh_id
            ,client_id
            ,stgdte
            ,rmanum

            ,prtnum
            ,orgcod
            ,invsts
            ,lotnum
            ,expire_dte
            ,untqty
            ,untcas
            ,empaques
            ,peso_empaques
            ,volumen_empaques
        FROM #invdtl

        UPDATE a
        SET
             a.estado_suscripcion = 'ORDEN_ALISTAMIENTO_EN_STAGE'
        FROM dbo.suscripciones a
        INNER JOIN #base b ON
            b.suscripcion = a.suscripcion
        AND b.id_externo = a.id_externo

        COMMIT TRANSACTION
    END TRY
    BEGIN CATCH
        IF (@@TRANCOUNT > 0) BEGIN
            ROLLBACK TRANSACTION
        END
        ;THROW
    END CATCH
END