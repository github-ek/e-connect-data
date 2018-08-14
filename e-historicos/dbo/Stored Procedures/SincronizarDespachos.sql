CREATE PROCEDURE dbo.SincronizarDespachos
AS
BEGIN TRY
	DECLARE @fecha_desde DATETIME
	DECLARE @fecha_hasta DATETIME

    EXECUTE dbo.GetFechasIntegracion 'DESPACHOS', @fecha_desde OUTPUT, @fecha_hasta OUTPUT

    --CORTE
    BEGIN
        IF OBJECT_ID('tempdb..#corte') IS NOT NULL BEGIN
	        DROP TABLE #corte
        END

        SELECT
             CAST('DESPACHOS' AS VARCHAR(50)) AS integracion 
            ,@fecha_desde AS fecha_ultima_sincronizacion
            ,@fecha_hasta AS fecha_sincronizacion
        INTO #corte

        --SELECT
        --     CAST('DESPACHOS' AS VARCHAR(50)) AS integracion 
        --    ,CAST('2018-01-01' AS DATETIME) AS fecha_ultima_sincronizacion
        --    ,CAST(GETDATE() AS DATETIME) AS fecha_sincronizacion
        --INTO #corte
    END

	--CONSOLIDACION #source_shipment: Del origen, se toman los registros nuevos y/o modificados recientemente y aquellos que crucen contra el target (ABIERTAS en el destino)
	BEGIN
        IF OBJECT_ID('tempdb..#source_shipment') IS NOT NULL BEGIN
			DROP TABLE #source_shipment
		END

		;WITH
		cte_00 AS
		(
            SELECT DISTINCT 
                b.ship_id
            FROM #corte a
            INNER JOIN [$(ttcwmsprd)].dbo.shipment b ON
                b.moddte >= a.fecha_ultima_sincronizacion
            WHERE
                b.shpsts IN ('C')
        ),
		cte_01 AS
		(
            SELECT DISTINCT 
                b.ship_id
            FROM #corte a
            INNER JOIN [$(ttcwmsprd)].dbo.shipment_line b ON
                b.moddte >= a.fecha_ultima_sincronizacion
            INNER JOIN [$(ttcwmsprd)].dbo.shipment c ON
                c.ship_id = b.ship_id
            WHERE
                c.shpsts IN ('C')
        ),
        cte_02 AS
        (
		    SELECT
                a.ship_id
		    FROM cte_00 a
            UNION
		    SELECT
                a.ship_id
		    FROM cte_01 a
        )
		SELECT
			a.ship_id
		INTO #source_shipment
        FROM cte_02 a
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
                 CAST(a.colval AS NVARCHAR(1)) AS shpsts
                ,UPPER(CAST(a.lngdsc AS NVARCHAR(100))) AS arg0 
            FROM [$(ttcwmsprd)].dbo.dscmst a
            WHERE 
                colnam = 'shpsts' 
            AND locale_id = 'ES-ES'
        )
        SELECT
             z.integracion
            ,CAST(b.ship_id AS VARCHAR(200)) AS id_externo
            ,CAST(b.shpsts AS VARCHAR(50)) AS estado_externo
            ,CAST('NO_PROCESADO' AS VARCHAR(50)) AS estado_actualizacion
            ,0 AS entradas_en_cola
            ,COALESCE(c.arg0,'') AS arg0
            ,z.fecha_sincronizacion AS fecha_creacion
            ,z.fecha_sincronizacion AS fecha_modificacion
            ,0 AS existe_actualizacion
        INTO #source
        FROM #source_shipment a
        INNER JOIN [$(ttcwmsprd)].dbo.shipment b ON 
            b.ship_id = a.ship_id
        LEFT OUTER JOIN cte_00 c ON 
            c.shpsts = b.shpsts
        ,#corte z
        WHERE
            b.shpsts IN ('C')

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
            ,fecha_creacion
            ,fecha_modificacion)
        SELECT
             integracion
            ,id_externo
            ,estado_externo
            ,estado_actualizacion
            ,entradas_en_cola
            ,arg0
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
	ROLLBACK TRANSACTION
    ;THROW;
END CATCH