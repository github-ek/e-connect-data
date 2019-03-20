CREATE TABLE [dbo].[clientes] (
    [id]                 BIGINT        IDENTITY (1, 1) NOT NULL,
    [operacion]          NVARCHAR (1)  NOT NULL,
    [cambio_notificado]  BIT           DEFAULT ((0)) NOT NULL,
    [fecha_creacion]     DATETIME      NOT NULL,
    [fecha_modificacion] DATETIME      NOT NULL,
    [client_id]          NVARCHAR (32) NOT NULL,
    [adrnam]             NVARCHAR (40) NOT NULL,
    [host_ext_id]        NVARCHAR (40) NOT NULL,
    [activo]             BIT           DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_clientes] PRIMARY KEY CLUSTERED ([id] ASC) WITH (FILLFACTOR = 80),
    CONSTRAINT [UK_clientes_01] UNIQUE NONCLUSTERED ([client_id] ASC) WITH (FILLFACTOR = 80)
);



