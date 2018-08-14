
CREATE PROCEDURE [dbo].[SincronizarEwmsUnidadesMedidas]
AS
BEGIN TRY

    --CONSOLIDAR SOURCE
    BEGIN
        IF OBJECT_ID('tempdb..#source') IS NOT NULL BEGIN
            DROP TABLE #source
        END

        SELECT
             a.fecha_creacion
            ,a.fecha_modificacion

            ,a.id_unidad_medida
            ,CAST(a.codigo AS NVARCHAR(2)) AS uomcod
            ,CAST(a.nombre AS NVARCHAR(100)) AS lngdsc
        INTO #source
        FROM [$(eConnect)].dbo.unidades_medida a
    END

    BEGIN TRANSACTION
    --MERGE
    BEGIN
        MERGE dbo.unidades_medida AS t
        USING #source AS s ON
            s.id_unidad_medida = t.id_unidad_medida
        WHEN NOT MATCHED BY TARGET THEN
		    INSERT
		    (operacion
            ,fecha_creacion
            ,fecha_modificacion

            ,id_unidad_medida
            ,uomcod
            ,lngdsc)
		    VALUES
		    ('C'
            ,fecha_modificacion
            ,fecha_modificacion

            ,id_unidad_medida
            ,uomcod
            ,lngdsc)
        WHEN MATCHED AND NOT (0 = 0
        AND t.uomcod    = s.uomcod
        AND t.lngdsc = s.lngdsc
        ) THEN
		    UPDATE SET 
		        t.operacion = 'U'
		    ,t.fecha_modificacion = s.fecha_modificacion

            ,t.uomcod       = s.uomcod
            ,t.lngdsc    = s.lngdsc
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