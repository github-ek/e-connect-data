CREATE PROCEDURE [dbo].[MergeMaestroEmpresasFromProduction2Test] AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION

        BEGIN
            MERGE [$(eConnect)].dbo.empresas AS t
            USING [$(SERVER_MASTER_DATA)].[$(eConnectMasterData)].dbo.empresas AS s ON 
                s.id_empresa = t.id_empresa
            WHEN MATCHED AND NOT (0 = 0
            AND t.codigo                = s.codigo
            AND t.nombre                = s.nombre
            AND t.tipo_identificacion   = s.tipo_identificacion
            AND t.numero_identificacion = s.numero_identificacion
            AND t.digito_verificacion   = s.digito_verificacion
			AND t.ordinal               = s.ordinal
			AND t.activo                = s.activo
		    ) THEN
                UPDATE SET
                 t.codigo                   = s.codigo
                ,t.nombre                   = s.nombre
                ,t.tipo_identificacion      = s.tipo_identificacion
                ,t.numero_identificacion    = s.numero_identificacion
                ,t.digito_verificacion      = s.digito_verificacion
                ,t.ordinal				    = s.ordinal
                ,t.activo                   = s.activo
				,t.version                  = s.version
                ,t.usuario_creacion			= s.usuario_creacion
                ,t.fecha_creacion			= s.fecha_creacion
                ,t.usuario_modificacion     = s.usuario_modificacion
                ,t.fecha_modificacion		= s.fecha_modificacion
            WHEN NOT MATCHED BY TARGET THEN 
                INSERT 
			    (id_empresa
                ,codigo
                ,nombre
                ,tipo_identificacion
                ,numero_identificacion
                ,digito_verificacion
				,ordinal
                ,activo
				,version
                ,usuario_creacion
                ,fecha_creacion
                ,usuario_modificacion
                ,fecha_modificacion)
                VALUES
			    (id_empresa
                ,codigo
                ,nombre
                ,tipo_identificacion
                ,numero_identificacion
                ,digito_verificacion
				,ordinal
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

