CREATE PROCEDURE [dbo].[MergeMaestroConciliacionesProductosExcluidosFromProduction2Test] AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION

	    BEGIN

            MERGE [$(eConciliaciones)].dbo.productos_excluidos AS t
            USING [$(SERVER_MASTER_DATA)].[$(eConciliacionesMasterData)].dbo.productos_excluidos AS s ON 
                s.id_producto = t.id_producto
            WHEN NOT MATCHED BY TARGET THEN 
                INSERT 
			    (id_producto)
                VALUES
			    (id_producto)
			WHEN NOT MATCHED BY SOURCE THEN 
				DELETE
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

