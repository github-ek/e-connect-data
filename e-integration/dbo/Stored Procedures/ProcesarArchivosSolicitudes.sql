
CREATE PROCEDURE [dbo].[ProcesarArchivosSolicitudes]
AS
BEGIN
    DECLARE @id_archivo BIGINT
    ---------------------------------------------------------------------------
    --ABASTECIMIENTO
    ---------------------------------------------------------------------------
    BEGIN
        DECLARE cursor_archivos CURSOR LOCAL FOR  
        SELECT DISTINCT
            a.id_archivo
        FROM [$(eStage)].dbo.traslados a
        WHERE
            a.estado = 'VALIDADO'
        ORDER BY
            a.id_archivo

        OPEN cursor_archivos  
        FETCH NEXT FROM cursor_archivos INTO @id_archivo

        WHILE @@FETCH_STATUS = 0  
        BEGIN
            BEGIN TRY
                EXEC dbo.CrearSolicitudesDeTraslado @id_archivo
            END TRY
            BEGIN CATCH
                PRINT CONCAT('OCURRIO EL SIGUIENTE ERROR AL PROCESAR EL ARCHIVO ',@id_archivo,':',ERROR_MESSAGE())
            END CATCH
            
            FETCH NEXT FROM cursor_archivos INTO @id_archivo
        END 

        CLOSE cursor_archivos  
        DEALLOCATE cursor_archivos
    END

    ---------------------------------------------------------------------------
    --SALIDAS
    ---------------------------------------------------------------------------
    BEGIN
        DECLARE cursor_archivos CURSOR LOCAL FOR  
        SELECT DISTINCT
            a.id_archivo
        FROM [$(eStage)].dbo.salidas a
        WHERE
            a.estado = 'VALIDADO'
        ORDER BY
            a.id_archivo

        OPEN cursor_archivos  
        FETCH NEXT FROM cursor_archivos INTO @id_archivo

        WHILE @@FETCH_STATUS = 0  
        BEGIN
            BEGIN TRY
                EXEC dbo.CrearSolicitudesDeSalida @id_archivo
            END TRY
            BEGIN CATCH
                PRINT CONCAT('OCURRIO EL SIGUIENTE ERROR AL PROCESAR EL ARCHIVO ',@id_archivo,':',ERROR_MESSAGE())
            END CATCH
            
            FETCH NEXT FROM cursor_archivos INTO @id_archivo
        END 

        CLOSE cursor_archivos  
        DEALLOCATE cursor_archivos
    END
END