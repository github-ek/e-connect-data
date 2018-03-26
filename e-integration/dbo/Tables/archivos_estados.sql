CREATE TABLE [dbo].[archivos_estados] (
    [id]                   BIGINT        IDENTITY (1, 1) NOT NULL,
    [id_archivo]           BIGINT        NOT NULL,
    [estado]               VARCHAR (50)  NOT NULL,
    [numero_errores]       INT           NOT NULL,
    [version]              INT           NOT NULL DEFAULT 0,
    [usuario_creacion]     VARCHAR (50)  NOT NULL DEFAULT '',
    [fecha_creacion]       DATETIME2 (0) NOT NULL DEFAULT SYSDATETIME(),
    [usuario_modificacion] VARCHAR (50)  NOT NULL DEFAULT '',
    [fecha_modificacion]   DATETIME2 (0) NOT NULL DEFAULT SYSDATETIME(),
    CONSTRAINT [PK_archivos_estados] PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [FK_archivos_estados_archivos] FOREIGN KEY ([id_archivo]) REFERENCES [dbo].[archivos] ([id_archivo])
);

