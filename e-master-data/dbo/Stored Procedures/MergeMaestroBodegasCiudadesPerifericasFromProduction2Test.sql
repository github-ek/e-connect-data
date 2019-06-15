
CREATE PROCEDURE [dbo].[MergeMaestroBodegasCiudadesPerifericasFromProduction2Test] AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION

	    BEGIN
            MERGE [$(eConnect)].dbo.bodegas_ciudades_perifericas AS t
            USING [$(SERVER_MASTER_DATA)].[$(eConnectMasterData)].dbo.bodegas_ciudades_perifericas AS s ON 
                s.id_bodega = t.id_bodega
			AND s.id_ciudad = t.id_ciudad
            WHEN NOT MATCHED BY TARGET THEN 
                INSERT 
			    (id_bodega
                ,id_ciudad)
                VALUES
			    (id_bodega
                ,id_ciudad)
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

