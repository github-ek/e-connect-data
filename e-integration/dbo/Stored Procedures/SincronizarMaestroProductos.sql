CREATE PROCEDURE [dbo].[SincronizarMaestroProductos]
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
        FROM [$(WMS_DB_SERVER)].[$(eHistoricos)].dbo.productos a
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
                WHEN c.id_producto IS NOT NULL  AND a.operacion IN ('C') THEN 'U'
                WHEN c.id_producto IS NULL      AND a.operacion IN ('U') THEN 'C'
                ELSE a.operacion END AS operacion

                ,a.prtnum AS codigo
                ,UPPER(a.lngdsc) AS nombre
                ,a.dept_cod AS tipo_cobro
                ,0 AS ordinal

                ,a.mod_usr_id AS usuario_modificacion
                ,CAST(a.moddte AS DATETIME2(0)) AS fecha_modificacion

                ,b.id_cliente
                ,c.id_producto

                ,a.prt_client_id
            FROM #source a
            LEFT OUTER JOIN [$(eConnect)].dbo.clientes b ON
                b.codigo_alterno_wms = a.prt_client_id
            LEFT OUTER JOIN [$(eConnect)].dbo.productos c ON
                c.id_cliente = b.id_cliente
            AND c.codigo = a.prtnum
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
            FROM #target a
        )
        SELECT
            a.*
        INTO #inconsistencias
        FROM cte_00 a
        WHERE
            cliente_no_existe > 0

        --TODO enviar errores a una tabla de error en errores
        DELETE a
        FROM #target a
        INNER JOIN #inconsistencias b ON
            b.id = a.id
    END
    
    --ACTUALIZAR TARGET
    BEGIN
        INSERT INTO [$(eConnect)].dbo.productos
           (id_cliente,codigo,nombre,tipo_cobro,activo,[version],usuario_creacion,fecha_creacion,usuario_modificacion,fecha_modificacion)
        SELECT
             id_cliente

            ,codigo
            ,nombre
            ,tipo_cobro
            
            ,activo
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
             a.nombre = b.nombre
            ,a.tipo_cobro = b.tipo_cobro

            ,a.usuario_modificacion = b.usuario_modificacion
            ,a.fecha_modificacion = b.fecha_modificacion
        FROM [$(eConnect)].dbo.productos a 
        INNER JOIN #target b ON
            b.id_producto = a.id_producto
        AND b.operacion = 'U'
        WHERE NOT (0 = 0
        AND a.nombre = b.nombre
        AND a.tipo_cobro = b.tipo_cobro
        )

        UPDATE a
        SET
             a.activo = 0
            ,a.usuario_modificacion = b.usuario_modificacion
            ,a.fecha_modificacion = b.fecha_modificacion
        FROM [$(eConnect)].dbo.productos a 
        INNER JOIN #target b ON
            b.id_producto = a.id_producto
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
            FROM [$(WMS_DB_SERVER)].[$(eHistoricos)].dbo.productos a
            INNER JOIN #notificados b ON
                b.id = a.id
            AND a.cambio_notificado = 0
        END
    END

END TRY
BEGIN CATCH
    SELECT ERROR_MESSAGE()
	ROLLBACK TRANSACTION
    ;THROW;
END CATCH