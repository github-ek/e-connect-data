

CREATE PROCEDURE [dbo].[ProcesarCortesSaldosInventario]
AS
BEGIN
	DECLARE @id_corte_saldo_inventario BIGINT
	DECLARE @fecha_corte DATE
	DECLARE @prt_client_id VARCHAR(32)

    ---------------------------------------------------------------------------
    --
    ---------------------------------------------------------------------------
    BEGIN
		IF OBJECT_ID('tempdb..#cortes') IS NOT NULL BEGIN
			DROP TABLE #cortes
		END		

		SELECT
			 a.id_corte_saldo_inventario
			,a.fecha AS fecha_corte
			,b.codigo_alterno_wms AS prt_client_id
			,a.id_cliente
			,CONCAT('ESTADOS_CONCILIACION_OPL_',b.codigo) AS mapa_codigo
		INTO #cortes
		FROM [$(eConciliaciones)].dbo.cortes_saldos_inventario a
		INNER JOIN [$(eConnect)].dbo.clientes b ON
			b.id_cliente = a.id_cliente
		WHERE
			a.estado = 'NO_PROCESADO'

        DECLARE cursor_cortes CURSOR LOCAL FOR  
		SELECT
			 a.id_corte_saldo_inventario
			,a.fecha_corte
			,a.prt_client_id
		FROM #cortes a
		ORDER BY
			a.id_corte_saldo_inventario

        OPEN cursor_cortes  
        FETCH NEXT FROM cursor_cortes INTO @id_corte_saldo_inventario, @fecha_corte, @prt_client_id

        WHILE @@FETCH_STATUS = 0  
        BEGIN
            BEGIN TRY
				SELECT @id_corte_saldo_inventario, @id_corte_saldo_inventario, @fecha_corte, @prt_client_id

                EXEC [$(WMS_DB_SERVER)].[$(eHistoricos)].dbo.ConsolidarSaldosInventarioPorCliente @fecha_corte, @prt_client_id

				---------------------------------------------------------------------------
				-- COPIAR SALDOS WMS
				---------------------------------------------------------------------------
				BEGIN
					IF OBJECT_ID('tempdb..#saldos_wms') IS NOT NULL BEGIN
						DROP TABLE #saldos_wms
					END

					SELECT
						 @id_corte_saldo_inventario AS id_corte_saldo_inventario
						,MIN(a.fecha_creacion) AS fecha_corte_opl
						,a.wh_id AS bodega_codigo
						,a.prtnum AS producto_codigo
						,a.invsts AS id_estado_inventario
                        ,a.prtstyle
						,SUM(a.untqty) AS unidades_wms
					INTO #saldos_wms
					FROM [$(WMS_DB_SERVER)].[$(eHistoricos)].dbo.saldos_inventario a
					WHERE 1 = 1
					AND a.fecha_corte = @fecha_corte
					AND a.prt_client_id = @prt_client_id
					AND (a.lst_arecod IS NULL OR a.lst_arecod NOT IN ('SHIP'))
					GROUP BY
						 a.wh_id
						,a.prtnum
						,a.invsts
                        ,a.prtstyle
					
					IF OBJECT_ID('tempdb..#salidas_en_proceso') IS NOT NULL BEGIN
						DROP TABLE #salidas_en_proceso
					END

					SELECT
						 a.wh_id AS bodega_codigo
						,a.prtnum AS producto_codigo
						,a.invsts AS id_estado_inventario
						,SUM(a.ordqty) AS unidades_en_proceso_despacho
					INTO #salidas_en_proceso
					FROM [$(WMS_DB_SERVER)].[$(historicoInv)].dbo.pedidos_pendientes_lineas a
					WHERE 1 = 1
					AND a.fecha = @fecha_corte
					AND a.prt_client_id = @prt_client_id
					GROUP BY
						 a.wh_id
						,a.prtnum
						,a.invsts

					IF OBJECT_ID('tempdb..#corte') IS NOT NULL BEGIN
						DROP TABLE #corte
					END

					;WITH
					cte_00 AS
					(
						SELECT
							 a.id_corte_saldo_inventario
							,MIN(a.fecha_corte_opl) AS fecha_corte_opl
						FROM #saldos_wms a
						GROUP BY
							a.id_corte_saldo_inventario
					)
					SELECT
						 a.id_corte_saldo_inventario
						,a.fecha_corte_opl
						,b.id_cliente
						,c.id_mapa
					INTO #corte
					FROM cte_00 a
					INNER JOIN #cortes b ON
						b.id_corte_saldo_inventario = a.id_corte_saldo_inventario
					LEFT OUTER JOIN [$(eIntegration)].dbo.mapas c ON
						c.codigo = b.mapa_codigo
				END

				---------------------------------------------------------------------------
				-- REALIZAR CRUCE DATOS CLIENTE VS OPL
				---------------------------------------------------------------------------
				BEGIN TRANSACTION
				BEGIN
					---------------------------------------------------------------------------
					-- BLOQUEAR CORTE 
					---------------------------------------------------------------------------
					BEGIN
						UPDATE a
						SET  a.fecha_corte_opl = b.fecha_corte_opl
							,a.estado = 'PROCESADO'
							,a.version = a.version + 1
							,a.usuario_modificacion = SYSTEM_USER
							,a.fecha_modificacion = SYSDATETIME()
						FROM [$(eConciliaciones)].dbo.cortes_saldos_inventario a
						INNER JOIN #corte b ON
							b.id_corte_saldo_inventario = a.id_corte_saldo_inventario
					END

					---------------------------------------------------------------------------
					-- CONSOLIDAR MAPA
					---------------------------------------------------------------------------
					BEGIN
						IF OBJECT_ID('tempdb..#mapa_estados_conciliacion') IS NOT NULL BEGIN
							DROP TABLE #mapa_estados_conciliacion
						END

						SELECT
							 b.clave AS id_estado_inventario
							,b.valor AS estado_conciliacion_codigo
							,COALESCE(c.id_estado_conciliacion,0) AS id_estado_conciliacion
						INTO #mapa_estados_conciliacion
						FROM #corte a
						INNER JOIN [$(eIntegration)].dbo.mapas_valores b ON
							b.id_mapa = a.id_mapa
						LEFT OUTER JOIN [$(eConciliaciones)].dbo.estados_conciliacion c ON
							c.codigo = b.valor
					END

					---------------------------------------------------------------------------
					-- CONSOLIDACION cortes_saldos_inventario
					---------------------------------------------------------------------------
					BEGIN
						--PROBABLEMENTE SE DEBA CONVERTIR EL CODIGO DE BODEGA 
						IF OBJECT_ID('tempdb..#saldos_inventario_cliente') IS NOT NULL BEGIN
							DROP TABLE #saldos_inventario_cliente
						END

						;WITH
						cte_00 AS
						(
							SELECT
								 b.id_corte_saldo_inventario
								,COALESCE(c.codigo,b.bodega_codigo_alterno) AS bodega_codigo
								,b.producto_codigo
								,b.id_estado_conciliacion
								,b.id_bodega
								,b.id_producto

								,b.unidades_cliente
								,b.valor_unitario
							FROM #corte a
							INNER JOIN [$(eConciliaciones)].dbo.cortes_saldos_inventario_cliente b ON
								b.id_corte_saldo_inventario = a.id_corte_saldo_inventario
							LEFT OUTER JOIN [$(eConnect)].dbo.bodegas c ON
								c.id_bodega = b.id_bodega
						)
						SELECT
							 a.id_corte_saldo_inventario
							,a.bodega_codigo
							,a.producto_codigo
							,a.id_estado_conciliacion
							,a.id_bodega
							,a.id_producto

							,SUM(a.unidades_cliente) AS unidades_cliente
							,MAX(a.valor_unitario) AS valor_unitario
						INTO #saldos_inventario_cliente
						FROM cte_00 a
						LEFT OUTER JOIN [$(eConciliaciones)].dbo.productos_excluidos b ON
							b.id_producto = a.id_producto
						WHERE
							b.id_producto IS NULL
						GROUP BY
							 a.id_corte_saldo_inventario
							,a.bodega_codigo
							,a.producto_codigo
							,a.id_estado_conciliacion
							,a.id_bodega
							,a.id_producto

						CREATE UNIQUE CLUSTERED INDEX ix_saldos_inventario_cliente_01 
						ON #saldos_inventario_cliente(bodega_codigo,producto_codigo,id_estado_conciliacion)

						IF OBJECT_ID('tempdb..#saldos_inventario_opl') IS NOT NULL BEGIN
							DROP TABLE #saldos_inventario_opl
						END

						;WITH
						cte_00 AS
						(
							SELECT
								 b.id_corte_saldo_inventario
								,b.bodega_codigo
								,b.producto_codigo
                                ,b.prtstyle
                                ,COALESCE(f.id_estado_conciliacion,0) AS id_estado_conciliacion
								,COALESCE(d.id_bodega,0) AS id_bodega
								,COALESCE(e.id_producto,0) AS id_producto

								,b.unidades_wms
								,COALESCE(c.unidades_en_proceso_despacho,0) AS unidades_en_proceso_despacho
								,0 AS unidades_en_proceso_recibo
								,b.id_estado_inventario
							FROM #corte a
							INNER JOIN #saldos_wms b ON
								b.id_corte_saldo_inventario = a.id_corte_saldo_inventario
							LEFT OUTER JOIN #salidas_en_proceso c ON
								c.bodega_codigo = b.bodega_codigo
							AND c.producto_codigo = b.producto_codigo
							AND c.id_estado_inventario = b.id_estado_inventario

							LEFT OUTER JOIN [$(eConnect)].dbo.bodegas d ON
								d.codigo = b.bodega_codigo
							LEFT OUTER JOIN [$(eConnect)].dbo.productos e ON
								e.id_cliente = a.id_cliente
							AND e.codigo = b.producto_codigo
							LEFT OUTER JOIN #mapa_estados_conciliacion f ON
								f.id_estado_inventario = b.id_estado_inventario
						)
						SELECT
							 a.id_corte_saldo_inventario
							,a.bodega_codigo
							,a.producto_codigo
                            ,a.prtstyle
							,a.id_estado_conciliacion
							,a.id_bodega
							,a.id_producto
							,a.id_estado_inventario

							,SUM(a.unidades_wms - a.unidades_en_proceso_despacho) AS unidades_opl
							,SUM(a.unidades_wms) AS unidades_wms
							,SUM(a.unidades_en_proceso_despacho) AS unidades_en_proceso_despacho
							,0 AS unidades_en_proceso_recibo
						INTO #saldos_inventario_opl
						FROM cte_00 a
						LEFT OUTER JOIN [$(eConciliaciones)].dbo.productos_excluidos b ON
							b.id_producto = a.id_producto
						WHERE
							b.id_producto IS NULL
						GROUP BY
							 a.id_corte_saldo_inventario
							,a.bodega_codigo
							,a.producto_codigo
                            ,a.prtstyle
							,a.id_estado_conciliacion
							,a.id_bodega
							,a.id_producto
							,a.id_estado_inventario

						IF OBJECT_ID('tempdb..#conciliaciones_saldos_inventario') IS NOT NULL BEGIN
							DROP TABLE #conciliaciones_saldos_inventario
						END

						;WITH
						cte_00 AS
						(
							SELECT
								 a.id_corte_saldo_inventario
								,a.bodega_codigo
								,a.producto_codigo
                                ,a.prtstyle
								,a.id_estado_conciliacion
								,a.id_bodega
								,a.id_producto

								,SUM(a.unidades_opl) AS unidades_opl
								,SUM(a.unidades_wms) AS unidades_wms
								,SUM(a.unidades_en_proceso_despacho) AS unidades_en_proceso_despacho
							FROM #saldos_inventario_opl a
							GROUP BY
								 a.id_corte_saldo_inventario
								,a.bodega_codigo
								,a.producto_codigo
                                ,a.prtstyle
								,a.id_estado_conciliacion
								,a.id_bodega
								,a.id_producto
						)
						SELECT
							 COALESCE(a.id_corte_saldo_inventario,b.id_corte_saldo_inventario) AS id_corte_saldo_inventario
							,COALESCE(a.bodega_codigo,b.bodega_codigo) AS bodega_codigo
							,COALESCE(a.producto_codigo,b.producto_codigo) AS producto_codigo
                            ,COALESCE(a.prtstyle,'') AS prtstyle
							,COALESCE(a.id_estado_conciliacion,b.id_estado_conciliacion) AS id_estado_conciliacion
							,COALESCE(a.id_bodega,b.id_bodega) AS id_bodega
							,COALESCE(a.id_producto,b.id_producto) AS id_producto
							,COALESCE(b.unidades_cliente,0) AS unidades_cliente
							,COALESCE(a.unidades_opl,0) AS unidades_opl
							,COALESCE(a.unidades_wms,0) AS unidades_wms
							,COALESCE(a.unidades_en_proceso_despacho,0) AS unidades_en_proceso_despacho
							,0 AS unidades_en_proceso_recibo
							,COALESCE(b.valor_unitario,0) AS valor_unitario
						INTO #conciliaciones_saldos_inventario
						FROM cte_00 a
						FULL OUTER JOIN #saldos_inventario_cliente b ON
							b.id_corte_saldo_inventario = a.id_corte_saldo_inventario
						AND b.id_bodega = a.id_bodega
						AND b.id_producto = a.id_producto
						AND b.id_estado_conciliacion = a.id_estado_conciliacion
					END

					---------------------------------------------------------------------------
					-- ACTUALIZACION DE DATOS DE CONCILIACIONES
					---------------------------------------------------------------------------
					BEGIN
						DELETE a
						FROM [$(eConciliaciones)].dbo.cortes_saldos_inventario_opl a
						INNER JOIN #corte b ON
							b.id_corte_saldo_inventario = a.id_corte_saldo_inventario

						DELETE a
						FROM [$(eConciliaciones)].dbo.conciliaciones_saldos_inventario a
						INNER JOIN #corte b ON
							b.id_corte_saldo_inventario = a.id_corte_saldo_inventario
						
						INSERT INTO [$(eConciliaciones)].dbo.cortes_saldos_inventario_opl
							(id_corte_saldo_inventario
							,bodega_codigo
							,producto_codigo
							,id_estado_conciliacion
							,id_bodega
							,id_producto
							,unidades
							,unidades_wms
							,unidades_en_proceso_despacho
							,unidades_en_proceso_recibo
							,id_estado_inventario
                            ,prtstyle

							,usuario_creacion
							,fecha_creacion
							,usuario_modificacion
							,fecha_modificacion)
						SELECT
							 id_corte_saldo_inventario
							,bodega_codigo
							,producto_codigo
							,id_estado_conciliacion
							,id_bodega
							,id_producto
							,unidades_opl
							,unidades_wms
							,unidades_en_proceso_despacho
							,unidades_en_proceso_recibo
							,id_estado_inventario
                            ,prtstyle

							,SYSTEM_USER AS usuario_creacion
							,SYSDATETIME() AS fecha_creacion
							,SYSTEM_USER AS usuario_modificacion
							,SYSDATETIME() AS fecha_modificacion
						FROM #saldos_inventario_opl

						INSERT INTO [$(eConciliaciones)].dbo.conciliaciones_saldos_inventario
							(id_corte_saldo_inventario
							,bodega_codigo
							,producto_codigo
							,id_estado_conciliacion
							,id_bodega
							,id_producto
							,unidades_cliente
							,unidades_opl
							,unidades_wms
							,unidades_en_proceso_despacho
							,unidades_en_proceso_recibo
							,valor_unitario
                            ,prtstyle

							,usuario_creacion
							,fecha_creacion
							,usuario_modificacion
							,fecha_modificacion)
						SELECT
							 id_corte_saldo_inventario
							,bodega_codigo
							,producto_codigo
							,id_estado_conciliacion
							,id_bodega
							,id_producto
							,unidades_cliente
							,unidades_opl
							,unidades_wms
							,unidades_en_proceso_despacho
							,unidades_en_proceso_recibo
							,valor_unitario
                            ,prtstyle

							,SYSTEM_USER AS usuario_creacion
							,SYSDATETIME() AS fecha_creacion
							,SYSTEM_USER AS usuario_modificacion
							,SYSDATETIME() AS fecha_modificacion
						FROM #conciliaciones_saldos_inventario
					END
				END

				COMMIT TRANSACTION
            END TRY
            BEGIN CATCH
                PRINT CONCAT('OCURRIO EL SIGUIENTE ERROR AL PROCESAR EL CORTE DEL CLIENTE "',@prt_client_id,'" DEL DIA ',FORMAT(@fecha_corte,'yyyy-MM-dd'),':',ERROR_MESSAGE())
                IF @@TRANCOUNT > 0 BEGIN
                    ROLLBACK TRANSACTION
                END
            END CATCH
            
            FETCH NEXT FROM cursor_cortes INTO @id_corte_saldo_inventario, @fecha_corte, @prt_client_id
        END 

        CLOSE cursor_cortes  
        DEALLOCATE cursor_cortes
    END
END
