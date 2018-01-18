CREATE TABLE [dbo].[___ordenes_notas] (
    [id]                   BIGINT        IDENTITY (1, 1) NOT NULL,
    [id_orden]             BIGINT        NOT NULL,
    [id_tipo_nota]         VARCHAR (50)  NOT NULL,
    [nota]                 VARCHAR (200) NOT NULL,
    [version]              INT           NOT NULL,
    [usuario_creacion]     VARCHAR (50)  NOT NULL,
    [fecha_creacion]       DATETIME2 (0) NOT NULL,
    [usuario_modificacion] VARCHAR (50)  NOT NULL,
    [fecha_modificacion]   DATETIME2 (0) NOT NULL,
    CONSTRAINT [PK_ordenes_notas] PRIMARY KEY CLUSTERED ([id_orden] ASC) WITH (FILLFACTOR = 80),
    CONSTRAINT [FK_ordenes_notas_ordenes] FOREIGN KEY ([id_orden]) REFERENCES [dbo].[solicitudes] ([id_solicitud])
);

