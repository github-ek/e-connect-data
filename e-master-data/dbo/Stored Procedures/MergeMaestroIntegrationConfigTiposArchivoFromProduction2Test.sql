CREATE PROCEDURE [dbo].[MergeMaestroIntegrationConfigTiposArchivoFromProduction2Test] AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION

	    BEGIN

            MERGE [$(eIntegrationConfig)].dbo.integraciones AS t
            USING [$(SERVER_MASTER_DATA)].[$(eIntegrationConfigMasterData)].dbo.integraciones AS s ON 
                s.id_integracion = t.id_integracion
            WHEN MATCHED AND NOT (0 = 0
			AND t.codigo                    = s.codigo
		    AND t.nombre                    = s.nombre
            AND t.descripcion               = s.descripcion
			AND t.fecha_ultima_extraccion   = s.fecha_ultima_extraccion
            AND t.ordinal                   = s.ordinal
		    AND t.activo                    = s.activo
		    ) THEN
                UPDATE SET
                 t.codigo                   = s.codigo
				,t.nombre                   = s.nombre
                ,t.descripcion              = s.descripcion
				,t.fecha_ultima_extraccion  = s.fecha_ultima_extraccion
                ,t.ordinal                  = s.ordinal
                ,t.activo                   = s.activo
				,t.version                  = s.version
                ,t.usuario_creacion			= s.usuario_creacion
                ,t.fecha_creacion			= s.fecha_creacion
                ,t.usuario_modificacion     = s.usuario_modificacion
                ,t.fecha_modificacion		= s.fecha_modificacion
            WHEN NOT MATCHED BY TARGET THEN 
                INSERT 
			    (id_integracion
				,codigo
                ,nombre
                ,descripcion
				,fecha_ultima_extraccion
				,ordinal
                ,activo
				,version
                ,usuario_creacion
                ,fecha_creacion
                ,usuario_modificacion
                ,fecha_modificacion)
                VALUES
			    (id_integracion
				,codigo
                ,nombre
                ,descripcion
				,fecha_ultima_extraccion
				,ordinal
                ,activo
				,version
                ,usuario_creacion
                ,fecha_creacion
                ,usuario_modificacion
                ,fecha_modificacion)
			WHEN NOT MATCHED BY SOURCE THEN
				DELETE
		    ;

            MERGE [$(eIntegrationConfig)].dbo.grupos_tipo_archivo AS t
            USING [$(SERVER_MASTER_DATA)].[$(eIntegrationConfigMasterData)].dbo.grupos_tipo_archivo AS s ON 
                s.id_grupo_tipo_archivo		= t.id_grupo_tipo_archivo
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
			    (id_grupo_tipo_archivo
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
			    (id_grupo_tipo_archivo
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
			WHEN NOT MATCHED BY SOURCE AND NOT EXISTS (SELECT * FROM [$(eIntegrationConfig)].dbo.tipos_archivo a WHERE a.id_grupo_tipo_archivo = t.id_grupo_tipo_archivo) THEN 
				DELETE
		    ;

            MERGE [$(eIntegrationConfig)].dbo.tipos_archivo AS t
            USING [$(SERVER_MASTER_DATA)].[$(eIntegrationConfigMasterData)].dbo.tipos_archivo AS s ON 
                s.id_tipo_archivo			= t.id_tipo_archivo
            WHEN MATCHED AND NOT (0 = 0
			AND t.id_grupo_tipo_archivo     = s.id_grupo_tipo_archivo
			AND t.codigo                    = s.codigo
		    AND t.nombre                    = s.nombre
            AND t.descripcion               = s.descripcion
			AND t.separador_registros       = s.separador_registros
			AND t.separador_campos          = s.separador_campos
            AND t.ordinal                   = s.ordinal
		    AND t.activo                    = s.activo
		    ) THEN
                UPDATE SET
                 t.id_grupo_tipo_archivo    = s.id_grupo_tipo_archivo
				,t.codigo                   = s.codigo
				,t.nombre                   = s.nombre
                ,t.descripcion              = s.descripcion
				,t.separador_registros      = s.separador_registros
				,t.separador_campos         = s.separador_campos
                ,t.ordinal                  = s.ordinal
                ,t.activo                   = s.activo
				,t.version                  = s.version
                ,t.usuario_creacion			= s.usuario_creacion
                ,t.fecha_creacion			= s.fecha_creacion
                ,t.usuario_modificacion     = s.usuario_modificacion
                ,t.fecha_modificacion		= s.fecha_modificacion
            WHEN NOT MATCHED BY TARGET THEN 
                INSERT 
			    (id_tipo_archivo
				,id_grupo_tipo_archivo
				,codigo
                ,nombre
                ,descripcion
				,separador_registros
				,separador_campos
				,ordinal
                ,activo
				,version
                ,usuario_creacion
                ,fecha_creacion
                ,usuario_modificacion
                ,fecha_modificacion)
                VALUES
			    (id_tipo_archivo
				,id_grupo_tipo_archivo
				,codigo
                ,nombre
                ,descripcion
				,separador_registros
				,separador_campos
				,ordinal
                ,activo
				,version
                ,usuario_creacion
                ,fecha_creacion
                ,usuario_modificacion
                ,fecha_modificacion)
			WHEN NOT MATCHED BY SOURCE 
			AND NOT EXISTS (SELECT * FROM [$(eIntegrationConfig)].dbo.campos a WHERE a.id_tipo_archivo = t.id_tipo_archivo) 
			AND NOT EXISTS (SELECT * FROM [$(eIntegrationConfig)].dbo.directorios a WHERE a.id_tipo_archivo = t.id_tipo_archivo) 
			AND NOT EXISTS (SELECT * FROM [$(eIntegrationConfig)].dbo.llaves a WHERE a.id_tipo_archivo = t.id_tipo_archivo) 
			THEN 
				DELETE
		    ;

			DELETE FROM [$(eIntegrationConfig)].dbo.llaves_campos
			DELETE FROM [$(eIntegrationConfig)].dbo.llaves
			DELETE FROM [$(eIntegrationConfig)].dbo.directorios
			DELETE FROM [$(eIntegrationConfig)].dbo.campos

			INSERT INTO [$(eIntegrationConfig)].dbo.campos
				(id_campo
				,id_tipo_archivo
				,ordinal
				,codigo
				,nombre
				,descripcion
				,tipo_dato
				,numero_caracteres
				,truncar_caracteres
				,ignorar
				,incluir
				,obligatorio_estructura
				,ordinal_transformacion
				,obligatorio_validacion
				,id_mapa
				,valor_predeterminado
				,formato
				,formato_numerico_separador_decimal
				,formato_numerico_separador_grupo
				,expresion_regular
				,valores_permitidos
				,valor_entero_min
				,valor_entero_max
				,valor_decimal_min
				,valor_decimal_max
				,valor_fecha_min
				,valor_fecha_max
				,valor_hora_min
				,valor_hora_max
				,activo
				,version
				,usuario_creacion
				,fecha_creacion
				,usuario_modificacion
				,fecha_modificacion)
			SELECT
				 id_campo
				,id_tipo_archivo
				,ordinal
				,codigo
				,nombre
				,descripcion
				,tipo_dato
				,numero_caracteres
				,truncar_caracteres
				,ignorar
				,incluir
				,obligatorio_estructura
				,ordinal_transformacion
				,obligatorio_validacion
				,id_mapa
				,valor_predeterminado
				,formato
				,formato_numerico_separador_decimal
				,formato_numerico_separador_grupo
				,expresion_regular
				,valores_permitidos
				,valor_entero_min
				,valor_entero_max
				,valor_decimal_min
				,valor_decimal_max
				,valor_fecha_min
				,valor_fecha_max
				,valor_hora_min
				,valor_hora_max
				,activo
				,version
				,usuario_creacion
				,fecha_creacion
				,usuario_modificacion
				,fecha_modificacion
			FROM [$(SERVER_MASTER_DATA)].[$(eIntegrationConfigMasterData)].dbo.campos 

			INSERT INTO [$(eIntegrationConfig)].dbo.directorios
				(id_directorio
				,id_tipo_archivo
				,subdirectorio_template
				,regexp
				,directorio_entradas
				,directorio_temporal
				,directorio_dump
				,directorio_procesados
				,directorio_errores
				,directorio_salidas
				,version
				,usuario_creacion
				,fecha_creacion
				,usuario_modificacion
				,fecha_modificacion)
			SELECT
				 id_directorio
				,id_tipo_archivo
				,subdirectorio_template
				,regexp
				,directorio_entradas
				,directorio_temporal
				,directorio_dump
				,directorio_procesados
				,directorio_errores
				,directorio_salidas
				,version
				,usuario_creacion
				,fecha_creacion
				,usuario_modificacion
				,fecha_modificacion
			FROM [$(SERVER_MASTER_DATA)].[$(eIntegrationConfigMasterData)].dbo.directorios 
	    
			INSERT INTO [$(eIntegrationConfig)].dbo.llaves
				(id_llave
				,id_tipo_archivo
				,codigo
				,ordinal
				,activo
				,version
				,usuario_creacion
				,fecha_creacion
				,usuario_modificacion
				,fecha_modificacion)
			SELECT
				 id_llave
				,id_tipo_archivo
				,codigo
				,ordinal
				,activo
				,version
				,usuario_creacion
				,fecha_creacion
				,usuario_modificacion
				,fecha_modificacion
			FROM [$(SERVER_MASTER_DATA)].[$(eIntegrationConfigMasterData)].dbo.llaves 

			INSERT INTO [$(eIntegrationConfig)].dbo.llaves_campos
				(id_llave
				,id_campo)
			SELECT
				 id_llave
				,id_campo
			FROM [$(SERVER_MASTER_DATA)].[$(eIntegrationConfigMasterData)].dbo.llaves_campos 
		END

        COMMIT TRANSACTION
    END TRY
    BEGIN CATCH
        SELECT ERROR_MESSAGE()
	    ROLLBACK TRANSACTION
        ;THROW;
    END CATCH
END

