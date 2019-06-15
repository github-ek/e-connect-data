
CREATE PROCEDURE [dbo].[MergeMaestroBodegasVirtualesFromProduction2Test] AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION

	    BEGIN
            MERGE [$(eConnect)].dbo.bodegas_virtuales AS t
            USING [$(SERVER_MASTER_DATA)].[$(eConnectMasterData)].dbo.bodegas_virtuales AS s ON 
                s.id_bodega_virtual = t.id_bodega_virtual
            WHEN MATCHED AND NOT (0 = 0
            AND t.id_cliente                = s.id_cliente
			AND t.codigo                    = s.codigo
		    AND t.nombre                    = s.nombre
		    AND t.id_ciudad					= s.id_ciudad
		    AND t.direccion                 = s.direccion
			AND t.contacto					= s.contacto
			AND t.telefono					= s.telefono
            AND t.ordinal                   = s.ordinal
		    AND t.activo                    = s.activo
		    ) THEN
                UPDATE SET
                 t.id_cliente               = s.id_cliente
				,t.codigo                   = s.codigo
                ,t.nombre                   = s.nombre
                ,t.id_ciudad                = s.id_ciudad
                ,t.direccion                = s.direccion
				,t.contacto                 = s.contacto
				,t.telefono                 = s.telefono
                ,t.ordinal                  = s.ordinal
                ,t.activo                   = s.activo
				,t.version                  = s.version
                ,t.usuario_creacion			= s.usuario_creacion
                ,t.fecha_creacion			= s.fecha_creacion
                ,t.usuario_modificacion     = s.usuario_modificacion
                ,t.fecha_modificacion		= s.fecha_modificacion
            WHEN NOT MATCHED BY TARGET THEN 
                INSERT 
			    (id_bodega_virtual
				,id_cliente
                ,codigo
                ,nombre
                ,id_ciudad
                ,direccion
                ,contacto
                ,telefono
                ,ordinal
                ,activo
				,version
                ,usuario_creacion
                ,fecha_creacion
                ,usuario_modificacion
                ,fecha_modificacion)
                VALUES
			    (id_bodega_virtual
				,id_cliente
                ,codigo
                ,nombre
                ,id_ciudad
                ,direccion
                ,contacto
                ,telefono
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

