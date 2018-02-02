CREATE PROCEDURE [dbo].[SincronizarMaestroClientes]
AS
BEGIN TRY
    SET NOCOUNT ON;

	BEGIN TRANSACTION
    
    --CONSOLIDAR SOURCE
    BEGIN
        IF OBJECT_ID('tempdb..#source') IS NOT NULL BEGIN
            DROP TABLE #source
        END

        SELECT 
            a.*
        INTO #source
        FROM [$(WMS_DB_SERVER)].[$(eHistoricos)].dbo.clientes a
        WHERE   
            a.cambio_notificado = 0
        AND a.client_id NOT IN ('TRANSEGA','TACTIC LOGISTICS SAS')
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
                WHEN b.id_cliente IS NOT NULL  AND a.operacion IN ('C') THEN 'U'
                WHEN b.id_cliente IS NULL      AND a.operacion IN ('U') THEN 'C'
                ELSE a.operacion END AS operacion

                ,a.client_id AS codigo
                ,a.adrnam AS nombre
                ,'NI' AS tipo_identificacion
                ,a.host_ext_id AS  numero_identificacion
                ,'' AS digito_verificacion
                ,0 AS id_empresa
                ,a.client_id AS codigo_alterno_wms

                ,'' AS usuario_modificacion
                ,CAST(a.fecha_modificacion AS DATETIME2(0)) AS fecha_modificacion

                ,b.id_cliente
            FROM #source a
            LEFT OUTER JOIN [$(eConnect)].dbo.clientes b ON
                b.codigo_alterno_wms = a.client_id
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

                ,CASE WHEN a.numero_identificacion = ''    THEN 1 ELSE 0 END AS numero_identificacion_vacia
                ,CASE WHEN b.id_cliente IS NOT NULL THEN 1 ELSE 0 END AS nombre_existente
                ,CASE WHEN c.id_cliente IS NOT NULL THEN 1 ELSE 0 END AS numero_identificacion_existente
            FROM #target a
            LEFT OUTER JOIN [$(eConnect)].dbo.clientes b ON
                b.nombre = a.nombre
            AND b.codigo_alterno_wms <> a.codigo_alterno_wms
            LEFT OUTER JOIN [$(eConnect)].dbo.clientes c ON
                c.numero_identificacion = a.numero_identificacion
            AND c.codigo_alterno_wms <> a.codigo_alterno_wms
        )
        SELECT
            a.*
        INTO #inconsistencias
        FROM cte_00 a
        WHERE
            numero_identificacion_vacia + nombre_existente + numero_identificacion_existente > 0

        --TODO enviar errores a una tabla de error en errores
        DELETE a
        FROM #target a
        INNER JOIN #inconsistencias b ON
            b.id = a.id
    END

    --ACTUALIZAR TARGET
    BEGIN
        INSERT INTO [$(eConnect)].dbo.clientes
            (codigo,nombre,tipo_identificacion,numero_identificacion,digito_verificacion,id_empresa,codigo_alterno_wms,activo,[version],usuario_creacion,fecha_creacion,usuario_modificacion,fecha_modificacion)
        SELECT
             codigo
            ,nombre
            ,tipo_identificacion
            ,numero_identificacion
            ,digito_verificacion
            ,id_empresa
            ,codigo_alterno_wms
            
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
            ,a.numero_identificacion =  b.numero_identificacion

            ,a.usuario_modificacion = ''
            ,a.fecha_modificacion = b.fecha_modificacion
        FROM [$(eConnect)].dbo.clientes a 
        INNER JOIN #target b ON
            b.id_cliente = a.id_cliente
        AND b.operacion = 'U'
        WHERE NOT (0 = 0
        AND a.nombre = b.nombre
        AND a.numero_identificacion =  b.numero_identificacion
        )

        UPDATE a
        SET
             a.activo = 0
            ,a.usuario_modificacion = b.usuario_modificacion
            ,a.fecha_modificacion = b.fecha_modificacion
        FROM [$(eConnect)].dbo.clientes a 
        INNER JOIN #target b ON
            b.id_cliente = a.id_cliente
        AND b.operacion = 'D'
    END

    COMMIT TRANSACTION

    UPDATE a
    SET a.cambio_notificado = 1
    FROM [$(WMS_DB_SERVER)].[$(eHistoricos)].dbo.clientes a
    INNER JOIN #source b ON
        b.id = a.id

END TRY
BEGIN CATCH
    SELECT ERROR_MESSAGE()
	ROLLBACK TRANSACTION
    ;THROW;
END CATCH