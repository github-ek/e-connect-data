CREATE TABLE [dbo].[centros_costo] (
    [id_centro_costo]      BIGINT        NOT NULL,
    [codigo]               VARCHAR (20)  NOT NULL,
    [nombre]               VARCHAR (100) NOT NULL,
    [descripcion]          VARCHAR (200) NOT NULL,
    [codigo_alterno_tms]   VARCHAR (50)  NOT NULL,
    [ordinal]              INT           NOT NULL,
    [activo]               BIT           NOT NULL,
    [version]              INT           NOT NULL,
    [usuario_creacion]     VARCHAR (50)  NOT NULL,
    [fecha_creacion]       DATETIME2 (0) NOT NULL,
    [usuario_modificacion] VARCHAR (50)  NOT NULL,
    [fecha_modificacion]   DATETIME2 (0) NOT NULL,
    CONSTRAINT [PK_centros_costo] PRIMARY KEY CLUSTERED ([id_centro_costo] ASC),
    CONSTRAINT [UK_centros_costo_01] UNIQUE NONCLUSTERED ([codigo] ASC),
    CONSTRAINT [UK_centros_costo_02] UNIQUE NONCLUSTERED ([nombre] ASC)
);

