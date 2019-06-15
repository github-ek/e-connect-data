CREATE TABLE [dbo].[tipos_atributo_solicitud] (
    [id_tipo_atributo_solicitud] BIGINT        IDENTITY (1, 1) NOT NULL,
    [tipo_solicitud]             VARCHAR (50)  NOT NULL,
    [codigo]                     VARCHAR (20)  NOT NULL,
    [nombre]                     VARCHAR (100) NOT NULL,
    [descripcion]                VARCHAR (200) NOT NULL,
    [ordinal]                    INT           NOT NULL,
    [activo]                     BIT           NOT NULL,
    [version]                    INT           NOT NULL,
    [usuario_creacion]           VARCHAR (50)  NOT NULL,
    [fecha_creacion]             DATETIME2 (0) NOT NULL,
    [usuario_modificacion]       VARCHAR (50)  NOT NULL,
    [fecha_modificacion]         DATETIME2 (0) NOT NULL,
    CONSTRAINT [PK_tipos_atributo_solicitud] PRIMARY KEY CLUSTERED ([id_tipo_atributo_solicitud] ASC),
    CONSTRAINT [UK_tipos_atributo_solicitud_01] UNIQUE NONCLUSTERED ([codigo] ASC),
    CONSTRAINT [UK_tipos_atributo_solicitud_02] UNIQUE NONCLUSTERED ([nombre] ASC)
);

