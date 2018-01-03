CREATE PROCEDURE Clean
AS 
BEGIN
DELETE FROM oms.destrucciones
DELETE FROM oms.manufacturas
DELETE FROM oms.recibos
DELETE FROM oms.salidas
DELETE FROM oms.traslados

DELETE FROM tms.base_liquidaciones
DELETE FROM tms.cumplidos_rutacontrol
DELETE FROM tms.moviles_rutacontrol
DELETE FROM tms.planillas
DELETE FROM tms.remesas_toursolver
DELETE FROM tms.remesas_manuales

DELETE FROM wms.saldos_inventario

DELETE FROM [$(eIntegration)].dbo.archivos_estados
DELETE FROM [$(eIntegration)].dbo.archivos_errores
DELETE FROM [$(eIntegration)].dbo.archivos
END