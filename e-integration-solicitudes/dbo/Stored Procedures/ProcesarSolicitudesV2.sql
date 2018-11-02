CREATE PROCEDURE [dbo].[ProcesarSolicitudesV2]
AS
BEGIN
    DECLARE @tipo_solicitud VARCHAR(50)
    DECLARE @integracion VARCHAR(50)
    DECLARE @correlacion VARCHAR(100)

    BEGIN
        DECLARE cursor_archivos CURSOR LOCAL FOR 
        WITH
        cte_00 AS
        (
            SELECT DISTINCT 'SALIDA' AS tipo_solicitud,a.integracion, a.correlacion FROM dbo.actualizaciones a WHERE a.estado_integracion = 'VALIDADO' AND a.integracion = 'SOLICITUDES_SALIDAS_GWS'
        )
        SELECT DISTINCT
            a.tipo_solicitud, a.integracion, a.correlacion 
        FROM cte_00 a
        ORDER BY a.tipo_solicitud, a.integracion, a.correlacion 
        
        OPEN cursor_archivos  
        FETCH NEXT FROM cursor_archivos INTO @tipo_solicitud, @integracion, @correlacion

        WHILE @@FETCH_STATUS = 0  
        BEGIN
            BEGIN TRY
                IF @tipo_solicitud = 'SALIDA' BEGIN
                    SELECT @tipo_solicitud, @integracion, @correlacion
                    EXEC dbo.[CrearSolicitudesDeSalidaV2] @integracion, @correlacion
                END
            END TRY
            BEGIN CATCH
                PRINT CONCAT('OCURRIO EL SIGUIENTE ERROR AL PROCESAR EL LOTE: tipo_solicitud=',@tipo_solicitud,', integracion=',@integracion,', correlacion=',@correlacion,':',ERROR_MESSAGE())
            END CATCH
            
            FETCH NEXT FROM cursor_archivos INTO @tipo_solicitud, @integracion, @correlacion
        END 

        CLOSE cursor_archivos  
        DEALLOCATE cursor_archivos
    END
END