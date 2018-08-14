CREATE PROCEDURE dbo.CleanArchivos
AS
BEGIN
	SET NOCOUNT ON;
    DELETE a FROM tactic_integrador.tms.cumplidos_digitales a
    DELETE a FROM tactic_integrador.tms.rutas_manuales a
    DELETE a FROM tactic_integrador.tms.rutas_toursolver a
    DELETE a FROM tactic_integrador.tms.visitas_rutacontrol a
    
    DELETE a FROM tactic_integrador.wms.saldos_cliente a
    DELETE a FROM tactic_integrador.wms.wms_unidades a
    DELETE a FROM tactic_integrador.wms.wms_bodegas a
    DELETE a FROM tactic_integrador.wms.wms_productos a
    DELETE a FROM tactic_integrador.wms.wms_productos_atributos a
    DELETE a FROM tactic_integrador.wms.wms_productos_codigos a
    DELETE a FROM tactic_integrador.wms.wms_productos_medidas a
    DELETE a FROM tactic_integrador.wms.pf_productos_medidas a

    DELETE a FROM tactic_integrador.oms.manufacturas a
    DELETE a FROM tactic_integrador.oms.vehiculos a
    DELETE a FROM tactic_integrador.oms.recibos a
    DELETE a FROM tactic_integrador.oms.salidas a
    
    DELETE a FROM tactic_integrador.etl.archivos_errores a
    DELETE a FROM tactic_integrador.etl.archivos a
END
