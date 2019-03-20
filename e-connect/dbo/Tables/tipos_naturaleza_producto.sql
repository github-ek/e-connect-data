CREATE TABLE [dbo].[tipos_naturaleza_producto] (
    [id_tipo_naturaleza_producto] BIGINT        NOT NULL,
    [codigo]                      VARCHAR (20)  NOT NULL,
    [nombre]                      VARCHAR (100) NOT NULL,
    [descripcion]                 VARCHAR (200) NOT NULL,
    [codigo_alterno_tms]          VARCHAR (50)  NOT NULL,
    [ordinal]                     INT           NOT NULL,
    [activo]                      BIT           NOT NULL,
    [version]                     INT           NOT NULL,
    [usuario_creacion]            VARCHAR (50)  NOT NULL,
    [fecha_creacion]              DATETIME2 (0) NOT NULL,
    [usuario_modificacion]        VARCHAR (50)  NOT NULL,
    [fecha_modificacion]          DATETIME2 (0) NOT NULL,
    CONSTRAINT [PK_tipos_naturaleza_producto] PRIMARY KEY CLUSTERED ([id_tipo_naturaleza_producto] ASC),
    CONSTRAINT [UK_tipos_naturaleza_producto_01] UNIQUE NONCLUSTERED ([codigo] ASC),
    CONSTRAINT [UK_tipos_naturaleza_producto_02] UNIQUE NONCLUSTERED ([nombre] ASC)
);

