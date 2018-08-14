CREATE TABLE [dbo].[saldos_inventario_proyectados] (
    [id]                           BIGINT         IDENTITY (1, 1) NOT NULL,
    [fecha_creacion]               DATETIME2 (7)  NOT NULL,
    [fecha_corte]                  DATE           NULL,
    [prt_client_id]                NVARCHAR (32)  NULL,
    [wh_id]                        NVARCHAR (32)  NULL,
    [prtnum]                       NVARCHAR (50)  NULL,
    [prtdsc]                       NVARCHAR (200) NULL,
    [invsts]                       NVARCHAR (4)   NULL,
    [invdsc]                       NVARCHAR (100) NULL,
    [prtstyle]                     NVARCHAR (30)  NULL,
    [unidades_wms]                 INT            NULL,
    [unidades_en_proceso_despacho] INT            NULL,
    [unidades_en_proceso_recibo]   INT            NOT NULL,
    [unidades_opl]                 INT            NULL
);

