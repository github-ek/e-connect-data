CREATE PROCEDURE [dbo].[test] 
    @fecha DATE = NULL
AS
SET NOCOUNT ON;
BEGIN
    IF @fecha IS NULL BEGIN
        SET @fecha = CAST(GETDATE() AS DATE)
    END

    SELECT @fecha
END
