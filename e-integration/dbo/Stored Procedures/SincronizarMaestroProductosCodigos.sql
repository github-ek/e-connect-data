CREATE PROCEDURE [dbo].[SincronizarMaestroProductosCodigos]
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
        FROM [$(WMS_DB_SERVER)].[$(eHistoricos)].dbo.productos_codigos a
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
                WHEN d.id_producto IS NOT NULL  AND a.operacion IN ('C') THEN 'U'
                WHEN d.id_producto IS NULL      AND a.operacion IN ('U') THEN 'C'
                ELSE a.operacion END AS operacion


                ,a.alt_prtnum AS codigo
                ,a.alt_prt_typ AS tipo_codigo
                
                ,a.last_upd_user_id AS usuario_modificacion
                ,CAST(a.last_upd_dt AS DATETIME2(0)) AS fecha_modificacion

                ,b.id_cliente
                ,c.id_producto

                ,a.prt_client_id
                ,a.prtnum
            FROM #source a
            LEFT OUTER JOIN [$(eConnect)].dbo.clientes b ON
                b.codigo_alterno_wms = a.prt_client_id
            LEFT OUTER JOIN [$(eConnect)].dbo.productos c ON
                c.id_cliente = b.id_cliente
            AND c.codigo = a.prtnum
            LEFT OUTER JOIN [$(eConnect)].dbo.productos_codigos d ON
                d.id_producto = c.id_producto
            AND d.codigo = a.alt_prtnum
            AND d.tipo_codigo = a.alt_prt_typ
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
                ,CASE WHEN a.id_producto IS NULL THEN 1 ELSE 0 END AS producto_no_existe
            FROM #target a
        )
        SELECT
            a.*
        INTO #inconsistencias
        FROM cte_00 a
        WHERE
            cliente_no_existe + producto_no_existe > 0

        --TODO enviar errores a una tabla de error en errores
        DELETE a
        FROM #target a
        INNER JOIN #inconsistencias b ON
            b.id = a.id
    END

    --ACTUALIZAR TARGET
    BEGIN
        INSERT INTO [$(eConnect)].dbo.productos_codigos
           (id_producto,codigo,tipo_codigo,activo,[version],usuario_creacion,fecha_creacion,usuario_modificacion,fecha_modificacion)
        SELECT
             id_producto
            ,codigo
            ,tipo_codigo

            ,activo
            ,[version]
            ,usuario_modificacion
            ,fecha_modificacion
            ,usuario_modificacion
            ,fecha_modificacion
        FROM #target a
        WHERE
            a.operacion = 'C'
    
        --NA UPDATE

        DELETE a
        FROM [$(eConnect)].dbo.productos_codigos a 
        INNER JOIN #target b ON
            b.id_producto = a.id_producto
        AND b.codigo = a.codigo
        AND b.tipo_codigo = a.tipo_codigo
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
            FROM [$(WMS_DB_SERVER)].[$(eHistoricos)].dbo.productos_codigos a
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