CREATE TABLE [dbo].[solicitudes_documentos] (
    [id]                   BIGINT        IDENTITY (1, 1) NOT NULL,
    [id_solicitud]         BIGINT        NOT NULL,
    [id_tipo_documento]     BIGINT NOT NULL,
    [numero_documento]     VARCHAR (20)  NOT NULL,
    [fecha_documento]      DATE          NULL,
    [version]              INT           NOT NULL DEFAULT 0,
    [usuario_creacion]     VARCHAR (50)  NOT NULL,
    [fecha_creacion]       DATETIME2 (0) NOT NULL,
    [usuario_modificacion] VARCHAR (50)  NOT NULL,
    [fecha_modificacion]   DATETIME2 (0) NOT NULL,
    CONSTRAINT [PK_solicitudes_documentos] PRIMARY KEY CLUSTERED ([id] ASC) WITH (FILLFACTOR = 80),
    CONSTRAINT [FK_solicitudes_documentos_solicitudes] FOREIGN KEY ([id_solicitud]) REFERENCES [dbo].[solicitudes] ([id_solicitud]),
    CONSTRAINT [FK_solicitudes_documentos_tipos_documento] FOREIGN KEY ([id_tipo_documento]) REFERENCES [dbo].[tipos_documento] ([id_tipo_documento])
);

