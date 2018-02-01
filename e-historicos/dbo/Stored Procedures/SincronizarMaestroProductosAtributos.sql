CREATE PROCEDURE [dbo].[SincronizarMaestroProductosAtributos]
AS
BEGIN TRY
	DECLARE @fecha_desde DATETIME
	DECLARE @fecha_hasta DATETIME

    BEGIN TRANSACTION

    EXECUTE dbo.GetFechasIntegracion 'PRODUCTOS_ATRIBUTOS', @fecha_desde OUTPUT, @fecha_hasta OUTPUT

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
                ,a.wh_id_tmpl AS  wh_id

                ,a.dte_code
	            ,a.lotflg
                ,CAST(ROUND(a.untcst,0,0) AS BIGINT) AS untcst 

	            ,COALESCE(a.last_upd_dt,CAST('1900-01-01' AS DATETIME)) AS last_upd_dt
	            ,COALESCE(a.last_upd_user_id,'') AS last_upd_user_id
            FROM [$(ttcwmsprd)].dbo.prtmst a
            WHERE 0 = 0
            AND a.wh_id_tmpl NOT IN ('----','WMD1')
            AND a.last_upd_dt >= @fecha_desde 
            AND a.last_upd_dt <= @fecha_hasta
        ),
        cte_01 AS
        (
            SELECT
                 a.prt_client_id
                ,a.prtnum
                ,a.wh_id

                ,CAST(a.dte_code AS NVARCHAR(50)) AS dte_code
		        ,CAST(a.lotflg AS NVARCHAR(50)) AS lotflg
                ,COALESCE(CAST(a.untcst AS NVARCHAR(50)),'') AS untcst

                ,a.last_upd_dt
                ,a.last_upd_user_id
            FROM cte_00 a
        ),
        cte_02 AS
        (
            SELECT
                 b.prt_client_id
                ,b.prtnum
                ,b.wh_id
                ,UPPER(b.codigo) AS codigo
                ,UPPER(b.valor) AS valor
                ,b.last_upd_dt
                ,b.last_upd_user_id
            FROM cte_01 a
            UNPIVOT (valor FOR codigo IN (dte_code,lotflg,untcst)) b
        )
		SELECT
            CAST(NULL AS BIGINT) AS id,
            CAST('' AS NVARCHAR(1)) AS operacion,
            CAST(0 AS BIT) AS cambio_notificado,
            @fecha_hasta AS fecha_creacion,
            @fecha_hasta AS fecha_modificacion,
			a.*
		INTO #source
		FROM cte_02 a
        WHERE 0 = 0
        AND NOT (a.codigo IN ('UNTCST') AND a.valor IN (''))
    END

    --MERGE
    BEGIN
        UPDATE a
        SET a.id = b.id,
            a.operacion = 'U',
            a.fecha_creacion = b.fecha_creacion
        FROM #source a
        INNER JOIN dbo.productos_atributos b ON
            b.prt_client_id = a.prt_client_id
        AND b.prtnum = a.prtnum
        AND b.wh_id = a.wh_id
        AND b.codigo = a.codigo
        WHERE NOT (
            a.valor = b.valor        
        AND a.last_upd_dt = b.last_upd_dt)
        
        UPDATE a
        SET a.operacion = 'C'
        FROM #source a
        LEFT OUTER JOIN dbo.productos_atributos b ON
            b.prt_client_id = a.prt_client_id
        AND b.prtnum = a.prtnum
        AND b.wh_id = a.wh_id
        AND b.codigo = a.codigo
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
        FROM dbo.productos_atributos a
        WHERE 0 = 1
        --CASO PARTICULAR: Debido al costo de calcular las eliminaciones lo mejor será recalcular periodicamente toda la tabla

		IF OBJECT_ID('tempdb..#deleted') IS NOT NULL BEGIN
			DROP TABLE #deleted
		END

        ;WITH
        cte_matched AS
        (
            SELECT
                b.*
            FROM #source a
            INNER JOIN dbo.productos_atributos b ON
                b.prt_client_id = a.prt_client_id
            AND b.prtnum = a.prtnum
            AND b.wh_id = a.wh_id
            AND b.codigo = a.codigo
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

    --ACTUALIZACION TARGET/LOGS
    BEGIN
		DELETE a
		FROM dbo.productos_atributos a
		INNER JOIN #deleted b ON
			b.id = a.id
        
		INSERT INTO dbo.productos_atributos
			(operacion
            ,fecha_creacion
            ,fecha_modificacion

            ,prt_client_id
            ,prtnum
            ,wh_id
            ,codigo
            ,valor
			,last_upd_dt
			,last_upd_user_id)
		SELECT
			 operacion
            ,fecha_creacion
            ,fecha_modificacion

            ,prt_client_id
            ,prtnum
            ,wh_id
            ,codigo
            ,valor
			,last_upd_dt
			,last_upd_user_id
		FROM #inserted a
        WHERE
            a.operacion = 'C'

        SET IDENTITY_INSERT dbo.productos_atributos ON

		INSERT INTO dbo.productos_atributos
			(id
            ,operacion
            ,fecha_creacion
            ,fecha_modificacion

            ,prt_client_id
            ,prtnum
            ,wh_id
            ,codigo
            ,valor
			,last_upd_dt
			,last_upd_user_id)
		SELECT
             id
            ,operacion
            ,fecha_creacion
            ,fecha_modificacion

            ,prt_client_id
            ,prtnum
            ,wh_id
            ,codigo
            ,valor
			,last_upd_dt
			,last_upd_user_id
		FROM #inserted a
        WHERE
            a.operacion IN ('U','D')

        SET IDENTITY_INSERT dbo.productos_atributos OFF

		INSERT INTO logs.productos_atributos
			(id
            ,operacion
            ,cambio_notificado
            ,fecha_creacion
            ,fecha_modificacion

            ,prt_client_id
            ,prtnum
            ,wh_id
            ,codigo
            ,valor
			,last_upd_dt
			,last_upd_user_id)
		SELECT
             id
            ,operacion
            ,cambio_notificado
            ,fecha_creacion
            ,fecha_modificacion

            ,prt_client_id
            ,prtnum
            ,wh_id
            ,codigo
            ,valor
			,last_upd_dt
			,last_upd_user_id
		FROM #deleted a
	END
    
    COMMIT TRANSACTION
END TRY
BEGIN CATCH
    SELECT ERROR_MESSAGE()
	ROLLBACK TRANSACTION
    ;THROW;
END CATCH