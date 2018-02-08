CREATE PROCEDURE [dbo].[SincronizarMaestroBodegas]
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
        FROM [$(WMS_DB_SERVER)].[$(eHistoricos)].dbo.bodegas a
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
                WHEN b.id_bodega IS NOT NULL  AND a.operacion IN ('C') THEN 'U'
                WHEN b.id_bodega IS NULL      AND a.operacion IN ('U') THEN 'C'
                ELSE a.operacion END AS operacion

                ,a.wh_id AS codigo
                ,a.adrnam AS nombre
                ,RTRIM(LTRIM(a.adrln1)) AS direccion
                ,0 AS ordinal

                ,a.mod_usr_id AS usuario_modificacion
                ,CAST(a.moddte AS DATETIME2(0)) AS fecha_modificacion

                ,b.id_bodega
                ,c.id_ciudad

                ,a.adrcty
            FROM #source a
            LEFT OUTER JOIN [$(eConnect)].dbo.bodegas b ON
                b.codigo = a.wh_id
            LEFT OUTER JOIN [$(eConnect)].dbo.ciudades c ON
                c.nombre_alterno = a.adrcty
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

                ,CASE WHEN a.id_ciudad IS NULL THEN 1 ELSE 0 END AS ciudad_no_existe
                ,CASE WHEN a.direccion = ''    THEN 1 ELSE 0 END AS direccion_vacia
            FROM #target a
        )
        SELECT
            a.*
        INTO #inconsistencias
        FROM cte_00 a
        WHERE
            ciudad_no_existe + direccion_vacia > 0

        --TODO enviar errores a una tabla de error en errores
        DELETE a
        FROM #target a
        INNER JOIN #inconsistencias b ON
            b.id = a.id
    END

    --ACTUALIZAR TARGET
    BEGIN
        INSERT INTO [$(eConnect)].dbo.bodegas
           (codigo,nombre,id_ciudad,direccion,ordinal,activo,[version],usuario_creacion,fecha_creacion,usuario_modificacion,fecha_modificacion)
        SELECT
             codigo
            ,nombre
            ,id_ciudad
            ,direccion
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
            ,a.id_ciudad = b.id_ciudad
            ,a.direccion = b.direccion
            ,a.id_direccion = CASE WHEN a.id_ciudad = b.id_ciudad AND a.direccion = b.direccion THEN a.id_direccion ELSE NULL END

            ,a.usuario_modificacion = b.usuario_modificacion
            ,a.fecha_modificacion = b.fecha_modificacion
        FROM [$(eConnect)].dbo.bodegas a 
        INNER JOIN #target b ON
            b.id_bodega = a.id_bodega
        AND b.operacion = 'U'
        WHERE NOT (0 = 0
        AND a.nombre = b.nombre
        AND a.id_ciudad = b.id_ciudad
        AND a.direccion = b.direccion
        )

        UPDATE a
        SET
             a.activo = 0
            ,a.usuario_modificacion = b.usuario_modificacion
            ,a.fecha_modificacion = b.fecha_modificacion
        FROM [$(eConnect)].dbo.bodegas a 
        INNER JOIN #target b ON
            b.id_bodega = a.id_bodega
        AND b.operacion = 'D'
    END

    COMMIT TRANSACTION

    --ACTUALIZAR SOURCE
    UPDATE a
    SET a.cambio_notificado = 1
    FROM [$(WMS_DB_SERVER)].[$(eHistoricos)].dbo.bodegas a
    INNER JOIN #source b ON
        b.id = a.id

END TRY
BEGIN CATCH
    SELECT ERROR_MESSAGE()
	ROLLBACK TRANSACTION
    ;THROW;
END CATCH