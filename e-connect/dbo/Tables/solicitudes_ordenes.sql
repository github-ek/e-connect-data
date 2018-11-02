CREATE TABLE [dbo].[solicitudes_ordenes] (
    [id_solicitud_orden]   BIGINT        NOT NULL,
    [tipo_solicitud]       VARCHAR (50)  NOT NULL,
    [id_solicitud]         BIGINT        NOT NULL,
    [tipo_orden]           VARCHAR (50)  NOT NULL,
    [id_orden]             BIGINT        NULL,
    [numero_orden]         VARCHAR (50)  DEFAULT ('') NOT NULL,
    [estado]               VARCHAR (50)  DEFAULT ('') NOT NULL,
    [resultado]            VARCHAR (50)  DEFAULT ('NO_PROCESADA') NULL,
    [id_orden_origen]      BIGINT        NULL,
    [numero_orden_origen]  VARCHAR (50)  DEFAULT ('') NOT NULL,
    [version]              INT           DEFAULT ((0)) NOT NULL,
    [usuario_creacion]     VARCHAR (50)  NOT NULL,
    [fecha_creacion]       DATETIME2 (0) NOT NULL,
    [usuario_modificacion] VARCHAR (50)  NOT NULL,
    [fecha_modificacion]   DATETIME2 (0) NOT NULL,
    CONSTRAINT [PK_solicitudes_ordenes] PRIMARY KEY CLUSTERED ([id_solicitud_orden] ASC),
    CONSTRAINT [FK_solicitudes_ordenes_solicitudes] FOREIGN KEY ([id_solicitud]) REFERENCES [dbo].[solicitudes] ([id_solicitud]) ON DELETE CASCADE
);


