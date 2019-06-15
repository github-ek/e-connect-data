CREATE TABLE [dbo].[tipos_identificacion] (
    [id_tipo_identificacion] VARCHAR (20)  NOT NULL,
    [nombre]                 VARCHAR (100) NOT NULL,
    [descripcion]            VARCHAR (200) NOT NULL,
    [codigo_alterno_tms]     VARCHAR (50)  NULL,
    [ordinal]                INT           NOT NULL,
    [activo]                 BIT           NOT NULL,
    [version]                INT           NOT NULL,
    [usuario_creacion]       VARCHAR (50)  NOT NULL,
    [fecha_creacion]         DATETIME2 (0) NOT NULL,
    [usuario_modificacion]   VARCHAR (50)  NOT NULL,
    [fecha_modificacion]     DATETIME2 (0) NOT NULL,
    CONSTRAINT [PK_tipos_identificacion] PRIMARY KEY CLUSTERED ([id_tipo_identificacion] ASC),
    CONSTRAINT [UK_tipos_identificacion_02] UNIQUE NONCLUSTERED ([nombre] ASC)
);

