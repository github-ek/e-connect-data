CREATE PROCEDURE [dbo].[CerrarOrdenesDeAlistamiento]
AS
BEGIN TRY

    --CONSOLIDACION DE INFORMACION DE NUEVAS ORDENES
    BEGIN
        IF OBJECT_ID('tempdb..#source') IS NOT NULL BEGIN
            DROP TABLE #source
        END

        SELECT
             a.integracion
            ,a.correlacion
            ,a.id_externo
        INTO #source
        FROM actualizaciones a
        WHERE
            a.integracion = 'ORDENES_DE_ALISTAMIENTO'
        AND a.estado_integracion = 'VALIDADO'
        AND a.subestado_integracion = ''

        IF OBJECT_ID('tempdb..#ordenes') IS NOT NULL BEGIN
            DROP TABLE #ordenes
        END

        SELECT
             a.integracion
            ,a.correlacion
            ,a.id_externo

            ,b.id_orden
            ,b.wh_id
            ,c.id_solicitud
            ,c.id_orden_alistamiento
            ,c.estado_orden
            ,c.numero_orden
            ,CASE WHEN c.id_orden_alistamiento IS NOT NULL THEN 1 ELSE 0 END AS match_orden
            ,CASE WHEN b.id_bodega = c.id_bodega THEN 1 ELSE 0 END AS match_bodega
            ,CASE WHEN c.estado_orden = 'CREACION_CONFIRMADA' THEN 1 ELSE 0 END AS match_estado_orden
        INTO #ordenes
        FROM #source a
        INNER JOIN dbo.ordenes_alistamiento_ord b ON
            b.integracion = a.integracion
        AND b.id_externo = a.id_externo
        LEFT OUTER JOIN [$(eConnect)].dbo.ordenes_alistamiento c ON
            c.id_cliente = b.id_cliente
        AND c.numero_orden = b.ordnum
		
        IF OBJECT_ID('tempdb..#ordenes_lineas_alistadas') IS NOT NULL BEGIN
            DROP TABLE #ordenes_lineas_alistadas
        END

        SELECT
             a.integracion
            ,a.correlacion
            ,a.id_externo

            ,a.id_orden
            ,a.id_orden_alistamiento
            ,a.numero_orden
            ,c.id_orden_linea

            ,b.numero_linea
            ,b.unidades_solicitadas

            ,c.ordqty
            ,c.stgqty
            ,c.ordlin
            
            ,b.producto_codigo
            ,c.prtnum

            ,b.id_estado_inventario
            ,c.invsts

            ,CASE WHEN c.id_orden_linea IS NOT NULL THEN 1 ELSE 0 END AS match_linea
            ,CASE WHEN b.id_producto = c.id_producto THEN 1 ELSE 0 END AS match_producto
            ,CASE WHEN b.id_estado_inventario = c.id_estado_inventario THEN 1 ELSE 0 END AS match_estado_inventario
            ,CASE WHEN b.unidades_solicitadas = c.ordqty THEN 1 ELSE 0 END AS match_unidades_solicitadas
        INTO #ordenes_lineas_alistadas
        FROM #ordenes a
        INNER JOIN [$(eConnect)].dbo.ordenes_alistamiento_lineas b ON
            b.id_orden_alistamiento = a.id_orden_alistamiento
        LEFT OUTER JOIN dbo.ordenes_alistamiento_shipment_line c ON
            c.id_orden = a.id_orden
        AND c.numero_linea = b.numero_linea
        WHERE
            a.match_orden = 1

        IF OBJECT_ID('tempdb..#ordenes_lineas_alistadas_sobrantes') IS NOT NULL BEGIN
            DROP TABLE #ordenes_lineas_alistadas_sobrantes
        END

        SELECT
             a.integracion
            ,a.correlacion
            ,a.id_externo

            ,a.id_orden
            ,a.id_orden_alistamiento
            ,a.numero_orden

            ,b.numero_linea
        INTO #ordenes_lineas_alistadas_sobrantes
        FROM #ordenes a
        INNER JOIN dbo.ordenes_alistamiento_shipment_line b ON
            b.id_orden = a.id_orden
        AND b.numero_linea = b.numero_linea
        LEFT OUTER JOIN [$(eConnect)].dbo.ordenes_alistamiento_lineas c ON
            c.id_orden_alistamiento = a.id_orden_alistamiento
        AND c.numero_linea = b.numero_linea
        WHERE
            a.match_orden = 1
        AND c.id IS NULL

        IF OBJECT_ID('tempdb..#ordenes_cancelaciones') IS NOT NULL BEGIN
            DROP TABLE #ordenes_cancelaciones
        END

        SELECT
             a.integracion
            ,a.correlacion
            ,a.id_externo

            ,a.id_orden
            ,a.id_orden_alistamiento
            ,a.numero_orden

            ,a.numero_linea

            ,b.remqty
            ,b.cancod
            ,b.lngdsc
            ,b.can_usr_id
            ,b.candte
        INTO #ordenes_cancelaciones
        FROM #ordenes_lineas_alistadas a
        INNER JOIN dbo.ordenes_alistamiento_canpck b ON
            b.id_orden_linea = a.id_orden_linea
        WHERE
            a.match_linea = 1

        IF OBJECT_ID('tempdb..#ordenes_lotes') IS NOT NULL BEGIN
            DROP TABLE #ordenes_lotes
        END

        SELECT
             a.integracion
            ,a.correlacion
            ,a.id_externo

            ,a.id_orden
            ,a.id_orden_alistamiento
            ,a.numero_orden

            ,a.numero_linea

            ,b.untqty
            ,b.lotnum
            ,b.invsts
            ,b.expire_dte
            ,b.orgcod
        INTO #ordenes_lotes
        FROM #ordenes_lineas_alistadas a
        INNER JOIN dbo.ordenes_alistamiento_invdtl b ON
            b.id_orden_linea = a.id_orden_linea
        WHERE
            a.match_linea = 1
    END

    --DETECCION DE ERRORES
    BEGIN
        IF OBJECT_ID('tempdb..#ordenes_errores') IS NOT NULL BEGIN
            DROP TABLE #ordenes_errores
        END

        ;WITH
        cte_00 AS
        (
            SELECT
                 a.integracion
                ,a.correlacion
                ,a.id_externo
                ,'NUMERO ORDEN' AS codigo
                ,'Número de orden no existe' AS mensaje

                ,'' AS arg0
            FROM #ordenes a
            WHERE
                a.match_orden = 0
            UNION
            SELECT
                 a.integracion
                ,a.correlacion
                ,a.id_externo
                ,'BODEGA' AS codigo
                ,'Código no existe' AS mensaje

                ,a.wh_id AS arg0
            FROM #ordenes a
            WHERE
                a.match_bodega = 0
            UNION
            SELECT
                 a.integracion
                ,a.correlacion
                ,a.id_externo
                ,'ESTADO ORDEN' AS codigo
                ,'El estado de la orden no permite realizar este cambio' AS mensaje

                ,a.estado_orden AS arg0
            FROM #ordenes a
            WHERE
                a.match_estado_orden = 0
        )
        SELECT
            a.*
        INTO #ordenes_errores
        FROM cte_00 a
   
        IF OBJECT_ID('tempdb..#ordenes_lineas_alistadas_errores') IS NOT NULL BEGIN
            DROP TABLE #ordenes_lineas_alistadas_errores
        END

        ;WITH
        cte_00 AS
        (
            SELECT
                 a.integracion
                ,a.correlacion
                ,a.id_externo
                ,'LÍNEA' AS codigo
                ,'El número de la línea que originalmente existe en la solicitud, no existe en WMS' AS mensaje

                ,CAST(a.numero_linea AS varchar(10)) AS arg0
                ,'' AS arg1
                ,'' AS arg2
            FROM #ordenes_lineas_alistadas a
            WHERE
                a.match_linea = 0

            UNION
            SELECT
                 a.integracion
                ,a.correlacion
                ,a.id_externo
                ,'PRODUCTO' AS codigo
                ,'El código del producto que originalmente se solicitaron en esta línea, no coincide con el reportado en el WMS' AS mensaje

                ,CAST(a.numero_linea AS varchar(10)) AS arg0
                ,a.producto_codigo AS arg1
                ,a.prtnum AS arg2
            FROM #ordenes_lineas_alistadas a
            WHERE
                a.match_linea = 1
            AND a.match_producto = 0

            UNION
            SELECT
                 a.integracion
                ,a.correlacion
                ,a.id_externo
                ,'ESTADO INVENTARIO' AS codigo
                ,'El código del estado que originalmente se solicitaron en esta línea, no coincide con el reportado en el WMS' AS mensaje

                ,CAST(a.numero_linea AS varchar(10)) AS arg0
                ,a.id_estado_inventario AS arg1
                ,a.invsts AS arg2
            FROM #ordenes_lineas_alistadas a
            WHERE
                a.match_linea = 1
            AND a.match_estado_inventario = 0
        
            UNION
            SELECT
                 a.integracion
                ,a.correlacion
                ,a.id_externo
                ,'UNIDADES SOLICITADAS' AS codigo
                ,'Las unidades que originalmente se solicitaron en esta línea, no coincide con el reportado en el WMS' AS mensaje

                ,CAST(a.numero_linea AS varchar(10)) AS arg0
                ,CAST(a.unidades_solicitadas AS varchar(10)) AS arg1
                ,CAST(a.ordqty AS varchar(10)) AS arg2
            FROM #ordenes_lineas_alistadas a
            WHERE
                a.match_linea = 1
            AND a.match_unidades_solicitadas = 0	
        
            UNION
            SELECT
                 a.integracion
                ,a.correlacion
                ,a.id_externo
                ,'LÍNEA SOBRANTE' AS codigo
                ,'Esta línea aparece en WMS pero originalmente no venia en la solicitud' AS mensaje

                ,CAST(a.numero_linea AS varchar(10)) AS arg0
                ,'' AS arg1
                ,'' AS arg2
            FROM #ordenes_lineas_alistadas_sobrantes a
        )
        SELECT
            a.*
        INTO #ordenes_lineas_alistadas_errores 
        FROM cte_00 a

        IF OBJECT_ID('tempdb..#errores') IS NOT NULL BEGIN
            DROP TABLE #errores
        END

        ;WITH
        cte_00 AS
        (
            SELECT
                 a.integracion
                ,a.correlacion
                ,a.id_externo
                ,a.codigo
                ,a.mensaje

                ,a.arg0
                ,'' AS arg1
                ,'' AS arg2
            FROM #ordenes_errores a
            UNION    
            SELECT
                 a.integracion
                ,a.correlacion
                ,a.id_externo
                ,a.codigo
                ,a.mensaje

                ,a.arg0
                ,a.arg1
                ,a.arg2
            FROM #ordenes_lineas_alistadas_errores a
        )
        SELECT
            a.*
        INTO #errores
        FROM cte_00 a

        DELETE a
        FROM #ordenes a
        INNER JOIN #errores b ON
            b.integracion = a.integracion
        AND b.id_externo = a.id_externo

        DELETE a
        FROM #ordenes_lineas_alistadas a
        INNER JOIN #errores b ON
            b.integracion = a.integracion
        AND b.id_externo = a.id_externo

        DELETE a
        FROM #ordenes_cancelaciones a
        INNER JOIN #errores b ON
            b.integracion = a.integracion
        AND b.id_externo = a.id_externo

        DELETE a
        FROM #ordenes_lotes a
        INNER JOIN #errores b ON
            b.integracion = a.integracion
        AND b.id_externo = a.id_externo
    END

    --CIERRE DE LAS ORDENES
    BEGIN TRANSACTION
    
    BEGIN
		--FINALIZAR MENSAJE
        UPDATE a
        SET  a.estado_mensaje = 'PROCESADO'
            ,a.fecha_confirmacion_envio = SYSDATETIME()
            ,a.[version] = a.[version] + 1
            ,a.usuario_modificacion = SYSTEM_USER
            ,a.fecha_modificacion = SYSDATETIME()
        FROM dbo.mensajes_alistamiento_jda a
        INNER JOIN #ordenes b ON
            b.id_orden_alistamiento = a.id_orden_alistamiento

		--ACTUALIZAR EL ESTADO DE LA INTEGRACION DE LA ORDEN DE ALISTAMIENTO EN CASO EXITOSO
		UPDATE a
        SET  a.estado_integracion = 'PROCESADO'
			,a.subestado_integracion = ''
			,a.estado_notificacion = 'SIN_NOVEDAD'
			,a.reintentos = 0
			,a.[version] = a.[version] + 1
			,a.fecha_modificacion = SYSDATETIME()
        FROM dbo.actualizaciones a
        INNER JOIN #ordenes b ON
            a.integracion = b.integracion
        AND a.id_externo = b.numero_orden

		--ACTUALIZAR EL ESTADO DE LA INTEGRACION DE LA ORDEN DE ALISTAMIENTO EN CASO DE ERROR
		;WITH
        cte_00 AS
        (
            SELECT DISTINCT
                 a.integracion
                ,a.id_externo
            FROM #errores a
        )
        UPDATE a
        SET  a.estado_integracion = 'ERROR_VALIDACION'
            ,a.subestado_integracion = 'INCONSISTENCIA_WMS'
        FROM actualizaciones a
        INNER JOIN cte_00 b ON
            b.integracion = a.integracion
        AND b.id_externo = a.id_externo

		--ACTUALIZAR EL ESTADO DE LA INTEGRACION DE LA SOLICITUD. ESTO ESTA AQUI PARA PERMITIR QUE LA INTEGRACION DE GWS NOTIFIQUE AL SISTEMA DE GWS. 
		--REALMENTE ESTO DEBERIA 
		--SER NOTIFICADO A LOS FLUJOS INTERESADOS MEDIANTE EL PATRON OBSERVER
		--O
		--EL FLUJO INTERESADO DEBERIA CONSULTAR LAS ORDENES EN STAGE. NO TODOS LOS CLIENTES ESTAN INTERESADOS EN CONOCER QUE LA ORDEN DE ALISTAMIENTO HA QUEDADO EN STAGE
        UPDATE c
        SET  c.subestado_integracion = 'STAGE'
			,c.estado_notificacion = 'NOTIFICAR'
        FROM #ordenes a
        INNER JOIN [$(eConnect)].dbo.solicitudes b ON
            b.id_solicitud = a.id_solicitud
        INNER JOIN dbo.actualizaciones c ON
            c.integracion = b.integracion
        AND c.id_externo = b.id_externo

		--DEJAR EN STAGE LA ORDEN DE ALISTAMIENTO
        UPDATE a
        SET  a.estado_orden = 'STAGE'
			,a.[version] = a.[version] + 1
			,a.usuario_modificacion = SYSTEM_USER
			,a.fecha_modificacion = SYSDATETIME()
        FROM [$(eConnect)].dbo.ordenes_alistamiento a
        INNER JOIN #ordenes b ON
            b.id_orden_alistamiento = a.id_orden_alistamiento

        INSERT INTO [$(eConnect)].dbo.ordenes_alistamiento_lineas_alistadas
            (id
            ,id_orden_alistamiento
            ,numero_linea
            ,unidades_alistadas
            ,ordlin

            ,[version]
            ,usuario_creacion
            ,fecha_creacion
            ,usuario_modificacion
            ,fecha_modificacion)
        SELECT
             NEXT VALUE FOR [$(eConnect)].dbo.hibernate_sequence
            ,id_orden_alistamiento
            ,numero_linea
            ,stgqty AS unidades_alistadas
            ,ordlin
            
            ,0 AS [version]
            ,SYSTEM_USER AS usuario_creacion
            ,SYSDATETIME() AS fecha_creacion
            ,SYSTEM_USER AS usuario_modificacion
            ,SYSDATETIME() AS fecha_modificacion
        FROM #ordenes_lineas_alistadas

        INSERT INTO [$(eConnect)].dbo.ordenes_alistamiento_cancelaciones
            (id
            ,id_orden_alistamiento
            ,numero_linea
            ,unidades_canceladas
            ,cancelacion_codigo
            ,cancelacion_descripcion

            ,[version]
            ,usuario_creacion
            ,fecha_creacion
            ,usuario_modificacion
            ,fecha_modificacion)
        SELECT
             NEXT VALUE FOR [$(eConnect)].dbo.hibernate_sequence
            ,id_orden_alistamiento
            ,numero_linea
            ,remqty AS unidades_canceladas
            ,cancod AS cancelacion_codigo
            ,lngdsc AS cancelacion_descripcion

            ,0 AS [version]
            ,can_usr_id AS usuario_creacion
            ,candte AS fecha_creacion
            ,can_usr_id AS usuario_modificacion
            ,candte AS fecha_modificacion
        FROM #ordenes_cancelaciones

        INSERT INTO [$(eConnect)].dbo.ordenes_alistamiento_lotes
            (id
            ,id_orden_alistamiento
            ,numero_linea
            ,unidades_alistadas
            ,lote
            ,id_estado_inventario
            ,fecha_vencimiento
            ,orgcod

            ,[version]
            ,usuario_creacion
            ,fecha_creacion
            ,usuario_modificacion
            ,fecha_modificacion)
        SELECT
             NEXT VALUE FOR [$(eConnect)].dbo.hibernate_sequence
            ,id_orden_alistamiento
            ,numero_linea
            ,untqty AS unidades_alistadas
            ,lotnum AS lote
            ,invsts AS id_estado_inventario
            ,expire_dte AS fecha_vencimiento
            ,orgcod

            ,0 AS [version]
            ,SYSTEM_USER AS usuario_creacion
            ,SYSDATETIME() AS fecha_creacion
            ,SYSTEM_USER AS usuario_modificacion
            ,SYSDATETIME() AS fecha_modificacion
        FROM #ordenes_lotes
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