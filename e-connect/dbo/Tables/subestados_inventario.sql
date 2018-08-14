CREATE TABLE [dbo].[subestados_inventario] (
    [id_subestado_inventario] VARCHAR (25)  NOT NULL,
    [nombre]                  VARCHAR (100) NOT NULL,
    [descripcion]             VARCHAR (200) NOT NULL,
    [ordinal]                 INT           NOT NULL,
    [activo]                  BIT           NOT NULL,
    [version]                 INT           CONSTRAINT [DF_subestados_inventario_version] DEFAULT ((0)) NOT NULL,
    [usuario_creacion]        VARCHAR (50)  NOT NULL,
    [fecha_creacion]          DATETIME2 (0) NOT NULL,
    [usuario_modificacion]    VARCHAR (50)  NOT NULL,
    [fecha_modificacion]      DATETIME2 (0) NOT NULL,
    CONSTRAINT [PK_subestados_inventario] PRIMARY KEY CLUSTERED ([id_subestado_inventario] ASC),
    CONSTRAINT [UK_subestados_inventario_01] UNIQUE NONCLUSTERED ([nombre] ASC)
);

