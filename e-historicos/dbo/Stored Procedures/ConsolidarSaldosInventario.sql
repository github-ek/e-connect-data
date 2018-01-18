CREATE PROCEDURE [dbo].[ConsolidarSaldosInventario]
    @fecha_corte DATE = NULL
AS
BEGIN TRY
    SET NOCOUNT ON;
    DECLARE @fecha_creacion DATETIME

    BEGIN TRANSACTION
    -------------------------------------------------------------------------------------------------------------------
    -- Inicializando valores por defecto
    -------------------------------------------------------------------------------------------------------------------
    BEGIN
        IF @fecha_corte IS NULL BEGIN
            SET @fecha_corte = CAST(GETDATE() AS DATE)
        END

        SET @fecha_creacion = GETDATE()
    END

    -------------------------------------------------------------------------------------------------------------------
    -- Limpiar registros del dia (en caso de volver a ejecutar el proceso por incidencia)
    -------------------------------------------------------------------------------------------------------------------
    BEGIN
        DELETE a
        FROM dbo.saldos_inventario a
        WHERE
            a.fecha_corte = @fecha_corte
    END

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
                c.cmpkey
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
            AND e.adjflg = 0
            AND a.prmflg = 0
        )
        SELECT 
            a.*
        INTO #saldos_inventario
        FROM cte_00 a
        --WHERE NOT (prt_client_id = 'GLOBAL WINE & SPIRITS LTDA' AND wh_id = 'TL-BOG-ZF-01' AND stoloc like 'Z1-01A')
    END

    -------------------------------------------------------------------------------------------------------------------
    -- Descartar registros
    -------------------------------------------------------------------------------------------------------------------
    BEGIN
        -------------------------------------------------------------------------------------------------------------------
        -- Descartar los nuevos productos manufacturados en tanto su orden se encuentre en un estado no completado
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
            ,lodnum)
        SELECT
            @fecha_creacion,
            @fecha_corte,

            a.prt_client_id,
            a.wh_id,
            a.prtnum,
            a.invsts,
            a.lotnum,
            SUM(a.untqty) AS untqty,
		    a.lst_arecod,
		    a.expire_dte,
		    a.inv_attr_str7,
		    a.stoloc,
            a.lodnum
        FROM #saldos_inventario a
        GROUP BY 
            a.prt_client_id,
            a.wh_id,
            a.prtnum,
            a.invsts,
            a.lotnum,
		    a.lst_arecod,
		    a.expire_dte,
		    a.inv_attr_str7,
		    a.stoloc,
            a.lodnum
    END

    -------------------------------------------------------------------------------------------------------------------
    -- MIGRACION
    -------------------------------------------------------------------------------------------------------------------
    BEGIN
        DELETE a
        FROM [$(historicoInv)].dbo.corteinv_hist a
        WHERE
            a.fecha = @fecha_corte

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

        EXEC [$(historicoInv)].[dbo].[corte_pedidos_pendientes_sp] @fecha_corte
    END

    COMMIT TRANSACTION

END TRY
BEGIN CATCH
    SELECT ERROR_MESSAGE()
	ROLLBACK TRANSACTION
    ;THROW;
END CATCH
