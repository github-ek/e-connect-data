CREATE PROCEDURE [dbo].[SincronizarMaestroUnidadesMedida]
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
        FROM [$(WMS_DB_SERVER)].[$(eHistoricos)].dbo.unidades_medida a
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
                WHEN b.id_unidad_medida IS NOT NULL  AND a.operacion IN ('C') THEN 'U'
                WHEN b.id_unidad_medida IS NULL      AND a.operacion IN ('U') THEN 'C'
                ELSE a.operacion END AS operacion

                ,a.uomcod AS codigo
                ,a.lngdsc AS nombre
                ,'' AS descripcion
                ,0 AS ordinal

                ,'' AS usuario_modificacion
                ,CAST(a.fecha_modificacion AS DATETIME2(0)) AS fecha_modificacion

                ,b.id_unidad_medida
            FROM #source a
            LEFT OUTER JOIN [$(eConnect)].dbo.unidades_medida b ON
                b.codigo = a.uomcod
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
                ,CASE WHEN b.id_unidad_medida IS NOT NULL THEN 1 ELSE 0 END AS nombre_existente
            FROM #target a
            LEFT OUTER JOIN [$(eConnect)].dbo.unidades_medida b ON
                b.nombre = a.nombre
            AND b.codigo <> a.codigo
        )
        SELECT
            a.*
        INTO #inconsistencias
        FROM cte_00 a
        WHERE
            nombre_existente > 0

        --TODO enviar errores a una tabla de error en errores
        DELETE a
        FROM #target a
        INNER JOIN #inconsistencias b ON
            b.id = a.id
    END

    BEGIN
        INSERT INTO [$(eConnect)].dbo.unidades_medida
           (codigo,nombre,descripcion,ordinal,activo,[version],usuario_creacion,fecha_creacion,usuario_modificacion,fecha_modificacion)
        SELECT
             codigo
            ,nombre
            ,descripcion
            ,ordinal
            
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

            ,a.usuario_modificacion = b.usuario_modificacion
            ,a.fecha_modificacion = b.fecha_modificacion
        FROM [$(eConnect)].dbo.unidades_medida a 
        INNER JOIN #target b ON
            b.id_unidad_medida = a.id_unidad_medida
        AND b.operacion = 'U'
        WHERE NOT (0 = 0
        AND a.nombre = b.nombre
        )

        UPDATE a
        SET
             a.activo = 0
            ,a.usuario_modificacion = b.usuario_modificacion
            ,a.fecha_modificacion = b.fecha_modificacion
        FROM [$(eConnect)].dbo.unidades_medida a 
        INNER JOIN #target b ON
            b.id_unidad_medida = a.id_unidad_medida
        AND b.operacion = 'D'
    END

    COMMIT TRANSACTION

    UPDATE a
    SET a.cambio_notificado = 1
    FROM [$(WMS_DB_SERVER)].[$(eHistoricos)].dbo.unidades_medida a
    INNER JOIN #source b ON
        b.id = a.id

END TRY
BEGIN CATCH
    SELECT ERROR_MESSAGE()
	ROLLBACK TRANSACTION
    ;THROW;
END CATCH