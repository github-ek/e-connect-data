CREATE PROCEDURE [dbo].[SincronizarOrdenesDeEntrada]
AS
BEGIN TRY
    SET NOCOUNT ON;

	BEGIN TRANSACTION

    BEGIN
        IF OBJECT_ID('tempdb..#source') IS NOT NULL BEGIN
            DROP TABLE #source
        END

        SELECT 
            a.*
        INTO #source
        FROM [$(WMS_DB_SERVER)].[$(eHistoricos)].dbo.entradas a
        WHERE   
            a.cambio_notificado = 0


        ;WITH
        cte_00 AS
        (
            SELECT DISTINCT
                a.order_key
            FROM #source a
        )
        DELETE b
        FROM cte_00 a
        INNER JOIN [$(eWms)].dbo.entradas b ON
            b.order_key = a.order_key

        INSERT INTO [$(eWms)].dbo.entradas
            (id
            ,order_key
            ,line_key
            ,operacion
            ,estado
            ,cambio_notificado
            ,cerrada_con_errores
            ,fecha_creacion
            ,fecha_modificacion
            ,client_id
            ,wh_id
            ,supnum
            ,invnum
            ,trknum
            ,po_num
            ,invtyp
            ,invdte
            ,moddte
            ,mod_usr_id
            ,invlin
            ,invsln
            ,seqnum
            ,prtnum
            ,rcvsts
            ,expqty
            ,rcvqty
            ,lotnum
            ,mandte
            ,expire_dte
            ,inv_attr_str7
            ,rcvkey
            ,edtflg
            ,blind_flg
            ,rcvlin_moddte
            ,rcvlin_mod_usr_id
            ,rcvtrk_stat
            ,devcod
            ,rcvtrk_clsdte
            ,rcvtrk_moddte
            ,rcvtrk_mod_usr_id
            ,trlr_id
            ,trlr_num
            ,trlr_stat
            ,trlr_typ
            ,trlr_size
            ,refrig_flg
            ,trlr_cod
            ,trlr_cond
            ,safe_sts
            ,carcod
            ,tractor_num
            ,driver_nam
            ,driver_lic_num
            ,arrdte
            ,close_dte
            ,dispatch_dte
            ,trlr_seal1
            ,trlr_seal2
            ,trlr_seal3
            ,trlr_seal4
            ,trlr_moddte
            ,trlr_mod_usr_id)
        SELECT
             id
            ,order_key
            ,line_key
            ,operacion
            ,estado
            ,cambio_notificado
            ,CAST(0 AS BIT) AS cerrada_con_errores
            ,fecha_creacion
            ,fecha_modificacion
            ,client_id
            ,wh_id
            ,supnum
            ,invnum
            ,trknum
            ,po_num
            ,invtyp
            ,invdte
            ,moddte
            ,mod_usr_id
            ,invlin
            ,invsln
            ,seqnum
            ,prtnum
            ,rcvsts
            ,expqty
            ,rcvqty
            ,lotnum
            ,mandte
            ,expire_dte
            ,inv_attr_str7
            ,rcvkey
            ,edtflg
            ,blind_flg
            ,rcvlin_moddte
            ,rcvlin_mod_usr_id
            ,rcvtrk_stat
            ,devcod
            ,rcvtrk_clsdte
            ,rcvtrk_moddte
            ,rcvtrk_mod_usr_id
            ,trlr_id
            ,trlr_num
            ,trlr_stat
            ,trlr_typ
            ,trlr_size
            ,refrig_flg
            ,trlr_cod
            ,trlr_cond
            ,safe_sts
            ,carcod
            ,tractor_num
            ,driver_nam
            ,driver_lic_num
            ,arrdte
            ,close_dte
            ,dispatch_dte
            ,trlr_seal1
            ,trlr_seal2
            ,trlr_seal3
            ,trlr_seal4
            ,trlr_moddte
            ,trlr_mod_usr_id
        FROM #source

    END

    COMMIT TRANSACTION

    UPDATE a
    SET a.cambio_notificado = 1
    FROM [$(WMS_DB_SERVER)].[$(eHistoricos)].dbo.entradas a
    INNER JOIN #source b ON
        b.id = a.id

END TRY
BEGIN CATCH
    SELECT ERROR_MESSAGE()
	ROLLBACK TRANSACTION
    ;THROW;
END CATCH