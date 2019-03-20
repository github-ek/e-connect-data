CREATE PROCEDURE [dbo].[corte_pedidos_pendientes_sp]
     @fecha_corte DATE = DATE
	,@prt_client_id VARCHAR(32)
WITH RECOMPILE AS
SET NOCOUNT ON;
BEGIN
    -------------------------------------------------------------------------------------------------------------------
    -- Inicializando valores por defecto
    -------------------------------------------------------------------------------------------------------------------
    IF @fecha_corte IS NULL BEGIN
        SET @fecha_corte = CAST(GETDATE() AS DATE)
    END

    -------------------------------------------------------------------------------------------------------------------
    -- Limpiando registros del dia (en caso de una repetición del proceso por una incidencia)
    -------------------------------------------------------------------------------------------------------------------
    BEGIN
        DELETE a
        FROM dbo.corte_wh_clientes a
        WHERE
            a.fecha = @fecha_corte
		AND a.prt_client_id = @prt_client_id

        DELETE a
        FROM dbo.pedidos_pendientes_lineas a
        WHERE
            a.fecha = @fecha_corte
		AND a.prt_client_id = @prt_client_id

        DELETE a
        FROM dbo.pedidos_pendientes_lineas_sin_stage a
        WHERE
            a.fecha = @fecha_corte
		AND a.prt_client_id = @prt_client_id
    END

    -------------------------------------------------------------------------------------------------------------------
    -- Generando consolidado de clientes x bodega x fecha
    -------------------------------------------------------------------------------------------------------------------
    BEGIN
	    INSERT INTO dbo.corte_wh_clientes
		    (fecha,prt_client_id,wh_id)
	    SELECT DISTINCT
		     fecha
		    ,prt_client_id
		    ,wh_id
	    FROM dbo.corteinv_hist a
        WHERE
            a.fecha = @fecha_corte
		AND a.prt_client_id = @prt_client_id
    END

    -------------------------------------------------------------------------------------------------------------------
    -- Generando consolidado de ordenes pendientes
    -------------------------------------------------------------------------------------------------------------------
    BEGIN
        INSERT INTO dbo.pedidos_pendientes_lineas
            (fecha
            ,prt_client_id
            ,wh_id
            ,ordnum
            ,adddte
            ,ordlin
            ,prtnum
            ,invsts
            ,ordqty
            ,fecha_creacion)
        SELECT
             @fecha_corte AS fecha
            ,b.prt_client_id
            ,b.wh_id
            ,a.ordnum
            ,a.adddte
            ,b.ordlin
            ,b.prtnum
            ,b.invsts_prg AS invsts
            ,b.ordqty
            ,GETDATE() AS fecha_creacion
        FROM [$(ttcwmsprd)].dbo.ord a
        INNER JOIN [$(ttcwmsprd)].dbo.ord_line b ON 
            b.wh_id = a.wh_id
        AND b.client_id = a.client_id
        AND b.ordnum = a.ordnum
        WHERE 0 = 0
        AND a.wave_flg = 1
        AND NOT EXISTS
        (
            SELECT '1'
            FROM [$(ttcwmsprd)].dbo.shipment_line c
            INNER JOIN [$(ttcwmsprd)].dbo.shipment d ON 
                d.wh_id = c.wh_id
            AND d.ship_id = c.ship_id
            AND d.shpsts IN ('L','D','C')
            WHERE 
                c.wh_id = a.wh_id
            AND c.client_id = a.client_id
            AND c.ordnum = a.ordnum
        )
        AND a.adddte >= DATEADD(DAY,-30,@fecha_corte)
        AND a.adddte < @fecha_corte
		AND a.client_id = @prt_client_id
        --L CARGANDO: CARGANDO EL CARRO
        --D CARGADO: LE FALTA CERRAR LA PUERTA
        --C CARGA COMPLETA: SE FUE EL CARRO

        --S STAGE : EN MULLE
    END

    BEGIN
        INSERT INTO dbo.pedidos_pendientes_lineas_sin_stage
            (fecha
            ,prt_client_id
            ,wh_id
            ,ordnum
            ,adddte
            ,ordlin
            ,prtnum
            ,invsts
            ,ordqty
            ,fecha_creacion)
        SELECT
             @fecha_corte AS fecha
            ,b.prt_client_id
            ,b.wh_id
            ,a.ordnum
            ,a.adddte
            ,b.ordlin
            ,b.prtnum
            ,b.invsts_prg AS invsts
            ,b.ordqty
            ,GETDATE() AS fecha_creacion
        FROM [$(ttcwmsprd)].dbo.ord a
        INNER JOIN [$(ttcwmsprd)].dbo.ord_line b ON 
            b.wh_id = a.wh_id
        AND b.client_id = a.client_id
        AND b.ordnum = a.ordnum
        WHERE 0 = 0
        AND a.wave_flg = 1
        AND NOT EXISTS
        (
            SELECT '1'
            FROM [$(ttcwmsprd)].dbo.shipment_line c
            INNER JOIN [$(ttcwmsprd)].dbo.shipment d ON 
                d.wh_id = c.wh_id
            AND d.ship_id = c.ship_id
            AND d.shpsts IN ('S','L','D','C')
            WHERE 
                c.wh_id = a.wh_id
            AND c.client_id = a.client_id
            AND c.ordnum = a.ordnum
        )
        AND a.adddte >= DATEADD(DAY,-30,@fecha_corte)
        AND a.adddte < @fecha_corte
		AND a.client_id = @prt_client_id
        --L CARGANDO: CARGANDO EL CARRO
        --D CARGADO: LE FALTA CERRAR LA PUERTA
        --C CARGA COMPLETA: SE FUE EL CARRO

        --S STAGE : EN MULLE
    END

END