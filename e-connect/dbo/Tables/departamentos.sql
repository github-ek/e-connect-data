CREATE TABLE [dbo].[departamentos] (
    [id_departamento]      BIGINT           IDENTITY (1, 1) NOT NULL,
    [id_pais]              BIGINT           NOT NULL,
    [codigo]               VARCHAR (20)     NOT NULL,
    [nombre]               VARCHAR (100)    NOT NULL,
    [nombre_alterno]       VARCHAR (100)    NOT NULL,
    [cx]                   DECIMAL (18, 15) NULL,
    [cy]                   DECIMAL (18, 15) NULL,
    [ordinal]              INT              NOT NULL,
    [activo]               BIT              NOT NULL,
    [version]              INT              NOT NULL,
    [usuario_creacion]     VARCHAR (50)     NOT NULL,
    [fecha_creacion]       DATETIME2 (0)    NOT NULL,
    [usuario_modificacion] VARCHAR (50)     NOT NULL,
    [fecha_modificacion]   DATETIME2 (0)    NOT NULL,
    CONSTRAINT [PK_departamentos] PRIMARY KEY CLUSTERED ([id_departamento] ASC),
    CONSTRAINT [FK_departamentos_paises] FOREIGN KEY ([id_pais]) REFERENCES [dbo].[paises] ([id_pais]),
    CONSTRAINT [UK_departamentos_01] UNIQUE NONCLUSTERED ([codigo] ASC),
    CONSTRAINT [UK_departamentos_02] UNIQUE NONCLUSTERED ([nombre] ASC)
);

