﻿CREATE TABLE [dbo].[solicitudes_transporte] (
    [id_solicitud_transporte]            BIGINT        NOT NULL,
    [id_solicitud]                       BIGINT        NOT NULL,
    [id_ciudad_remitente]                BIGINT        NOT NULL,
    [ciudad_remitente_codigo_alterno]    VARCHAR (50)  NOT NULL,
    [direccion_remitente]                VARCHAR (150) NOT NULL,
    [punto_remitente_codigo_alterno]     VARCHAR (50)  NOT NULL,
    [punto_remitente_nombre]             VARCHAR (100) NOT NULL,
    [requiere_cita_remitente]            BIT           NOT NULL,
    [fecha_cita_remitente]               DATE          NULL,
    [hora_cita_minima_remitente]         TIME (0)      NULL,
    [hora_cita_maxima_remitente]         TIME (0)      NULL,
    [id_ciudad_destinatario]             BIGINT        NOT NULL,
    [ciudad_destinatario_codigo_alterno] VARCHAR (50)  NOT NULL,
    [direccion_destinatario]             VARCHAR (150) NOT NULL,
    [punto_destinatario_codigo_alterno]  VARCHAR (50)  NOT NULL,
    [punto_destinatario_nombre]          VARCHAR (100) NOT NULL,
    [requiere_cita_destinatario]         BIT           NOT NULL,
    [fecha_cita_destinatario]            DATE          NULL,
    [hora_cita_minima_destinatario]      TIME (0)      NULL,
    [hora_cita_maxima_destinatario]      TIME (0)      NULL,
    [id_tipo_ruta]                       BIGINT        NULL,
    [id_tipo_vehiculo]                   BIGINT        NULL,
    [version]                            INT           CONSTRAINT [DF__tmp_ms_xx__versi__5C4299A5] DEFAULT ((0)) NOT NULL,
    [usuario_creacion]                   VARCHAR (50)  NOT NULL,
    [fecha_creacion]                     DATETIME2 (0) NOT NULL,
    [usuario_modificacion]               VARCHAR (50)  NOT NULL,
    [fecha_modificacion]                 DATETIME2 (0) NOT NULL,
    CONSTRAINT [PK_solicitudes_transporte] PRIMARY KEY CLUSTERED ([id_solicitud_transporte] ASC) WITH (FILLFACTOR = 80),
    CONSTRAINT [FK_solicitudes_transporte_ciudades_destinatario] FOREIGN KEY ([id_ciudad_destinatario]) REFERENCES [dbo].[ciudades] ([id_ciudad]),
    CONSTRAINT [FK_solicitudes_transporte_ciudades_remitente] FOREIGN KEY ([id_ciudad_remitente]) REFERENCES [dbo].[ciudades] ([id_ciudad]),
    CONSTRAINT [FK_solicitudes_transporte_solicitudes] FOREIGN KEY ([id_solicitud]) REFERENCES [dbo].[solicitudes] ([id_solicitud]) ON DELETE CASCADE,
    CONSTRAINT [FK_solicitudes_transporte_tipos_ruta] FOREIGN KEY ([id_tipo_ruta]) REFERENCES [dbo].[tipos_ruta] ([id_tipo_ruta]),
    CONSTRAINT [FK_solicitudes_transporte_tipos_vehiculo] FOREIGN KEY ([id_tipo_vehiculo]) REFERENCES [dbo].[tipos_vehiculo] ([id_tipo_vehiculo])
);





