
CREATE PROCEDURE [dbo].[MergeMaestroProductosMedidasFromProduction2Test] AS
BEGIN
    BEGIN TRY

        BEGIN
            IF OBJECT_ID('tempdb..#productos_medidas') IS NOT NULL BEGIN
                DROP TABLE #productos_medidas
            END

            SELECT
                 a.*
            INTO #productos_medidas
            FROM [$(SERVER_MASTER_DATA)].[$(eConnectMasterData)].dbo.productos_medidas a

            DELETE a
            FROM #productos_medidas a
            LEFT OUTER JOIN [$(eConnect)].dbo.productos b ON
                b.id_producto = a.id_producto
            WHERE
                b.id_producto IS NULL
        END

        BEGIN TRANSACTION
        
        BEGIN
            MERGE [$(eConnect)].dbo.productos_medidas AS t
            USING #productos_medidas AS s ON 
                s.id_producto = t.id_producto
            AND s.id_bodega = t.id_bodega
			AND s.id_unidad_medida = t.id_unidad_medida
            WHEN MATCHED AND NOT (0 = 0
            AND t.huella_codigo		= s.huella_codigo
            AND t.nivel             = s.nivel
		    AND t.factor_conversion = s.factor_conversion
		    AND t.largo             = s.largo
            AND t.ancho             = s.ancho
            AND t.alto              = s.alto
            AND t.peso				= s.peso
            AND t.cas_flg			= s.cas_flg
            AND t.pal_flg			= s.pal_flg
            AND t.rcv_flg			= s.rcv_flg
		    ) THEN
                UPDATE SET
				 t.huella_codigo		= s.huella_codigo
				,t.nivel             = s.nivel
				,t.factor_conversion = s.factor_conversion
				,t.largo             = s.largo
				,t.ancho             = s.ancho
				,t.alto              = s.alto
				,t.peso				= s.peso
				,t.cas_flg			= s.cas_flg
				,t.pal_flg			= s.pal_flg
				,t.rcv_flg			= s.rcv_flg
				,t.version                  = s.version
				,t.usuario_creacion			= s.usuario_creacion
				,t.fecha_creacion			= s.fecha_creacion
				,t.usuario_modificacion     = s.usuario_modificacion
				,t.fecha_modificacion		= s.fecha_modificacion
            WHEN NOT MATCHED BY TARGET THEN 
                INSERT 
			    (id_producto
				,id_bodega
				,id_unidad_medida
				,huella_codigo
				,nivel
				,factor_conversion
				,largo
				,ancho
				,alto
				,peso
				,cas_flg
				,pal_flg
				,rcv_flg
				,version
				,usuario_creacion
				,fecha_creacion
				,usuario_modificacion
				,fecha_modificacion)
                VALUES
			    (id_producto
				,id_bodega
				,id_unidad_medida
				,huella_codigo
				,nivel
				,factor_conversion
				,largo
				,ancho
				,alto
				,peso
				,cas_flg
				,pal_flg
				,rcv_flg
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
