CREATE PROCEDURE [dbo].[CrearSolicitudes]
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
            SELECT 'SALIDA' AS tipo_solicitud, a.integracion, a.correlacion, MIN(a.fecha_creacion) AS fecha_creacion
            FROM dbo.actualizaciones a 
            WHERE a.estado_integracion = 'VALIDADO'
            GROUP BY a.integracion, a.correlacion
        )
        SELECT
            a.tipo_solicitud, a.integracion, a.correlacion 
        FROM cte_00 a
        ORDER BY
            a.tipo_solicitud, a.fecha_creacion, a.integracion
        
        OPEN cursor_archivos  
        FETCH NEXT FROM cursor_archivos INTO @tipo_solicitud, @integracion, @correlacion

        WHILE @@FETCH_STATUS = 0  
        BEGIN
            BEGIN TRY
                IF @tipo_solicitud = 'SALIDA' BEGIN
                    SELECT @tipo_solicitud, @integracion, @correlacion
                    EXEC dbo.CrearSolicitudesDeDespacho @integracion, @correlacion
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