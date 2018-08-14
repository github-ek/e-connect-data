
CREATE PROCEDURE [dbo].[ProcesarArchivoRutaControl]
	@id_archivo BIGINT
AS
BEGIN TRY
	BEGIN
		IF OBJECT_ID('tempdb..#source') IS NOT NULL BEGIN
			DROP TABLE #source
		END

		SELECT
             id
            ,a.id_archivo
            ,a.numero_linea
            ,a.cliente_identificacion
            ,b.id_cliente
            ,COALESCE(b.codigo,'') AS cliente_codigo
            ,a.numero_solicitud
            ,c.id_solicitud

            ,a.placa_programada
            ,a.fecha_programada
            ,a.estado_codigo_alterno AS estado
            ,a.causal_novedad_codigo_alterno AS causal_novedad
            ,'' AS responsable_novedad
            ,a.fecha_hora_inicio
            ,a.fecha_hora_fin
            ,a.observaciones
            ,0 AS version
            ,a.fecha_creacion
            ,a.fecha_modificacion

            ,CASE WHEN d.id_remesa_secundaria IS NOT NULL THEN 1 ELSE 0 END AS existe_remesa
            ,d.id_remesa_secundaria
            ,
            CASE 
            WHEN d.responsable_novedad <> '' THEN 1 
            WHEN d.estado = a.estado_codigo_alterno
            AND  d.causal_novedad = a.causal_novedad_codigo_alterno
            AND  d.observaciones = a.observaciones THEN 1 
            ELSE 0 END AS descartar

            ,CAST(0 AS BIT) AS error
		INTO #source
		FROM dbo.planillas_rutacontrol a
        LEFT OUTER JOIN [$(eConnect)].dbo.clientes b ON
            b.numero_identificacion = a.cliente_identificacion
        LEFT OUTER JOIN [$(tactic_stage)].dbo.solicitudes c ON
            c.id_cliente = b.id_cliente
        AND c.numero_solicitud = a.numero_solicitud

        LEFT OUTER JOIN [$(tactic_stage)].dbo.remesas_secundaria d ON
            d.id_solicitud = c.id_solicitud
        AND d.placa_programada = a.placa_programada
        AND d.fecha_programada = a.fecha_programada
		WHERE
			a.id_archivo = @id_archivo
        AND a.estado = 'VALIDADO'

        UPDATE a
        SET a.error = 1
        FROM #source a
        WHERE
            a.id_cliente IS NULL OR a.id_solicitud IS NULL
	END

    BEGIN
        BEGIN TRANSACTION
        
        INSERT INTO [$(tactic_stage)].dbo.remesas_secundaria
			(id_solicitud
            ,placa_programada
            ,fecha_programada
            ,estado
            ,causal_novedad
            ,responsable_novedad
            ,fecha_hora_inicio
            ,fecha_hora_fin
            ,observaciones
            ,version
            ,fecha_creacion
            ,fecha_modificacion)
		SELECT
		     id_solicitud
            ,placa_programada
            ,fecha_programada
            ,estado
            ,causal_novedad
            ,responsable_novedad
            ,fecha_hora_inicio
            ,fecha_hora_fin
            ,observaciones
            ,version
            ,fecha_creacion
            ,fecha_modificacion
		FROM #source a
        WHERE
            a.existe_remesa = 0
        AND a.error = 0

        UPDATE a
        SET  a.estado = b.estado
            ,a.causal_novedad = b.causal_novedad
            ,a.fecha_hora_inicio = b.fecha_hora_inicio
            ,a.fecha_hora_fin = a.fecha_hora_fin
            ,a.observaciones = a.observaciones
            ,a.version = a.version + 1
            ,a.fecha_modificacion = b.fecha_modificacion
        FROM [$(tactic_stage)].dbo.remesas_secundaria a
        INNER JOIN #source b ON
            b.id_remesa_secundaria = a.id_remesa_secundaria
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
		FROM dbo.planillas_rutacontrol a
		INNER JOIN #source b ON
			b.id = a.id

        ;WITH
        cte_00 AS
        (
            SELECT
                 id_archivo
                ,numero_linea
                ,CONCAT('No se encontró un cliente con el número de identificación ',cliente_identificacion) AS mensaje
                ,fecha_creacion
                ,fecha_modificacion
            FROM #source
            WHERE
                id_cliente IS NULL
            UNION
            SELECT
                    id_archivo
                ,numero_linea
                ,CONCAT('No se encontró una solicitud con el número ',numero_solicitud,' para el cliente ',cliente_codigo) AS mensaje
                ,fecha_creacion
                ,fecha_modificacion
            FROM #source
            WHERE
                id_cliente IS NOT NULL AND id_solicitud IS NULL
        )
        INSERT INTO [$(eIntegration)].dbo.archivos_errores
            (id_archivo
            ,numero_linea
            ,codigo
            ,mensaje
            ,datos
            ,version
            ,usuario_creacion
            ,fecha_creacion
            ,usuario_modificacion
            ,fecha_modificacion)
        SELECT
                id_archivo
            ,numero_linea
            ,'' AS codigo
            ,mensaje
            ,'' AS datos
            ,0 AS version
            ,'' AS usuario_creacion
            ,fecha_creacion
            ,'' AS usuario_modificacion
            ,fecha_modificacion
        FROM cte_00 a

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
            INNER JOIN dbo.planillas_rutacontrol b ON
                b.id_archivo = a.id_archivo
            GROUP BY
                a.id_archivo
            HAVING
                COUNT(1) = SUM(CASE WHEN b.estado IN ('PROCESADO','DESCARTADO','ERROR_HOMOLOGACION') THEN 1 ELSE 0 END) 
        )
        UPDATE a
        SET  a.estado = 'PROCESADO'
            ,a.[version] = a.[version] + 1
            ,a.fecha_modificacion = SYSDATETIME()
            ,a.usuario_modificacion = SYSTEM_USER
        FROM [$(eIntegration)].dbo.archivos a
        INNER JOIN cte_01 b ON
            b.id_archivo = a.id_archivo

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
