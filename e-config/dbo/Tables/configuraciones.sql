CREATE TABLE [dbo].[configuraciones] (
    [id_configuracion]       BIGINT         IDENTITY (1, 1) NOT NULL,
    [id_grupo_configuracion] BIGINT         NOT NULL,
    [codigo]                 VARCHAR (50)   NOT NULL,
    [valor]                  VARCHAR (1000) NOT NULL,
    [activo]                 BIT            NOT NULL,
    [version]                INT            NOT NULL,
    [usuario_creacion]       VARCHAR (50)   NOT NULL,
    [fecha_creacion]         DATETIME2 (0)  NOT NULL,
    [usuario_modificacion]   VARCHAR (50)   NOT NULL,
    [fecha_modificacion]     DATETIME2 (0)  NOT NULL,
    CONSTRAINT [PK_configuraciones] PRIMARY KEY CLUSTERED ([id_configuracion] ASC),
    CONSTRAINT [FK_configuraciones_grupos_configuracion] FOREIGN KEY ([id_grupo_configuracion]) REFERENCES [dbo].[grupos_configuracion] ([id_grupo_configuracion]),
    CONSTRAINT [UK_configuraciones_01] UNIQUE NONCLUSTERED ([codigo] ASC)
);

