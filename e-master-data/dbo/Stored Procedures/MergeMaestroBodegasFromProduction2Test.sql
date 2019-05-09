
CREATE PROCEDURE [dbo].[MergeMaestroBodegasFromProduction2Test] AS
BEGIN
	SET NOCOUNT ON;

    BEGIN TRY
        BEGIN TRANSACTION

        --bodegas(Satelite)
	    BEGIN
            MERGE [$(eConnect)].dbo.bodegas AS t
            USING [$(EC_DB_SERVER_LEGADO)].[$(eConnectLegado)].dbo.bodegas AS s ON 
                s.id_bodega = t.id_bodega
            WHEN MATCHED AND NOT (0 = 0
            AND t.codigo                    = s.codigo
		    AND t.nombre                    = s.nombre
		    AND COALESCE(t.id_ciudad,-1)    = COALESCE(s.id_ciudad,-1)
		    AND t.direccion                 = s.direccion
			AND COALESCE(t.contacto,'')		= COALESCE(s.contacto,'')
			AND COALESCE(t.telefono,'')     = COALESCE(s.telefono,'')
            AND t.ordinal                   = s.ordinal
		    AND t.activo                    = s.activo
		    ) THEN
                UPDATE SET
                 t.codigo                   = s.codigo
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
			    (id_bodega
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
			    (id_bodega
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

