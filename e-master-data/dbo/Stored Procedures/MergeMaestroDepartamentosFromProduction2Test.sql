
CREATE PROCEDURE [dbo].[MergeMaestroDepartamentosFromProduction2Test] AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION

	    BEGIN
            MERGE [$(eConnect)].dbo.departamentos AS t
            USING [$(SERVER_MASTER_DATA)].[$(eConnectMasterData)].dbo.departamentos AS s ON 
                s.id_departamento = t.id_departamento
            WHEN MATCHED AND NOT (0 = 0
			AND t.id_pais                   = s.id_pais
            AND t.codigo                    = s.codigo
		    AND t.nombre                    = s.nombre
			AND t.nombre_alterno            = s.nombre_alterno
			AND COALESCE(t.codigo_alterno_tms,'')	= COALESCE(s.codigo_alterno_tms,'')
		    AND COALESCE(t.cx,0.0)			= COALESCE(s.cx,0.0)
		    AND COALESCE(t.cy,0.0)			= COALESCE(s.cy,0.0)
            AND t.ordinal                   = s.ordinal
		    AND t.activo                    = s.activo
		    ) THEN
                UPDATE SET
			     t.id_pais                   = s.id_pais
                ,t.codigo                   = s.codigo
                ,t.nombre                   = s.nombre
				,t.nombre_alterno           = s.nombre_alterno
				,t.codigo_alterno_tms       = s.codigo_alterno_tms
                ,t.cx						= s.cx
                ,t.cy						= s.cy
                ,t.ordinal                  = s.ordinal
                ,t.activo                   = s.activo
				,t.version                  = s.version
                ,t.usuario_creacion			= s.usuario_creacion
                ,t.fecha_creacion			= s.fecha_creacion
                ,t.usuario_modificacion     = s.usuario_modificacion
                ,t.fecha_modificacion		= s.fecha_modificacion
            WHEN NOT MATCHED BY TARGET THEN 
                INSERT 
			    (id_departamento
				,id_pais
                ,codigo
                ,nombre
				,nombre_alterno
				,codigo_alterno_tms
                ,cx
                ,cy
                ,ordinal
                ,activo
				,version
                ,usuario_creacion
                ,fecha_creacion
                ,usuario_modificacion
                ,fecha_modificacion)
                VALUES
			    (id_departamento
				,id_pais
                ,codigo
                ,nombre
				,nombre_alterno
				,codigo_alterno_tms
                ,cx
                ,cy
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

