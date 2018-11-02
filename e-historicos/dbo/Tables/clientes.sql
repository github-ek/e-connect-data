CREATE TABLE [dbo].[clientes] (
    [id]                 BIGINT  NOT NULL,
    [operacion]          NVARCHAR (1) NOT NULL,
    [cambio_notificado]  BIT NOT NULL DEFAULT 0,
    [fecha_creacion]     DATETIME       NOT NULL,
    [fecha_modificacion] DATETIME       NOT NULL,

    [client_id]     NVARCHAR (32) NOT NULL,
    [adrnam]        NVARCHAR (40) NOT NULL,
    [host_ext_id]   NVARCHAR (40) NOT NULL,
    [activo] BIT NOT NULL DEFAULT 0, 
    CONSTRAINT [PK_clientes] PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [UK_clientes_01] UNIQUE NONCLUSTERED ([client_id])
);

