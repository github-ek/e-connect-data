CREATE PROCEDURE [dbo].[SincronizarMaestroProductosAtributos]
AS
BEGIN TRY
	BEGIN TRANSACTION
    
    --CONSOLIDAR SOURCE
    BEGIN
        IF OBJECT_ID('tempdb..#source') IS NOT NULL BEGIN
            DROP TABLE #source
        END

        SELECT
             a.id
            ,a.operacion
            ,a.cambio_notificado
            ,a.fecha_creacion
            ,a.fecha_modificacion

            ,a.prt_client_id
            ,a.prtnum
            ,a.wh_id

            ,CAST(a.dte_code AS VARCHAR(50)) AS dte_code
            ,CAST(a.lotflg AS VARCHAR(50)) AS lotflg
            ,CAST(a.untcst AS VARCHAR(50)) AS untcst
            ,a.moddte
            ,a.mod_usr_id
        INTO #source
        FROM [$(WMS_DB_SERVER)].[$(eHistoricos)].dbo.productos_atributos a
        WHERE   
            a.cambio_notificado = 0
    END


    --CONSOLIDAR TARGET
    BEGIN
        IF OBJECT_ID('tempdb..#source_unpivot') IS NOT NULL BEGIN
            DROP TABLE #source_unpivot
        END

        ;WITH
        cte_00 AS
        (
            SELECT
                 b.id
                ,b.operacion

                ,b.prt_client_id
                ,b.prtnum
                ,b.wh_id
                ,UPPER(b.codigo) AS codigo
                ,UPPER(b.valor) AS valor

                ,b.moddte
                ,b.mod_usr_id
            FROM #source a
            UNPIVOT (valor FOR codigo IN (dte_code,lotflg,untcst)) b
        )
        SELECT
            *
        INTO #source_unpivot
        FROM cte_00 a
        WHERE NOT (0 = 1
        OR (codigo = 'UNTCST' AND valor IN ('0','1'))
        OR (codigo = 'LOTFLG' AND valor IN ('0'))
        OR (codigo = 'DTE_CODE' AND valor IN (''))
        )

        IF OBJECT_ID('tempdb..#target') IS NOT NULL BEGIN
            DROP TABLE #target
        END

        ;WITH
        cte_00 AS
        (
            SELECT
                 a.id
                ,CASE 
                WHEN e.id_producto IS NOT NULL  AND a.operacion IN ('C') THEN 'U'
                WHEN e.id_producto IS NULL      AND a.operacion IN ('U') THEN 'C'
                ELSE a.operacion END AS operacion

                ,a.codigo
                ,a.valor
                
                ,a.mod_usr_id AS usuario_modificacion
                ,CAST(a.moddte AS DATETIME2(0)) AS fecha_modificacion

                ,b.id_cliente
                ,c.id_producto
                ,d.id_bodega

                ,a.prt_client_id
                ,a.prtnum
                ,a.wh_id
            FROM #source_unpivot a
            LEFT OUTER JOIN [$(eConnect)].dbo.clientes b ON
                b.codigo_alterno_wms = a.prt_client_id
            LEFT OUTER JOIN [$(eConnect)].dbo.productos c ON
                c.id_cliente = b.id_cliente
            AND c.codigo = a.prtnum
            LEFT OUTER JOIN [$(eConnect)].dbo.bodegas d ON
                d.codigo = a.wh_id
            LEFT OUTER JOIN [$(eConnect)].dbo.productos_atributos e ON
                e.id_producto = c.id_producto 
            AND e.id_bodega = d.id_bodega
            AND e.codigo = a.codigo
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
            FROM #target a
        )
        SELECT
            a.*
        INTO #inconsistencias
        FROM cte_00 a
        WHERE
            cliente_no_existe + bodega_no_existe + producto_no_existe > 0

        --TODO enviar errores a una tabla de error en errores
        DELETE a
        FROM #target a
        INNER JOIN #inconsistencias b ON
            b.id = a.id
    END
    
    --ACTUALIZAR TARGET
    BEGIN
        INSERT INTO [$(eConnect)].dbo.productos_atributos
           (id_producto,id_bodega,codigo,valor,[version],usuario_creacion,fecha_creacion,usuario_modificacion,fecha_modificacion)
        SELECT
             id_producto
            ,id_bodega
            ,codigo

            ,valor
            
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
             a.valor = b.valor

            ,a.usuario_modificacion = b.usuario_modificacion
            ,a.fecha_modificacion = b.fecha_modificacion
        FROM [$(eConnect)].dbo.productos_atributos a 
        INNER JOIN #target b ON
            b.id_producto = a.id_producto
        AND b.id_bodega = a.id_bodega
        AND b.codigo = a.codigo
        AND b.operacion = 'U'
        WHERE NOT (0 = 0
        AND a.valor = b.valor
        )

        DELETE a
        FROM [$(eConnect)].dbo.productos_atributos a 
        INNER JOIN #target b ON
            b.id_producto = a.id_producto
        AND b.id_bodega = a.id_bodega
        AND b.codigo = a.codigo
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
            FROM [$(WMS_DB_SERVER)].[$(eHistoricos)].dbo.productos_atributos a
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