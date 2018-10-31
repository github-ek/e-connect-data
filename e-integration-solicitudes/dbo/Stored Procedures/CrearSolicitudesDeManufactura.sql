CREATE PROCEDURE [dbo].[CrearSolicitudesDeManufactura]
    @id_archivo BIGINT
AS
BEGIN TRY
    --SET NOCOUNT ON;

    BEGIN TRANSACTION
	
    --CONSOLIDACION DE INFORMACION DE NUEVAS SOLICITUDES
    BEGIN
        IF OBJECT_ID('tempdb..#source') IS NOT NULL BEGIN
            DROP TABLE #source
        END

        ;WITH
        cte_00 AS
        (
            SELECT
				 a.id AS id_registro_stage 
                ,a.id_archivo

                ,a.numero_solicitud
                ,a.prefijo
                ,a.numero_solicitud_sin_prefijo

                ,a.id_bodega
                ,a.id_cliente
                ,a.id_servicio
                ,a.servicio_codigo_alterno

                ,a.femi
                ,a.fema

                ,a.usuario_creacion
                ,a.fecha_creacion
                ,a.usuario_modificacion
                ,a.fecha_modificacion

                ,a.numero_linea

                ,a.id_producto
                ,a.id_estado_inventario
                ,COALESCE(a.id_unidad_medida,1) AS id_unidad_medida
                ,a.unidad_medida_codigo_alterno
                ,a.cantidad

				,a.requiere_bom

                ,a.bodega_codigo_alterno
                ,a.estado_inventario_codigo_alterno
            FROM dbo.manufacturas a
            WHERE
                a.estado = 'VALIDADO'
            AND a.id_archivo = @id_archivo
        )
        SELECT
             a.id_registro_stage
            ,a.id_archivo

            ,CAST(NULL AS BIGINT) AS id_solicitud
            ,'MANUFACTURA' AS tipo_solicitud
            ,a.numero_solicitud
            ,a.prefijo
            ,a.numero_solicitud_sin_prefijo

            ,a.id_bodega
            ,CAST(NULL AS BIGINT) AS id_bodega_traslado
            ,a.id_cliente
            ,a.id_servicio
            ,a.servicio_codigo_alterno

            ,a.femi AS fecha_minima_solicitada
            ,a.fema AS fecha_maxima_solicitada
            ,CAST(NULL AS TIME(0)) AS hora_minima_solicitada
            ,CAST(NULL AS TIME(0)) AS hora_maxima_solicitada

            ,CAST(NULL AS BIGINT) AS id_tercero
            ,'' AS tercero_identificacion
            ,'' AS tercero_nombre
            ,CAST(NULL AS BIGINT) AS id_canal
            ,'' AS canal_codigo_alterno

            ,CAST(0 AS BIT) AS requiere_transporte
            ,CAST(0 AS BIT) AS requiere_recaudo
            ,'' AS nota

            ,a.usuario_creacion
            ,a.fecha_creacion
            ,a.usuario_modificacion
            ,a.fecha_modificacion

            ,ROW_NUMBER() OVER(PARTITION BY a.id_cliente, a.numero_solicitud ORDER BY a.numero_linea) AS numero_linea

            ,a.id_producto
            ,a.id_estado_inventario
            ,a.id_unidad_medida AS id_unidad_medida_solicitada
            ,a.unidad_medida_codigo_alterno AS unidad_medida_solicitada_codigo_alterno
            ,a.cantidad AS cantidad_solicitada
            ,0 AS valor_unitario_declarado
            ,'' AS lote

            ,a.bodega_codigo_alterno
            ,a.estado_inventario_codigo_alterno
            ,'' AS bodega_traslado_codigo_alterno
            ,'' AS estado_inventario_traslado_codigo_alterno
        INTO #source
        FROM cte_00 a
        INNER JOIN [$(eConnect)].dbo.clientes b ON
            b.id_cliente = a.id_cliente

		IF OBJECT_ID('tempdb..#source_bom_base') IS NOT NULL BEGIN
			DROP TABLE #source_bom_base
		END

		;WITH
		cte_00 AS
		(
			SELECT 
				 b.id_registro_stage

				,b.numero_linea
				,a.id_cliente
				,a.id_estado_inventario

				,c.codigo_alterno_wms AS client_id
				,d.codigo AS WH_ID
				,e.codigo AS PRTNUM
				,CAST(a.cantidad AS NUMERIC(19,4)) AS wkoqty
			FROM dbo.manufacturas a
			INNER JOIN #source b ON
				b.id_registro_stage = a.id
			AND b.id_archivo = a.id_archivo
			INNER JOIN [$(eConnect)].dbo.clientes c ON
				c.id_cliente = a.id_cliente
			INNER JOIN [$(eConnect)].dbo.bodegas d ON
				d.id_bodega = a.id_bodega
			INNER JOIN [$(eConnect)].dbo.productos e ON
				e.id_producto = a.id_producto
			WHERE
				a.requiere_bom = 1
		),
		cte_01 AS
		(
			SELECT
					a.id_registro_stage
				,a.numero_linea

				,a.id_cliente
				,c.bomlin AS wkolin
				,a.id_estado_inventario
				
				,c.prtnum AS producto_codigo
				,c.cnsqty AS bom_cnsqty
				,a.wkoqty*c.cnsqty AS unidades
			FROM cte_00 a
			LEFT OUTER JOIN [$(WMS_DB_SERVER)].[$(ttcwmsprd)].dbo.bomhdr b ON
				b.client_id = a.client_id
			AND b.wh_id = a.wh_id
			AND b.prtnum = a.prtnum
			LEFT OUTER JOIN [$(WMS_DB_SERVER)].[$(ttcwmsprd)].dbo.bomdtl c ON
				c.wh_id = b.wh_id
			AND c.client_id = b.client_id
			AND c.bomnum = b.bomnum
		),
		cte_02 AS
		(
			SELECT 
				 b.id_registro_stage
				,b.numero_linea
				
				,a.id_cliente
				,'0001' AS wkolin
				,CASE c.codigo 
				WHEN 'ESTAMPILLA' THEN 
					CASE a.id_estado_inventario 
					WHEN 'A' THEN 'REN'
					WHEN 'NC' THEN 'NCR'
					ELSE '' END
				WHEN 'DSESTAMPILLA' THEN 
					CASE a.id_estado_inventario
					WHEN 'REN' THEN 'A'
					WHEN 'NCR' THEN 'NC'
					ELSE '' END
				ELSE a.id_estado_inventario END AS id_estado_inventario

				,a.producto_codigo_alterno AS producto_codigo
				,CAST(1 AS NUMERIC(19,4)) AS bom_cnsqty
				,CAST(a.cantidad AS NUMERIC(19,4)) AS unidades
			FROM dbo.manufacturas a
			INNER JOIN #source b ON
				b.id_registro_stage = a.id
			AND b.id_archivo = a.id_archivo
			INNER JOIN [$(eConnect)].dbo.servicios c ON
				c.id_servicio = a.id_servicio	
			WHERE
				a.requiere_bom = 0
		),
		cte_03 AS 
		(
			SELECT * FROM cte_01 a
			UNION
			SELECT * FROM cte_02 a
		)
		SELECT
			a.*
		INTO #source_bom_base
		FROM cte_03 a
			
		IF OBJECT_ID('tempdb..#source_bom') IS NOT NULL BEGIN
            DROP TABLE #source_bom
        END

		SELECT
			 a.id_registro_stage
			 
			,a.numero_linea
			
			,b.id_producto
			,a.producto_codigo
			,a.id_estado_inventario
			,CAST(NULL AS VARCHAR(25)) AS id_subestado_inventario
			,CAST(a.unidades AS INT) AS unidades
			,'' AS lote
			,'' AS estado_inventario_bom_codigo_alterno
			,'' AS subestado_inventario_bom_codigo_alterno
		INTO #source_bom
		FROM #source_bom_base a
		INNER JOIN [$(eConnect)].dbo.productos b ON
			b.id_cliente = a.id_cliente
		AND b.codigo = a.producto_codigo
    END

    --CREAR NUEVAS SOLICITUDES ESTANDAR
    BEGIN
        EXEC dbo.CrearSolicitudesEstandar

        EXEC dbo.CrearSolicitudesEstandarLineasBom
    END

    --ACTUALIZAR PROGRAMACION DE ORDENES
    BEGIN
        INSERT INTO [$(eConnect)].dbo.solicitudes_ordenes
            (tipo_solicitud
            ,id_solicitud
            
            ,tipo_orden

            ,usuario_creacion
            ,fecha_creacion
            ,usuario_modificacion
            ,fecha_modificacion)
        SELECT
             a.tipo_solicitud
            ,a.id_solicitud

            ,'MANUFACTURA' AS tipo_orden

            ,a.usuario_creacion
            ,a.fecha_creacion
            ,a.usuario_modificacion
            ,a.fecha_modificacion
        FROM #source a
        WHERE
            a.id_solicitud IS NOT NULL
        AND a.numero_linea = 1
    END

    --ACTUALIZACION DE LOS REGISTROS EN STAGE
    BEGIN
        UPDATE a
        SET  a.estado = CASE WHEN b.id_solicitud IS NOT NULL THEN 'PROCESADO' ELSE 'DESCARTADA' END
            ,a.[version] = a.[version] + 1
            ,a.fecha_modificacion = SYSDATETIME()
            ,a.usuario_modificacion = SYSTEM_USER
        FROM dbo.manufacturas a
        INNER JOIN #source b ON
            b.id_registro_stage = a.id

        ;WITH
        cte_00 AS
        (
            SELECT DISTINCT
                a.id_archivo
            FROM #source a
        ),
        cte_01 AS
        (
            SELECT
                a.id_archivo
            FROM cte_00 a
            INNER JOIN dbo.manufacturas b ON
                b.id_archivo = a.id_archivo
            GROUP BY
                a.id_archivo
            HAVING
                COUNT(1) = SUM(CASE WHEN b.estado IN ('PROCESADO','DESCARTADA') THEN 1 ELSE 0 END) 
        )
        UPDATE a
        SET  a.estado = 'PROCESADO'
            ,a.[version] = a.[version] + 1
            ,a.fecha_modificacion = SYSDATETIME()
            ,a.usuario_modificacion = SYSTEM_USER
        FROM dbo.archivos a
        INNER JOIN cte_01 b ON
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
