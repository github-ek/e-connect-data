
CREATE PROCEDURE [dbo].[MergeMaestroProductosAtributosFromProduction2Test] AS
BEGIN
    BEGIN TRY

        BEGIN
            IF OBJECT_ID('tempdb..#productos_atributos') IS NOT NULL BEGIN
                DROP TABLE #productos_atributos
            END

            SELECT
                 a.*
            INTO #productos_atributos
            FROM [$(SERVER_MASTER_DATA)].[$(eConnectMasterData)].dbo.productos_atributos a

            DELETE a
            FROM #productos_atributos a
            LEFT OUTER JOIN [$(eConnect)].dbo.productos b ON
                b.id_producto = a.id_producto
            WHERE
                b.id_producto IS NULL
        END

        BEGIN TRANSACTION
        
        BEGIN
            MERGE [$(eConnect)].dbo.productos_atributos AS t
            USING #productos_atributos AS s ON 
                s.id_producto = t.id_producto
            AND s.id_bodega = t.id_bodega
			AND s.codigo = t.codigo
            WHEN MATCHED AND NOT (0 = 0
            AND t.valor		= s.valor
		    ) THEN
                UPDATE SET
				 t.valor					= s.valor
				,t.version                  = s.version
				,t.usuario_creacion			= s.usuario_creacion
				,t.fecha_creacion			= s.fecha_creacion
				,t.usuario_modificacion     = s.usuario_modificacion
				,t.fecha_modificacion		= s.fecha_modificacion
            WHEN NOT MATCHED BY TARGET THEN 
                INSERT 
			    (id_producto
				,id_bodega
				,codigo
				,valor
				,version
				,usuario_creacion
				,fecha_creacion
				,usuario_modificacion
				,fecha_modificacion)
                VALUES
			    (id_producto
				,id_bodega
				,codigo
				,valor
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
