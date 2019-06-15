
CREATE PROCEDURE [dbo].[MergeMaestroProductosFromProduction2Test] AS
BEGIN
    BEGIN TRY
        IF OBJECT_ID('tempdb..#productos') IS NOT NULL BEGIN
            DROP TABLE #productos
        END

        SELECT
            *
        INTO #productos
        FROM [$(SERVER_MASTER_DATA)].[$(eConnectMasterData)].dbo.productos a
        WHERE
        NOT (id_cliente = 18 AND codigo = '310228')
   
        BEGIN TRANSACTION

        BEGIN
            MERGE [$(eConnect)].dbo.productos AS t
            USING #productos AS s ON
                s.id_producto = t.id_producto
            WHEN MATCHED AND NOT (0 = 0
            AND t.codigo            = s.codigo
            AND t.nombre			= s.nombre
			AND t.tipo_cobro		= s.tipo_cobro
            AND t.activo            = s.activo
            ) THEN
            UPDATE SET
             t.codigo                   = s.codigo
            ,t.nombre                   = s.nombre
            ,t.tipo_cobro				= s.tipo_cobro
            ,t.activo                   = s.activo
			,t.version                  = s.version
            ,t.usuario_creacion			= s.usuario_creacion
            ,t.fecha_creacion			= s.fecha_creacion
            ,t.usuario_modificacion     = s.usuario_modificacion
            ,t.fecha_modificacion		= s.fecha_modificacion
            WHEN NOT MATCHED BY TARGET AND (s.activo = 1) THEN 
            INSERT 
            (id_producto
            ,id_cliente
            ,codigo
            ,nombre
            ,tipo_cobro
            ,activo
			,version
            ,usuario_creacion
            ,fecha_creacion
            ,usuario_modificacion
            ,fecha_modificacion)
            VALUES
            (id_producto
            ,id_cliente
            ,codigo
            ,nombre
            ,tipo_cobro
            ,activo
			,version
            ,usuario_creacion
            ,fecha_creacion
            ,usuario_modificacion
            ,fecha_modificacion)
            ;
        END

        COMMIT TRANSACTION
    END TRY
    BEGIN CATCH
        SELECT ERROR_MESSAGE()
	    ROLLBACK TRANSACTION
        ;THROW;
    END CATCH
END

