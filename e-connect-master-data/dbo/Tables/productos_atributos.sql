CREATE TABLE [dbo].[productos_atributos] (
    [id_producto]          BIGINT        NOT NULL,
    [id_bodega]            BIGINT        NOT NULL,
    [codigo]               VARCHAR (50)  NOT NULL,
    [valor]                VARCHAR (50)  NOT NULL,
    [version]              INT           NOT NULL,
    [usuario_creacion]     VARCHAR (50)  NOT NULL,
    [fecha_creacion]       DATETIME2 (0) NOT NULL,
    [usuario_modificacion] VARCHAR (50)  NOT NULL,
    [fecha_modificacion]   DATETIME2 (0) NOT NULL,
    CONSTRAINT [PK_productos_atributos] PRIMARY KEY CLUSTERED ([id_producto] ASC, [id_bodega] ASC, [codigo] ASC),
    CONSTRAINT [FK_productos_atributos_bodegas] FOREIGN KEY ([id_bodega]) REFERENCES [dbo].[bodegas] ([id_bodega]),
    CONSTRAINT [FK_productos_atributos_productos] FOREIGN KEY ([id_producto]) REFERENCES [dbo].[productos] ([id_producto])
);

