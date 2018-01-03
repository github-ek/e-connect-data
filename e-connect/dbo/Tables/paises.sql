CREATE TABLE [dbo].[paises] (
    [id_pais]              BIGINT           IDENTITY (1, 1) NOT NULL,
    [codigo]               VARCHAR (20)     NOT NULL,
    [nombre]               VARCHAR (100)    NOT NULL,
    [cx]                   DECIMAL (18, 15) NULL,
    [cy]                   DECIMAL (18, 15) NULL,
    [ordinal]              INT              NOT NULL,
    [activo]               BIT              NOT NULL,
    [version]              INT              NOT NULL,
    [usuario_creacion]     VARCHAR (50)     NOT NULL,
    [fecha_creacion]       DATETIME2 (0)    NOT NULL,
    [usuario_modificacion] VARCHAR (50)     NOT NULL,
    [fecha_modificacion]   DATETIME2 (0)    NOT NULL,
    CONSTRAINT [PK_paises] PRIMARY KEY CLUSTERED ([id_pais] ASC),
    CONSTRAINT [UK_paises_01] UNIQUE NONCLUSTERED ([codigo] ASC),
    CONSTRAINT [UK_paises_02] UNIQUE NONCLUSTERED ([nombre] ASC)
);

