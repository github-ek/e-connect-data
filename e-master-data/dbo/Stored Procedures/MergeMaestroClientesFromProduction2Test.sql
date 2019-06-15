CREATE PROCEDURE [dbo].[MergeMaestroClientesFromProduction2Test] AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION

        BEGIN
            MERGE [$(eConnect)].dbo.clientes AS t
            USING [$(SERVER_MASTER_DATA)].[$(eConnectMasterData)].dbo.clientes AS s ON 
                s.id_cliente = t.id_cliente
            WHEN MATCHED AND NOT (0 = 0
            AND t.codigo                = s.codigo
            AND t.nombre                = s.nombre
            AND t.tipo_identificacion   = s.tipo_identificacion
            AND t.numero_identificacion = s.numero_identificacion
            AND t.digito_verificacion   = s.digito_verificacion
			AND t.id_empresa            = s.id_empresa
		    AND t.codigo_alterno_wms    = s.codigo_alterno_wms
			AND COALESCE(t.codigo_alterno_tms,'') = COALESCE(s.codigo_alterno_tms,'')
			AND t.habilitado_conciliacion   = s.habilitado_conciliacion
			AND t.activo                = s.activo
		    ) THEN
                UPDATE SET
                 t.codigo                   = s.codigo
                ,t.nombre                   = s.nombre
                ,t.tipo_identificacion      = s.tipo_identificacion
                ,t.numero_identificacion    = s.numero_identificacion
                ,t.digito_verificacion      = s.digito_verificacion
                ,t.id_empresa				= s.id_empresa
                ,t.codigo_alterno_wms       = s.codigo_alterno_wms
                ,t.codigo_alterno_tms       = s.codigo_alterno_tms
                ,t.habilitado_conciliacion  = s.habilitado_conciliacion
                ,t.activo                   = s.activo
				,t.version                  = s.version
                ,t.usuario_creacion			= s.usuario_creacion
                ,t.fecha_creacion			= s.fecha_creacion
                ,t.usuario_modificacion     = s.usuario_modificacion
                ,t.fecha_modificacion		= s.fecha_modificacion
            WHEN NOT MATCHED BY TARGET THEN 
                INSERT 
			    (id_cliente
                ,codigo
                ,nombre
                ,tipo_identificacion
                ,numero_identificacion
                ,digito_verificacion
				,id_empresa
				,codigo_alterno_wms
				,codigo_alterno_tms
				,habilitado_conciliacion
                ,activo
				,version
                ,usuario_creacion
                ,fecha_creacion
                ,usuario_modificacion
                ,fecha_modificacion)
                VALUES
			    (id_cliente
                ,codigo
                ,nombre
                ,tipo_identificacion
                ,numero_identificacion
                ,digito_verificacion
				,id_empresa
				,codigo_alterno_wms
				,codigo_alterno_tms
				,habilitado_conciliacion
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

