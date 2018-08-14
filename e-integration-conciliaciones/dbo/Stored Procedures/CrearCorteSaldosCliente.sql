
CREATE PROCEDURE [dbo].[CrearCorteSaldosCliente]
	@id_archivo BIGINT
AS
BEGIN TRY
	BEGIN TRANSACTION
		BEGIN

			IF OBJECT_ID('tempdb..#source') IS NOT NULL BEGIN
				DROP TABLE #source
			END

			SELECT
				*
			INTO #source
			FROM dbo.saldos_inventario a
			WHERE
				a.id_archivo = @id_archivo

			IF OBJECT_ID('tempdb..#corte') IS NOT NULL BEGIN
				DROP TABLE #corte
			END

			SELECT TOP (1)
				 id_archivo
				,id_cliente
				,fecha
				,'NO_PROCESADO' AS estado
				,fecha_corte AS fecha_corte_cliente
				,usuario_creacion
				,fecha_creacion
				,usuario_modificacion
				,fecha_modificacion
			INTO #corte
			FROM #source a
		END

		BEGIN
			UPDATE a
			SET  a.estado = 'PROCESADO'
				,a.usuario_modificacion = SYSTEM_USER
				,a.fecha_modificacion = SYSDATETIME()
			FROM [$(eIntegration)].dbo.archivos a
			INNER JOIN #corte b ON
				b.id_archivo = a.id_archivo
		END
		
		IF NOT EXISTS (
			SELECT 
				1
			FROM [$(eConciliaciones)].dbo.cortes_saldos_inventario a
			INNER JOIN #corte b ON
				b.id_cliente = a.id_cliente
			AND b.fecha = a.fecha
			WHERE
				a.estado = 'CERRADO'
		) BEGIN
			DELETE a
			FROM [$(eConciliaciones)].dbo.cortes_saldos_inventario a
			INNER JOIN #corte b ON
				b.id_cliente = a.id_cliente
			AND b.fecha = a.fecha
			
			DECLARE @t TABLE (id_cliente BIGINT,fecha DATE,id BIGINT)

			INSERT INTO [$(eConciliaciones)].dbo.cortes_saldos_inventario
				(id_cliente
				,fecha
				,estado
				,fecha_corte_cliente
				,usuario_creacion
				,fecha_creacion
				,usuario_modificacion
				,fecha_modificacion)
			OUTPUT inserted.id_cliente,inserted.fecha,inserted.id_corte_saldo_inventario
			INTO @t
			SELECT
				 id_cliente
				,fecha
				,estado
				,fecha_corte_cliente
				,usuario_creacion
				,fecha_creacion
				,usuario_modificacion
				,fecha_modificacion
			FROM #corte a

			INSERT INTO [$(eConciliaciones)].dbo.cortes_saldos_inventario_cliente
				(id_corte_saldo_inventario
				,bodega_codigo_alterno
				,producto_codigo
				,id_estado_conciliacion
				,id_bodega
				,id_producto
				,unidades_cliente
				
				,valor_unitario
				,estado_conciliacion_codigo_alterno
				,unidad_medida_codigo_alterno
				,cantidad_reportada
				,unidades_equivalentes

				,usuario_creacion
				,fecha_creacion
				,usuario_modificacion
				,fecha_modificacion)
			SELECT
				 b.id
				,a.bodega_codigo_alterno
				,a.producto_codigo_alterno AS producto_codigo
				,COALESCE(a.id_estado_conciliacion,c.id_estado_conciliacion) AS id_estado_conciliacion
				,COALESCE(a.id_bodega,0) AS id_bodega
				,COALESCE(a.id_producto,0) AS id_producto
				,CAST(a.cantidad * CAST(a.unidades_por_empaque AS DEC(12,4)) AS INT) AS unidades_cliente
				
				,a.valor_unitario
				,a.estado_conciliacion_codigo_alterno
				,a.unidad_medida_codigo_alterno
				,a.cantidad AS cantidad_reportada
				,a.unidades_por_empaque AS unidades_equivalentes

				,a.usuario_creacion
				,a.fecha_creacion
				,a.usuario_modificacion
				,a.fecha_modificacion
			FROM #source a
			INNER JOIN @t b ON
				b.id_cliente = a.id_cliente
			AND b.fecha = a.fecha
			INNER JOIN [$(eConciliaciones)].dbo.estados_conciliacion c ON
				c.codigo = 'DESCONOCIDO'

			UPDATE a
			SET  a.estado = 'PROCESADO'
				,a.usuario_modificacion = SYSTEM_USER
				,a.fecha_modificacion = SYSDATETIME()
			FROM dbo.saldos_inventario a
			INNER JOIN #corte b ON
				b.id_archivo = a.id_archivo 
		
		END ELSE BEGIN
			--DESCARTAR LOS NUEVOS REGISTROS
			UPDATE a
			SET  a.estado = 'DESCARTADO'
				,a.usuario_modificacion = SYSTEM_USER
				,a.fecha_modificacion = SYSDATETIME()
			FROM dbo.saldos_inventario a
			INNER JOIN #corte b ON
				b.id_archivo = a.id_archivo 
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
