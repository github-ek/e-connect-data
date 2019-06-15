CREATE PROCEDURE [dbo].[MergeMaestroIntegrationConfigMapasFromProduction2Test] AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION

	    BEGIN

			MERGE [$(eIntegrationConfig)].dbo.grupos_mapa AS t
            USING [$(SERVER_MASTER_DATA)].[$(eIntegrationConfigMasterData)].dbo.grupos_mapa AS s ON 
                s.id_grupo_mapa = t.id_grupo_mapa
            WHEN MATCHED AND NOT (0 = 0
			AND t.codigo                    = s.codigo
		    AND t.nombre                    = s.nombre
            AND t.descripcion               = s.descripcion
            AND t.ordinal                   = s.ordinal
		    AND t.activo                    = s.activo
		    ) THEN
                UPDATE SET
                 t.codigo                   = s.codigo
				,t.nombre                   = s.nombre
                ,t.descripcion              = s.descripcion
                ,t.ordinal                  = s.ordinal
                ,t.activo                   = s.activo
				,t.version                  = s.version
                ,t.usuario_creacion			= s.usuario_creacion
                ,t.fecha_creacion			= s.fecha_creacion
                ,t.usuario_modificacion     = s.usuario_modificacion
                ,t.fecha_modificacion		= s.fecha_modificacion
            WHEN NOT MATCHED BY TARGET THEN 
                INSERT 
			    (id_grupo_mapa
				,codigo
                ,nombre
                ,descripcion
				,ordinal
                ,activo
				,version
                ,usuario_creacion
                ,fecha_creacion
                ,usuario_modificacion
                ,fecha_modificacion)
                VALUES
			    (id_grupo_mapa
				,codigo
                ,nombre
                ,descripcion
				,ordinal
                ,activo
				,version
                ,usuario_creacion
                ,fecha_creacion
                ,usuario_modificacion
                ,fecha_modificacion)
			WHEN NOT MATCHED BY SOURCE AND NOT EXISTS (SELECT * FROM [$(eIntegrationConfig)].dbo.mapas a WHERE a.id_grupo_mapa = t.id_grupo_mapa) THEN 
				DELETE
		    ;

            MERGE [$(eIntegrationConfig)].dbo.mapas AS t
            USING [$(SERVER_MASTER_DATA)].[$(eIntegrationConfigMasterData)].dbo.mapas AS s ON 
                s.id_mapa = t.id_mapa
            WHEN MATCHED AND NOT (0 = 0
			AND t.id_grupo_mapa             = s.id_grupo_mapa
			AND t.codigo                    = s.codigo
		    AND t.nombre                    = s.nombre
            AND t.descripcion               = s.descripcion
			AND t.patron_clave              = s.patron_clave
            AND t.ordinal                   = s.ordinal
		    AND t.activo                    = s.activo
		    ) THEN
                UPDATE SET
				 t.id_grupo_mapa            = s.id_grupo_mapa
                ,t.codigo                   = s.codigo
				,t.nombre                   = s.nombre
                ,t.descripcion              = s.descripcion
				,t.patron_clave             = s.patron_clave
                ,t.ordinal                  = s.ordinal
                ,t.activo                   = s.activo
				,t.version                  = s.version
                ,t.usuario_creacion			= s.usuario_creacion
                ,t.fecha_creacion			= s.fecha_creacion
                ,t.usuario_modificacion     = s.usuario_modificacion
                ,t.fecha_modificacion		= s.fecha_modificacion
            WHEN NOT MATCHED BY TARGET THEN 
                INSERT 
			    (id_mapa
				,id_grupo_mapa
				,codigo
                ,nombre
                ,descripcion
				,patron_clave
				,ordinal
                ,activo
				,version
                ,usuario_creacion
                ,fecha_creacion
                ,usuario_modificacion
                ,fecha_modificacion)
                VALUES
			    (id_mapa
				,id_grupo_mapa
				,codigo
                ,nombre
                ,descripcion
				,patron_clave
				,ordinal
                ,activo
				,version
                ,usuario_creacion
                ,fecha_creacion
                ,usuario_modificacion
                ,fecha_modificacion)
			WHEN NOT MATCHED BY SOURCE AND NOT EXISTS (SELECT * FROM [$(eIntegrationConfig)].dbo.mapas_valores a WHERE a.id_mapa = t.id_mapa) THEN 
				DELETE
		    ;

			DELETE FROM [$(eIntegrationConfig)].dbo.mapas_valores

			INSERT INTO [$(eIntegrationConfig)].dbo.mapas_valores
				(id_mapa
				,clave
				,valor
				,version
				,usuario_creacion
				,fecha_creacion
				,usuario_modificacion
				,fecha_modificacion)
			SELECT
				id_mapa
				,clave
				,valor
				,version
				,usuario_creacion
				,fecha_creacion
				,usuario_modificacion
				,fecha_modificacion
			FROM [$(SERVER_MASTER_DATA)].[$(eIntegrationConfigMasterData)].dbo.mapas_valores 
	    END

        COMMIT TRANSACTION
    END TRY
    BEGIN CATCH
        SELECT ERROR_MESSAGE()
	    ROLLBACK TRANSACTION
        ;THROW;
    END CATCH
END

