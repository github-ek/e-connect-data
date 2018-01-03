CREATE TABLE [dbo].[estados_inventario] (
    [id_estado_inventario] VARCHAR (4)   NOT NULL,
    [nombre]               VARCHAR (100) NOT NULL,
    [descripcion]          VARCHAR (200) NOT NULL,
    [ordinal]              INT           NOT NULL,
    [activo]               BIT           NOT NULL,
    [version]              INT           NOT NULL,
    [usuario_creacion]     VARCHAR (50)  NOT NULL,
    [fecha_creacion]       DATETIME2 (0) NOT NULL,
    [usuario_modificacion] VARCHAR (50)  NOT NULL,
    [fecha_modificacion]   DATETIME2 (0) NOT NULL,
    CONSTRAINT [PK_estados_inventario] PRIMARY KEY CLUSTERED ([id_estado_inventario] ASC),
    CONSTRAINT [UK_estados_inventario_01] UNIQUE NONCLUSTERED ([nombre] ASC)
);

