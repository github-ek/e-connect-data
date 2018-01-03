
CREATE PROCEDURE [dbo].[SincronizarBodegas]
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
			a.codigo = 'WMS_BODEGAS'
        
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
                ,a.id_bodega
                ,CAST(a.codigo AS NVARCHAR(32)) AS wh_id
                ,a.nombre
            FROM [$(eConnect)].dbo.bodegas a
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
        MERGE dbo.bodegas AS t
        USING #source AS s ON 
            s.id_bodega = t.id_bodega
        WHEN NOT MATCHED BY TARGET THEN
		    INSERT
		    (operacion
            ,fecha_creacion
            ,fecha_modificacion

            ,id_bodega
            ,wh_id
            ,nombre)
		    VALUES
		    ('C'
            ,fecha_modificacion
            ,fecha_modificacion

            ,id_bodega
            ,wh_id
            ,nombre)
        WHEN MATCHED THEN
		    UPDATE SET 
		     t.operacion = 'U'
		    ,t.fecha_modificacion = s.fecha_modificacion

		    ,t.wh_id = s.wh_id
            ,t.nombre = s.nombre
        ;
    END

	COMMIT TRANSACTION
END TRY
BEGIN CATCH
    SELECT ERROR_MESSAGE()
	ROLLBACK TRANSACTION
    ;THROW;
END CATCH