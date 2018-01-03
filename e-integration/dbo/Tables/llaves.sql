CREATE TABLE [dbo].[llaves] (
    [id_llave]             BIGINT        IDENTITY (1, 1) NOT NULL,
    [id_tipo_archivo]      BIGINT        NOT NULL,
    [codigo]               VARCHAR (50)  NOT NULL,
    [ordinal]              INT           NOT NULL,
    [activo]               BIT           NOT NULL,
    [version]              INT           NULL,
    [usuario_creacion]     VARCHAR (50)  NULL,
    [fecha_creacion]       DATETIME2 (0) NULL,
    [usuario_modificacion] VARCHAR (50)  NULL,
    [fecha_modificacion]   DATETIME2 (0) NULL,
    CONSTRAINT [PK_llaves] PRIMARY KEY CLUSTERED ([id_llave] ASC) WITH (FILLFACTOR = 80),
    CONSTRAINT [FK_llaves_tipos_archivo] FOREIGN KEY ([id_tipo_archivo]) REFERENCES [dbo].[tipos_archivo] ([id_tipo_archivo]),
    CONSTRAINT [UK_llaves_01] UNIQUE NONCLUSTERED ([id_tipo_archivo] ASC, [codigo] ASC) WITH (FILLFACTOR = 80)
);

