
CREATE PROCEDURE [dbo].[ConsolidarConsultaSolicitudes]
	@id_archivo BIGINT
AS
BEGIN TRY
	BEGIN TRANSACTION
		BEGIN
			UPDATE a
			SET  a.estado = 'PROCESADO'
				,a.usuario_modificacion = SYSTEM_USER
				,a.fecha_modificacion = SYSDATETIME()
			FROM [$(eIntegration)].dbo.archivos a
            WHERE
				a.id_archivo = @id_archivo

			IF OBJECT_ID('tempdb..#source') IS NOT NULL BEGIN
				DROP TABLE #source
			END

			;WITH
			cte_00 AS
			(
				SELECT
					 a.id
					,a.id_archivo
					,b.id_cliente
					,a.numero_solicitud 
					,a.numero_solicitud COLLATE Modern_Spanish_CI_AS AS numero_documento_orden_cliente
					,ROW_NUMBER() OVER(PARTITION BY b.id_cliente, a.numero_solicitud ORDER BY a.numero_solicitud) AS orden
				FROM dbo.consultas_solicitudes a
				INNER JOIN [$(eConnect)].dbo.clientes b ON
					b.codigo = a.cliente_codigo
				WHERE
					a.id_archivo = @id_archivo
			)
			SELECT
				 a.*
			INTO #source
			FROM cte_00 a
			WHERE
				a.orden = 1

            CREATE UNIQUE INDEX IX_source_01 ON #source(numero_documento_orden_cliente,id_cliente)

            IF OBJECT_ID('tempdb..#base') IS NOT NULL BEGIN
	            DROP TABLE #base
            END

            SELECT
                 a.id_archivo
				,a.id
                ,a.id_cliente
                ,a.numero_solicitud
	            ,b.id_orden AS id_solicitud
	            ,COALESCE(b.fecha_confirmacion,CAST('1900-01-01' AS DATE)) AS fecha_creacion

	            ,COALESCE(b.destinatario_numero_identificacion_alterno,'') COLLATE SQL_Latin1_General_CP1_CI_AS AS destinatario_identificacion
	            ,CASE WHEN COALESCE(b.destinatario_nombre_alterno,'') <> '' THEN b.destinatario_nombre_alterno ELSE COALESCE(d.nombre,'') END COLLATE SQL_Latin1_General_CP1_CI_AS AS destinatario_nombre
                ,b.id_ciudad_destino AS id_ciudad
	            ,COALESCE(b.destino_direccion,'') COLLATE SQL_Latin1_General_CP1_CI_AS AS direccion
	            ,COALESCE(b.destino_nombre_alterno,'') COLLATE SQL_Latin1_General_CP1_CI_AS AS destino
	            ,COALESCE(b.ORD_WH_ID,b.INV_WH_ID,'') COLLATE SQL_Latin1_General_CP1_CI_AS AS wh_id
	            ,COALESCE(b.ORDNUM,b.INVNUM,'') COLLATE SQL_Latin1_General_CP1_CI_AS AS orden_wms
	            
                ,c.id_producto
                ,c.id_unidad
	            ,COALESCE(c.id_estado_inventario,'') COLLATE SQL_Latin1_General_CP1_CI_AS AS id_estado_inventario
	            ,COALESCE(c.lote,'') COLLATE SQL_Latin1_General_CP1_CI_AS AS lote
                ,c.cantidad
                ,CAST(c.cantidad AS BIGINT) * CAST(COALESCE(c.valor_declarado_por_unidad,0) AS BIGINT) AS valor_declarado_linea

                ,COALESCE(b.id_estado_georeferenciacion,'') COLLATE SQL_Latin1_General_CP1_CI_AS AS id_estado_georeferenciacion
	            ,COALESCE(b.id_estado_planificacion_ruta,'') COLLATE SQL_Latin1_General_CP1_CI_AS AS id_estado_planificacion_ruta
	            ,COALESCE(b.usuario_corte_planificacion_ruta,'') COLLATE SQL_Latin1_General_CP1_CI_AS AS usuario_corte_planificacion_ruta
            INTO #base
            FROM #source a
            INNER JOIN [$(INGLATERRA)].[$(satelite)].ordenes.ordenes b ON
	            b.numero_documento_orden_cliente = a.numero_documento_orden_cliente
            AND b.id_cliente = a.id_cliente
            INNER JOIN [$(INGLATERRA)].[$(satelite)].ordenes.lineas_orden c ON
	            c.id_orden = b.id_orden
            LEFT OUTER JOIN [$(INGLATERRA)].[$(satelite)].crm.destinatarios_remitentes d ON
	            d.id_destinatario_remitente = b.id_destinatario_remitente_destinatario
		END
        
        BEGIN 
            DELETE b
		    FROM dbo.consultas_solicitudes a
            INNER JOIN dbo.consultas_solicitudes_lineas b ON
                b.id_archivo = a.id_archivo
            AND b.id = a.id
		    WHERE
			    a.id_archivo = @id_archivo

			INSERT INTO dbo.consultas_solicitudes_lineas
			    (id_archivo
                ,id
                ,id_cliente
                ,id_solicitud
                ,fecha_creacion
                ,destinatario_identificacion
                ,destinatario_nombre
                ,id_ciudad
                ,direccion
                ,destino
                ,id_bodega
                ,wh_id
                ,orden_wms
                ,id_producto
                ,id_unidad
                ,id_estado_inventario
                ,lote
                ,cantidad
                ,valor_declarado_linea
                ,id_estado_georeferenciacion
                ,id_estado_planificacion_ruta
                ,usuario_corte_planificacion_ruta)
		    SELECT
                 a.id_archivo
		        ,a.id

                ,b.id_cliente
                ,b.id_solicitud
                ,b.fecha_creacion

                ,b.destinatario_identificacion
                ,b.destinatario_nombre
                ,b.id_ciudad
                ,b.direccion
                ,b.destino
                ,c.id_bodega
                ,b.wh_id
                ,b.orden_wms
                ,b.id_producto
                ,b.id_unidad
                ,b.id_estado_inventario
                ,b.lote
                ,b.cantidad
                ,b.valor_declarado_linea
                ,b.id_estado_georeferenciacion
                ,b.id_estado_planificacion_ruta
                ,b.usuario_corte_planificacion_ruta
		    FROM dbo.consultas_solicitudes a
            INNER JOIN #base b ON
                b.id_archivo = a.id_archivo
            AND b.id = a.id    
            LEFT OUTER JOIN [$(eConnect)].dbo.bodegas c ON
                c.codigo = b.wh_id
		    WHERE
			    a.id_archivo = @id_archivo

			UPDATE a
			SET  a.estado = 'PROCESADO'
				,a.usuario_modificacion = SYSTEM_USER
				,a.fecha_modificacion = SYSDATETIME()
			FROM dbo.consultas_solicitudes a
			WHERE
				a.id_archivo = @id_archivo
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