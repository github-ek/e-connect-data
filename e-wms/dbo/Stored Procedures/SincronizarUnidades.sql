
CREATE PROCEDURE [dbo].[SincronizarUnidades]
AS
BEGIN TRY
    SET NOCOUNT ON;

	DECLARE @t AS TABLE(fecha_extraccion_anterior DATETIME2(0))
	DECLARE @fecha_extraccion_actual DATETIME2(0)
	DECLARE @fecha_extraccion_anterior DATETIME2(0)

	BEGIN TRANSACTION

	--OBTENER FECHA DE ULTIMA EXTRACCION
	BEGIN
		SET @fecha_extraccion_actual = SYSDATETIME()

		UPDATE a
		SET a.fecha_ultima_extraccion = @fecha_extraccion_actual
		OUTPUT deleted.fecha_ultima_extraccion
		INTO @t(fecha_extraccion_anterior)
		FROM [$(eIntegration)].dbo.integraciones a
		WHERE
			a.codigo = 'WMS_UNIDADES'
        
        SELECT
		    @fecha_extraccion_anterior = a.fecha_extraccion_anterior
		FROM @t a
	END

    --CONSOLIDACION SOURCE
    BEGIN
		IF OBJECT_ID('tempdb..#source') IS NOT NULL BEGIN
			DROP TABLE #source
		END

        ;WITH
        cte_00 AS
        (
            SELECT
                 SYSDATETIME() AS fecha_modificacion
                ,a.id_unidad_medida
                ,CAST(a.codigo AS NVARCHAR(2)) AS uomcod
            FROM [$(eConnect)].dbo.unidades_medida a
            WHERE
                a.fecha_modificacion > @fecha_extraccion_anterior
            AND a.fecha_modificacion <= @fecha_extraccion_actual
        )
        SELECT
             a.*
        INTO #source
        FROM cte_00 a
    END

    --MERGE TARGET/SOURCE
    BEGIN
        MERGE dbo.unidades AS t
        USING #source AS s ON 
            s.id_unidad = t.id_unidad
        WHEN NOT MATCHED BY TARGET THEN
		    INSERT
		    (operacion
            ,fecha_creacion
            ,fecha_modificacion

            ,id_unidad
            ,uomcod)
		    VALUES
		    ('C'
            ,fecha_modificacion
            ,fecha_modificacion

            ,id_unidad
            ,uomcod)
        WHEN MATCHED THEN
		    UPDATE SET 
		     t.operacion = 'U'
		    ,t.fecha_modificacion = s.fecha_modificacion

		    ,t.uomcod = s.uomcod
        ;
    END

	COMMIT TRANSACTION
END TRY
BEGIN CATCH
    SELECT ERROR_MESSAGE()
	ROLLBACK TRANSACTION
    ;THROW;
END CATCH