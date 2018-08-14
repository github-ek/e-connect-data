CREATE PROCEDURE [dbo].[SincronizarEwmsMaestroUbicaciones]
AS
BEGIN TRY
    
    --CONSOLIDAR SOURCE
    BEGIN
        IF OBJECT_ID('tempdb..#source') IS NOT NULL BEGIN
            DROP TABLE #source
        END

        SELECT 
            a.*
        INTO #source
        FROM [$(WMS_DB_SERVER)].[$(eHistoricos)].dbo.ubicaciones a
        WHERE   
            a.cambio_notificado = 0
    END

    --CONSOLIDAR TARGET
    BEGIN
        IF OBJECT_ID('tempdb..#target') IS NOT NULL BEGIN
            DROP TABLE #target
        END

        ;WITH
        cte_00 AS
        (
            SELECT
                 a.id
                ,CASE 
                WHEN b.id_bodega IS NOT NULL  AND a.operacion IN ('C') THEN 'U'
                WHEN b.id_bodega IS NULL      AND a.operacion IN ('U') THEN 'C'
                ELSE a.operacion END AS operacion

                ,a.wh_id
                ,a.arecod
                ,a.stoloc
                ,a.wrkzon
                ,a.last_upd_dt
                ,a.last_upd_user_id

                ,COALESCE(a.last_upd_user_id,'') AS usuario_modificacion
                ,CAST(COALESCE(a.last_upd_dt,SYSDATETIME()) AS DATETIME2(0)) AS fecha_modificacion

                ,b.id_bodega
            FROM #source a
            LEFT OUTER JOIN [$(eConnect)].dbo.bodegas b ON
                b.codigo = a.wh_id
        )
        SELECT
            a.*

            ,CAST(1 AS BIT) AS activo
            ,0 AS [version]
        INTO #target
        FROM cte_00 a
    END

    --DETECTAR INCONSISTENCIAS   
    BEGIN
        IF OBJECT_ID('tempdb..#inconsistencias') IS NOT NULL BEGIN
	        DROP TABLE #inconsistencias
        END

        ;WITH
        cte_00 AS
        (
            SELECT
                 a.*

                ,CASE WHEN a.id_bodega IS NULL THEN 1 ELSE 0 END AS bodega_no_existe
            FROM #target a
        )
        SELECT
            a.*
        INTO #inconsistencias
        FROM cte_00 a
        WHERE
            bodega_no_existe > 0

        --TODO enviar errores a una tabla de error en errores
        DELETE a
        FROM #target a
        INNER JOIN #inconsistencias b ON
            b.id = a.id
    END

    BEGIN TRANSACTION
    --ACTUALIZAR TARGET
    BEGIN
        MERGE dbo.ubicaciones AS t
        USING #target AS s ON 
            s.id = t.id
        WHEN NOT MATCHED BY TARGET THEN
		    INSERT
		    (id
            ,operacion
            ,fecha_creacion
            ,fecha_modificacion

            ,id_bodega
            ,wh_id
            ,arecod
            ,stoloc
            ,wrkzon
            ,last_upd_dt
            ,last_upd_user_id)
		    VALUES
		    (id
            ,operacion
            ,fecha_modificacion
            ,fecha_modificacion

            ,id_bodega
            ,wh_id
            ,arecod
            ,stoloc
            ,wrkzon
            ,last_upd_dt
            ,last_upd_user_id)
        WHEN MATCHED THEN
		    UPDATE SET 
		     t.operacion = s.operacion
            ,t.fecha_modificacion = s.fecha_modificacion
            ,t.id_bodega = s.id_bodega
            ,t.wh_id = s.wh_id
            ,t.arecod = s.arecod
            ,t.stoloc = s.stoloc
            ,t.wrkzon = s.wrkzon
            ,t.last_upd_dt = s.last_upd_dt
            ,t.last_upd_user_id = s.last_upd_user_id
        ;
    END

	COMMIT TRANSACTION

    UPDATE a
    SET a.cambio_notificado = 1
    FROM [$(WMS_DB_SERVER)].[$(eHistoricos)].dbo.ubicaciones a
    INNER JOIN #source b ON
        b.id = a.id
END TRY
BEGIN CATCH
    SELECT ERROR_MESSAGE()
    IF @@TRANCOUNT > 0 BEGIN
	    ROLLBACK TRANSACTION
    END
    ;THROW;
END CATCH