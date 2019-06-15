CREATE PROCEDURE [dbo].[CrearRemesasProgramadas]
    @id_archivo BIGINT
AS
BEGIN TRY
    --SET NOCOUNT ON;

    ----------------------------------------------------------------------------------------------------------------------------
    --TODO CORRECION DE NITS DE CLIENTES
    ----------------------------------------------------------------------------------------------------------------------------
    BEGIN
        IF OBJECT_ID('tempdb..#correciones_identificaciones') IS NOT NULL BEGIN
            DROP TABLE #correciones_identificaciones
        END

        ;WITH
        cte_00 AS
        (
            SELECT
                a.*
            FROM
            (
                VALUES
                ('83024249',	'830024249'),
                ('900913766',	'9009137666'),
                ('8300837281',	'830083728'),
                ('900128567',	'9001288567'),
                ('901011813',	'901011813-7'),
                ('9003950626',	'900395062'),
                ('9008002638',	'900800263'),
                ('900367261-6',	'900367261'),
                ('9002769621',	'900276962'),

                ('890900608-9', '830074144')
            )a(cliente_identificacion_errada,cliente_identificacion)
        )
        SELECT
            a.*
        INTO #correciones_identificaciones
        FROM cte_00 a

        SELECT DISTINCT
             a.cliente_identificacion,b.cliente_identificacion
        FROM [eStage].tms.remesas_programadas a
        INNER JOIN #correciones_identificaciones b ON
            b.cliente_identificacion_errada = a.cliente_identificacion
        WHERE
            a.estado = 'ERROR_VALIDACION'
        AND a.id_cliente IS NULL

        UPDATE a
        SET 
             a.cliente_identificacion = b.cliente_identificacion
            ,a.estado = 'ESTRUCTURA_VALIDA'
        FROM [eStage].tms.remesas_programadas a
        INNER JOIN #correciones_identificaciones b ON
            b.cliente_identificacion_errada = a.cliente_identificacion
        WHERE
            a.estado = 'ERROR_VALIDACION'
        AND a.id_cliente IS NULL

    END

    ----------------------------------------------------------------------------------------------------------------------------
    --00 SNAPSHOT ARCHIVOS
    ----------------------------------------------------------------------------------------------------------------------------
    BEGIN
        IF OBJECT_ID('tempdb..#source') IS NOT NULL BEGIN
            DROP TABLE #source
        END

        SELECT
             a.id
            ,a.id_archivo
            ,a.numero_linea
            ,a.estado

            ,a.id_cliente
            ,a.cliente_identificacion
            ,COALESCE(b.codigo,'') AS cliente_codigo
            ,CASE WHEN a.placa_programada LIKE 'PAQUETEO%' THEN 'PAQUETEO' ELSE 'DISTRIBUCION' END AS linea_negocio_codigo
            ,a.numero_solicitud
            ,a.id_orden

            ,CASE WHEN a.paqueteadora_codigo = '' THEN a.placa_programada ELSE COALESCE(c.placa_predeterminada,'') END AS placa_programada
            ,a.fecha_programada
    
            ,a.es_servicio_dedicado
            ,a.paqueteadora_codigo
            ,CAST('' AS VARCHAR(1024)) AS mensaje

            ,a.usuario_creacion
            ,a.fecha_creacion
            ,a.usuario_modificacion
            ,a.fecha_modificacion
        INTO #source
        FROM [eStage].tms.remesas_programadas a
        LEFT OUTER JOIN [eConnect].dbo.clientes b ON
            b.id_cliente = a.id_cliente
        LEFT OUTER JOIN [eConnect].dbo.poseedores_vehiculos c ON
            c.codigo = a.paqueteadora_codigo
        WHERE
            a.estado = 'VALIDADO'
        AND a.id_archivo = @id_archivo
    END

    ----------------------------------------------------------------------------------------------------------------------------
    --01 CONSOLIDACION DE ORDENES
    ----------------------------------------------------------------------------------------------------------------------------
    BEGIN
        IF OBJECT_ID('tempdb..#ordenes') IS NOT NULL BEGIN
            DROP TABLE #ordenes
        END

        SELECT DISTINCT
             a.id_cliente
            ,a.numero_solicitud
            ,b.id_orden

            ,d.id_bodega
            ,b.id_tipo_servicio AS id_servicio
            ,COALESCE(b.hora_entrega_sugerida_minima,CAST('00:00:00' AS TIME(0))) AS hora_cita_minima
            ,COALESCE(b.hora_entrega_sugerida_maxima,CAST('23:59:59' AS TIME(0)))  AS hora_cita_maxima

            ,c.codigo_alterno_wms AS client_id
            ,COALESCE(d.codigo,'') AS wh_id
            ,COALESCE(b.ORDNUM,'') COLLATE SQL_Latin1_General_CP1_CI_AS AS ordnum
            ,COALESCE(b.INVNUM,'') COLLATE SQL_Latin1_General_CP1_CI_AS AS invnum
            
            ,CASE WHEN b.ORDNUM IS NOT NULL THEN 1 ELSE 0 END AS es_despacho
            ,CASE WHEN b.ORDNUM IS NULL AND b.INVNUM IS NOT NULL THEN 1 ELSE 0 END AS es_recogida
        INTO #ordenes
        FROM #source a
        INNER JOIN [192.168.10.15].[Satelite].ordenes.ordenes b ON
            b.id_cliente = a.id_cliente
        AND b.numero_documento_orden_cliente = a.numero_solicitud COLLATE Modern_Spanish_CI_AS
        INNER JOIN [eConnect].dbo.clientes c ON
            c.id_cliente = a.id_cliente
        LEFT OUTER JOIN [eConnect].dbo.bodegas d ON
            d.codigo = COALESCE(b.ORD_WH_ID,b.INV_WH_ID) COLLATE SQL_Latin1_General_CP1_CI_AS

        UPDATE a
        SET a.id_orden = b.id_orden
        FROM #source a
        INNER JOIN #ordenes b ON
            b.id_cliente = a.id_cliente
        AND b.numero_solicitud = a.numero_solicitud

        UPDATE a
        SET  a.estado = 'ERROR_VALIDACION'
            ,a.mensaje = CONCAT('El número de solicitud "',a.numero_solicitud,'" del cliente "',a.cliente_codigo,'" no corresponde a una solicitud existente')
        FROM #source a
        WHERE 1 = 1 
        AND a.estado = 'VALIDADO'
        AND a.id_cliente IS NOT NULL
        AND a.id_orden IS NULL
    END

    BEGIN TRANSACTION

    ----------------------------------------------------------------------------------------------------------------------------
    --02 REPROGRAMACION DE PLACAS: Si en el archivo viene una placa y ya existe una remesa para el mismo dia, se podria tratar de una corrección.
    --                             Entonces se debe eliminar todo lo haya programado para esa placa el mismo dia pero que aun no haya sido ejecutado.
    ----------------------------------------------------------------------------------------------------------------------------
    BEGIN
        --IF OBJECT_ID('tempdb..#placas') IS NOT NULL BEGIN
        --    DROP TABLE #placas
        --END
        
        --SELECT DISTINCT
        --     a.placa_programada
        --    ,a.fecha_programada
        --INTO #placas
        --FROM #source a
        --WHERE 1 = 1
        --AND a.estado = 'VALIDADO'
        --AND a.paqueteadora_codigo = ''

        --DELETE a
        --FROM [$(eConnect)].dbo.remesas_programadas a
        --INNER JOIN #placas b ON
        --    b.placa_programada = a.placa_programada
        --AND b.fecha_programada = a.fecha_programada
        --WHERE
        --    a.estado NOT IN ('GENERADA')

        UPDATE a
        SET  a.estado = 'DESCARTADO'
            ,a.mensaje = 'Este registro es solo para corregir un placa que no se va a programar'
        FROM #source a
        WHERE 1 = 1 
        AND a.estado = 'VALIDADO'
        AND a.id_cliente IS NULL
    END

    ----------------------------------------------------------------------------------------------------------------------------
    --03 REPROGRAMACION DE PAQUETEO: Si en el archivo viene una placa de paqueteo y viene ademas un codigo de paqueteadora, se podria tratar de una corrección.
    --                             Entonces se debe eliminar todo lo haya programado para esa placa y para la placa de la paqueteadora el mismo dia pero que aun no haya sido ejecutado.
    ----------------------------------------------------------------------------------------------------------------------------
    --BEGIN
    --    IF OBJECT_ID('tempdb..#paqueteo') IS NOT NULL BEGIN
    --        DROP TABLE #paqueteo
    --    END

    --    SELECT DISTINCT
    --         a.id_orden
    --        ,a.placa_programada
    --        ,a.fecha_programada
    --    INTO #paqueteo
    --    FROM #source a
    --    WHERE 1 = 1
    --    AND a.estado = 'VALIDADO'
    --    AND a.paqueteadora_codigo <> ''

    --    DELETE a
    --    FROM [$(eConnect)].dbo.remesas_programadas a
    --    INNER JOIN #paqueteo b ON
    --        b.id_orden = a.id_orden
    --    AND b.placa_programada = a.placa_programada
    --    AND b.fecha_programada = a.fecha_programada
    --    WHERE
    --        a.estado NOT IN ('GENERADA')
    --END

    ----------------------------------------------------------------------------------------------------------------------------
    --03 DESCARTAR REGISTROS YA EXISTENTES Y ELIMINAR REGISTROS CON PLACA TACTIC Y PAQUETEO
    ----------------------------------------------------------------------------------------------------------------------------
    BEGIN
        DELETE a 
        FROM [eConnect].dbo.remesas_programadas a
        INNER JOIN #source b ON
            b.id_orden = a.id_orden
        AND b.fecha_programada = a.fecha_programada
        AND b.estado = 'VALIDADO'
        WHERE 1 = 1
        AND a.estado NOT IN ('GENERADA')
        AND (a.placa_programada LIKE 'TACTIC%' OR a.placa_programada LIKE 'PAQUETEO%')

        UPDATE a
        SET  a.estado = 'DESCARTADO'
            ,a.mensaje = 'Este registro ya existe' + CASE WHEN b.estado IN ('GENERADA') THEN ' y no puede ser modificado' ELSE '' END
        FROM #source a
        INNER JOIN [eConnect].dbo.remesas_programadas b ON
            b.id_orden = a.id_orden
        AND b.placa_programada = a.placa_programada
        AND b.fecha_programada = a.fecha_programada
        WHERE 1 = 1
        AND a.estado = 'VALIDADO'
    END

    ----------------------------------------------------------------------------------------------------------------------------
    --04 IDENTIFICAR SOLICITUDES CON ALGUNA REPROGRAMACION (TODO: CAMBIAR DESPUES DE MIGRACION)
    ----------------------------------------------------------------------------------------------------------------------------
    BEGIN
        IF OBJECT_ID('tempdb..#reprogramaciones') IS NOT NULL BEGIN
            DROP TABLE #reprogramaciones
        END

        ;WITH
        cte_00 AS
        (
            SELECT
                a.id_orden
            FROM #source a
            WHERE 1 = 1
            AND a.estado = 'VALIDADO'
            GROUP BY
                a.id_orden
            HAVING COUNT(1) > 1
        ),
        cte_01 AS
        (
            SELECT DISTINCT
                a.id_orden
            FROM #source a
            INNER JOIN [eConnect].dbo.remesas_programadas b ON
                b.id_orden = a.id_orden
            WHERE 1 = 1
            AND a.estado = 'VALIDADO'
        ),
        cte_02 AS
        (
            SELECT id_orden FROM cte_00
            UNION
            SELECT id_orden FROM cte_01
        )
        SELECT
            a.*
        INTO #reprogramaciones
        FROM cte_02 a
    END

    ----------------------------------------------------------------------------------------------------------------------------
    --05 CONSOLIDACION DE DATOS DE REMESAS
    ----------------------------------------------------------------------------------------------------------------------------
    BEGIN
        IF OBJECT_ID('tempdb..#remesas_programadas') IS NOT NULL BEGIN
            DROP TABLE #remesas_programadas
        END

        SELECT
             a.id
    
            ,CAST(NULL AS BIGINT) AS id_remesa_programada
            ,CASE 
            WHEN c.es_despacho = 1 THEN 'DESPACHO' 
            WHEN c.es_recogida = 1 THEN 'RECOGIDA'
            ELSE '' END AS tipo_remesa 
            ,CAST(CASE WHEN d.id_orden IS NOT NULL THEN 1 ELSE 0 END AS BIT) AS es_reprogramacion
            ,a.numero_solicitud AS numero_remesa
            ,'NO_PROCESADA' AS estado
            ,a.numero_solicitud
            ,b.id_linea_negocio
            ,CAST(NULL AS BIGINT) AS id_orden_transporte

            ,c.id_bodega
            ,a.id_cliente
            ,c.id_servicio
            ,CAST(NULL AS BIGINT) AS id_tipo_ruta
            ,CAST(NULL AS BIGINT) AS id_tipo_vehiculo
            ,a.placa_programada
            ,a.fecha_programada
            ,c.hora_cita_minima
            ,c.hora_cita_maxima
    
            ,a.usuario_creacion
            ,a.fecha_creacion
            ,a.usuario_modificacion
            ,a.fecha_modificacion
            
            ,a.id_orden
            
            ,c.client_id
            ,c.wh_id
            ,c.ordnum
            ,c.invnum

            ,c.es_despacho
            ,c.es_recogida
            ,a.es_servicio_dedicado
            ,a.paqueteadora_codigo
        INTO #remesas_programadas
        FROM #source a
        INNER JOIN [eConnect].dbo.lineas_negocio b ON
            b.codigo = a.linea_negocio_codigo
        INNER JOIN #ordenes c ON
            c.id_orden = a.id_orden
        LEFT OUTER JOIN #reprogramaciones d ON
            d.id_orden = a.id_orden
        WHERE 1 = 1
        AND a.estado = 'VALIDADO'

        UPDATE a
        SET  a.estado = 'ERROR_VALIDACION'
            ,a.mensaje = CONCAT('No se pudo determinar el tipo de remesa de la solicitud "',a.numero_solicitud,'" del cliente "',a.cliente_codigo,'", debido a que no tiene asociada una orden de salida o de recibo en el WMS')
        FROM #source a
        INNER JOIN #remesas_programadas b ON
            b.id = a.id
        AND b.tipo_remesa = ''
        WHERE 1 = 1 
        AND a.estado = 'VALIDADO'

        UPDATE a
        SET  a.estado = 'ERROR_VALIDACION'
            ,a.mensaje = CONCAT('No se pudo determinar la placa de la paqueteadora "',a.paqueteadora_codigo,'" para la solicitud "',a.numero_solicitud,'" del cliente "',a.cliente_codigo,'". Verificar que la paqueteador este creada correctamente')
        FROM #source a
        INNER JOIN #remesas_programadas b ON
            b.id = a.id
        AND b.placa_programada = '' AND b.paqueteadora_codigo <> ''
        WHERE 1 = 1 
        AND a.estado = 'VALIDADO'

        DELETE a
        FROM #remesas_programadas a
        INNER JOIN #source b ON
            b.id = a.id
        AND b.estado <> 'VALIDADO'
        
        CREATE UNIQUE INDEX ix_remesas_programadas_01 ON #remesas_programadas(id)

        CREATE UNIQUE INDEX ix_remesas_programadas_02 ON #remesas_programadas(id_orden,placa_programada,fecha_programada)
    END

    ----------------------------------------------------------------------------------------------------------------------------
    --06 CREACION DE LAS REMESAS PROGRAMADAS
    ----------------------------------------------------------------------------------------------------------------------------
    BEGIN
        DECLARE @t AS TABLE(id_orden BIGINT,placa_programada VARCHAR(20),fecha_programada DATE,id_remesa_programada BIGINT)

        INSERT INTO [eConnect].dbo.remesas_programadas
           (tipo_remesa
           ,es_reprogramacion
           ,numero_remesa
           ,estado
           ,numero_solicitud
           ,id_linea_negocio
           ,id_orden_transporte
           ,id_bodega
           ,id_cliente
           ,id_servicio
           ,id_tipo_ruta
           ,id_tipo_vehiculo
           ,placa_programada
           ,fecha_programada
           ,hora_cita_minima
           ,hora_cita_maxima
           ,es_servicio_dedicado
           ,usuario_creacion
           ,fecha_creacion
           ,usuario_modificacion
           ,fecha_modificacion
           ,id_orden
           ,client_id
           ,wh_id
           ,ordnum
           ,invnum)
        OUTPUT inserted.id_orden,inserted.placa_programada,inserted.fecha_programada,inserted.id_remesa_programada
        INTO @t
        SELECT
            tipo_remesa
           ,es_reprogramacion
           ,numero_remesa
           ,estado
           ,numero_solicitud
           ,id_linea_negocio
           ,id_orden_transporte
           ,id_bodega
           ,id_cliente
           ,id_servicio
           ,id_tipo_ruta
           ,id_tipo_vehiculo
           ,placa_programada
           ,fecha_programada
           ,hora_cita_minima
           ,hora_cita_maxima
           ,es_servicio_dedicado
           ,usuario_creacion
           ,fecha_creacion
           ,usuario_modificacion
           ,fecha_modificacion
           ,id_orden
           ,client_id
           ,wh_id
           ,ordnum
           ,invnum
        FROM #remesas_programadas a

        UPDATE a
        SET a.id_remesa_programada = b.id_remesa_programada
        FROM #remesas_programadas a 
        INNER JOIN @t b ON
            b.id_orden = a.id_orden
        AND b.placa_programada = a.placa_programada
        AND b.fecha_programada = a.fecha_programada
    END

    ----------------------------------------------------------------------------------------------------------------------------
    --07 ACTUALIZACION DE REGISTROS EN STAGE 
    ----------------------------------------------------------------------------------------------------------------------------
    BEGIN
        UPDATE a
        SET  a.estado = 'PROCESADO'
        FROM #source a
        WHERE 1 = 1 
        AND a.estado = 'VALIDADO'

        UPDATE a
        SET  a.estado = b.estado
            ,a.[version] = a.[version] + 1
            ,a.fecha_modificacion = b.fecha_modificacion
            ,a.usuario_modificacion = b.usuario_modificacion
        FROM [eStage].tms.remesas_programadas a
        INNER JOIN #source b ON
            b.id = a.id

        ;WITH
        cte_00 AS
        (
            SELECT
                 a.id_archivo
                ,a.numero_linea
                ,a.mensaje
                ,CONCAT(a.cliente_identificacion,'|',a.numero_solicitud,'|',a.fecha_programada,'|',a.placa_programada) AS datos
            FROM #source a
            INNER JOIN [eStage].tms.remesas_programadas b ON
                b.id = a.id
            WHERE
                a.estado IN ('ERROR_VALIDACION','DESCARTADO')
        )
        INSERT INTO dbo.archivos_errores
            (id_archivo,numero_linea,codigo,mensaje,datos,usuario_creacion,fecha_creacion,usuario_modificacion,fecha_modificacion)
        SELECT 
             id_archivo
            ,numero_linea
            ,'' AS codigo
            ,mensaje
            ,datos
            ,SYSTEM_USER AS usuario_creacion
            ,SYSDATETIME() AS fecha_creacion
            ,SYSTEM_USER AS usuario_modificacion
            ,SYSDATETIME() AS fecha_modificacion 
        FROM cte_00
    END 

    ----------------------------------------------------------------------------------------------------------------------------
    --08 TODO MARCACION AUTOMATICA DE ERRORES
    ----------------------------------------------------------------------------------------------------------------------------
    BEGIN
        UPDATE b
        SET
            b.estado = 'RETENIDA',
            b.notas_migracion = 
            CASE 
            WHEN a.placa_programada LIKE 'TACTIC%' THEN 'PLACA GENERICA TACTIC' 
            WHEN a.placa_programada LIKE 'PAQUETEO%' THEN 'PLACA GENERICA PAQUETEO'
            WHEN (a.tipo_remesa = 'DESPACHO' AND a.es_reprogramacion = 1) THEN 'REPROGRAMACION DE DESPACHO'
            WHEN a.tipo_remesa = 'RECOGIDA' THEN 'LOGISTICA INVERSA'
            ELSE '' END
        FROM #remesas_programadas a
        INNER JOIN [eConnect].dbo.remesas_programadas b ON
            b.id_remesa_programada = a.id_remesa_programada
        WHERE 0 = 1
        OR a.placa_programada LIKE 'TACTIC%'
        OR a.placa_programada LIKE 'PAQUETEO%'
        OR (a.tipo_remesa = 'DESPACHO' AND a.es_reprogramacion = 1)
        OR a.tipo_remesa = 'RECOGIDA'

        SELECT
            a.*
        FROM #source a
        WHERE 1 = 1 
        AND a.estado <> 'PROCESADO'
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
