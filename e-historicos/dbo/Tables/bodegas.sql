CREATE TABLE [dbo].[bodegas] (
    [id]                 BIGINT  NOT NULL,
    [operacion]          NVARCHAR (1) NOT NULL,
    [cambio_notificado]  BIT NOT NULL DEFAULT 0,
    [fecha_creacion]     DATETIME       NOT NULL,
    [fecha_modificacion] DATETIME       NOT NULL,

    [wh_id]               NVARCHAR (32)   NOT NULL,
    [adrnam]              NVARCHAR (40)  NOT NULL,
    [adrln1]              NVARCHAR (40)  NULL,
    [adrcty]              NVARCHAR (70)  NULL,
    [moddte]              DATETIME        NULL,
    [mod_usr_id]          NVARCHAR (40)   NULL,

    CONSTRAINT [PK_bodegas] PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [UK_bodegas_01] UNIQUE NONCLUSTERED ([wh_id])
);

