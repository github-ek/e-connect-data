CREATE PROCEDURE [dbo].[SincronizarMaestroProductosMedidas]
AS
BEGIN TRY
	DECLARE @fecha_desde DATETIME
	DECLARE @fecha_hasta DATETIME

    BEGIN TRANSACTION

    EXECUTE dbo.GetFechasIntegracion 'PRODUCTOS_MEDIDAS', @fecha_desde OUTPUT, @fecha_hasta OUTPUT

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
                ,a.wh_id
                ,a.uomcod
                ,a.ftpcod

                ,a.uomlvl
                ,a.untqty
                ,a.len
                ,a.wid
                ,a.hgt
                ,a.grswgt
                ,CAST(a.rcv_flg AS BIT) AS rcv_flg
                ,CAST(a.cas_flg AS BIT) AS cas_flg
                ,CAST(a.pal_flg AS BIT) AS pal_flg
				,COALESCE(a.last_upd_dt,CAST('1900-01-01' AS DATETIME)) AS last_upd_dt
				,COALESCE(a.last_upd_user_id,'') AS last_upd_user_id
                ,COALESCE(b.last_upd_dt,CAST('1900-01-01' AS DATETIME)) AS prtftp_last_upd_dt
                ,COALESCE(b.last_upd_user_id,'') AS prtftp_last_upd_user_id
            FROM [$(ttcwmsprd)].dbo.prtftp_dtl a
            INNER JOIN [$(ttcwmsprd)].dbo.prtftp b ON
                b.prt_client_id = a.prt_client_id
            AND b.prtnum = a.prtnum
            AND b.wh_id = a.wh_id
            AND b.ftpcod = a.ftpcod
            AND b.defftp_flg = 1
            WHERE 0 = 0
            AND a.wh_id NOT IN ('----','WMD1')
            AND (
                (a.last_upd_dt >= @fecha_desde AND a.last_upd_dt <= @fecha_hasta) OR
                (b.last_upd_dt >= @fecha_desde AND b.last_upd_dt <= @fecha_hasta)
            )
        )
		SELECT
            CAST(NULL AS BIGINT) AS id,
            CAST('' AS NVARCHAR(1)) AS operacion,
            CAST(0 AS BIT) AS cambio_notificado,
            @fecha_hasta AS fecha_creacion,
            @fecha_hasta AS fecha_modificacion,
			a.*
		INTO #source
		FROM cte_00 a
    END

    --MERGE
    BEGIN
        UPDATE a
        SET a.id = b.id,
            a.operacion = 'U',
            a.fecha_creacion = b.fecha_creacion
        FROM #source a
        INNER JOIN dbo.productos_medidas b ON
            b.prt_client_id = a.prt_client_id
        AND b.prtnum = a.prtnum
        AND b.wh_id = a.wh_id
        AND b.uomcod = a.uomcod
        WHERE NOT (
            a.last_upd_dt = b.last_upd_dt
        AND a.prtftp_last_upd_user_id = b.prtftp_last_upd_user_id)     
        
        UPDATE a
        SET a.operacion = 'C'
        FROM #source a
        LEFT OUTER JOIN dbo.productos_medidas b ON
            b.prt_client_id = a.prt_client_id
        AND b.prtnum = a.prtnum
        AND b.wh_id = a.wh_id
        AND b.uomcod = a.uomcod
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
        FROM dbo.productos_medidas a
        LEFT OUTER JOIN [$(ttcwmsprd)].dbo.prtftp_dtl b ON
            b.prt_client_id = a.prt_client_id
        AND b.prtnum = a.prtnum
        AND b.wh_id = a.wh_id
        AND b.uomcod = a.uomcod
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
            INNER JOIN dbo.productos_medidas b ON
                b.prt_client_id = a.prt_client_id
            AND b.prtnum = a.prtnum
            AND b.wh_id = a.wh_id
            AND b.uomcod = a.uomcod
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
		FROM dbo.productos_medidas a
		INNER JOIN #deleted b ON
			b.id = a.id
        
		INSERT INTO dbo.productos_medidas
			(operacion
            ,fecha_creacion
            ,fecha_modificacion

            ,prt_client_id
            ,prtnum
            ,wh_id
            ,uomcod
            ,ftpcod
            ,uomlvl
            ,untqty
            ,len
            ,wid
            ,hgt
            ,grswgt
            ,rcv_flg
            ,cas_flg
            ,pal_flg
			,last_upd_dt
			,last_upd_user_id
            ,prtftp_last_upd_dt
            ,prtftp_last_upd_user_id)
		SELECT
			 operacion
            ,fecha_creacion
            ,fecha_modificacion

            ,prt_client_id
            ,prtnum
            ,wh_id
            ,uomcod
            ,ftpcod
            ,uomlvl
            ,untqty
            ,len
            ,wid
            ,hgt
            ,grswgt
            ,rcv_flg
            ,cas_flg
            ,pal_flg
			,last_upd_dt
			,last_upd_user_id
            ,prtftp_last_upd_dt
            ,prtftp_last_upd_user_id
		FROM #inserted a
        WHERE
            a.operacion = 'C'

        SET IDENTITY_INSERT dbo.productos_medidas ON

		INSERT INTO dbo.productos_medidas
			(id
            ,operacion
            ,fecha_creacion
            ,fecha_modificacion

            ,prt_client_id
            ,prtnum
            ,wh_id
            ,uomcod
            ,ftpcod
            ,uomlvl
            ,untqty
            ,len
            ,wid
            ,hgt
            ,grswgt
            ,rcv_flg
            ,cas_flg
            ,pal_flg
			,last_upd_dt
			,last_upd_user_id
            ,prtftp_last_upd_dt
            ,prtftp_last_upd_user_id)
		SELECT
             id
            ,operacion
            ,fecha_creacion
            ,fecha_modificacion

            ,prt_client_id
            ,prtnum
            ,wh_id
            ,uomcod
            ,ftpcod
            ,uomlvl
            ,untqty
            ,len
            ,wid
            ,hgt
            ,grswgt
            ,rcv_flg
            ,cas_flg
            ,pal_flg
			,last_upd_dt
			,last_upd_user_id
            ,prtftp_last_upd_dt
            ,prtftp_last_upd_user_id
		FROM #inserted a
        WHERE
            a.operacion IN ('U','D')

        SET IDENTITY_INSERT dbo.productos_medidas OFF

		INSERT INTO logs.productos_medidas
			(id
            ,operacion
            ,cambio_notificado
            ,fecha_creacion
            ,fecha_modificacion

            ,prt_client_id
            ,prtnum
            ,wh_id
            ,uomcod
            ,ftpcod
            ,uomlvl
            ,untqty
            ,len
            ,wid
            ,hgt
            ,grswgt
            ,rcv_flg
            ,cas_flg
            ,pal_flg
			,last_upd_dt
			,last_upd_user_id
            ,prtftp_last_upd_dt
            ,prtftp_last_upd_user_id)
		SELECT
             id
            ,operacion
            ,cambio_notificado
            ,fecha_creacion
            ,fecha_modificacion

            ,prt_client_id
            ,prtnum
            ,wh_id
            ,uomcod
            ,ftpcod
            ,uomlvl
            ,untqty
            ,len
            ,wid
            ,hgt
            ,grswgt
            ,rcv_flg
            ,cas_flg
            ,pal_flg
			,last_upd_dt
			,last_upd_user_id
            ,prtftp_last_upd_dt
            ,prtftp_last_upd_user_id
		FROM #deleted a
	END
    
    COMMIT TRANSACTION
END TRY
BEGIN CATCH
    SELECT ERROR_MESSAGE()
	ROLLBACK TRANSACTION
    ;THROW;
END CATCH