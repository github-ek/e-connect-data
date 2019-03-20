

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE FUNCTION [dbo].[GetProductos]
(	
	@producto VARCHAR(50)
)
RETURNS TABLE 
AS
RETURN 
(
	SELECT 
	 	 a.producto_codigo
		,b.nombre
	FROM cortes_saldos_inventario_opl a
	INNER JOIN [$(eConnect)].dbo.productos b ON
		b.id_producto = a.id_producto
	WHERE 
		b.nombre = @producto
)