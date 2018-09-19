CREATE PROCEDURE [dbo].[ConsolidarSaldosInventarioPorCliente] 
     @fecha_corte DATE
	,@prt_client_id VARCHAR(32)
WITH RECOMPILE AS
BEGIN TRY
    DECLARE @fecha_creacion DATETIME = GETDATE()
    SELECT SYSDATETIME(),@prt_client_id

    -------------------------------------------------------------------------------------------------------------------
    -- Consolidar saldos de inventario
    -------------------------------------------------------------------------------------------------------------------
    BEGIN
        IF OBJECT_ID('tempdb..#saldos_inventario') IS NOT NULL BEGIN 
            DROP TABLE #saldos_inventario
        END

        ;WITH
        cte_00 AS
        (
            SELECT
                c.prt_client_id,
                a.wh_id,
                c.prtnum,
                c.invsts,
                c.lotnum,
                c.untqty,
		        COALESCE(c.lst_arecod,'') AS lst_arecod,
		        c.expire_dte,
		        COALESCE(c.inv_attr_str7,'') AS inv_attr_str7,
		        d.stoloc,
                a.lodnum,
                c.orgcod,
                c.cmpkey,
				c.hld_flg
            FROM [$(ttcwmsprd)].dbo.invlod a
            INNER JOIN [$(ttcwmsprd)].dbo.invsub b ON
                a.lodnum = b.lodnum
            INNER JOIN [$(ttcwmsprd)].dbo.invdtl c ON 
                c.subnum = b.subnum
            INNER JOIN [$(ttcwmsprd)].dbo.locmst d ON 
                d.stoloc = a.stoloc
            AND d.wh_id = a.wh_id
            INNER JOIN [$(ttcwmsprd)].dbo.aremst e ON 
                e.arecod = d.arecod
            AND e.wh_id = d.wh_id
            WHERE 
                (e.fwiflg = 1 OR e.prd_stgflg = 1)
			AND c.prt_client_id = @prt_client_id
            AND e.adjflg = 0
            AND a.prmflg = 0
        )
        SELECT
             a.*
            ,COALESCE(b.prtstyle,'') AS prtstyle
        INTO #saldos_inventario
        FROM cte_00 a
        INNER JOIN [$(ttcwmsprd)].dbo.prtmst b ON 
            b.prtnum = a.prtnum
        AND b.prt_client_id = a.prt_client_id
        AND b.wh_id_tmpl = a.wh_id
    END

    SELECT TOP (10) 
        SYSDATETIME(),a.*
    FROM #saldos_inventario a
    -------------------------------------------------------------------------------------------------------------------
    -- Descartar registros
    -------------------------------------------------------------------------------------------------------------------
    BEGIN
        -------------------------------------------------------------------------------------------------------------------
        -- Descartar los nuevos productos manufacturados en tanto su orden de manufactura se encuentre en un estado no completado
        -------------------------------------------------------------------------------------------------------------------
        DELETE a
        FROM #saldos_inventario a
        INNER JOIN [$(ttcwmsprd)].dbo.cmphdr b ON
            b.cmpkey = a.cmpkey
        INNER JOIN [$(ttcwmsprd)].dbo.wkohdr c ON 
            c.wh_id = b.wh_id
        AND c.client_id = b.client_id
        AND c.wkonum = b.wkonum
        AND c.wkorev = b.wkorev
        WHERE
            a.cmpkey IS NOT NULL
        AND c.wkosts NOT IN ('C')
    END

    SELECT SYSDATETIME(),'DELETE FROM #saldos_inventario'

    BEGIN TRANSACTION

    -------------------------------------------------------------------------------------------------------------------
    -- Limpiar registros del dia (en caso de volver a ejecutar el proceso por incidencia)
    -------------------------------------------------------------------------------------------------------------------
    BEGIN
        DELETE a
        FROM dbo.saldos_inventario a
        WHERE
            a.fecha_corte = @fecha_corte
		AND a.prt_client_id = @prt_client_id
    END

    SELECT SYSDATETIME(),'DELETE FROM saldos_inventario'

    -------------------------------------------------------------------------------------------------------------------
    -- Consolidar saldos de inventario
    -------------------------------------------------------------------------------------------------------------------

    BEGIN
        INSERT INTO dbo.saldos_inventario
            (fecha_creacion
            ,fecha_corte

            ,prt_client_id
            ,wh_id
            ,prtnum
            ,invsts
            ,lotnum
            ,untqty
            ,lst_arecod
            ,expire_dte
            ,inv_attr_str7
            ,stoloc
            ,lodnum
            ,orgcod
            ,prtstyle
			,hld_flg)
        SELECT
             @fecha_creacion
            ,@fecha_corte

            ,prt_client_id
            ,wh_id
            ,prtnum
            ,invsts
            ,lotnum
            ,SUM(untqty) AS untqty
		    ,lst_arecod
		    ,expire_dte
		    ,inv_attr_str7
		    ,stoloc
            ,lodnum
            ,orgcod
            ,prtstyle
			,hld_flg
        FROM #saldos_inventario a
        GROUP BY 
             prt_client_id
            ,wh_id
            ,prtnum
            ,invsts
            ,lotnum
		    ,lst_arecod
		    ,expire_dte
		    ,inv_attr_str7
		    ,stoloc
            ,lodnum
            ,orgcod
            ,prtstyle
			,hld_flg
    END

    SELECT SYSDATETIME(),'INSERT INTO dbo.saldos_inventario'

    -------------------------------------------------------------------------------------------------------------------
    -- MIGRACION
    -------------------------------------------------------------------------------------------------------------------
    BEGIN
        DELETE a
        FROM [$(historicoInv)].dbo.corteinv_hist a
        WHERE
            a.fecha = @fecha_corte
		AND a.prt_client_id = @prt_client_id

        SELECT SYSDATETIME(),'DELETE FROM FROM [$(historicoInv)].dbo.corteinv_hist a'


        INSERT INTO [$(historicoInv)].dbo.corteinv_hist 
            (fecha
            ,prt_client_id
            ,wh_id
            ,prtnum
            ,invsts
            ,lotnum
            ,untqty
            ,lst_arecod
            ,expire_dte
            ,inv_attr_str7
            ,stoloc
            ,fecha_creacion)
        SELECT
             fecha_corte AS fecha
            ,prt_client_id
            ,wh_id
            ,prtnum
            ,invsts
            ,lotnum
            ,untqty
            ,lst_arecod
            ,expire_dte
            ,inv_attr_str7
            ,stoloc
            ,fecha_creacion
        FROM dbo.saldos_inventario a
        WHERE
            a.fecha_corte = @fecha_corte
		AND a.prt_client_id = @prt_client_id

        SELECT SYSDATETIME(),'INSERT INTO [$(historicoInv)].dbo.corteinv_hist'

		EXEC [$(historicoInv)].[dbo].[corte_pedidos_pendientes_sp] @fecha_corte, @prt_client_id

        SELECT SYSDATETIME(),'EXEC [$(historicoInv)].[dbo].[corte_pedidos_pendientes_sp] @fecha_corte, @prt_client_id'
    END

    -------------------------------------------------------------------------------------------------------------------
    -- MIGRACION
    -------------------------------------------------------------------------------------------------------------------
    BEGIN
		EXEC [dbo].[ConsolidarSaldosInventarioProyectadosPorCliente] @fecha_corte, @prt_client_id

        SELECT SYSDATETIME(),'EXEC [dbo].[ConsolidarSaldosInventarioProyectadosPorCliente] @fecha_corte, @prt_client_id'
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