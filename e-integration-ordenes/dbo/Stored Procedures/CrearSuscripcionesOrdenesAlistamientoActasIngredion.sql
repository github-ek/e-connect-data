
CREATE PROCEDURE [dbo].[CrearSuscripcionesOrdenesAlistamientoActasIngredion]
(
	@suscripcion varchar(50),
	@id_externo varchar(100),
	@estado_suscripcion varchar(50),
	@arg0 varchar(100),
	@arg1 varchar(100),
	@arg2 varchar(100),
	@arg3 varchar(100)
)
AS
BEGIN
    INSERT INTO dbo.suscripciones
        (id
		,suscripcion
        ,id_externo
        ,estado_suscripcion
        ,arg0
        ,arg1
        ,arg2
        ,arg3)
    SELECT
		 NEXT VALUE FOR dbo.hibernate_sequence 
        ,@suscripcion
        ,@id_externo
        ,@estado_suscripcion
        ,@arg0
        ,@arg1
        ,@arg2
        ,@arg3
END