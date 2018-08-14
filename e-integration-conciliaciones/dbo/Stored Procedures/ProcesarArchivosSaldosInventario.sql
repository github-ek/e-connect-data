

CREATE PROCEDURE [dbo].[ProcesarArchivosSaldosInventario]
AS
BEGIN
    DECLARE @id_archivo BIGINT
    ---------------------------------------------------------------------------
    --
    ---------------------------------------------------------------------------
    BEGIN
        DECLARE cursor_archivos CURSOR LOCAL FOR  
		SELECT DISTINCT
			a.id_archivo
		FROM dbo.saldos_inventario a
		INNER JOIN [$(eIntegration)].dbo.archivos b ON
			b.id_archivo = a.id_archivo
		AND b.estado = 'VALIDADO'
		GROUP BY
			a.id_archivo,a.id_cliente,a.fecha
		HAVING
			COUNT(1) = SUM(CASE WHEN a.estado = 'VALIDADO' THEN 1 ELSE 0 END) 
		ORDER BY
			a.id_archivo

        OPEN cursor_archivos  
        FETCH NEXT FROM cursor_archivos INTO @id_archivo

        WHILE @@FETCH_STATUS = 0  
        BEGIN
            BEGIN TRY
                EXEC dbo.CrearCorteSaldosCliente @id_archivo
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
