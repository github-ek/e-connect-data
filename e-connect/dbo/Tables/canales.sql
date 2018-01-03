CREATE TABLE [dbo].[canales] (
    [id_canal]             BIGINT        IDENTITY (1, 1) NOT NULL,
    [codigo]               VARCHAR (20)  NOT NULL,
    [nombre]               VARCHAR (100) NOT NULL,
    [descripcion]          VARCHAR (200) NOT NULL,
    [predeterminado]       BIT           NOT NULL,
    [ordinal]              INT           NOT NULL,
    [activo]               BIT           NOT NULL,
    [version]              INT           NOT NULL,
    [usuario_creacion]     VARCHAR (50)  NOT NULL,
    [fecha_creacion]       DATETIME2 (0) NOT NULL,
    [usuario_modificacion] VARCHAR (50)  NOT NULL,
    [fecha_modificacion]   DATETIME2 (0) NOT NULL,
    CONSTRAINT [PK_canales] PRIMARY KEY CLUSTERED ([id_canal] ASC),
    CONSTRAINT [UK_canales_01] UNIQUE NONCLUSTERED ([codigo] ASC),
    CONSTRAINT [UK_canales_02] UNIQUE NONCLUSTERED ([nombre] ASC)
);

