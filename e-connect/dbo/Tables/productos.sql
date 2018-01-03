CREATE TABLE [dbo].[productos] (
    [id_producto]          BIGINT        IDENTITY (1, 1) NOT NULL,
    [id_cliente]           BIGINT        NOT NULL,
    [codigo]               VARCHAR (50)  NOT NULL,
    [nombre]               VARCHAR (250) NOT NULL,
    [activo]               BIT           NOT NULL,
    [version]              INT           NOT NULL,
    [usuario_creacion]     VARCHAR (50)  NOT NULL,
    [fecha_creacion]       DATETIME2 (0) NOT NULL,
    [usuario_modificacion] VARCHAR (50)  NOT NULL,
    [fecha_modificacion]   DATETIME2 (0) NOT NULL,
    CONSTRAINT [PK_productos] PRIMARY KEY CLUSTERED ([id_producto] ASC),
    CONSTRAINT [FK_productos_clientes] FOREIGN KEY ([id_cliente]) REFERENCES [dbo].[clientes] ([id_cliente]),
    CONSTRAINT [UK_productos_01] UNIQUE NONCLUSTERED ([id_cliente] ASC, [codigo] ASC)
);

