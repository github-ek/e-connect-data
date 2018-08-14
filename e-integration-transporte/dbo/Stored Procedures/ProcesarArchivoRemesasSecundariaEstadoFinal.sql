--EXEC [dbo].[ProcesarArchivoRemesasSecundariaEstadoFinal]
CREATE PROCEDURE [dbo].[ProcesarArchivoRemesasSecundariaEstadoFinal]
AS
BEGIN TRY
    BEGIN
        UPDATE b
        SET b.cliente_codigo_alterno = a.codigo_alterno_wms
        FROM
        (
        VALUES
            ('FANALCA S.A.',	'FANALCA SA'),
            ('PERNOD RICARD COLOMBIA S.A.',	'PERNOD RICARD COLOMBIA S.A'),
            ('COLOMA LTDA',	'COLOMA'),
            ('DLK',	'DLK S.A.S'),
            ('HEINZ COLOMBIA',	'HEINZ COLOMBIA SAS'),
            ('EL DELI EJE S.A.S',	'EL DELI EJE SAS'),
            ('DOBLEVIA COMUNICACIONES S.A.',	'DOBLEVIA'),
            ('RED BULL COLOMBIA SAS',	'REDBUL'),
            ('DIVERFOODS S.A.S',	'DIVER'),
            ('JTI',	'JT')
        ) a(cliente_codigo_alterno,codigo_alterno_wms)
        INNER JOIN dbo.remesas_secundaria_estado_final b ON
            b.cliente_codigo_alterno = a.cliente_codigo_alterno
    END
    
	BEGIN
		IF OBJECT_ID('tempdb..#source') IS NOT NULL BEGIN
			DROP TABLE #source
		END

		SELECT
             id
            ,a.id_archivo
            ,a.numero_linea
            ,a.cliente_codigo_alterno
            ,b.id_cliente
            ,COALESCE(b.codigo,'') AS cliente_codigo
            ,a.numero_solicitud
            ,c.id_solicitud

            ,a.placa_programada
            ,a.fecha_programada

            ,a.estado_codigo_alterno AS estado
            ,a.causal_novedad_codigo_alterno AS causal_novedad
            ,a.responsable_novedad
            ,a.estado_cumplido_codigo_alterno AS estado_cumplido

            ,0 AS version
            ,a.fecha_creacion
            ,a.fecha_modificacion
            ,'NO_PROCESADO' AS estado_liquidacion 

            ,CASE WHEN d.id_remesa_secundaria_estado_final IS NOT NULL THEN 1 ELSE 0 END AS existe_remesa
            ,d.id_remesa_secundaria_estado_final
            ,
            CASE 
            WHEN d.estado = a.estado_codigo_alterno
            AND  d.causal_novedad = a.causal_novedad_codigo_alterno
            AND  d.responsable_novedad = a.responsable_novedad 
            AND  d.estado_cumplido = a.estado_cumplido_codigo_alterno THEN 1 
            ELSE 0 END AS descartar

            ,CAST(0 AS BIT) AS error
		INTO #source
		FROM dbo.remesas_secundaria_estado_final a
        LEFT OUTER JOIN [$(eConnect)].dbo.clientes b ON
            b.codigo_alterno_wms = a.cliente_codigo_alterno
        LEFT OUTER JOIN [$(tactic_stage)].dbo.solicitudes c ON
            c.id_cliente = b.id_cliente
        AND c.numero_solicitud = a.numero_solicitud

        LEFT OUTER JOIN [$(tactic_stage)].dbo.remesas_secundaria_estado_final d ON
            d.id_solicitud = c.id_solicitud
        AND d.placa_programada = a.placa_programada
        AND d.fecha_programada = a.fecha_programada
		WHERE 1 = 1
        AND a.estado = 'ESTRUCTURA_VALIDA'

        UPDATE a
        SET a.error = 1
        FROM #source a
        WHERE
            a.id_cliente IS NULL OR a.id_solicitud IS NULL
	END

    BEGIN
        BEGIN TRANSACTION
        
        INSERT INTO [$(tactic_stage)].dbo.remesas_secundaria_estado_final
            (id_solicitud
            ,placa_programada
            ,fecha_programada
            ,estado
            ,causal_novedad
            ,responsable_novedad
            ,estado_cumplido
            ,version
            ,fecha_creacion
            ,fecha_modificacion
            
            ,estado_liquidacion)
		SELECT
		     id_solicitud
            ,placa_programada
            ,fecha_programada
            ,estado
            ,causal_novedad
            ,responsable_novedad
            ,estado_cumplido
            ,version
            ,fecha_creacion
            ,fecha_modificacion

            ,estado_liquidacion
		FROM #source a
        WHERE
            a.existe_remesa = 0
        AND a.error = 0
        AND a.descartar = 0

        UPDATE a
        SET  a.estado = b.estado
            ,a.causal_novedad = b.causal_novedad
            ,a.responsable_novedad = b.responsable_novedad
            ,a.estado_cumplido = a.estado_cumplido
            ,a.[version] = a.[version] + 1
            ,a.fecha_modificacion = b.fecha_modificacion
        FROM [$(tactic_stage)].dbo.remesas_secundaria_estado_final a
        INNER JOIN #source b ON
            b.id_remesa_secundaria_estado_final = a.id_remesa_secundaria_estado_final
        AND b.existe_remesa = 1
        AND b.descartar = 0

		UPDATE a
		SET  a.estado = CASE 
                        WHEN error = 1  THEN 'ERROR_HOMOLOGACION' 
                        WHEN descartar = 1  THEN 'DESCARTADO' 
                        ELSE 'PROCESADO' END
            ,a.version = a.version + 1
			,a.usuario_modificacion = SYSTEM_USER
			,a.fecha_modificacion = SYSDATETIME()
		FROM dbo.remesas_secundaria_estado_final a
		INNER JOIN #source b ON
			b.id = a.id

        --;WITH
        --cte_00 AS
        --(
        --    SELECT
        --         id_archivo
        --        ,numero_linea
        --        ,CONCAT('No se encontró un cliente con el número de identificación ',cliente_identificacion) AS mensaje
        --        ,fecha_creacion
        --        ,fecha_modificacion
        --    FROM #source
        --    WHERE
        --        id_cliente IS NULL
        --    UNION
        --    SELECT
        --            id_archivo
        --        ,numero_linea
        --        ,CONCAT('No se encontró una solicitud con el número ',numero_solicitud,' para el cliente ',cliente_codigo) AS mensaje
        --        ,fecha_creacion
        --        ,fecha_modificacion
        --    FROM #source
        --    WHERE
        --        id_cliente IS NOT NULL AND id_solicitud IS NULL
        --)
        --INSERT INTO [$(eIntegration)].dbo.archivos_errores
        --    (id_archivo
        --    ,numero_linea
        --    ,codigo
        --    ,mensaje
        --    ,datos
        --    ,version
        --    ,usuario_creacion
        --    ,fecha_creacion
        --    ,usuario_modificacion
        --    ,fecha_modificacion)
        --SELECT
        --        id_archivo
        --    ,numero_linea
        --    ,'' AS codigo
        --    ,mensaje
        --    ,'' AS datos
        --    ,0 AS version
        --    ,'' AS usuario_creacion
        --    ,fecha_creacion
        --    ,'' AS usuario_modificacion
        --    ,fecha_modificacion
        --FROM cte_00 a

        --;WITH
        --cte_00 AS
        --(
        --    SELECT DISTINCT
        --        a.id_archivo
        --    FROM #source a
        --),
        --cte_01 AS
        --(
        --    SELECT
        --        a.id_archivo
        --    FROM cte_00 a
        --    INNER JOIN dbo.planillas_rutacontrol b ON
        --        b.id_archivo = a.id_archivo
        --    GROUP BY
        --        a.id_archivo
        --    HAVING
        --        COUNT(1) = SUM(CASE WHEN b.estado IN ('PROCESADO','DESCARTADO','ERROR_HOMOLOGACION') THEN 1 ELSE 0 END) 
        --)
        --UPDATE a
        --SET  a.estado = 'PROCESADO'
        --    ,a.[version] = a.[version] + 1
        --    ,a.fecha_modificacion = SYSDATETIME()
        --    ,a.usuario_modificacion = SYSTEM_USER
        --FROM [$(eIntegration)].dbo.archivos a
        --INNER JOIN cte_01 b ON
        --    b.id_archivo = a.id_archivo

        COMMIT TRANSACTION 
    END	
END TRY
BEGIN CATCH
    SELECT ERROR_MESSAGE()
    IF @@TRANCOUNT > 0 BEGIN
	    ROLLBACK TRANSACTION
    END
    ;THROW;
END CATCH
