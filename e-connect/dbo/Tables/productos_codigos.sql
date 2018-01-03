CREATE TABLE [dbo].[productos_codigos] (
    [id_producto]          BIGINT        NOT NULL,
    [codigo]               VARCHAR (50)  NOT NULL,
    [tipo_codigo]          VARCHAR (50)  NOT NULL,
    [activo]               BIT           NOT NULL,
    [version]              INT           NOT NULL,
    [usuario_creacion]     VARCHAR (50)  NOT NULL,
    [fecha_creacion]       DATETIME2 (0) NOT NULL,
    [usuario_modificacion] VARCHAR (50)  NOT NULL,
    [fecha_modificacion]   DATETIME2 (0) NOT NULL,
    CONSTRAINT [PK_productos_codigos] PRIMARY KEY CLUSTERED ([id_producto] ASC, [codigo] ASC),
    CONSTRAINT [FK_productos_codigos_productos] FOREIGN KEY ([id_producto]) REFERENCES [dbo].[productos] ([id_producto])
);

