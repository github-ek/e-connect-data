CREATE PROCEDURE [dbo].[piloto_RechazarSolicitudesDeCedisNoHabilitados]
AS
BEGIN TRY
    BEGIN
        IF OBJECT_ID('tempdb..#errores') IS NOT NULL BEGIN
            DROP TABLE #errores
        END

		;WITH
		cte_00 AS
		(
			SELECT
				b.id_bodega
			FROM dbo.piloto_bodegas_habilitadas a
			INNER JOIN [$(eConnect)].dbo.bodegas b ON
				b.codigo = a.bodega_codigo
		)
        SELECT DISTINCT
             b.id_solicitud_despacho 
			,a.integracion
			,a.correlacion
			,a.id_externo

			,'SOLICITUD CEDI NO HABILITADO' AS codigo
			,'La solicitud esta asociada a un cedi no habilitado' AS mensaje
		INTO #errores
        FROM dbo.actualizaciones a
        INNER JOIN dbo.solicitudes_despacho b ON
            b.integracion = a.integracion
        AND b.id_externo = a.id_externo
        AND b.correlacion = a.correlacion
		INNER JOIN dbo.solicitudes_despacho_lineas c ON
			c.id_solicitud_despacho = b.id_solicitud_despacho
        LEFT OUTER JOIN cte_00 d ON
            d.id_bodega = c.id_bodega
        WHERE
            a.estado_integracion = 'VALIDADO'
		AND d.id_bodega IS NULL
    END

	BEGIN
		BEGIN TRANSACTION

			UPDATE a
			SET  a.estado_integracion = 'ERROR_VALIDACION' 
				,a.estado_notificacion = 'NOTIFICAR'
				,a.[version] = a.[version] + 1
				,a.fecha_modificacion = SYSDATETIME()
			FROM dbo.actualizaciones a
			INNER JOIN #errores b ON
				b.integracion = a.integracion
			AND b.correlacion = a.correlacion
			AND b.id_externo = a.id_externo

			INSERT INTO errores
				(id
				,integracion
				,correlacion
				,id_externo
				,estado_notificacion
				,codigo
				,mensaje
				,version
				,fecha_creacion
				,fecha_modificacion)
			SELECT
				 NEXT VALUE FOR [$(eConnect)].dbo.hibernate_sequence AS id
				,integracion
				,correlacion
				,id_externo
				,'NOTIFICAR' AS estado_notificacion
				,codigo
				,mensaje
				,0 AS version
				,SYSDATETIME() AS fecha_creacion
				,SYSDATETIME() AS fecha_modificacion
			FROM #errores

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