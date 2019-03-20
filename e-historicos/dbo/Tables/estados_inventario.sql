CREATE TABLE [dbo].[estados_inventario] (
    [id]                 BIGINT         IDENTITY (1, 1) NOT NULL,
    [operacion]          NVARCHAR (1)   NOT NULL,
    [cambio_notificado]  BIT            DEFAULT ((0)) NOT NULL,
    [fecha_creacion]     DATETIME       NOT NULL,
    [fecha_modificacion] DATETIME       NOT NULL,
    [invsts]             NVARCHAR (4)   NOT NULL,
    [lngdsc]             NVARCHAR (100) NOT NULL,
    CONSTRAINT [PK_estados_inventario] PRIMARY KEY CLUSTERED ([id] ASC) WITH (FILLFACTOR = 80),
    CONSTRAINT [UK_estados_inventario_01] UNIQUE NONCLUSTERED ([invsts] ASC) WITH (FILLFACTOR = 80)
);



