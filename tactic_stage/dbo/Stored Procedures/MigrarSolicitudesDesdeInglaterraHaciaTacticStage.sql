CREATE PROCEDURE [dbo].[MigrarSolicitudesDesdeInglaterraHaciaTacticStage]
AS
BEGIN TRY
    --SET NOCOUNT ON;
    BEGIN
        IF OBJECT_ID('tempdb..#solicitudes') IS NOT NULL BEGIN
            DROP TABLE #solicitudes
        END

        SELECT
             a.*
        INTO #solicitudes
        FROM [192.168.10.15].[tactic_stage].dbo.solicitudes a
        WHERE
            a.cambio_notificado = 0

        CREATE UNIQUE INDEX ix_solicitudes_01 ON #solicitudes(id_solicitud)

        IF OBJECT_ID('tempdb..#solicitudes_lineas') IS NOT NULL BEGIN
            DROP TABLE #solicitudes_lineas
        END

        ;WITH
        cte_00 AS
        (
            SELECT
                 a.id_solicitud
            FROM #solicitudes a
            LEFT OUTER JOIN tactic_stage.dbo.solicitudes b ON
                b.id_solicitud = a.id_solicitud
            WHERE
                b.id_solicitud IS NULL
            AND a.eliminada = 0
        )
        SELECT
             b.*
        INTO #solicitudes_lineas
        FROM cte_00 a
        INNER JOIN [192.168.10.15].[tactic_stage].dbo.solicitudes_lineas b ON
            b.id_solicitud = a.id_solicitud
    END

    BEGIN
        BEGIN TRANSACTION

        INSERT INTO tactic_stage.dbo.solicitudes
            (id_solicitud
            ,numero_solicitud
            ,fecha_solicitud
            ,cambio_notificado
            ,eliminada
            ,numero_orden
            ,id_bodega
            ,id_cliente
            ,id_servicio
            ,tercero_identificacion
            ,tercero_nombre
            ,id_canal
            ,canal_codigo_alterno
            ,fecha_minima_solicitada
            ,fecha_maxima_solicitada
            ,requiere_transporte
            ,id_ciudad
            ,direccion
            ,id_estado_distribucion
            ,fecha_creacion
            ,fecha_modificacion)
        SELECT
             a.id_solicitud
            ,a.numero_solicitud
            ,a.fecha_solicitud
            ,a.cambio_notificado
            ,a.eliminada
            ,a.numero_orden
            ,a.id_bodega
            ,a.id_cliente
            ,a.id_servicio
            ,a.tercero_identificacion
            ,a.tercero_nombre
            ,a.id_canal
            ,a.canal_codigo_alterno
            ,a.fecha_minima_solicitada
            ,a.fecha_maxima_solicitada
            ,a.requiere_transporte
            ,a.id_ciudad
            ,a.direccion
            ,a.id_estado_distribucion
            ,a.fecha_creacion
            ,a.fecha_modificacion
        FROM #solicitudes a
        LEFT OUTER JOIN tactic_stage.dbo.solicitudes b ON
            b.id_solicitud = a.id_solicitud
        WHERE
            b.id_solicitud IS NULL
        AND a.eliminada = 0

        INSERT INTO tactic_stage.dbo.solicitudes_lineas
            (id_solicitud
            ,numero_item
            ,cantidad
            ,id_producto
            ,id_unidad_medida
            ,valor_declarado_por_unidad)
        SELECT
             id_solicitud
            ,numero_item
            ,cantidad
            ,id_producto
            ,id_unidad_medida
            ,valor_declarado_por_unidad
        FROM #solicitudes_lineas

        UPDATE a
        SET  a.eliminada = 1
            ,a.cambio_notificado = 0
            ,a.fecha_modificacion = b.fecha_modificacion
        FROM tactic_stage.dbo.solicitudes a
        INNER JOIN #solicitudes b ON
            b.id_solicitud = a.id_solicitud
        WHERE 1 = 1
        AND a.eliminada = 0
        AND b.eliminada = 1

        COMMIT TRANSACTION
    END

    --ACTUALIZAR SOURCE
    BEGIN
        DECLARE @i INT = 100
        WHILE @i > 0 
        BEGIN
            IF OBJECT_ID('tempdb..#lote') IS NOT NULL BEGIN
                DROP TABLE #lote
            END

            SELECT DISTINCT
                id_solicitud
            INTO #lote
            FROM #solicitudes a
            WHERE 
                cambio_notificado = 0
            ORDER BY id_solicitud
            OFFSET 0 ROWS
            FETCH NEXT 1000 ROWS ONLY;
            
            IF @@ROWCOUNT = 0 BREAK

            BEGIN
                DECLARE cursor_solicitudes CURSOR LOCAL FOR  
                SELECT
                    a.id_solicitud
                FROM #lote a
                ORDER BY
                    a.id_solicitud
                DECLARE @id_solicitud BIGINT

                OPEN cursor_solicitudes
                FETCH NEXT FROM cursor_solicitudes INTO @id_solicitud

                WHILE @@FETCH_STATUS = 0  
                BEGIN
                    BEGIN TRY
                        EXEC [192.168.10.15].Satelite.dbo.MigrarSolicitudesMarcarNotificacion @id_solicitud
                    END TRY
                    BEGIN CATCH
                        NOOP:
                    END CATCH
            
                    FETCH NEXT FROM cursor_solicitudes INTO @id_solicitud
                END 

                CLOSE cursor_solicitudes  
                DEALLOCATE cursor_solicitudes
            END

            UPDATE a
            SET a.cambio_notificado = 1
            FROM tactic_stage.dbo.solicitudes a
            INNER JOIN #lote b ON
                b.id_solicitud = a.id_solicitud
            WHERE
                a.cambio_notificado = 0

            UPDATE a
            SET a.cambio_notificado = 1
            FROM #solicitudes a
            INNER JOIN #lote b ON
                b.id_solicitud = a.id_solicitud
            WHERE
                a.cambio_notificado = 0
                
            SET @i = @i - 1

            SELECT a.cambio_notificado,COUNT(1) FROM #solicitudes a GROUP BY a.cambio_notificado
            SELECT @i
        END
    END
END TRY
BEGIN CATCH
    SELECT ERROR_MESSAGE()
    IF @@TRANCOUNT > 0 BEGIN
	    ROLLBACK TRANSACTION
    END
    ;THROW;
END CATCH
