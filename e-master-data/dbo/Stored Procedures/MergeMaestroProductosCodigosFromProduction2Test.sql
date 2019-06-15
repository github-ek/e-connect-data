
CREATE PROCEDURE [dbo].[MergeMaestroProductosCodigosFromProduction2Test] AS
BEGIN
    BEGIN TRY

        BEGIN
            IF OBJECT_ID('tempdb..#productos_codigos') IS NOT NULL BEGIN
                DROP TABLE #productos_codigos
            END

            SELECT
                 a.*
            INTO #productos_codigos
            FROM [$(SERVER_MASTER_DATA)].[$(eConnectMasterData)].dbo.productos_codigos a

            DELETE a
            FROM #productos_codigos a
            LEFT OUTER JOIN [$(eConnect)].dbo.productos b ON
                b.id_producto = a.id_producto
            WHERE
                b.id_producto IS NULL
        END

        BEGIN TRANSACTION
        
        BEGIN
            MERGE [$(eConnect)].dbo.productos_codigos AS t
            USING #productos_codigos AS s ON 
                s.id_producto = t.id_producto
			AND s.codigo = t.codigo
			AND s.tipo_codigo = t.tipo_codigo
            WHEN MATCHED AND NOT (0 = 0
            AND t.activo		= s.activo
		    ) THEN
                UPDATE SET
				 t.activo					= s.activo
				,t.version                  = s.version
				,t.usuario_creacion			= s.usuario_creacion
				,t.fecha_creacion			= s.fecha_creacion
				,t.usuario_modificacion     = s.usuario_modificacion
				,t.fecha_modificacion		= s.fecha_modificacion
            WHEN NOT MATCHED BY TARGET THEN 
                INSERT 
			    (id_producto
				,codigo
				,tipo_codigo
				,activo
				,version
				,usuario_creacion
				,fecha_creacion
				,usuario_modificacion
				,fecha_modificacion)
                VALUES
			    (id_producto
				,codigo
				,tipo_codigo
				,activo
				,version
				,usuario_creacion
				,fecha_creacion
				,usuario_modificacion
				,fecha_modificacion)
            WHEN NOT MATCHED BY SOURCE THEN 
                DELETE
		    ;
	    END

        COMMIT TRANSACTION
    END TRY
    BEGIN CATCH
        SELECT ERROR_MESSAGE()
        IF @@TRANCOUNT > 0 BEGIN
	        ROLLBACK TRANSACTION
        END
        ;THROW;
    END CATCH
END
