
CREATE PROCEDURE [dbo].[SincronizarEwmsMaestroProductos]
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

            ,a.id_producto
            ,a.id_cliente
            ,CAST(b.codigo_alterno_wms AS NVARCHAR(32)) AS prt_client_id
            ,CAST(a.codigo AS NVARCHAR(50)) AS prtnum
            ,CAST(a.nombre AS NVARCHAR(250)) AS nombre
            ,CAST(a.tipo_cobro AS NVARCHAR(5)) AS dept_cod
        INTO #source
        FROM [$(eConnect)].dbo.productos a
        INNER JOIN [$(eConnect)].dbo.clientes b ON
            b.id_cliente = a.id_cliente
        WHERE 1 = 1
    END

    BEGIN TRANSACTION
    --MERGE
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
            ,id_cliente
            ,prt_client_id
            ,prtnum
            ,nombre
            ,dept_cod)
		    VALUES
		    ('C'
            ,fecha_modificacion
            ,fecha_modificacion

            ,id_producto
            ,id_cliente
            ,prt_client_id
            ,prtnum
            ,nombre
            ,dept_cod)
        WHEN MATCHED AND NOT (0 = 0
        AND t.id_cliente    = s.id_cliente
        AND t.prt_client_id = s.prt_client_id
        AND t.prtnum        = s.prtnum
        AND t.nombre        = s.nombre
        AND t.dept_cod      = s.dept_cod
        ) THEN
		    UPDATE SET 
		     t.operacion = 'U'
		    ,t.fecha_modificacion = s.fecha_modificacion

            ,t.id_cliente       = s.id_cliente
            ,t.prt_client_id    = s.prt_client_id
            ,t.prtnum           = s.prtnum
            ,t.nombre           = s.nombre
            ,t.dept_cod         = s.dept_cod
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