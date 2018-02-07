
CREATE PROCEDURE [dbo].[SincronizarEwmsMaestroClientes]
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

            ,a.id_cliente
            ,CAST(a.codigo AS NVARCHAR(32)) AS client_id
            ,a.codigo
            ,a.nombre
            ,a.numero_identificacion
        INTO #source
        FROM [$(eConnect)].dbo.clientes a
    END 

    --MERGE
    BEGIN
        MERGE [$(eWms)].dbo.clientes AS t
        USING #source AS s ON
            s.id_cliente = t.id_cliente
        WHEN NOT MATCHED BY TARGET THEN
		    INSERT
		    (operacion
            ,fecha_creacion
            ,fecha_modificacion

            ,id_cliente
            ,client_id
            ,codigo
            ,nombre
            ,numero_identificacion)
		    VALUES
		    ('C'
            ,fecha_creacion
            ,fecha_modificacion

            ,id_cliente
            ,client_id
            ,codigo
            ,nombre
            ,numero_identificacion)
        WHEN MATCHED AND NOT (0 = 0
        AND t.client_id             = s.client_id
        AND t.codigo                = s.codigo
        AND t.nombre                = s.nombre
        AND t.numero_identificacion = s.numero_identificacion
        )
        THEN
		    UPDATE SET 
		        t.operacion = 'U'
		    ,t.fecha_modificacion       = s.fecha_modificacion

		    ,t.client_id                = s.client_id
		    ,t.codigo                   = s.codigo
            ,t.nombre                   = s.nombre
            ,t.numero_identificacion    = s.numero_identificacion
        WHEN NOT MATCHED BY SOURCE THEN 
            DELETE
		;
	END

    COMMIT TRANSACTION
END TRY
BEGIN CATCH
    SELECT ERROR_MESSAGE()
	ROLLBACK TRANSACTION
    ;THROW;
END CATCH
GO