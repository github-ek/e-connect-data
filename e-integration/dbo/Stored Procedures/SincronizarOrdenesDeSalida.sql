CREATE PROCEDURE [dbo].[SincronizarOrdenesDeSalida]
AS
BEGIN TRY
    SET NOCOUNT ON;

	BEGIN TRANSACTION

    BEGIN
        IF OBJECT_ID('tempdb..#source') IS NOT NULL BEGIN
            DROP TABLE #source
        END

        ;WITH
        cte_00 AS
        (
            SELECT DISTINCT
                a.record_key
            FROM [$(WMS_DB_SERVER)].[$(eHistoricos)].dbo.ordenes_salida a
            WHERE   
                a.cambio_notificado = 0
        )
        SELECT 
            a.*
        INTO #source
        FROM [$(WMS_DB_SERVER)].[$(eHistoricos)].dbo.ordenes_salida a
        INNER JOIN cte_00 b ON
            b.record_key = a.record_key

        ;WITH
        cte_00 AS
        (
            SELECT DISTINCT
                a.record_key
            FROM #source a
        )
        DELETE b
        FROM cte_00 a
        INNER JOIN [$(eWms)].dbo.ordenes_salida b ON
            b.record_key = a.record_key

        INSERT INTO [$(eWms)].dbo.ordenes_salida
            (id
            ,record_key
            ,line_key
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
            ,record_key
            ,line_key
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
                FROM [$(WMS_DB_SERVER)].[$(eHistoricos)].dbo.ordenes_salida a
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
	ROLLBACK TRANSACTION
    ;THROW;
END CATCH