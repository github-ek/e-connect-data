CREATE PROCEDURE [dbo].[SincronizarOrdenesDeSalida]
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
        FROM [$(WMS_DB_SERVER)].[$(eHistoricos)].dbo.salidas a
        WHERE   
            a.cambio_notificado = 0


        ;WITH
        cte_00 AS
        (
            SELECT DISTINCT
                a.client_id,a.ordnum 
            FROM #source a
        )
        DELETE b
        FROM cte_00 a
        INNER JOIN [$(eWms)].dbo.salidas b ON
            b.client_id = a.client_id
        AND b.ordnum = a.ordnum

        INSERT INTO [$(eWms)].dbo.salidas
            (id
            ,operacion
            ,estado
            ,cambio_notificado
            ,cerrada_con_errores
            ,fecha_creacion
            ,fecha_modificacion
            ,client_id
            ,wh_id
            ,ordnum
            ,rmanum
            ,ordtyp
            ,bus_grp
            ,stcust
            ,wave_flg
            ,adddte
            ,moddte
            ,mod_usr_id
            ,ordlin
            ,prtnum
            ,invsts_prg
            ,ordqty
            ,shpqty
            ,remqty
            ,ordlin_moddte
            ,ordlin_mod_usr_id
            ,canpck_candte
            ,canpck_can_usr_id)
        SELECT
             id
            ,operacion
            ,estado
            ,cambio_notificado
            ,CAST(0 AS BIT) AS cerrada_con_errores
            ,fecha_creacion
            ,fecha_modificacion
            ,client_id
            ,wh_id
            ,ordnum
            ,rmanum
            ,ordtyp
            ,bus_grp
            ,stcust
            ,wave_flg
            ,adddte
            ,moddte
            ,mod_usr_id
            ,ordlin
            ,prtnum
            ,invsts_prg
            ,ordqty
            ,shpqty
            ,remqty
            ,ordlin_moddte
            ,ordlin_mod_usr_id
            ,canpck_candte
            ,canpck_can_usr_id
        FROM #source

    END

    COMMIT TRANSACTION

    UPDATE a
    SET a.cambio_notificado = 1
    FROM [$(WMS_DB_SERVER)].[$(eHistoricos)].dbo.salidas a
    INNER JOIN #source b ON
        b.id = a.id

END TRY
BEGIN CATCH
    SELECT ERROR_MESSAGE()
	ROLLBACK TRANSACTION
    ;THROW;
END CATCH