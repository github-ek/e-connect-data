CREATE TABLE [dbo].[tipos_flete] (
    [id_tipo_flete]        BIGINT        NOT NULL,
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
    CONSTRAINT [PK_tipos_flete] PRIMARY KEY CLUSTERED ([id_tipo_flete] ASC),
    CONSTRAINT [UK_tipos_flete_01] UNIQUE NONCLUSTERED ([codigo] ASC),
    CONSTRAINT [UK_tipos_flete_02] UNIQUE NONCLUSTERED ([nombre] ASC)
);

