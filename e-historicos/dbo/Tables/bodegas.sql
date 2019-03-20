CREATE TABLE [dbo].[bodegas] (
    [id]                 BIGINT        IDENTITY (1, 1) NOT NULL,
    [operacion]          NVARCHAR (1)  NOT NULL,
    [cambio_notificado]  BIT           DEFAULT ((0)) NOT NULL,
    [fecha_creacion]     DATETIME      NOT NULL,
    [fecha_modificacion] DATETIME      NOT NULL,
    [wh_id]              NVARCHAR (32) NOT NULL,
    [adrnam]             NVARCHAR (40) NOT NULL,
    [adrln1]             NVARCHAR (40) NULL,
    [adrcty]             NVARCHAR (70) NULL,
    [moddte]             DATETIME      NULL,
    [mod_usr_id]         NVARCHAR (40) NULL,
    CONSTRAINT [PK_bodegas] PRIMARY KEY CLUSTERED ([id] ASC) WITH (FILLFACTOR = 80),
    CONSTRAINT [UK_bodegas_01] UNIQUE NONCLUSTERED ([wh_id] ASC) WITH (FILLFACTOR = 80)
);



