
CREATE PROCEDURE [dbo].[CrearSolicitudesDeManufacturaBom]
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
                ,a.id_unidad_medida
                ,a.unidad_medida_codigo_alterno
                ,a.cantidad

				,CAST(0 AS BIT) AS requiere_bom

                ,a.bodega_codigo_alterno
                ,a.estado_inventario_codigo_alterno

                ,ROW_NUMBER() OVER(PARTITION BY a.id_cliente,a.numero_solicitud,a.id_producto,a.id_estado_inventario ORDER BY a.numero_linea) AS orden 
            FROM dbo.manufacturas_bom a
            WHERE
                a.estado = 'VALIDADO'
            AND a.id_archivo = @id_archivo
        )
        SELECT
             a.id_registro_stage
            ,a.id_archivo

            ,CAST(NULL AS BIGINT) AS id_solicitud
            ,'MANUFACTURA_BOM' AS tipo_solicitud
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
        WHERE
            a.orden = 1

        IF OBJECT_ID('tempdb..#source_bom') IS NOT NULL BEGIN
            DROP TABLE #source_bom
        END

        SELECT 
             b.id_registro_stage
            
            ,a.id
            ,b.numero_linea
            ,a.id_producto_bom AS id_producto
            ,a.producto_bom_codigo_alterno AS producto_codigo
            ,a.id_estado_inventario_bom AS id_estado_inventario
            ,a.id_subestado_inventario_bom AS id_subestado_inventario
            ,a.cantidad_bom AS unidades
            ,a.lote
            ,a.estado_inventario_bom_codigo_alterno
            ,a.subestado_inventario_bom_codigo_alterno
        INTO #source_bom
        FROM dbo.manufacturas_bom a
        INNER JOIN #source b ON
		    b.id_archivo = a.id_archivo
        AND b.id_cliente = a.id_cliente
        AND b.numero_solicitud = a.numero_solicitud
        AND b.id_producto = a.id_producto
        AND b.id_estado_inventario = a.id_estado_inventario
        AND b.id_bodega = a.id_bodega
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
        SET  a.estado = CASE WHEN c.id_solicitud IS NOT NULL THEN 'PROCESADO' ELSE 'DESCARTADA' END
            ,a.[version] = a.[version] + 1
            ,a.fecha_modificacion = SYSDATETIME()
            ,a.usuario_modificacion = SYSTEM_USER
        FROM dbo.manufacturas_bom a
        INNER JOIN #source_bom b ON
            b.id = a.id
        INNER JOIN #source c ON
            c.id_registro_stage = b.id_registro_stage

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
            INNER JOIN dbo.manufacturas_bom b ON
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
        FROM [eIntegration].dbo.archivos a
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
