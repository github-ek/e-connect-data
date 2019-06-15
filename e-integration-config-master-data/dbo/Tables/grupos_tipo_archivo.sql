CREATE TABLE [dbo].[grupos_tipo_archivo] (
    [id_grupo_tipo_archivo] BIGINT        IDENTITY (1, 1) NOT NULL,
    [codigo]                VARCHAR (50)  NOT NULL,
    [nombre]                VARCHAR (100) NOT NULL,
    [descripcion]           VARCHAR (200) NOT NULL,
    [ordinal]               INT           NOT NULL,
    [activo]                BIT           DEFAULT ((1)) NOT NULL,
    [version]               INT           DEFAULT ((0)) NOT NULL,
    [usuario_creacion]      VARCHAR (50)  DEFAULT ('') NOT NULL,
    [fecha_creacion]        DATETIME2 (0) DEFAULT (sysdatetime()) NOT NULL,
    [usuario_modificacion]  VARCHAR (50)  DEFAULT ('') NOT NULL,
    [fecha_modificacion]    DATETIME2 (0) DEFAULT (sysdatetime()) NOT NULL,
    CONSTRAINT [PK_grupos_tipo_archivo] PRIMARY KEY CLUSTERED ([id_grupo_tipo_archivo] ASC),
    CONSTRAINT [UK_grupos_tipo_archivo_01] UNIQUE NONCLUSTERED ([codigo] ASC)
);

