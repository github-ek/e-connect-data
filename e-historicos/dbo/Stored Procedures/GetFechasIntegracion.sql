CREATE PROCEDURE [dbo].[GetFechasIntegracion]
	@codigo VARCHAR(50),
	@fecha_desde DATETIME OUTPUT,
	@fecha_hasta DATETIME OUTPUT
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @t AS TABLE(fecha_desde DATETIME)

	SET @fecha_hasta = GETDATE()

	UPDATE a
	SET a.fecha_ultimo_pull = @fecha_hasta
	OUTPUT deleted.fecha_ultimo_pull
	INTO @t(fecha_desde)
	FROM dbo.integraciones a
	WHERE
		a.codigo = @codigo

	DECLARE @hora_desde INT

	SELECT
		 @fecha_desde = a.fecha_desde
		,@hora_desde = DATEPART(HOUR,a.fecha_desde)
	FROM @t a

	SET @fecha_desde = DATEADD(HOUR,@hora_desde - 1,DATEADD(DD, 0, DATEDIFF(DD, 0, @fecha_desde)))
END
