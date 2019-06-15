CREATE TABLE [dbo].[estados_conciliacion] (
    [id_estado_conciliacion] BIGINT        IDENTITY (1, 1) NOT NULL,
    [codigo]                 VARCHAR (100) NOT NULL,
    [nombre]                 VARCHAR (100) NOT NULL,
    [descripcion]            VARCHAR (200) NOT NULL,
    [ordinal]                INT           NOT NULL,
    [activo]                 BIT           NOT NULL,
    [version]                INT           NOT NULL,
    [usuario_creacion]       VARCHAR (50)  NOT NULL,
    [fecha_creacion]         DATETIME2 (0) NOT NULL,
    [usuario_modificacion]   VARCHAR (50)  NOT NULL,
    [fecha_modificacion]     DATETIME2 (0) NOT NULL,
    CONSTRAINT [PK_estados_conciliacion] PRIMARY KEY CLUSTERED ([id_estado_conciliacion] ASC),
    CONSTRAINT [UK_estados_conciliacion_01] UNIQUE NONCLUSTERED ([codigo] ASC)
);

