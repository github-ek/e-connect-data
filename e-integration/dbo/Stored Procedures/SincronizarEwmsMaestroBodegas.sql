
CREATE PROCEDURE [dbo].[SincronizarEwmsMaestroBodegas]
AS
BEGIN TRY
    BEGIN TRANSACTION

    --CONSOLIDAR SOURCE
    BEGIN
        IF OBJECT_ID('tempdb..#source') IS NOT NULL BEGIN
            DROP TABLE #source
        END

        SELECT
             a.fecha_creacion
            ,a.fecha_modificacion

            ,a.id_bodega
            ,CAST(a.codigo AS NVARCHAR(32)) AS wh_id
            ,a.nombre
            ,a.id_ciudad
            ,b.nombre_alterno AS ciudad_nombre
        INTO #source
        FROM [$(eConnect)].dbo.bodegas a
        INNER JOIN [$(eConnect)].dbo.ciudades b ON
            b.id_ciudad = a.id_ciudad
    END 

    --MERGE
    BEGIN
        MERGE [$(eWms)].dbo.bodegas AS t
        USING #source AS s ON
            s.id_bodega = t.id_bodega
        WHEN NOT MATCHED BY TARGET THEN
		    INSERT
		    (operacion
            ,fecha_creacion
            ,fecha_modificacion

            ,id_bodega
            ,wh_id
            ,nombre
            ,id_ciudad
            ,ciudad_nombre)
		    VALUES
		    ('C'
            ,fecha_modificacion
            ,fecha_modificacion

            ,id_bodega
            ,wh_id
            ,nombre
            ,id_ciudad
            ,ciudad_nombre)
        WHEN MATCHED AND NOT (0 = 0
        AND t.wh_id         = s.wh_id
        AND t.nombre        = s.nombre
        AND coalesce(t.id_ciudad,-1)     = s.id_ciudad
        AND coalesce(t.ciudad_nombre,'') = s.ciudad_nombre
        ) THEN
		    UPDATE SET 
		        t.operacion = 'U'
		    ,t.fecha_modificacion = s.fecha_modificacion

            ,t.wh_id         = s.wh_id
            ,t.nombre        = s.nombre
            ,t.id_ciudad     = s.id_ciudad
            ,t.ciudad_nombre = s.ciudad_nombre
        WHEN NOT MATCHED BY SOURCE THEN 
            DELETE
		;
	END

    COMMIT TRANSACTION
END TRY
BEGIN CATCH
    SELECT ERROR_MESSAGE()
    IF @@TRANCOUNT > 0 BEGIN
	    ROLLBACK TRANSACTION
    END
    ;THROW;
END CATCH