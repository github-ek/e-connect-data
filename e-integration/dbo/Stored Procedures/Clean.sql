CREATE PROCEDURE [dbo].[Clean]
AS 
BEGIN
DELETE FROM [$(eStage)].oms.destrucciones
DELETE FROM [$(eStage)].oms.manufacturas
DELETE FROM [$(eStage)].oms.recibos
DELETE FROM [$(eStage)].oms.salidas
DELETE FROM [$(eStage)].oms.traslados

DELETE FROM [$(eStage)].tms.base_liquidaciones
DELETE FROM [$(eStage)].tms.cumplidos_rutacontrol
DELETE FROM [$(eStage)].tms.moviles_rutacontrol
DELETE FROM [$(eStage)].tms.planillas_rutas
DELETE FROM [$(eStage)].tms.programaciones_toursolver
DELETE FROM [$(eStage)].tms.programaciones_manuales

DELETE FROM [$(eStage)].wms.saldos_inventario

DELETE FROM dbo.archivos_estados
DELETE FROM dbo.archivos_errores
DELETE FROM dbo.archivos
END