CREATE PROCEDURE [dbo].[SincronizarMaestroProductosMedidas]
AS
BEGIN TRY
	BEGIN TRANSACTION
    
    --CONSOLIDAR SOURCE
    BEGIN
        IF OBJECT_ID('tempdb..#source') IS NOT NULL BEGIN
            DROP TABLE #source
        END

        SELECT
            a.*
        INTO #source
        FROM [$(WMS_DB_SERVER)].[$(eHistoricos)].dbo.productos_medidas a
        WHERE   
            a.cambio_notificado = 0
    END

    --CONSOLIDAR TARGET
    BEGIN
        IF OBJECT_ID('tempdb..#target') IS NOT NULL BEGIN
            DROP TABLE #target
        END

        ;WITH
        cte_00 AS
        (
            SELECT
                 a.id
                ,CASE 
                WHEN f.id_producto IS NOT NULL  AND a.operacion IN ('C') THEN 'U'
                WHEN f.id_producto IS NULL      AND a.operacion IN ('U') THEN 'C'
                ELSE a.operacion END AS operacion

                ,a.ftpcod AS huella_codigo
                ,a.uomlvl AS nivel
                ,a.untqty AS factor_conversion
                ,CAST(a.len AS DECIMAL(12,4)) AS largo
                ,CAST(a.wid AS DECIMAL(12,4)) AS ancho
                ,CAST(a.hgt AS DECIMAL(12,4)) AS alto
                ,CAST(a.grswgt AS DECIMAL(12,4)) AS peso
                ,a.rcv_flg
                ,a.cas_flg
                ,a.pal_flg
                
                ,a.last_upd_user_id AS usuario_modificacion
                ,CAST(a.last_upd_dt AS DATETIME2(0)) AS fecha_modificacion

                ,b.id_cliente
                ,c.id_producto
                ,d.id_bodega
                ,e.id_unidad_medida
                ,f.id_producto AS id_producto_medida

                ,a.prt_client_id
                ,a.prtnum
                ,a.wh_id
                ,a.uomcod
            FROM #source a
            LEFT OUTER JOIN [$(eConnect)].dbo.clientes b ON
                b.codigo_alterno_wms = a.prt_client_id
            LEFT OUTER JOIN [$(eConnect)].dbo.productos c ON
                c.id_cliente = b.id_cliente
            AND c.codigo = a.prtnum
            LEFT OUTER JOIN [$(eConnect)].dbo.bodegas d ON
                d.codigo = a.wh_id
            LEFT OUTER JOIN [$(eConnect)].dbo.unidades_medida e ON
                e.codigo = a.uomcod
            LEFT OUTER JOIN [$(eConnect)].dbo.productos_medidas f ON
                f.id_producto = c.id_producto 
            AND f.id_bodega = d.id_bodega
            AND f.id_unidad_medida = e.id_unidad_medida
        )
        SELECT
            a.*

            ,CAST(1 AS BIT) AS activo
            ,0 AS [version]
        INTO #target
        FROM cte_00 a
    END

    --DETECTAR INCONSISTENCIAS   
    BEGIN
        IF OBJECT_ID('tempdb..#inconsistencias') IS NOT NULL BEGIN
	        DROP TABLE #inconsistencias
        END

        ;WITH
        cte_00 AS
        (
            SELECT
                 a.*

                ,CASE WHEN a.id_cliente IS NULL THEN 1 ELSE 0 END AS cliente_no_existe
                ,CASE WHEN a.id_bodega IS NULL THEN 1 ELSE 0 END AS bodega_no_existe
                ,CASE WHEN a.id_producto IS NULL THEN 1 ELSE 0 END AS producto_no_existe
                ,CASE WHEN a.id_unidad_medida IS NULL THEN 1 ELSE 0 END AS unidad_medida_no_existe
                ,CASE WHEN a.rcv_flg = 1 AND factor_conversion <> 1 THEN 1 ELSE 0 END AS unidad_recibo_inconsistente
            FROM #target a
        )
        SELECT
            a.*
        INTO #inconsistencias
        FROM cte_00 a
        WHERE
            cliente_no_existe + bodega_no_existe + producto_no_existe + unidad_medida_no_existe + unidad_recibo_inconsistente > 0

        --TODO enviar errores a una tabla de error en errores
        DELETE a
        FROM #target a
        INNER JOIN #inconsistencias b ON
            b.id = a.id
    END

    --ACTUALIZAR TARGET
    BEGIN
        INSERT INTO [$(eConnect)].dbo.productos_medidas
           (id_producto,id_bodega,id_unidad_medida,huella_codigo,nivel,factor_conversion,largo,ancho,alto,peso,rcv_flg,cas_flg,pal_flg,[version],usuario_creacion,fecha_creacion,usuario_modificacion,fecha_modificacion)
        SELECT
             id_producto
            ,id_bodega
            ,id_unidad_medida

            ,huella_codigo
            ,nivel
            ,factor_conversion
            ,largo
            ,ancho
            ,alto
            ,peso
            ,rcv_flg
            ,cas_flg
            ,pal_flg
            
            ,[version]
            ,usuario_modificacion
            ,fecha_modificacion
            ,usuario_modificacion
            ,fecha_modificacion
        FROM #target a
        WHERE
            a.operacion = 'C'

        UPDATE a
        SET
             a.huella_codigo = b.huella_codigo
            ,a.nivel = b.nivel
            ,a.factor_conversion = b.factor_conversion
            ,a.largo = b.largo
            ,a.ancho = b.ancho
            ,a.alto = b.alto
            ,a.peso = b.peso
            ,a.rcv_flg = b.rcv_flg
            ,a.cas_flg = b.cas_flg
            ,a.pal_flg = b.pal_flg

            ,a.usuario_modificacion = b.usuario_modificacion
            ,a.fecha_modificacion = b.fecha_modificacion
        FROM [$(eConnect)].dbo.productos_medidas a 
        INNER JOIN #target b ON
            b.id_producto = a.id_producto
        AND b.id_bodega = a.id_bodega
        AND b.id_unidad_medida = a.id_unidad_medida
        AND b.operacion = 'U'
        WHERE NOT (0 = 0
        AND a.huella_codigo = b.huella_codigo
        AND a.nivel = b.nivel
        AND a.factor_conversion = b.factor_conversion
        AND a.largo = b.largo
        AND a.ancho = b.ancho
        AND a.alto = b.alto
        AND a.peso = b.peso
        AND a.rcv_flg = b.rcv_flg
        AND a.cas_flg = b.cas_flg
        AND a.pal_flg = b.pal_flg
        )

        DELETE a
        FROM [$(eConnect)].dbo.productos_medidas a 
        INNER JOIN #target b ON
            b.id_producto = a.id_producto
        AND b.id_bodega = a.id_bodega
        AND b.id_unidad_medida = a.id_unidad_medida
        AND b.operacion = 'D'
    END

    COMMIT TRANSACTION

    --ACTUALIZAR SOURCE
    BEGIN
        WHILE 1 = 1 
        BEGIN
            IF OBJECT_ID('tempdb..#notificados') IS NOT NULL BEGIN
                DROP TABLE #notificados
            END

            SELECT TOP 1000 
                id
            INTO #notificados
            FROM #source 
            WHERE 
                cambio_notificado = 0
            
            IF NOT EXISTS(SELECT 1 FROM #notificados) BREAK

            UPDATE a
            SET a.cambio_notificado = 1
            FROM #source a
            INNER JOIN #notificados b ON
                b.id = a.id

            UPDATE a
            SET a.cambio_notificado = 1
            FROM [$(WMS_DB_SERVER)].[$(eHistoricos)].dbo.productos_medidas a
            INNER JOIN #notificados b ON
                b.id = a.id
        END
    END

END TRY
BEGIN CATCH
    SELECT ERROR_MESSAGE()
	ROLLBACK TRANSACTION
    ;THROW;
END CATCH