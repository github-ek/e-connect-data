
CREATE PROCEDURE [dbo].[CerrarOrdenes]
AS
BEGIN
    EXEC dbo.CerrarOrdenesDeAlistamiento
    --EXEC dbo._CrearOrdenesRecibo
    --EXEC dbo._CrearOrdenesReciboDeTraslados
    --EXEC dbo._CrearOrdenesManufactura
    SELECT 'TODO'
END