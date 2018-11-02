CREATE TABLE [dbo].[unidades_medida] (
    [id_unidad_medida]     BIGINT        NOT NULL,
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
    CONSTRAINT [PK_unidades_medida] PRIMARY KEY CLUSTERED ([id_unidad_medida] ASC),
    CONSTRAINT [UK_unidades_medida_01] UNIQUE NONCLUSTERED ([codigo] ASC),
    CONSTRAINT [UK_unidades_medida_02] UNIQUE NONCLUSTERED ([nombre] ASC)
);

