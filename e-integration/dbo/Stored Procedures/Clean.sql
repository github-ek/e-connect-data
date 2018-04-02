CREATE PROCEDURE [dbo].[Clean]
AS 
BEGIN
TRUNCATE TABLE [$(eStage)].dbo.destrucciones
TRUNCATE TABLE [$(eStage)].dbo.manufacturas
TRUNCATE TABLE [$(eStage)].dbo.recibos
TRUNCATE TABLE [$(eStage)].dbo.salidas
TRUNCATE TABLE [$(eStage)].dbo.traslados

TRUNCATE TABLE [$(eStage)].tms.base_liquidaciones
TRUNCATE TABLE [$(eStage)].tms.cumplidos_rutacontrol
TRUNCATE TABLE [$(eStage)].tms.moviles_rutacontrol
TRUNCATE TABLE [$(eStage)].tms.planillas_rutacontrol
TRUNCATE TABLE [$(eStage)].tms.planillas_rutas
TRUNCATE TABLE [$(eStage)].tms.programaciones_toursolver
TRUNCATE TABLE [$(eStage)].tms.programaciones_manuales

TRUNCATE TABLE [$(eStage)].dbo.saldos_inventario

DELETE FROM dbo.archivos_estados
DELETE FROM dbo.archivos_errores
DELETE FROM dbo.archivos
SELECT 1
END