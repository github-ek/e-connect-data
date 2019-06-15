CREATE TABLE [dbo].[lineas_negocio] (
    [id_linea_negocio]     BIGINT        IDENTITY (1, 1) NOT NULL,
    [id_unidad_negocio]    BIGINT        NOT NULL,
    [codigo]               VARCHAR (20)  NOT NULL,
    [nombre]               VARCHAR (100) NOT NULL,
    [descripcion]          VARCHAR (200) NOT NULL,
    [ordinal]              INT           NOT NULL,
    [activo]               BIT           NOT NULL,
    [version]              INT           NOT NULL,
    [usuario_creacion]     VARCHAR (50)  NOT NULL,
    [fecha_creacion]       DATETIME2 (0) NOT NULL,
    [usuario_modificacion] VARCHAR (50)  NOT NULL,
    [fecha_modificacion]   DATETIME2 (0) NOT NULL,
    CONSTRAINT [PK_lineas_negocio] PRIMARY KEY CLUSTERED ([id_linea_negocio] ASC),
    CONSTRAINT [FK_lineas_negocio_unidades_negocio] FOREIGN KEY ([id_unidad_negocio]) REFERENCES [dbo].[unidades_negocio] ([id_unidad_negocio]),
    CONSTRAINT [UK_lineas_negocio_01] UNIQUE NONCLUSTERED ([codigo] ASC),
    CONSTRAINT [UK_lineas_negocio_02] UNIQUE NONCLUSTERED ([nombre] ASC)
);

