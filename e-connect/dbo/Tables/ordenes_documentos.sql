CREATE TABLE [dbo].[ordenes_documentos] (
    [id]                   BIGINT        IDENTITY (1, 1) NOT NULL,
    [id_orden]             BIGINT        NOT NULL,
    [id_tipo_documento]    VARCHAR (50)  NOT NULL,
    [numero_documento]     VARCHAR (20)  NOT NULL,
    [fecha_documento]      DATE          NOT NULL,
    [version]              INT           NOT NULL,
    [usuario_creacion]     VARCHAR (50)  NOT NULL,
    [fecha_creacion]       DATETIME2 (0) NOT NULL,
    [usuario_modificacion] VARCHAR (50)  NOT NULL,
    [fecha_modificacion]   DATETIME2 (0) NOT NULL,
    CONSTRAINT [PK_ordenes_documentos] PRIMARY KEY CLUSTERED ([id] ASC) WITH (FILLFACTOR = 80),
    CONSTRAINT [FK_ordenes_documentos_ordenes] FOREIGN KEY ([id_orden]) REFERENCES [dbo].[ordenes] ([id_orden])
);

