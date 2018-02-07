﻿CREATE TABLE [dbo].[solicitudes] (
    [id_solicitud]             BIGINT        IDENTITY (2000000, 1) NOT NULL,
    [tipo_solicitud]           VARCHAR (50)  NOT NULL,
    [numero_solicitud]         VARCHAR (20)  NOT NULL,
    [prefijo]                  VARCHAR (20)  NOT NULL,
    [numero_solicitud_sin_prefijo] VARCHAR (20)  NOT NULL,
    [estado]                   VARCHAR (50)  NOT NULL,
    [id_bodega]                BIGINT        NOT NULL,
    [id_bodega_traslado]       BIGINT        NULL,
    [id_cliente]               BIGINT        NOT NULL,
    [id_servicio]              BIGINT        NOT NULL,
    [servicio_codigo_alterno]  VARCHAR (50)  NOT NULL,
    [id_tercero]               BIGINT        NULL,
    [tercero_identificacion]   VARCHAR (20)  NOT NULL DEFAULT '',
    [tercero_nombre]           VARCHAR (100) NOT NULL DEFAULT '',
    [id_canal]                 BIGINT        NULL,
    [canal_codigo_alterno]     VARCHAR (50)  NOT NULL DEFAULT '',
    [fecha_minima_solicitada]  DATE          NOT NULL,
    [fecha_maxima_solicitada]  DATE          NOT NULL,
    [hora_minima_solicitada]   TIME (0)      NULL,
    [hora_maxima_solicitada]   TIME (0)      NULL,
    [requiere_transporte]      BIT   NOT NULL,
    [requiere_recaudo]         BIT   NOT NULL,
    [nota]                     VARCHAR (200) NOT NULL DEFAULT '',
    [numero_solicitud_anulado]     VARCHAR (20)  NOT NULL DEFAULT '',
    [id_causal_anulacion]      BIGINT        NULL,
    [nota_anulacion]           VARCHAR (200) NOT NULL DEFAULT '',
    [usuario_anulacion]        VARCHAR (50)  NOT NULL DEFAULT '',
    [fecha_anulacion]          DATETIME2 (0) NULL,
    [version]                  INT           NOT NULL DEFAULT 0,
    [usuario_creacion]         VARCHAR (50)  NOT NULL,
    [fecha_creacion]           DATETIME2 (0) NOT NULL,
    [usuario_modificacion]     VARCHAR (50)  NOT NULL,
    [fecha_modificacion]       DATETIME2 (0) NOT NULL,
    CONSTRAINT [PK_solicitudes] PRIMARY KEY CLUSTERED ([id_solicitud] ASC) WITH (FILLFACTOR = 80),
    CONSTRAINT [FK_solicitudes_bodegas] FOREIGN KEY ([id_bodega]) REFERENCES [dbo].[bodegas] ([id_bodega]),
    CONSTRAINT [FK_solicitudes_bodegas_traslado] FOREIGN KEY ([id_bodega_traslado]) REFERENCES [dbo].[bodegas] ([id_bodega]),
    CONSTRAINT [FK_solicitudes_canales] FOREIGN KEY ([id_canal]) REFERENCES [dbo].[canales] ([id_canal]),
    CONSTRAINT [FK_solicitudes_clientes] FOREIGN KEY ([id_cliente]) REFERENCES [dbo].[clientes] ([id_cliente]),
    CONSTRAINT [FK_solicitudes_servicios] FOREIGN KEY ([id_servicio]) REFERENCES [dbo].[servicios] ([id_servicio]),
    CONSTRAINT [FK_solicitudes_terceros] FOREIGN KEY ([id_tercero]) REFERENCES [dbo].[terceros] ([id_tercero]), 
    CONSTRAINT [UK_solicitudes_01] UNIQUE ([numero_solicitud],[id_cliente])
);

