CREATE PROCEDURE [dbo].[SincronizarEmbarques]
AS
BEGIN TRY
    SET NOCOUNT ON;

    BEGIN
        IF OBJECT_ID('tempdb..#source_lineas') IS NOT NULL BEGIN
            DROP TABLE #source_lineas
        END

        SELECT 
             a.*

            ,line_key
            ,ship_line_id
            ,dtlnum
            ,client_id
            ,wh_id
            ,ordnum
            ,ordlin
            ,prtnum
            ,linsts
            ,shpqty
            ,lotnum
            ,invsts
            ,untqty
            ,moddte
            ,mod_usr_id
        INTO #source_lineas
        FROM [$(WMS_DB_SERVER)].[$(eHistoricos)].dbo.embarques a
        LEFT OUTER JOIN [$(WMS_DB_SERVER)].[$(eHistoricos)].dbo.embarques_lineas b ON
            b.record_key = a.record_key
        WHERE   
            a.cambio_notificado = 0

        CREATE INDEX ix_source_01 ON #source_lineas(record_key)

        IF OBJECT_ID('tempdb..#source') IS NOT NULL BEGIN
            DROP TABLE #source
        END
        
        SELECT DISTINCT
             id
            ,record_key
            ,operacion
            ,estado
            ,cambio_notificado
            ,CAST(0 AS BIT) AS cerrada_con_errores
            ,fecha_creacion
            ,fecha_modificacion

            ,ship_id
            ,shpsts
            ,shipment_moddte
            ,shipment_mod_usr_id
            ,trlr_id
            ,trlr_stat
            ,trlr_typ
            ,trlr_seal1
            ,trlr_seal2
            ,trlr_seal3
            ,trlr_seal4
            ,driver_nam
            ,driver_lic_num
            ,tractor_num
            ,arrdte
            ,close_dte
            ,dispatch_dte
            ,trlr_moddte
            ,trlr_mod_usr_id
        INTO #source
        FROM #source_lineas 
    
        CREATE UNIQUE INDEX ix_source_01 ON #source(record_key)
    END

	BEGIN TRANSACTION

    BEGIN

        DELETE a
        FROM dbo.embarques a
        INNER JOIN #source b ON
            b.record_key = a.record_key

        DELETE a
        FROM dbo.embarques_lineas a
        INNER JOIN #source b ON
            b.record_key = a.record_key

        INSERT INTO dbo.embarques
            (record_key
            ,operacion
            ,estado
            ,cambio_notificado
            ,cerrada_con_errores
            ,fecha_creacion
            ,fecha_modificacion

            ,ship_id
            ,shpsts
            ,shipment_moddte
            ,shipment_mod_usr_id
            ,trlr_id
            ,trlr_stat
            ,trlr_typ
            ,trlr_seal1
            ,trlr_seal2
            ,trlr_seal3
            ,trlr_seal4
            ,driver_nam
            ,driver_lic_num
            ,tractor_num
            ,arrdte
            ,close_dte
            ,dispatch_dte
            ,trlr_moddte
            ,trlr_mod_usr_id)
        SELECT
             record_key
            ,operacion
            ,estado
            ,cambio_notificado
            ,cerrada_con_errores
            ,fecha_creacion
            ,fecha_modificacion

            ,ship_id
            ,shpsts
            ,shipment_moddte
            ,shipment_mod_usr_id
            ,trlr_id
            ,trlr_stat
            ,trlr_typ
            ,trlr_seal1
            ,trlr_seal2
            ,trlr_seal3
            ,trlr_seal4
            ,driver_nam
            ,driver_lic_num
            ,tractor_num
            ,arrdte
            ,close_dte
            ,dispatch_dte
            ,trlr_moddte
            ,trlr_mod_usr_id
        FROM #source

        INSERT INTO dbo.embarques_lineas
            (record_key
            ,line_key
            ,ship_id
            ,ship_line_id
            ,dtlnum
            ,client_id
            ,wh_id
            ,ordnum
            ,ordlin
            ,prtnum
            ,linsts
            ,shpqty
            ,lotnum
            ,invsts
            ,untqty
            ,moddte
            ,mod_usr_id)
        SELECT
             record_key
            ,line_key
            ,ship_id
            ,ship_line_id
            ,dtlnum
            ,client_id
            ,wh_id
            ,ordnum
            ,ordlin
            ,prtnum
            ,linsts
            ,shpqty
            ,lotnum
            ,invsts
            ,untqty
            ,moddte
            ,mod_usr_id
        FROM #source_lineas
        WHERE
            ship_line_id IS NOT NULL
    END

    COMMIT TRANSACTION

    --ACTUALIZAR SOURCE
    BEGIN
        WHILE 1 = 1 
        BEGIN
            IF OBJECT_ID('tempdb..#notificados') IS NOT NULL BEGIN
                DROP TABLE #notificados
            END

            SELECT DISTINCT
                record_key,fecha_modificacion
            INTO #notificados
            FROM #source a
            WHERE 
                cambio_notificado = 0
            ORDER BY record_key
            OFFSET 0 ROWS
            FETCH NEXT 1000 ROWS ONLY;
            
            IF @@ROWCOUNT = 0 BREAK

            BEGIN TRY
                UPDATE a
                SET a.cambio_notificado = 1
                FROM [$(WMS_DB_SERVER)].[$(eHistoricos)].dbo.embarques a
                INNER JOIN #notificados b ON
                    b.record_key = a.record_key
                AND b.fecha_modificacion = a.fecha_modificacion
                WHERE
                    a.cambio_notificado = 0
            END TRY
            BEGIN CATCH
                NOOP:
            END CATCH

            UPDATE a
            SET a.cambio_notificado = 1
            FROM #source a
            INNER JOIN #notificados b ON
                b.record_key = a.record_key
            AND b.fecha_modificacion = a.fecha_modificacion
            WHERE
                a.cambio_notificado = 0
        END
    END

END TRY
BEGIN CATCH
    SELECT ERROR_MESSAGE()
    IF @@TRANCOUNT > 0 BEGIN
	    ROLLBACK TRANSACTION
    END
    ;THROW;
END CATCH