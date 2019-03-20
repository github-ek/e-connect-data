CREATE TABLE [dbo].[ciudades] (
    [id_ciudad]             BIGINT           NOT NULL,
    [id_departamento]       BIGINT           NOT NULL,
    [codigo]                VARCHAR (20)     NOT NULL,
    [codigo_centro_poblado] VARCHAR (20)     NOT NULL,
    [nombre]                VARCHAR (100)    NOT NULL,
    [nombre_alterno]        VARCHAR (100)    NOT NULL,
    [codigo_alterno_tms]    VARCHAR (50)     NULL,
    [cx]                    DECIMAL (18, 15) NULL,
    [cy]                    DECIMAL (18, 15) NULL,
    [ordinal]               INT              NOT NULL,
    [activo]                BIT              NOT NULL,
    [version]               INT              NOT NULL,
    [usuario_creacion]      VARCHAR (50)     NOT NULL,
    [fecha_creacion]        DATETIME2 (0)    NOT NULL,
    [usuario_modificacion]  VARCHAR (50)     NOT NULL,
    [fecha_modificacion]    DATETIME2 (0)    NOT NULL,
    CONSTRAINT [PK_ciudades] PRIMARY KEY CLUSTERED ([id_ciudad] ASC),
    CONSTRAINT [FK_ciudades_departamentos] FOREIGN KEY ([id_departamento]) REFERENCES [dbo].[departamentos] ([id_departamento]),
    CONSTRAINT [UK_ciudades_01] UNIQUE NONCLUSTERED ([codigo] ASC),
    CONSTRAINT [UK_ciudades_02] UNIQUE NONCLUSTERED ([nombre_alterno] ASC)
);



