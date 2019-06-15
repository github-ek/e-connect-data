CREATE TABLE [dbo].[tipos_remesa] (
    [id_tipo_remesa]       BIGINT        IDENTITY (1, 1) NOT NULL,
    [id_unidad_negocio]    BIGINT        NOT NULL,
    [codigo]               VARCHAR (20)  NOT NULL,
    [nombre]               VARCHAR (100) NOT NULL,
    [descripcion]          VARCHAR (200) NOT NULL,
    [codigo_alterno_tms]   VARCHAR (50)  NULL,
    [ordinal]              INT           NOT NULL,
    [activo]               BIT           NOT NULL,
    [version]              INT           NOT NULL,
    [usuario_creacion]     VARCHAR (50)  NOT NULL,
    [fecha_creacion]       DATETIME2 (0) NOT NULL,
    [usuario_modificacion] VARCHAR (50)  NOT NULL,
    [fecha_modificacion]   DATETIME2 (0) NOT NULL,
    CONSTRAINT [PK_tipos_remesa] PRIMARY KEY CLUSTERED ([id_tipo_remesa] ASC),
    CONSTRAINT [FK_tipos_remesa_unidades_negocio] FOREIGN KEY ([id_unidad_negocio]) REFERENCES [dbo].[unidades_negocio] ([id_unidad_negocio]),
    CONSTRAINT [UK_tipos_remesa_01] UNIQUE NONCLUSTERED ([codigo] ASC),
    CONSTRAINT [UK_tipos_remesa_02] UNIQUE NONCLUSTERED ([nombre] ASC)
);

