
CREATE PROCEDURE [dbo].[ConsolidarSaldosInventarioProyectadosPorCliente]
     @fecha_corte DATE
	,@prt_client_id VARCHAR(32)
WITH RECOMPILE AS
BEGIN TRY
    SET NOCOUNT ON;
    DECLARE @fecha_creacion DATETIME = GETDATE()
    SELECT @prt_client_id
    -------------------------------------------------------------------------------------------------------------------
    -- Consolidar saldos de inventario
    -------------------------------------------------------------------------------------------------------------------
    BEGIN
        
        IF OBJECT_ID('tempdb..#saldos_wms') IS NOT NULL BEGIN
            DROP TABLE #saldos_wms
        END

        SELECT
             fecha_corte
            ,prt_client_id
            ,wh_id
            ,prtnum
            ,prtstyle
            ,invsts
            ,SUM(untqty) AS unidades_wms
            ,MIN(fecha_creacion) AS fecha_creacion
        INTO #saldos_wms
        FROM dbo.saldos_inventario a
        WHERE
            a.fecha_corte = @fecha_corte
        AND a.prt_client_id = @prt_client_id
        GROUP BY
             fecha_corte
            ,prt_client_id
            ,wh_id
            ,prtnum
            ,prtstyle
            ,invsts

        IF OBJECT_ID('tempdb..#salidas_en_proceso') IS NOT NULL BEGIN
	        DROP TABLE #salidas_en_proceso
        END

        SELECT
             a.fecha AS fecha_corte
            ,a.prt_client_id
            ,a.wh_id
	        ,a.prtnum
	        ,a.invsts
	        ,SUM(a.ordqty) AS unidades_en_proceso_despacho
        INTO #salidas_en_proceso
        FROM [$(historicoInv)].dbo.pedidos_pendientes_lineas a
        WHERE 1 = 1
        AND a.fecha = @fecha_corte
        AND a.prt_client_id = @prt_client_id
        GROUP BY
             a.fecha
            ,a.prt_client_id
            ,a.wh_id
	        ,a.prtnum
	        ,a.invsts
                            
        IF OBJECT_ID('tempdb..#saldos_inventario_opl') IS NOT NULL BEGIN
            DROP TABLE #saldos_inventario_opl
        END

        ;WITH
        cte_00 AS
        (
            SELECT
                 COALESCE(a.fecha_corte     ,b.fecha_corte) AS fecha_corte
                ,COALESCE(a.prt_client_id   ,b.prt_client_id) AS prt_client_id
                ,COALESCE(a.wh_id           ,b.wh_id) AS wh_id
                ,COALESCE(a.prtnum          ,b.prtnum) AS prtnum
                ,COALESCE(a.prtstyle        ,'') AS prtstyle
                ,COALESCE(a.invsts          ,b.invsts) AS invsts
		        ,COALESCE(a.unidades_wms    ,0) AS unidades_wms
		        ,COALESCE(b.unidades_en_proceso_despacho,0) AS unidades_en_proceso_despacho
		        ,0 AS unidades_en_proceso_recibo
	        FROM #saldos_wms a
	        FULL OUTER JOIN #salidas_en_proceso b ON
		        b.fecha_corte = a.fecha_corte
            AND b.prt_client_id = a.prt_client_id
            AND b.wh_id = a.wh_id
            AND b.prtnum = a.prtnum
	        AND b.invsts = a.invsts
        )
        SELECT
             SYSDATETIME() AS fecha_creacion
            ,fecha_corte
            ,a.prt_client_id
            ,a.wh_id
            ,a.prtnum
            ,COALESCE(b.lngdsc,'') AS prtdsc
            ,a.invsts
            ,COALESCE(c.lngdsc,'') AS invdsc
            ,a.prtstyle
            ,a.unidades_wms
            ,a.unidades_en_proceso_despacho
            ,a.unidades_en_proceso_recibo
	        ,a.unidades_wms - a.unidades_en_proceso_despacho - a.unidades_en_proceso_recibo AS unidades_opl
        INTO #saldos_inventario_opl
        FROM cte_00 a
        LEFT OUTER JOIN dbo.productos b ON
            b.prt_client_id = a.prt_client_id
        AND b.prtnum = a.prtnum
        LEFT OUTER JOIN dbo.estados_inventario c ON
            c.invsts = a.invsts
    END

    -------------------------------------------------------------------------------------------------------------------
    -- Limpiar registros del dia (en caso de volver a ejecutar el proceso por incidencia)
    -------------------------------------------------------------------------------------------------------------------
    BEGIN
        DELETE a
        FROM dbo.saldos_inventario_proyectados a
        WHERE
            a.fecha_corte = @fecha_corte
		AND a.prt_client_id = @prt_client_id
    END

    -------------------------------------------------------------------------------------------------------------------
    -- Consolidar saldos de inventario
    -------------------------------------------------------------------------------------------------------------------
    BEGIN
        INSERT INTO saldos_inventario_proyectados 
        (
         fecha_creacion
        ,fecha_corte
        ,prt_client_id
        ,wh_id
        ,prtnum
        ,prtdsc
        ,invsts
        ,invdsc
        ,prtstyle
        ,unidades_wms
        ,unidades_en_proceso_despacho
        ,unidades_en_proceso_recibo
        ,unidades_opl
        )
        SELECT
         fecha_creacion
        ,fecha_corte
        ,prt_client_id
        ,wh_id
        ,prtnum
        ,prtdsc
        ,invsts
        ,invdsc
        ,prtstyle
        ,unidades_wms
        ,unidades_en_proceso_despacho
        ,unidades_en_proceso_recibo
        ,unidades_opl
        FROM #saldos_inventario_opl a
    END

END TRY
BEGIN CATCH
    SELECT ERROR_MESSAGE()
    ;THROW;
END CATCH