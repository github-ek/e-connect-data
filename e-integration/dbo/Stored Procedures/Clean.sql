CREATE PROCEDURE [dbo].[Clean]
AS 
BEGIN
TRUNCATE TABLE [$(eStage)].oms.destrucciones
TRUNCATE TABLE [$(eStage)].oms.manufacturas
TRUNCATE TABLE [$(eStage)].oms.recibos
TRUNCATE TABLE [$(eStage)].oms.salidas
TRUNCATE TABLE [$(eStage)].oms.traslados

TRUNCATE TABLE [$(eStage)].tms.base_liquidaciones
TRUNCATE TABLE [$(eStage)].tms.cumplidos_rutacontrol
TRUNCATE TABLE [$(eStage)].tms.moviles_rutacontrol
TRUNCATE TABLE [$(eStage)].tms.planillas_rutacontrol
TRUNCATE TABLE [$(eStage)].tms.planillas_rutas
TRUNCATE TABLE [$(eStage)].tms.programaciones_toursolver
TRUNCATE TABLE [$(eStage)].tms.programaciones_manuales

TRUNCATE TABLE [$(eStage)].wms.saldos_inventario

DELETE FROM dbo.archivos_estados
DELETE FROM dbo.archivos_errores
DELETE FROM dbo.archivos
END