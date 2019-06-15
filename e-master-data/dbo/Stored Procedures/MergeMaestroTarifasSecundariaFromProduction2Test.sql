CREATE PROCEDURE [dbo].[MergeMaestroTarifasSecundariaFromProduction2Test] AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION

        BEGIN
            MERGE [$(eConnect)].dbo.tarifas_secundaria AS t
            USING [$(SERVER_MASTER_DATA)].[$(eConnectMasterData)].dbo.tarifas_secundaria AS s ON 
                s.id_tarifa_secundaria = t.id_tarifa_secundaria
            WHEN MATCHED AND NOT (0 = 0
            AND t.id_cliente				= s.id_cliente
            AND t.id_bodega					= s.id_bodega
            AND t.nombre					= s.nombre
            AND t.liquidar_por_kilos		= s.liquidar_por_kilos
            AND t.id_unidad_medida			= s.id_unidad_medida
            AND t.cantidad_minima			= s.cantidad_minima
            AND t.tarifa_normal				= s.tarifa_normal
			AND t.tarifa_diferencial_por_despacho_minimo = s.tarifa_diferencial_por_despacho_minimo
            AND t.porcentaje_seguro			= s.porcentaje_seguro
            AND t.tiene_ciudades_asociadas	= s.tiene_ciudades_asociadas
            AND t.activo					= s.activo
		    ) THEN
                UPDATE SET
				 t.id_cliente				= s.id_cliente
				,t.id_bodega				= s.id_bodega
				,t.nombre					= s.nombre
				,t.liquidar_por_kilos		= s.liquidar_por_kilos
				,t.id_unidad_medida			= s.id_unidad_medida
				,t.cantidad_minima			= s.cantidad_minima
				,t.tarifa_normal			= s.tarifa_normal
				,t.tarifa_diferencial_por_despacho_minimo = s.tarifa_diferencial_por_despacho_minimo
				,t.porcentaje_seguro		= s.porcentaje_seguro
				,t.tiene_ciudades_asociadas	= s.tiene_ciudades_asociadas
				,t.activo					= s.activo
				,t.version                  = s.version
                ,t.usuario_creacion			= s.usuario_creacion
                ,t.fecha_creacion			= s.fecha_creacion
                ,t.usuario_modificacion     = s.usuario_modificacion
                ,t.fecha_modificacion		= s.fecha_modificacion
            WHEN NOT MATCHED BY TARGET THEN 
                INSERT 
			    (id_tarifa_secundaria
				,id_cliente
				,id_bodega
				,nombre
				,liquidar_por_kilos
				,id_unidad_medida
				,cantidad_minima
				,tarifa_normal
				,tarifa_diferencial_por_despacho_minimo
				,porcentaje_seguro
				,tiene_ciudades_asociadas
				,activo
				,version
				,usuario_creacion
				,fecha_creacion
				,usuario_modificacion
				,fecha_modificacion)
                VALUES
			    (id_tarifa_secundaria
				,id_cliente
				,id_bodega
				,nombre
				,liquidar_por_kilos
				,id_unidad_medida
				,cantidad_minima
				,tarifa_normal
				,tarifa_diferencial_por_despacho_minimo
				,porcentaje_seguro
				,tiene_ciudades_asociadas
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

