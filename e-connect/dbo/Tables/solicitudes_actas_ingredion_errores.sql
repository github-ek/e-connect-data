CREATE TABLE [dbo].[solicitudes_actas_ingredion_errores] (
    [id]                  BIGINT        IDENTITY (1, 1) NOT NULL,
    [id_solicitud_acta]   BIGINT        NOT NULL,
    [codigo]              VARCHAR (100) NOT NULL,
    [mensaje]             VARCHAR (MAX) NOT NULL,
    [estado_notificacion] VARCHAR (50)  NOT NULL,
    [fecha_notificacion]  DATETIME2 (0) NULL,
    [version]             INT           CONSTRAINT [DF_solicitudes_actas_ingredion_errores_version] DEFAULT ((0)) NOT NULL,
    [fecha_creacion]      DATETIME2 (0) CONSTRAINT [DF_solicitudes_actas_ingredion_errores_fecha_creacion] DEFAULT (sysdatetime()) NOT NULL,
    [fecha_modificacion]  DATETIME2 (0) CONSTRAINT [DF_solicitudes_actas_ingredion_errores_fecha_modificacion] DEFAULT (sysdatetime()) NOT NULL,
    CONSTRAINT [PK_solicitudes_actas_ingredion_errores] PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [FK_solicitudes_actas_ingredion_errores_solicitudes_actas_ingredion] FOREIGN KEY ([id_solicitud_acta]) REFERENCES [dbo].[solicitudes_actas_ingredion] ([id_solicitud_acta])
);

