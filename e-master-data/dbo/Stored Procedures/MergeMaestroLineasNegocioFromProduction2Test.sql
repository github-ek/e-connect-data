CREATE PROCEDURE [dbo].[MergeMaestroLineasNegocioFromProduction2Test] AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION

        BEGIN
            MERGE [$(eConnect)].dbo.lineas_negocio AS t
            USING [$(SERVER_MASTER_DATA)].[$(eConnectMasterData)].dbo.lineas_negocio AS s ON 
                s.id_linea_negocio = t.id_linea_negocio
            WHEN MATCHED AND NOT (0 = 0
			AND t.id_unidad_negocio     = s.id_unidad_negocio
            AND t.codigo                = s.codigo
            AND t.nombre                = s.nombre
            AND t.descripcion			= s.descripcion
			AND t.ordinal               = s.ordinal
			AND t.activo                = s.activo
		    ) THEN
                UPDATE SET
				 t.id_unidad_negocio        = s.id_unidad_negocio
                ,t.codigo                   = s.codigo
                ,t.nombre                   = s.nombre
                ,t.descripcion				= s.descripcion
                ,t.ordinal				    = s.ordinal
                ,t.activo                   = s.activo
				,t.version                  = s.version
                ,t.usuario_creacion			= s.usuario_creacion
                ,t.fecha_creacion			= s.fecha_creacion
                ,t.usuario_modificacion     = s.usuario_modificacion
                ,t.fecha_modificacion		= s.fecha_modificacion
            WHEN NOT MATCHED BY TARGET THEN 
                INSERT 
			    (id_linea_negocio
				,id_unidad_negocio
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
			    (id_linea_negocio
				,id_unidad_negocio
                ,codigo
                ,nombre
                ,descripcion
				,ordinal
                ,activo
				,version
                ,usuario_creacion
                ,fecha_creacion
                ,usuario_modificacion
                ,fecha_modificacion)		    ;
	    END

        COMMIT TRANSACTION
    END TRY
    BEGIN CATCH
        SELECT ERROR_MESSAGE()
	    ROLLBACK TRANSACTION
        ;THROW;
    END CATCH
END

