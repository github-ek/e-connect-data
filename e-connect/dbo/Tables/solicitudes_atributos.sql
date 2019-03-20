CREATE TABLE [dbo].[solicitudes_atributos] (
    [id]                         BIGINT        NOT NULL,
    [id_solicitud]               BIGINT        NOT NULL,
    [numero_linea]               INT           NULL,
    [id_tipo_atributo_solicitud] BIGINT        NOT NULL,
    [valor]                      VARCHAR (200) NOT NULL,
    [version]                    INT           CONSTRAINT [DF__tmp_ms_xx__versi__455F344D] DEFAULT ((0)) NOT NULL,
    [usuario_creacion]           VARCHAR (50)  NOT NULL,
    [fecha_creacion]             DATETIME2 (0) NOT NULL,
    [usuario_modificacion]       VARCHAR (50)  NOT NULL,
    [fecha_modificacion]         DATETIME2 (0) NOT NULL,
    CONSTRAINT [PK_solicitudes_atributos] PRIMARY KEY CLUSTERED ([id] ASC) WITH (FILLFACTOR = 80),
    CONSTRAINT [FK_solicitudes_atributos_solicitudes] FOREIGN KEY ([id_solicitud]) REFERENCES [dbo].[solicitudes] ([id_solicitud]) ON DELETE CASCADE,
    CONSTRAINT [FK_solicitudes_atributos_tipos_atributo_solicitud] FOREIGN KEY ([id_tipo_atributo_solicitud]) REFERENCES [dbo].[tipos_atributo_solicitud] ([id_tipo_atributo_solicitud])
);





