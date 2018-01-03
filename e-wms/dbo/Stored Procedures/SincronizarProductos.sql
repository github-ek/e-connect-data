
CREATE PROCEDURE [dbo].[SincronizarProductos]
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
			a.codigo = 'WMS_PRODUCTOS'
        
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
                ,a.id_producto
                ,CAST(b.codigo_alterno_wms AS NVARCHAR(32)) AS prt_client_id
                ,CAST(a.codigo AS NVARCHAR(50)) AS prtnum
                ,CAST(a.nombre AS NVARCHAR(250)) AS nombre
            FROM [$(eConnect)].dbo.productos a
            INNER JOIN [$(eConnect)].dbo.clientes b ON
                b.id_cliente = a.id_cliente
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
        MERGE dbo.productos AS t
        USING #source AS s ON 
            s.id_producto = t.id_producto
        WHEN NOT MATCHED BY TARGET THEN
		    INSERT
		    (operacion
            ,fecha_creacion
            ,fecha_modificacion

            ,id_producto
            ,prt_client_id
            ,prtnum
            ,nombre)
		    VALUES
		    ('C'
            ,fecha_modificacion
            ,fecha_modificacion

            ,id_producto
            ,prt_client_id
            ,prtnum
            ,nombre)
        WHEN MATCHED THEN
		    UPDATE SET 
		     t.operacion = 'U'
		    ,t.fecha_modificacion = s.fecha_modificacion

		    ,t.prt_client_id = s.prt_client_id
		    ,t.prtnum = s.prtnum
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