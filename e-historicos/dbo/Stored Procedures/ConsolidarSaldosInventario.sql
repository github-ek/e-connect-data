CREATE PROCEDURE [dbo].[ConsolidarSaldosInventario]
    @fecha_corte DATE = NULL
AS
BEGIN TRY
    SET NOCOUNT ON;
	DECLARE @client_id VARCHAR(32)

	DECLARE cursor_clientes CURSOR LOCAL FOR  
	SELECT
		client_id
	FROM dbo.clientes a
	ORDER BY
		a.client_id

	-------------------------------------------------------------------------------------------------------------------
    -- Inicializando valores por defecto
    -------------------------------------------------------------------------------------------------------------------
    IF @fecha_corte IS NULL BEGIN
        SET @fecha_corte = CAST(GETDATE() AS DATE)
    END

    OPEN cursor_clientes
    FETCH NEXT FROM cursor_clientes INTO @client_id

    WHILE @@FETCH_STATUS = 0  
    BEGIN
        BEGIN TRY
            EXEC dbo.ConsolidarSaldosInventarioPorCliente @fecha_corte, @client_id
        END TRY
        BEGIN CATCH
            PRINT CONCAT('OCURRIO EL SIGUIENTE ERROR AL CONSOLIDAR LOS SALDOS DEL CLIENTE ',@client_id,':',ERROR_MESSAGE())
        END CATCH
            
		FETCH NEXT FROM cursor_clientes INTO @client_id
    END 

    CLOSE cursor_clientes  
    DEALLOCATE cursor_clientes
END TRY
BEGIN CATCH
    SELECT ERROR_MESSAGE()
    ;THROW;
END CATCH
