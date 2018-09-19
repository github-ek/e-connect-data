CREATE PROCEDURE [dbo].[SincronizarMaestroProductos]
AS
BEGIN TRY
	DECLARE @fecha_desde DATETIME
	DECLARE @fecha_hasta DATETIME


    EXECUTE dbo.GetFechasIntegracion 'PRODUCTOS', @fecha_desde OUTPUT, @fecha_hasta OUTPUT

    --CONSOLIDACION SOURCE
	BEGIN
		IF OBJECT_ID('tempdb..#source') IS NOT NULL BEGIN
			DROP TABLE #source
		END

		;WITH
		cte_00 AS
		(
            SELECT 
                 a.prt_client_id
                ,a.prtnum

                ,COALESCE(a.dept_cod,'') AS dept_cod
		        ,COALESCE(a.moddte,CAST('1900-01-01' AS DATETIME)) AS moddte
		        ,COALESCE(a.mod_usr_id,'') AS mod_usr_id

                ,CONCAT(a.prtnum,'|',a.prt_client_id,'|',a.wh_id_tmpl) AS colval 
                ,ROW_NUMBER() OVER(PARTITION BY a.prt_client_id, a.prtnum ORDER BY a.moddte DESC) AS orden
            FROM [$(ttcwmsprd)].dbo.prtmst a
            WHERE 0 = 0
            AND a.wh_id_tmpl NOT IN ('----','WMD1')
            AND a.moddte >= @fecha_desde
            AND a.moddte <= @fecha_hasta
            --TODO
            AND a.prtnum NOT LIKE '8411640000459_'
        ),
        cte_01 AS
        (
            SELECT
                 a.prt_client_id
                ,a.prtnum

                ,LEFT(COALESCE(b.lngdsc,''),200) AS lngdsc
                ,a.dept_cod
                ,a.moddte
                ,a.mod_usr_id
            FROM cte_00 a
            LEFT OUTER JOIN [$(ttcwmsprd)].dbo.prtdsc b ON
                b.colval = a.colval
            AND b.locale_id = 'ES-ES'
            WHERE
                a.orden = 1
        )
		SELECT
            CAST(NULL AS BIGINT) AS id,
            CAST('' AS NVARCHAR(1)) AS operacion,
            CAST(0 AS BIT) AS cambio_notificado,
            @fecha_hasta AS fecha_creacion,
            @fecha_hasta AS fecha_modificacion,
			a.*
		INTO #source
		FROM cte_01 a
    END

    --MERGE
    BEGIN
        UPDATE a
        SET a.id = b.id,
            a.operacion = 'U',
            a.fecha_creacion = b.fecha_creacion
        FROM #source a
        INNER JOIN dbo.productos b ON
            b.prt_client_id = a.prt_client_id
        AND b.prtnum = a.prtnum
        --WHERE NOT (
        --    a.moddte = b.moddte)     
        
        UPDATE a
        SET a.operacion = 'C'
        FROM #source a
        LEFT OUTER JOIN dbo.productos b ON
            b.prt_client_id = a.prt_client_id
        AND b.prtnum = a.prtnum
        WHERE
            b.prt_client_id IS NULL
    END

    --CONSOLIDACION DE REGISTROS inserted/deleted
    BEGIN
		IF OBJECT_ID('tempdb..#not_matched') IS NOT NULL BEGIN
			DROP TABLE #not_matched
		END

        SELECT
            a.*
        INTO #not_matched
        FROM dbo.productos a
        LEFT OUTER JOIN [$(ttcwmsprd)].dbo.prtmst b ON
            b.prt_client_id = a.prt_client_id
        AND b.prtnum = a.prtnum
        AND b.wh_id_tmpl NOT IN ('----','WMD1')
        WHERE
            b.prt_client_id IS NULL
        AND a.operacion <> 'D'

		IF OBJECT_ID('tempdb..#deleted') IS NOT NULL BEGIN
			DROP TABLE #deleted
		END

        ;WITH
        cte_matched AS
        (
            SELECT
                b.*
            FROM #source a
            INNER JOIN dbo.productos b ON
                b.prt_client_id = a.prt_client_id
            AND b.prtnum = a.prtnum
            WHERE
                a.operacion IN  ('U')
        ),
        cte_01 AS
        (
            SELECT * FROM cte_matched a
            UNION
            SELECT * FROM #not_matched
        )
        SELECT
            a.*
        INTO #deleted
        FROM cte_01 a

        IF OBJECT_ID('tempdb..#inserted') IS NOT NULL BEGIN
			DROP TABLE #inserted
		END

        UPDATE a
        SET  operacion = 'D'
            ,fecha_modificacion = @fecha_hasta
        FROM #not_matched a

        ;WITH 
        cte_00 AS
        (
            SELECT * FROM #source a WHERE a.operacion IN  ('C','U')
            UNION
            SELECT * FROM #not_matched a
        )
		SELECT
			a.*
		INTO #inserted
		FROM cte_00 a
    END

    BEGIN TRANSACTION
    --ACTUALIZACION TARGET/LOGS
    BEGIN
		DELETE a
		FROM dbo.productos a
		INNER JOIN #deleted b ON
			b.id = a.id
        
		INSERT INTO dbo.productos
			(operacion
            ,fecha_creacion
            ,fecha_modificacion

            ,prt_client_id
            ,prtnum
            ,lngdsc
            ,dept_cod
            ,moddte
            ,mod_usr_id)
		SELECT
			 operacion
            ,fecha_creacion
            ,fecha_modificacion

            ,prt_client_id
            ,prtnum
            ,lngdsc
            ,dept_cod
            ,moddte
            ,mod_usr_id
		FROM #inserted a
        WHERE
            a.operacion = 'C'

        SET IDENTITY_INSERT dbo.productos ON

		INSERT INTO dbo.productos
			(id
            ,operacion
            ,fecha_creacion
            ,fecha_modificacion

            ,prt_client_id
            ,prtnum
            ,lngdsc
            ,dept_cod
            ,moddte
            ,mod_usr_id)
		SELECT
             id
            ,operacion
            ,fecha_creacion
            ,fecha_modificacion

            ,prt_client_id
            ,prtnum
            ,lngdsc
            ,dept_cod
            ,moddte
            ,mod_usr_id
		FROM #inserted a
        WHERE
            a.operacion IN ('U','D')

        SET IDENTITY_INSERT dbo.productos OFF

		INSERT INTO logs.productos
			(id
            ,operacion
            ,cambio_notificado
            ,fecha_creacion
            ,fecha_modificacion

            ,prt_client_id
            ,prtnum
            ,lngdsc
            ,dept_cod
            ,moddte
            ,mod_usr_id)
		SELECT
             id
            ,operacion
            ,cambio_notificado
            ,fecha_creacion
            ,fecha_modificacion

            ,prt_client_id
            ,prtnum
            ,lngdsc
            ,dept_cod
            ,moddte
            ,mod_usr_id
		FROM #deleted a
	END
    
    COMMIT TRANSACTION
END TRY
BEGIN CATCH
    SELECT ERROR_MESSAGE()
	ROLLBACK TRANSACTION
    ;THROW;
END CATCH