
CREATE PROCEDURE [dbo].[ProcesarArchivosRemesasProgramadas]
AS
BEGIN
    DECLARE @id_archivo BIGINT
            
    DECLARE cursor_archivos CURSOR LOCAL FOR  
    SELECT DISTINCT
        a.id_archivo
    FROM [eStage].tms.remesas_programadas a
    WHERE
        a.estado = 'VALIDADO'
    ORDER BY
        a.id_archivo

    OPEN cursor_archivos  
    FETCH NEXT FROM cursor_archivos INTO @id_archivo

    WHILE @@FETCH_STATUS = 0  
    BEGIN
        BEGIN TRY
            PRINT @id_archivo
            --EXECUTE dbo.
            
            --dbo.CrearRemesasProgramadas @id_archivo
        END TRY
        BEGIN CATCH
            PRINT CONCAT('OCURRIO EL SIGUIENTE ERROR AL PROCESAR EL ARCHIVO ',@id_archivo,':',ERROR_MESSAGE())
        END CATCH
            
        FETCH NEXT FROM cursor_archivos INTO @id_archivo
    END 

    CLOSE cursor_archivos  
    DEALLOCATE cursor_archivos
END
