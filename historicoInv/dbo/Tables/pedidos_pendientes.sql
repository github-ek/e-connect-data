CREATE TABLE [dbo].[pedidos_pendientes] (
    [fecha_add]      DATETIME        NULL,
    [cliente]        NVARCHAR (32)   NULL,
    [orden_tac]      NVARCHAR (35)   NULL,
    [orden_cli]      NVARCHAR (30)   NULL,
    [nro_lineas]     INT             NULL,
    [cnt_ordenada]   INT             NULL,
    [cnt_programada] INT             NULL,
    [cnt_stage]      INT             NULL,
    [cajas]          INT             NULL,
    [nro_ola]        NVARCHAR (32)   NULL,
    [trailer]        NVARCHAR (20)   NULL,
    [fecha_femi]     DATETIME        NULL,
    [tipo_orden]     NVARCHAR (2000) NULL,
    [destinatario]   NVARCHAR (20)   NULL,
    [almacen]        NVARCHAR (20)   NULL
);

