--exec [dbo].[ProcesarArchivosSolicitudes]
CREATE PROCEDURE [dbo].[ProcesarArchivosSolicitudes]
AS
BEGIN
    DECLARE @tipo_solicitud VARCHAR(50)
    DECLARE @id_archivo BIGINT

    BEGIN
        DECLARE cursor_archivos CURSOR LOCAL FOR  
        SELECT 'TRASLADO' AS tipo_solicitud, a.id_archivo FROM dbo.traslados a WHERE a.estado = 'VALIDADO'
        UNION
        SELECT 'SALIDA' AS tipo_solicitud, a.id_archivo FROM dbo.salidas a WHERE a.estado = 'VALIDADO' AND numero_solicitud NOT LIKE 'TAP%'
        UNION
        SELECT 'RECIBO' AS tipo_solicitud, a.id_archivo FROM dbo.recibos a WHERE a.estado = 'VALIDADO'
        UNION
        SELECT 'MANUFACTURA' AS tipo_solicitud, a.id_archivo FROM dbo.manufacturas a WHERE a.estado = 'VALIDADO'
        UNION
        SELECT 'MANUFACTURA_BOM' AS tipo_solicitud, a.id_archivo FROM dbo.manufacturas_bom a WHERE a.estado = 'VALIDADO'
        ORDER BY tipo_solicitud, a.id_archivo
        
        OPEN cursor_archivos  
        FETCH NEXT FROM cursor_archivos INTO @tipo_solicitud, @id_archivo

        WHILE @@FETCH_STATUS = 0  
        BEGIN
            BEGIN TRY
                IF @tipo_solicitud = 'TRASLADO' BEGIN
                    SELECT @tipo_solicitud, @id_archivo
                    EXEC dbo.CrearSolicitudesDeTraslado @id_archivo
                END ELSE IF @tipo_solicitud = 'SALIDA' BEGIN
                    SELECT @tipo_solicitud, @id_archivo
                    EXEC dbo.CrearSolicitudesDeSalida @id_archivo
                END ELSE IF @tipo_solicitud = 'RECIBO' BEGIN
                    SELECT @tipo_solicitud, @id_archivo
                    UPDATE a SET estado = 'PROCESADO' FROM dbo.recibos a WHERE a.estado = 'VALIDADO' AND a.id_archivo = @id_archivo
                    UPDATE a SET estado = 'PROCESADO' FROM [eIntegration].dbo.archivos a WHERE a.id_archivo = @id_archivo
                END ELSE IF @tipo_solicitud = 'MANUFACTURA' BEGIN
                    SELECT @tipo_solicitud, @id_archivo
					EXEC dbo.CrearSolicitudesDeManufactura @id_archivo
                END ELSE IF @tipo_solicitud = 'MANUFACTURA_BOM' BEGIN
                    SELECT @tipo_solicitud, @id_archivo
					EXEC dbo.CrearSolicitudesDeManufacturaBom @id_archivo
                END
            END TRY
            BEGIN CATCH
                PRINT CONCAT('OCURRIO EL SIGUIENTE ERROR AL PROCESAR EL ARCHIVO ',@id_archivo,':',ERROR_MESSAGE())
            END CATCH
            
            FETCH NEXT FROM cursor_archivos INTO @tipo_solicitud, @id_archivo
        END 

        CLOSE cursor_archivos  
        DEALLOCATE cursor_archivos
    END
END
