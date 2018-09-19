CREATE PROCEDURE [dbo].[SincronizarAlistamientos]
AS
BEGIN TRY
	DECLARE @fecha_desde DATETIME
	DECLARE @fecha_hasta DATETIME

    EXECUTE dbo.GetFechasIntegracion 'ALISTAMIENTOS', @fecha_desde OUTPUT, @fecha_hasta OUTPUT

    --CORTE
    BEGIN
        IF OBJECT_ID('tempdb..#corte') IS NOT NULL BEGIN
	        DROP TABLE #corte
        END

        SELECT
             CAST('ALISTAMIENTOS' AS VARCHAR(50)) AS integracion 
            ,DATEADD(HOUR,-1,@fecha_desde) AS fecha_ultima_sincronizacion
            ,@fecha_hasta AS fecha_sincronizacion
        INTO #corte

        --SELECT
        --     CAST('ALISTAMIENTOS' AS VARCHAR(50)) AS integracion 
        --    ,CAST('2018-01-01' AS DATETIME) AS fecha_ultima_sincronizacion
        --    ,CAST(GETDATE() AS DATETIME) AS fecha_sincronizacion
        --INTO #corte
    END

	--CONSOLIDACION #source_shipment: Del origen, se toman los registros nuevos y/o modificados recientemente y aquellos que crucen contra el target (ABIERTAS en el destino)
	BEGIN
        IF OBJECT_ID('tempdb..#source_ord') IS NOT NULL BEGIN
			DROP TABLE #source_ord
		END

        SELECT DISTINCT
             b.client_id
            ,b.wh_id
            ,b.ordnum
        INTO #source_ord
        FROM #corte a
        INNER JOIN [$(ttcwmsprd)].dbo.ord b ON
           b.entdte >= a.fecha_ultima_sincronizacion
        OR b.moddte >= a.fecha_ultima_sincronizacion

        IF OBJECT_ID('tempdb..#source_ord_line') IS NOT NULL BEGIN
			DROP TABLE #source_ord_line
		END

        SELECT DISTINCT
             b.client_id
            ,b.wh_id
            ,b.ordnum
        INTO #source_ord_line
        FROM #corte a
        INNER JOIN [$(ttcwmsprd)].dbo.ord_line b ON
           b.entdte >= a.fecha_ultima_sincronizacion
        OR b.moddte >= a.fecha_ultima_sincronizacion
        LEFT OUTER JOIN #source_ord z ON
            z.client_id = b.client_id
        AND z.wh_id = b.wh_id
        AND z.ordnum = b.ordnum
        WHERE
            z.ordnum IS NULL

        IF OBJECT_ID('tempdb..#source_canpck') IS NOT NULL BEGIN
			DROP TABLE #source_canpck
		END

        SELECT DISTINCT
             b.client_id
            ,b.wh_id
            ,b.ordnum
        INTO #source_canpck
        FROM #corte a
        INNER JOIN [$(ttcwmsprd)].dbo.canpck b ON
            b.adddte >= a.fecha_ultima_sincronizacion
        OR  b.candte >= a.fecha_ultima_sincronizacion
        INNER JOIN dbo.causales_cancelacion_alistamientos c ON
            c.cancod = b.cancod
        LEFT OUTER JOIN #source_ord z ON
            z.client_id = b.client_id
        AND z.wh_id = b.wh_id
        AND z.ordnum = b.ordnum
        WHERE
            z.ordnum IS NULL
        AND b.client_id IS NOT NULL
        AND b.ordnum IS NOT NULL
    END

    --CONSOLIDACION SOURCE
    BEGIN
        IF OBJECT_ID('tempdb..#source') IS NOT NULL BEGIN
            DROP TABLE #source
        END

		;WITH
		cte_00 AS
		(
		    SELECT
                a.client_id,a.ordnum,a.wh_id
		    FROM #source_ord a
            UNION
		    SELECT
                a.client_id,a.ordnum,a.wh_id
		    FROM #source_ord_line a
            UNION
		    SELECT
                a.client_id,a.ordnum,a.wh_id
		    FROM #source_canpck a
        )
        SELECT
             z.integracion
            ,CAST(CONCAT(a.client_id,'|',a.ordnum,'|',a.wh_id) AS VARCHAR(200)) AS id_externo
            ,CAST('' AS VARCHAR(50)) AS estado_externo
            ,CAST('NO_PROCESADO' AS VARCHAR(50)) AS estado_actualizacion
            ,0 AS entradas_en_cola
            ,COALESCE(a.client_id,'') AS arg0
            ,COALESCE(a.ordnum,'') AS arg1
            ,COALESCE(a.wh_id,'') AS arg2
            ,z.fecha_sincronizacion AS fecha_creacion
            ,z.fecha_sincronizacion AS fecha_modificacion
            ,0 AS existe_actualizacion
        INTO #source
        FROM cte_00 a
        ,#corte z

        CREATE UNIQUE INDEX ix_source_01 ON #source(id_externo)

        UPDATE a
        SET  a.existe_actualizacion = 1
        FROM #source a
        INNER JOIN dbo.integraciones_actualizaciones b ON
            b.integracion = a.integracion
        AND b.id_externo = a.id_externo
    END
    
    --MERGE: Los cambios se detectan teniendo en cuenta unicamente las fechas de modificacion.
    BEGIN TRANSACTION

    BEGIN
        UPDATE a
        SET  a.entradas_en_cola = a.entradas_en_cola + 1
            ,a.[version] = a.[version] + 1
            ,a.fecha_modificacion = a.fecha_modificacion
        FROM dbo.integraciones_actualizaciones a
        INNER JOIN #source b ON
            b.integracion = a.integracion
        AND b.id_externo = a.id_externo
        AND b.existe_actualizacion = 1

        INSERT INTO dbo.integraciones_actualizaciones
            (integracion
            ,id_externo
            ,estado_externo
            ,estado_actualizacion
            ,entradas_en_cola
            ,arg0
            ,arg1
            ,arg2
            ,fecha_creacion
            ,fecha_modificacion)
        SELECT
             integracion
            ,id_externo
            ,estado_externo
            ,estado_actualizacion
            ,entradas_en_cola
            ,arg0
            ,arg1
            ,arg2
            ,fecha_creacion
            ,fecha_modificacion
        FROM #source a
        WHERE
            a.existe_actualizacion = 0
    END

	COMMIT TRANSACTION
END TRY
BEGIN CATCH
    SELECT ERROR_MESSAGE()
    IF @@TRANCOUNT > 0 BEGIN
	    ROLLBACK TRANSACTION
    END
    ;THROW;
END CATCH