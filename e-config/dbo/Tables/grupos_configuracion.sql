CREATE TABLE [dbo].[grupos_configuracion] (
    [id_grupo_configuracion] BIGINT        IDENTITY (1, 1) NOT NULL,
    [codigo]                 VARCHAR (50)  NOT NULL,
    [nombre]                 VARCHAR (100) NOT NULL,
    [descripcion]            VARCHAR (200) NOT NULL,
    [ordinal]                INT           NOT NULL,
    [activo]                 BIT           NOT NULL,
    [version]                INT           NOT NULL,
    [usuario_creacion]       VARCHAR (50)  NOT NULL,
    [fecha_creacion]         DATETIME2 (0) NOT NULL,
    [usuario_modificacion]   VARCHAR (50)  NOT NULL,
    [fecha_modificacion]     DATETIME2 (0) NOT NULL,
    CONSTRAINT [PK_grupos_configuracion] PRIMARY KEY CLUSTERED ([id_grupo_configuracion] ASC),
    CONSTRAINT [UK_grupos_configuracion_01] UNIQUE NONCLUSTERED ([codigo] ASC),
    CONSTRAINT [UK_grupos_configuracion_02] UNIQUE NONCLUSTERED ([nombre] ASC)
);

