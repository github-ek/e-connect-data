
CREATE PROCEDURE [dbo].[SincronizarOrdenesDeEntrada]
AS
BEGIN TRY
    --SET NOCOUNT ON;

	DECLARE @t AS TABLE(fecha_ultimo_pull DATETIME)
	DECLARE @fecha_pull DATETIME
	DECLARE @fecha_ultimo_pull DATETIME
    /*
	BEGIN TRANSACTION

	--OBTENER FECHA DE ULTIMO PULL
	BEGIN
		SET @fecha_pull = GETDATE()

		UPDATE a
		SET a.fecha_ultimo_pull = @fecha_pull
		OUTPUT deleted.fecha_ultimo_pull
		INTO @t(fecha_ultimo_pull)
		FROM dbo.integraciones a
		WHERE
			a.codigo = 'ENTRADAS'

        SELECT
		    @fecha_ultimo_pull = a.fecha_ultimo_pull
		FROM @t a
	END

    --CONSOLIDACION TARGET
    BEGIN
		IF OBJECT_ID('tempdb..#target') IS NOT NULL BEGIN
			DROP TABLE #target
		END
        
        ;WITH
        cte_00 AS
        (
            SELECT DISTINCT
                 a.client_id
                ,a.wh_id
                ,a.po_num
                ,a.supnum
                ,a.invnum
                ,a.trknum
            FROM dbo.entradas a
            WHERE
                a.rcvtrk_stat NOT IN ('C')
        )
        SELECT
             a.*
        INTO #target
        FROM dbo.entradas a
        INNER JOIN cte_00 b ON
            b.client_id = a.client_id
        AND b.wh_id = a.wh_id
        AND b.po_num = a.po_num
        AND b.supnum = a.supnum
        AND b.invnum = a.invnum
        AND b.trknum = a.trknum
    END

	--CONSOLIDACION RCV
	BEGIN
		IF OBJECT_ID('tempdb..#rcv') IS NOT NULL BEGIN
			DROP TABLE #rcv
		END

		;WITH
		cte_00 AS
		(
		    SELECT DISTINCT
                a.client_id,
                a.wh_id,
                a.po_num,
                a.supnum,
                a.invnum,
                a.trknum
		    FROM #target a
        ),
		cte_01 AS
		(
            SELECT
                a.client_id,
                a.wh_id,
                a.po_num,
                a.supnum,
                a.invnum,
                a.trknum
            FROM dbo.rcvinv a
            INNER JOIN dbo.clientes b ON
                b.client_id = a.client_id
            LEFT OUTER JOIN cte_00 c ON
                c.client_id = a.client_id
            AND c.wh_id = a.wh_id
            AND c.po_num = a.po_num
            AND c.supnum = a.supnum
            AND c.invnum = a.invnum
            AND c.trknum = a.trknum
            WHERE 0 = 0
            AND a.moddte >= @fecha_ultimo_pull
            AND a.moddte < @fecha_pull
            AND c.po_num IS NULL
		),
        cte_02 AS
        (
            SELECT a.* FROM cte_00 a
            UNION
            SELECT a.* FROM cte_01 a
        )
		SELECT
            '' AS operacion,
            @fecha_pull AS fecha_creacion,
            @fecha_pull AS fecha_modificacion,
			a.*
		INTO #rcv
		FROM cte_02 a
    END

    --CONSOLIDACION SOURCE
    BEGIN
		IF OBJECT_ID('tempdb..#source') IS NOT NULL BEGIN
			DROP TABLE #source
		END

        SELECT
            CAST(NULL AS BIGINT) AS id,
            a.operacion,
            a.fecha_creacion,
            a.fecha_modificacion,

            b.client_id,
            b.wh_id,
            b.po_num,
            b.trknum,
            b.invtyp,
            b.supnum,
            b.invnum,
            b.invdte,
            b.moddte,
            b.mod_usr_id,

            c.invlin,
            c.invsln,
            c.seqnum,
            c.prtnum,
            c.rcvsts,
            c.expqty,
            c.idnqty,
            c.rcvqty,
            c.rptqty,
            c.lotnum,
            COALESCE(c.inv_attr_str7,'') AS inv_attr_str7,
            COALESCE(c.mandte,CAST('1900-01-01' AS DATETIME)) AS mandte,
            COALESCE(c.expire_dte,CAST('1900-01-01' AS DATETIME)) AS expire_dte,
            COALESCE(c.retcod,'') AS retcod,
            COALESCE(c.moddte,CAST('1900-01-01' AS DATETIME)) AS rcvlin_moddte,
            COALESCE(c.mod_usr_id,'') AS rcvlin_mod_usr_id,

            d.rcvtrk_stat,
            COALESCE(d.clsdte,CAST('1900-01-01' AS DATETIME)) AS rcvtrk_clsdte,
            COALESCE(d.devcod,'') AS devcod,
            COALESCE(d.moddte,CAST('1900-01-01' AS DATETIME)) AS rcvtrk_moddte,
            COALESCE(d.mod_usr_id,'') AS rcvtrk_mod_usr_id,

            e.trlr_id,
            e.trlr_num,
            e.trlr_stat,

            COALESCE(e.carcod,'') AS carcod,
            COALESCE(e.trlr_typ,'') AS trlr_typ,
            COALESCE(e.trlr_cod,'') AS trlr_cod,
            COALESCE(e.trlr_cond,'') AS trlr_cond,
            COALESCE(e.tractor_num,'') AS tractor_num,
            COALESCE(e.driver_nam,'') AS driver_nam,
            COALESCE(e.driver_lic_num,'') AS driver_lic_num,
    
            COALESCE(e.arrdte,CAST('1900-01-01' AS DATETIME)) AS arrdte,
            COALESCE(e.pend_dte,CAST('1900-01-01' AS DATETIME)) AS pend_dte,
            COALESCE(e.dispatch_dte,CAST('1900-01-01' AS DATETIME)) AS dispatch_dte,
            COALESCE(e.close_dte,CAST('1900-01-01' AS DATETIME)) AS close_dte,

            COALESCE(e.moddte,CAST('1900-01-01' AS DATETIME)) AS trlr_moddte,
            COALESCE(e.mod_usr_id,'') AS trlr_mod_usr_id
        INTO #source
        FROM #rcv a
        INNER JOIN dbo.rcvinv  b ON
            b.client_id = a.client_id
        AND b.wh_id = a.wh_id
        AND b.po_num = a.po_num
        AND b.supnum = a.supnum
        AND b.invnum = a.invnum
        AND b.trknum = a.trknum
        INNER JOIN dbo.rcvlin c ON
            c.client_id = b.client_id
        AND c.wh_id = b.wh_id
        AND c.supnum = b.supnum
        AND c.invnum = b.invnum
        AND c.trknum = b.trknum
        INNER JOIN dbo.rcvtrk d ON 
            d.wh_id = c.wh_id
        AND d.trknum = c.trknum
        INNER JOIN dbo.trlr e ON 
            e.trlr_id = d.trlr_id

        CREATE UNIQUE INDEX ix_source_01 ON #source(client_id,wh_id,po_num,supnum,invnum,trknum,invlin,invsln,seqnum)
    END
    
    --MERGE
    BEGIN
        UPDATE a
        SET a.id = b.id,
            a.operacion = 'U',
            a.fecha_creacion = b.fecha_creacion
        FROM #source a
        INNER JOIN #target b ON
            b.client_id = a.client_id
        AND b.wh_id = a.wh_id
        AND b.po_num = a.po_num
        AND b.supnum = a.supnum
        AND b.invnum = a.invnum
        AND b.trknum = a.trknum
        AND b.invlin = a.invlin
        AND b.invsln = a.invsln
        AND b.seqnum = a.seqnum
        WHERE NOT (
            b.moddte = a.moddte 
        AND b.rcvlin_moddte = a.rcvlin_moddte
        AND b.rcvtrk_moddte = a.rcvtrk_moddte
        AND b.trlr_moddte = a.trlr_moddte)     
        
        UPDATE a
        SET a.operacion = 'C'
        FROM #source a
        LEFT OUTER JOIN #target b ON
            b.client_id = a.client_id
        AND b.wh_id = a.wh_id
        AND b.po_num = a.po_num
        AND b.supnum = a.supnum
        AND b.invnum = a.invnum
        AND b.trknum = a.trknum
        AND b.invlin = a.invlin
        AND b.invsln = a.invsln
        AND b.seqnum = a.seqnum
        WHERE
            b.po_num IS NULL
    END

	--CONSOLIDACION DE REGISTROS inserted/deleted
    BEGIN
		IF OBJECT_ID('tempdb..#inserted') IS NOT NULL BEGIN
			DROP TABLE #inserted
		END

		SELECT
			a.*
		INTO #inserted
		FROM #source a
		WHERE
			a.operacion IN  ('C','U')

		IF OBJECT_ID('tempdb..#deleted') IS NOT NULL BEGIN
			DROP TABLE #deleted
		END

        SELECT
            a.*
        INTO #deleted
        FROM #target a
        LEFT OUTER JOIN #source b ON
            b.client_id = a.client_id
        AND b.wh_id = a.wh_id
        AND b.po_num = a.po_num
        AND b.supnum = a.supnum
        AND b.invnum = a.invnum
        AND b.trknum = a.trknum
        AND b.invlin = a.invlin
        AND b.invsln = a.invsln
        AND b.seqnum = a.seqnum
        WHERE
            b.operacion IN  ('U') OR b.po_num IS NULL
    END
    
    --ACTUALIZACION TARGET/LOGS
    BEGIN
		DELETE a
		FROM dbo.entradas a
		INNER JOIN #deleted b ON
			b.id = a.id
        
		INSERT INTO dbo.entradas
			(operacion
            ,fecha_creacion
            ,fecha_modificacion
            ,client_id
            ,wh_id
            ,po_num
            ,trknum
            ,invtyp
            ,supnum
            ,invnum
            ,invdte
            ,moddte
            ,mod_usr_id
            ,invlin
            ,invsln
            ,seqnum
            ,prtnum
            ,rcvsts
            ,expqty
            ,idnqty
            ,rcvqty
            ,rptqty
            ,lotnum
            ,inv_attr_str7
            ,mandte
            ,expire_dte
            ,retcod
            ,rcvlin_moddte
            ,rcvlin_mod_usr_id
            ,rcvtrk_stat
            ,rcvtrk_clsdte
            ,devcod
            ,rcvtrk_moddte
            ,rcvtrk_mod_usr_id
            ,trlr_id
            ,trlr_num
            ,trlr_stat
            ,carcod
            ,trlr_typ
            ,trlr_cod
            ,trlr_cond
            ,tractor_num
            ,driver_nam
            ,driver_lic_num
            ,arrdte
            ,pend_dte
            ,dispatch_dte
            ,close_dte
            ,trlr_moddte
            ,trlr_mod_usr_id)
		SELECT
             a.operacion
            ,a.fecha_creacion
            ,a.fecha_modificacion
            ,a.client_id
            ,a.wh_id
            ,a.po_num
            ,a.trknum
            ,a.invtyp
            ,a.supnum
            ,a.invnum
            ,a.invdte
            ,a.moddte
            ,a.mod_usr_id
            ,a.invlin
            ,a.invsln
            ,a.seqnum
            ,a.prtnum
            ,a.rcvsts
            ,a.expqty
            ,a.idnqty
            ,a.rcvqty
            ,a.rptqty
            ,a.lotnum
            ,a.inv_attr_str7
            ,a.mandte
            ,a.expire_dte
            ,a.retcod
            ,a.rcvlin_moddte
            ,a.rcvlin_mod_usr_id
            ,a.rcvtrk_stat
            ,a.rcvtrk_clsdte
            ,a.devcod
            ,a.rcvtrk_moddte
            ,a.rcvtrk_mod_usr_id
            ,a.trlr_id
            ,a.trlr_num
            ,a.trlr_stat
            ,a.carcod
            ,a.trlr_typ
            ,a.trlr_cod
            ,a.trlr_cond
            ,a.tractor_num
            ,a.driver_nam
            ,a.driver_lic_num
            ,a.arrdte
            ,a.pend_dte
            ,a.dispatch_dte
            ,a.close_dte
            ,a.trlr_moddte
            ,a.trlr_mod_usr_id
		FROM #inserted a
        WHERE
            a.operacion = 'C'

        SET IDENTITY_INSERT dbo.entradas ON

		INSERT INTO dbo.entradas
			(id
            ,operacion
            ,fecha_creacion
            ,fecha_modificacion
            ,client_id
            ,wh_id
            ,po_num
            ,trknum
            ,invtyp
            ,supnum
            ,invnum
            ,invdte
            ,moddte
            ,mod_usr_id
            ,invlin
            ,invsln
            ,seqnum
            ,prtnum
            ,rcvsts
            ,expqty
            ,idnqty
            ,rcvqty
            ,rptqty
            ,lotnum
            ,inv_attr_str7
            ,mandte
            ,expire_dte
            ,retcod
            ,rcvlin_moddte
            ,rcvlin_mod_usr_id
            ,rcvtrk_stat
            ,rcvtrk_clsdte
            ,devcod
            ,rcvtrk_moddte
            ,rcvtrk_mod_usr_id
            ,trlr_id
            ,trlr_num
            ,trlr_stat
            ,carcod
            ,trlr_typ
            ,trlr_cod
            ,trlr_cond
            ,tractor_num
            ,driver_nam
            ,driver_lic_num
            ,arrdte
            ,pend_dte
            ,dispatch_dte
            ,close_dte
            ,trlr_moddte
            ,trlr_mod_usr_id)
		SELECT
             a.id
            ,a.operacion
            ,a.fecha_creacion
            ,a.fecha_modificacion
            ,a.client_id
            ,a.wh_id
            ,a.po_num
            ,a.trknum
            ,a.invtyp
            ,a.supnum
            ,a.invnum
            ,a.invdte
            ,a.moddte
            ,a.mod_usr_id
            ,a.invlin
            ,a.invsln
            ,a.seqnum
            ,a.prtnum
            ,a.rcvsts
            ,a.expqty
            ,a.idnqty
            ,a.rcvqty
            ,a.rptqty
            ,a.lotnum
            ,a.inv_attr_str7
            ,a.mandte
            ,a.expire_dte
            ,a.retcod
            ,a.rcvlin_moddte
            ,a.rcvlin_mod_usr_id
            ,a.rcvtrk_stat
            ,a.rcvtrk_clsdte
            ,a.devcod
            ,a.rcvtrk_moddte
            ,a.rcvtrk_mod_usr_id
            ,a.trlr_id
            ,a.trlr_num
            ,a.trlr_stat
            ,a.carcod
            ,a.trlr_typ
            ,a.trlr_cod
            ,a.trlr_cond
            ,a.tractor_num
            ,a.driver_nam
            ,a.driver_lic_num
            ,a.arrdte
            ,a.pend_dte
            ,a.dispatch_dte
            ,a.close_dte
            ,a.trlr_moddte
            ,a.trlr_mod_usr_id
		FROM #inserted a
        WHERE
            a.operacion = 'U'

        SET IDENTITY_INSERT dbo.entradas OFF

		INSERT INTO logs.entradas
			(id
            ,operacion
            ,fecha_creacion
            ,fecha_modificacion
            ,client_id
            ,wh_id
            ,po_num
            ,trknum
            ,invtyp
            ,supnum
            ,invnum
            ,invdte
            ,moddte
            ,mod_usr_id
            ,invlin
            ,invsln
            ,seqnum
            ,prtnum
            ,rcvsts
            ,expqty
            ,idnqty
            ,rcvqty
            ,rptqty
            ,lotnum
            ,inv_attr_str7
            ,mandte
            ,expire_dte
            ,retcod
            ,rcvlin_moddte
            ,rcvlin_mod_usr_id
            ,rcvtrk_stat
            ,rcvtrk_clsdte
            ,devcod
            ,rcvtrk_moddte
            ,rcvtrk_mod_usr_id
            ,trlr_id
            ,trlr_num
            ,trlr_stat
            ,carcod
            ,trlr_typ
            ,trlr_cod
            ,trlr_cond
            ,tractor_num
            ,driver_nam
            ,driver_lic_num
            ,arrdte
            ,pend_dte
            ,dispatch_dte
            ,close_dte
            ,trlr_moddte
            ,trlr_mod_usr_id)
		SELECT
             a.id
            ,a.operacion
            ,a.fecha_creacion
            ,a.fecha_modificacion
            ,a.client_id
            ,a.wh_id
            ,a.po_num
            ,a.trknum
            ,a.invtyp
            ,a.supnum
            ,a.invnum
            ,a.invdte
            ,a.moddte
            ,a.mod_usr_id
            ,a.invlin
            ,a.invsln
            ,a.seqnum
            ,a.prtnum
            ,a.rcvsts
            ,a.expqty
            ,a.idnqty
            ,a.rcvqty
            ,a.rptqty
            ,a.lotnum
            ,a.inv_attr_str7
            ,a.mandte
            ,a.expire_dte
            ,a.retcod
            ,a.rcvlin_moddte
            ,a.rcvlin_mod_usr_id
            ,a.rcvtrk_stat
            ,a.rcvtrk_clsdte
            ,a.devcod
            ,a.rcvtrk_moddte
            ,a.rcvtrk_mod_usr_id
            ,a.trlr_id
            ,a.trlr_num
            ,a.trlr_stat
            ,a.carcod
            ,a.trlr_typ
            ,a.trlr_cod
            ,a.trlr_cond
            ,a.tractor_num
            ,a.driver_nam
            ,a.driver_lic_num
            ,a.arrdte
            ,a.pend_dte
            ,a.dispatch_dte
            ,a.close_dte
            ,a.trlr_moddte
            ,a.trlr_mod_usr_id
		FROM #deleted a
	END

	COMMIT TRANSACTION
    */
END TRY
BEGIN CATCH
    SELECT ERROR_MESSAGE()
	ROLLBACK TRANSACTION
    ;THROW
END CATCH
