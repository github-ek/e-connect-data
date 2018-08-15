CREATE PROCEDURE [dbo].[SincronizarAlistamientos]
AS
BEGIN TRY
    
    --================================================================================================================================
    --CONSOLIDAR DATOS REMOTOS
    --================================================================================================================================
    BEGIN
        DECLARE @fecha_sincronizacion DATETIME2(0) = SYSDATETIME()

        UPDATE a 
        SET a.fecha_sincronizacion = @fecha_sincronizacion
        FROM [$(WMS_DB_SERVER)].[$(eHistoricos)].dbo.integraciones_actualizaciones a
        WHERE   
            a.id_integracion_actualizacion IN 
        (
            SELECT TOP (10000)
                id_integracion_actualizacion
            FROM [$(WMS_DB_SERVER)].[$(eHistoricos)].dbo.integraciones_actualizaciones
            WHERE   
                integracion = 'ALISTAMIENTOS'
            AND estado_actualizacion =  'NO_PROCESADO'
            ORDER BY
                id_integracion_actualizacion
        )

        IF OBJECT_ID('tempdb..#source_ord') IS NOT NULL BEGIN
            DROP TABLE #source_ord
        END

        SELECT
             z.id_externo
            ,z.fecha_sincronizacion
            ,a.client_id
            ,a.ordnum
            ,a.wh_id
                        
            ,a.mod_usr_id
            ,a.moddte
        INTO #source_ord
        FROM [$(WMS_DB_SERVER)].[$(ttcwmsprd)].dbo.ord a
        INNER JOIN [$(WMS_DB_SERVER)].[$(eHistoricos)].dbo.integraciones_actualizaciones z ON
            a.client_id = z.arg0
        AND a.ordnum = z.arg1
        AND a.wh_id = z.arg2
        WHERE   
            z.integracion = 'ALISTAMIENTOS'
        AND z.estado_actualizacion =  'NO_PROCESADO'
        AND z.fecha_sincronizacion = @fecha_sincronizacion
                    
        IF OBJECT_ID('tempdb..#source_ord_line') IS NOT NULL BEGIN
            DROP TABLE #source_ord_line
        END

        SELECT
             z.id_externo
            ,z.fecha_sincronizacion
            ,a.ordlin

            ,a.prtnum
            ,a.invsts_prg
            ,a.ordqty
            ,a.shpqty AS stgqty
            ,a.shpqty
            ,a.mod_usr_id
            ,a.moddte
        INTO #source_ord_line
        FROM [$(WMS_DB_SERVER)].[$(ttcwmsprd)].dbo.ord_line a
        INNER JOIN [$(WMS_DB_SERVER)].[$(eHistoricos)].dbo.integraciones_actualizaciones z ON
            a.client_id = z.arg0
        AND a.ordnum = z.arg1
        AND a.wh_id = z.arg2
        WHERE   
            z.integracion = 'ALISTAMIENTOS'
        AND z.estado_actualizacion =  'NO_PROCESADO'
        AND z.fecha_sincronizacion = @fecha_sincronizacion

        IF OBJECT_ID('tempdb..#source_canpck') IS NOT NULL BEGIN
            DROP TABLE #source_canpck
        END

        SELECT
             z.id_externo
            ,z.fecha_sincronizacion
            ,a.ordlin
            ,a.cancod

            ,a.remqty
            ,a.candte
            ,a.can_usr_id
        INTO #source_canpck
        FROM [$(WMS_DB_SERVER)].[$(ttcwmsprd)].dbo.canpck a
        INNER JOIN [$(WMS_DB_SERVER)].[$(eHistoricos)].dbo.causales_cancelacion_alistamientos b ON
            b.cancod = a.cancod
        INNER JOIN [$(WMS_DB_SERVER)].[$(eHistoricos)].dbo.integraciones_actualizaciones z ON
            a.client_id = z.arg0
        AND a.ordnum = z.arg1
        AND a.wh_id = z.arg2
        WHERE   
            z.integracion = 'ALISTAMIENTOS'
        AND z.estado_actualizacion =  'NO_PROCESADO'
        AND z.fecha_sincronizacion = @fecha_sincronizacion
    END

    --================================================================================================================================
    --CONSOLIDAR DATOS LOCALMENTE
    --================================================================================================================================
    BEGIN
        --================================================================================================================================
        --ENCABEZADO
        --================================================================================================================================
        BEGIN
            IF OBJECT_ID('tempdb..#alistamientos') IS NOT NULL BEGIN
                DROP TABLE #alistamientos
            END

            SELECT 
                 b.id_alistamiento
                ,a.id_externo
                ,a.client_id
                ,a.ordnum
                ,a.wh_id

                ,c.id_cliente
                ,CAST(NULL AS BIGINT) AS id_solicitud
                ,d.id_bodega
                ,COALESCE(b.estado,CAST('ABIERTA' AS VARCHAR(20))) AS estado

                ,COALESCE(b.[version] + 1, 0) AS [version]
                ,COALESCE(b.usuario_creacion,a.mod_usr_id,'') AS usuario_creacion
                ,COALESCE(b.fecha_creacion,a.moddte,CAST('1900-01-01' AS DATETIME2(0))) AS fecha_creacion
                ,COALESCE(a.mod_usr_id,'') AS usuario_modificacion
                ,COALESCE(a.moddte,CAST('1900-01-01' AS DATETIME2(0))) AS fecha_modificacion

                ,a.fecha_sincronizacion
                ,CASE WHEN b.id_alistamiento IS NOT NULL THEN 1 ELSE 0 END AS existe
                ,CASE WHEN b.id_alistamiento IS NULL THEN 1 ELSE 0 END AS inserted
                ,0 AS deleted
            INTO #alistamientos
            FROM #source_ord a
            LEFT OUTER JOIN dbo.alistamientos b ON
                b.client_id = a.client_id
            AND b.ordnum = a.ordnum
            AND b.wh_id = a.wh_id
            LEFT OUTER JOIN [$(eConnect)].dbo.clientes c ON
                c.codigo_alterno_wms = a.client_id
            LEFT OUTER JOIN [$(eConnect)].dbo.bodegas d ON
                d.codigo = a.wh_id

            --Primero buscar la solicitud en lo nuevo
            UPDATE a
            SET a.id_solicitud = b.id_solicitud
            FROM #alistamientos a
            INNER JOIN [$(eConnect)].dbo.ordenes_alistamiento b ON
                b.id_cliente = a.id_cliente
            AND b.numero_orden = a.ordnum
            WHERE
                a.existe = 0
                    
            --Sino buscar la solicitud en lo viejo
            UPDATE a
            SET a.id_solicitud = b.id_solicitud
            FROM #alistamientos a
            INNER JOIN dbo.solicitudes b ON
                b.id_cliente = a.id_cliente
            AND b.numero_orden = a.ordnum
            WHERE
                a.existe = 0
            AND a.id_solicitud IS NULL

            CREATE UNIQUE CLUSTERED INDEX ix_alistamiento_01 ON #alistamientos(id_externo)
            CREATE UNIQUE INDEX ix_alistamiento_02 ON #alistamientos(client_id, wh_id, ordnum)
        END

        --================================================================================================================================
        --LINEAS
        --================================================================================================================================
        BEGIN
            IF OBJECT_ID('tempdb..#alistamientos_lineas') IS NOT NULL BEGIN
                DROP TABLE #alistamientos_lineas
            END

            ;WITH
            cte_00 AS
            (
                SELECT
                     a.id_externo
                    ,a.ordlin	
                    ,SUM(a.remqty) AS remqty
                FROM #source_canpck a
                GROUP BY
                     a.id_externo
                    ,a.ordlin	
            )
            SELECT
                 a.id_alistamiento
                ,a.id_externo
                ,b.ordlin

                ,CAST(b.ordlin AS INT) AS numero_item
                ,b.prtnum AS producto_codigo
                ,c.id_producto
                ,b.invsts_prg AS id_estado_inventario
                ,d.id_unidad_medida

                ,b.ordqty AS cantidad_solicitada
                ,b.stgqty AS cantidad_alistada
                ,b.shpqty AS cantidad_despachada
                ,CASE WHEN b.ordqty >= b.stgqty + COALESCE(e.remqty,0) THEN COALESCE(e.remqty,0) ELSE b.ordqty - b.stgqty END AS cantidad_cancelada

                ,COALESCE(b.mod_usr_id,'') AS usuario_creacion
                ,COALESCE(b.moddte,CAST('1900-01-01' AS DATETIME2(0)))AS fecha_creacion
                ,COALESCE(b.mod_usr_id,'') AS usuario_modificacion
                ,COALESCE(b.moddte,CAST('1900-01-01' AS DATETIME2(0))) AS fecha_modificacion

                ,a.existe
                ,CASE WHEN a.existe = 0 THEN 1 ELSE 0 END AS inserted
                ,0 AS deleted
            INTO #alistamientos_lineas
            FROM #alistamientos a
            INNER JOIN #source_ord_line b ON
                b.id_externo = a.id_externo
            LEFT OUTER JOIN [$(eConnect)].dbo.productos c ON
                c.id_cliente = a.id_cliente
            AND c.codigo = b.prtnum
            LEFT OUTER JOIN [$(eConnect)].dbo.productos_medidas d ON
                d.id_producto = c.id_producto
            AND d.id_bodega = a.id_bodega
            AND d.rcv_flg = 1
            LEFT OUTER JOIN cte_00 e ON
                e.id_externo = b.id_externo
            AND e.ordlin = b.ordlin

            UPDATE a
            SET
                 a.inserted = 1
                ,a.deleted = 1
                ,a.usuario_creacion = b.usuario_creacion
                ,a.fecha_creacion = b.fecha_creacion
            FROM #alistamientos_lineas a
            INNER JOIN dbo.alistamientos_lineas b ON
                b.id_alistamiento = a.id_alistamiento
            AND b.ordlin = a.ordlin
            WHERE
                a.existe = 1
            AND NOT 
            (
                a.producto_codigo = b.producto_codigo
            AND a.id_estado_inventario = b.id_estado_inventario
            AND a.cantidad_solicitada = b.cantidad_solicitada
            AND a.cantidad_alistada = b.cantidad_alistada
            AND a.cantidad_despachada = b.cantidad_despachada
            AND a.cantidad_cancelada = b.cantidad_cancelada
            )
					
            UPDATE a
            SET
                 a.inserted = 1
                ,a.deleted = 0
            FROM #alistamientos_lineas a
            LEFT OUTER JOIN dbo.alistamientos_lineas b ON
                b.id_alistamiento = a.id_alistamiento
            AND b.ordlin = a.ordlin
            WHERE
                a.existe = 1
            AND b.id_alistamiento IS NULL

            CREATE UNIQUE CLUSTERED INDEX ix_alistamiento_lineas_01 ON #alistamientos_lineas(id_externo, ordlin)
        END

        --================================================================================================================================
        --CANCELACIONES
        --================================================================================================================================
        BEGIN
            IF OBJECT_ID('tempdb..#alistamientos_cancelaciones') IS NOT NULL BEGIN
                DROP TABLE #alistamientos_cancelaciones
            END

            ;WITH
            cte_00 AS
            (
                SELECT
                        a.id_externo
                    ,a.ordlin	
                    ,a.cancod

                    ,SUM(a.remqty) OVER(PARTITION BY a.id_externo, a.ordlin, a.cancod) AS remqty
                    ,COALESCE(a.can_usr_id,'') AS can_usr_id
                    ,COALESCE(a.candte,CAST('1900-01-01' AS DATETIME2(0))) AS candte
                    ,ROW_NUMBER() OVER(PARTITION BY a.id_externo, a.ordlin, a.cancod ORDER BY a.candte DESC) AS orden
                FROM #source_canpck a
            )
            SELECT
                 a.id_alistamiento
                ,a.id_externo
                ,b.ordlin
                ,b.cancod AS cancelacion_codigo

                ,b.remqty AS cantidad_cancelada
                ,COALESCE(b.can_usr_id,'') AS usuario_creacion
                ,COALESCE(b.candte,CAST('1900-01-01' AS DATETIME2(0)))AS fecha_creacion
                ,COALESCE(b.can_usr_id,'') AS usuario_modificacion
                ,COALESCE(b.candte,CAST('1900-01-01' AS DATETIME2(0))) AS fecha_modificacion

                ,a.existe
                ,CASE WHEN a.existe = 0 THEN 1 ELSE 0 END AS inserted
                ,0 AS deleted
            INTO #alistamientos_cancelaciones
            FROM #alistamientos a
            INNER JOIN cte_00 b ON
                b.id_externo = a.id_externo
            WHERE
                b.orden = 1

            UPDATE a
            SET
                 a.inserted = 1
                ,a.deleted = 1
                ,a.usuario_creacion = b.usuario_creacion
                ,a.fecha_creacion = b.fecha_creacion
            FROM #alistamientos_cancelaciones a
            INNER JOIN dbo.alistamientos_cancelaciones b ON
                b.id_alistamiento = a.id_alistamiento
            AND b.ordlin = a.ordlin
			AND b.cancelacion_codigo = a.cancelacion_codigo
            WHERE
                a.existe = 1
            AND NOT 
            (
                a.cantidad_cancelada = b.cantidad_cancelada
            )
					
            UPDATE a
            SET
                 a.inserted = 1
                ,a.deleted = 0
            FROM #alistamientos_cancelaciones a
            LEFT OUTER JOIN dbo.alistamientos_cancelaciones b ON
                b.id_alistamiento = a.id_alistamiento
            AND b.ordlin = a.ordlin
			AND b.cancelacion_codigo = a.cancelacion_codigo
            WHERE
                a.existe = 1
            AND b.id_alistamiento IS NULL

            CREATE UNIQUE CLUSTERED INDEX ix_alistamiento_cancelaciones_01 ON #alistamientos_cancelaciones(id_externo, ordlin, cancelacion_codigo)
        END
    END

    --================================================================================================================================
    --DETECCION DE ORDENES CERRADAS
    --================================================================================================================================
    BEGIN
        --Cuando la cantidad solicitada (ordqty) sea igual a la cantidad despachada(shpqty) y la cancelada (remqty)
        --para todas las linea de una orden. En ese momento la orden pasará al estado CERRADA
        ;WITH
        cte_00 AS
        (
            SELECT
                 a.id_externo
                ,SUM(CASE WHEN a.cantidad_solicitada - (a.cantidad_alistada + a.cantidad_cancelada) <> 0 THEN 1 ELSE 0 END) AS lineas_abiertas
            FROM #alistamientos_lineas a
            GROUP BY
                    a.id_externo
            HAVING
                SUM(CASE WHEN a.cantidad_solicitada - (a.cantidad_alistada + a.cantidad_cancelada) <> 0 THEN 1 ELSE 0 END) = 0
        )
        UPDATE a
        SET  a.estado = 'CERRADA'
            ,a.inserted = 1
            ,a.deleted = CASE WHEN a.existe = 0 THEN 0 ELSE 1 END
        FROM #alistamientos a
        INNER JOIN cte_00 b ON
            b.id_externo = a.id_externo
        WHERE
            a.estado = 'ABIERTA'

        DELETE a
        FROM #alistamientos_lineas a
        INNER JOIN #alistamientos b ON
            b.id_externo = a.id_externo
        WHERE
            b.inserted = 0

        DELETE a
        FROM #alistamientos_cancelaciones a
        INNER JOIN #alistamientos b ON
            b.id_externo = a.id_externo
        WHERE
            b.inserted = 0
    END

    --================================================================================================================================
    --OBTENER REGISTROS A GUARDAR EN LOS LOGS
    --================================================================================================================================
    BEGIN
        --En la tabla destino se deben eliminar las versiones antiguas de los registros que se van a insertar
        --En la tabla destino solo se mantiene la ultima versión de cada registro.
        --Los registros eliminados de la tabla destino se pasarán luego al log
		IF OBJECT_ID('tempdb..#deleted') IS NOT NULL BEGIN
			DROP TABLE #deleted
		END

        SELECT
            a.*
        INTO #deleted
        FROM dbo.alistamientos a
        LEFT OUTER JOIN #alistamientos b ON
            b.id_alistamiento = a.id_alistamiento
        WHERE
            b.deleted = 1

		IF OBJECT_ID('tempdb..#deleted_lineas') IS NOT NULL BEGIN
			DROP TABLE #deleted_lineas
		END

        SELECT
            a.*
        INTO #deleted_lineas
        FROM dbo.alistamientos_lineas a
        LEFT OUTER JOIN #alistamientos_lineas b ON
            b.id_alistamiento = a.id_alistamiento
        AND b.ordlin = a.ordlin
        WHERE
            b.deleted = 1

		IF OBJECT_ID('tempdb..#deleted_cancelaciones') IS NOT NULL BEGIN
			DROP TABLE #deleted_cancelaciones
		END

        SELECT
            a.*
        INTO #deleted_cancelaciones
        FROM dbo.alistamientos_cancelaciones a
        LEFT OUTER JOIN #alistamientos_cancelaciones b ON
            b.id_alistamiento = a.id_alistamiento
        AND b.ordlin = a.ordlin
        AND b.cancelacion_codigo = a.cancelacion_codigo
        WHERE
            b.deleted = 1
    END

    --================================================================================================================================
    --ACTUALIZACION
    --================================================================================================================================
    BEGIN TRY
        BEGIN TRANSACTION

        --================================================================================================================================
        --LOGS
        --================================================================================================================================
        BEGIN
            DELETE a
            FROM dbo.alistamientos_cancelaciones a
            INNER JOIN #deleted_cancelaciones b ON
                b.id_alistamiento = a.id_alistamiento
            AND b.ordlin = a.ordlin
            AND b.cancelacion_codigo = a.cancelacion_codigo

            DELETE a
            FROM dbo.alistamientos_lineas a
            INNER JOIN #deleted_lineas b ON
                b.id_alistamiento = a.id_alistamiento
            AND b.ordlin = a.ordlin

            DELETE a
            FROM dbo.alistamientos_lineas a
            INNER JOIN #deleted b ON
                b.id_alistamiento = a.id_alistamiento
                
            INSERT INTO logs.alistamientos
                (id_alistamiento
                ,id_externo
                ,client_id
                ,ordnum
                ,wh_id
                ,id_cliente
                ,id_solicitud
                ,id_bodega
                ,estado
                ,[version]
                ,usuario_creacion
                ,fecha_creacion
                ,usuario_modificacion
                ,fecha_modificacion)
            SELECT
                    id_alistamiento
                ,id_externo
                ,client_id
                ,ordnum
                ,wh_id
                ,id_cliente
                ,id_solicitud
                ,id_bodega
                ,estado
                ,[version]
                ,usuario_creacion
                ,fecha_creacion
                ,usuario_modificacion
                ,fecha_modificacion
            FROM #deleted

            INSERT INTO logs.alistamientos
                (id_alistamiento
                ,id_externo
                ,client_id
                ,ordnum
                ,wh_id
                ,id_cliente
                ,id_solicitud
                ,id_bodega
                ,estado
                ,[version]
                ,usuario_creacion
                ,fecha_creacion
                ,usuario_modificacion
                ,fecha_modificacion)
            SELECT
                    id_alistamiento
                ,id_externo
                ,client_id
                ,ordnum
                ,wh_id
                ,id_cliente
                ,id_solicitud
                ,id_bodega
                ,estado
                ,[version]
                ,usuario_creacion
                ,fecha_creacion
                ,usuario_modificacion
                ,fecha_modificacion
            FROM #deleted

            INSERT INTO logs.alistamientos_lineas
                (id_alistamiento
                ,ordlin
                ,numero_item
                ,producto_codigo
                ,id_producto
                ,id_estado_inventario
                ,id_unidad_medida
                ,cantidad_solicitada
                ,cantidad_alistada
                ,cantidad_despachada
                ,cantidad_cancelada
                ,usuario_creacion
                ,fecha_creacion
                ,usuario_modificacion
                ,fecha_modificacion)
            SELECT
                    id_alistamiento
                ,ordlin
                ,numero_item
                ,producto_codigo
                ,id_producto
                ,id_estado_inventario
                ,id_unidad_medida
                ,cantidad_solicitada
                ,cantidad_alistada
                ,cantidad_despachada
                ,cantidad_cancelada
                ,usuario_creacion
                ,fecha_creacion
                ,usuario_modificacion
                ,fecha_modificacion
            FROM #deleted_lineas

            INSERT INTO logs.alistamientos_cancelaciones
                (id_alistamiento
                ,ordlin
                ,cancelacion_codigo
                ,cantidad_cancelada
                ,usuario_creacion
                ,fecha_creacion
                ,usuario_modificacion
                ,fecha_modificacion)
            SELECT
                    id_alistamiento
                ,ordlin
                ,cancelacion_codigo
                ,cantidad_cancelada
                ,usuario_creacion
                ,fecha_creacion
                ,usuario_modificacion
                ,fecha_modificacion
            FROM #deleted_cancelaciones
        END
                
        --================================================================================================================================
        -- TABLAS DEFINITIVAS
        --================================================================================================================================
        BEGIN
            DECLARE @t AS TABLE (id_externo VARCHAR(200), id int)

            INSERT INTO dbo.alistamientos
                (id_externo
                ,client_id
                ,ordnum
                ,wh_id
                ,id_cliente
                ,id_solicitud
                ,id_bodega
                ,estado
                ,[version]
                ,usuario_creacion
                ,fecha_creacion
                ,usuario_modificacion
                ,fecha_modificacion)
		    OUTPUT inserted.id_externo,inserted.id_alistamiento
		    INTO @t(id_externo,id)
            SELECT
                    a.id_externo
                ,a.client_id
                ,a.ordnum
                ,a.wh_id
                ,a.id_cliente
                ,a.id_solicitud
                ,a.id_bodega
                ,a.estado
                ,a.[version]
                ,a.usuario_creacion
                ,a.fecha_creacion
                ,a.usuario_modificacion
                ,a.fecha_modificacion
            FROM #alistamientos a
            WHERE
                a.inserted = 1
            AND a.existe = 0

            UPDATE a
            SET a.id_alistamiento = b.id
            FROM #alistamientos a
            INNER JOIN @t b ON
                b.id_externo = a.id_externo

            SET IDENTITY_INSERT dbo.alistamientos ON

            INSERT INTO dbo.alistamientos
                (id_alistamiento
                ,id_externo
                ,client_id
                ,ordnum
                ,wh_id
                ,id_cliente
                ,id_solicitud
                ,id_bodega
                ,estado
                ,[version]
                ,usuario_creacion
                ,fecha_creacion
                ,usuario_modificacion
                ,fecha_modificacion)
		    OUTPUT inserted.id_externo,inserted.id_alistamiento
		    INTO @t(id_externo,id)
            SELECT
                    a.id_alistamiento
                ,a.id_externo
                ,a.client_id
                ,a.ordnum
                ,a.wh_id
                ,a.id_cliente
                ,a.id_solicitud
                ,a.id_bodega
                ,a.estado
                ,a.[version]
                ,a.usuario_creacion
                ,a.fecha_creacion
                ,a.usuario_modificacion
                ,a.fecha_modificacion
            FROM #alistamientos a
            WHERE
                a.inserted = 1
            AND a.existe = 1

            SET IDENTITY_INSERT dbo.alistamientos OFF

            INSERT INTO dbo.alistamientos_lineas
                (id_alistamiento
                ,ordlin
                ,numero_item
                ,producto_codigo
                ,id_producto
                ,id_estado_inventario
                ,id_unidad_medida
                ,cantidad_solicitada
                ,cantidad_alistada
                ,cantidad_despachada
                ,cantidad_cancelada
                ,usuario_creacion
                ,fecha_creacion
                ,usuario_modificacion
                ,fecha_modificacion)
            SELECT
                    a.id_alistamiento
                ,b.ordlin
                ,b.numero_item
                ,b.producto_codigo
                ,b.id_producto
                ,b.id_estado_inventario
                ,b.id_unidad_medida
                ,b.cantidad_solicitada
                ,b.cantidad_alistada
                ,b.cantidad_despachada
                ,b.cantidad_cancelada
                ,b.usuario_creacion
                ,b.fecha_creacion
                ,b.usuario_modificacion
                ,b.fecha_modificacion
            FROM #alistamientos a
            INNER JOIN #alistamientos_lineas b ON
                b.id_externo = a.id_externo
            WHERE
                b.inserted = 1

            INSERT INTO dbo.alistamientos_cancelaciones
                (id_alistamiento
                ,ordlin
                ,cancelacion_codigo
                ,cantidad_cancelada
                ,usuario_creacion
                ,fecha_creacion
                ,usuario_modificacion
                ,fecha_modificacion)
            SELECT
                    a.id_alistamiento
                ,b.ordlin
                ,b.cancelacion_codigo
                ,b.cantidad_cancelada
                ,b.usuario_creacion
                ,b.fecha_creacion
                ,b.usuario_modificacion
                ,b.fecha_modificacion
            FROM #alistamientos a
            INNER JOIN #alistamientos_cancelaciones b ON
                b.id_externo = a.id_externo
            WHERE
                b.inserted = 1
        END

        COMMIT TRANSACTION
    END TRY
    BEGIN CATCH
        SELECT ERROR_MESSAGE()
        IF @@TRANCOUNT > 0 BEGIN
            ROLLBACK TRANSACTION
        END;
        ---TODO REGISTRAR ERROR
    END CATCH

    BEGIN
        --TODO SOLO ACTUALIAR LO QUE EXISTA EN WMS
        UPDATE a
        SET  a.estado_actualizacion = CASE WHEN a.entradas_en_cola = 0 THEN 'PROCESADO' ELSE 'NO_PROCESADO' END
            ,a.entradas_en_cola = 0
            ,a.[version] = a.[version] + 1
            ,a.fecha_modificacion = SYSDATETIME()
        FROM [$(WMS_DB_SERVER)].[$(eHistoricos)].dbo.integraciones_actualizaciones a
        WHERE   
            a.integracion = 'ALISTAMIENTOS'
        AND a.estado_actualizacion =  'NO_PROCESADO'
        AND a.fecha_sincronizacion = @fecha_sincronizacion
    END
END TRY
BEGIN CATCH
    ;THROW;
END CATCH