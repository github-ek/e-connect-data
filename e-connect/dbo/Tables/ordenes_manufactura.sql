﻿CREATE TABLE [dbo].[ordenes_manufactura] (
    [id_orden_manufactura]    BIGINT        NOT NULL,
    [tipo_orden]              VARCHAR (50)  NOT NULL,
    [numero_orden]            VARCHAR (20)  NOT NULL,
    [estado]                  VARCHAR (50)  NOT NULL,
    [id_linea_negocio]        BIGINT        NOT NULL,
    [id_solicitud_orden]      BIGINT        NOT NULL,
    [id_solicitud]            BIGINT        NOT NULL,
    [id_bodega]               BIGINT        NOT NULL,
    [id_cliente]              BIGINT        NOT NULL,
    [id_servicio]             BIGINT        NOT NULL,
    [fecha_minima_solicitada] DATE          NULL,
    [fecha_maxima_solicitada] DATE          NULL,
    [nota]                    VARCHAR (200) NOT NULL,
    [id_causal_anulacion]     BIGINT        NULL,
    [nota_cierre]             VARCHAR (200) DEFAULT ('') NOT NULL,
    [cerrada]                 BIT           DEFAULT ((0)) NOT NULL,
    [cierre_notificado]       BIT           DEFAULT ((0)) NOT NULL,
    [usuario_cierre]          VARCHAR (50)  DEFAULT ('') NOT NULL,
    [fecha_cierre]            DATETIME2 (0) NULL,
    [version]                 INT           DEFAULT ((0)) NOT NULL,
    [usuario_creacion]        VARCHAR (50)  DEFAULT ('') NOT NULL,
    [fecha_creacion]          DATETIME2 (0) NOT NULL,
    [usuario_modificacion]    VARCHAR (50)  DEFAULT ('') NOT NULL,
    [fecha_modificacion]      DATETIME2 (0) NOT NULL,
    CONSTRAINT [PK_ordenes_manufactura] PRIMARY KEY CLUSTERED ([id_orden_manufactura] ASC) WITH (FILLFACTOR = 80),
    CONSTRAINT [FK_ordenes_manufactura_bodegas] FOREIGN KEY ([id_bodega]) REFERENCES [dbo].[bodegas] ([id_bodega]),
    CONSTRAINT [FK_ordenes_manufactura_clientes] FOREIGN KEY ([id_cliente]) REFERENCES [dbo].[clientes] ([id_cliente]),
    CONSTRAINT [FK_ordenes_manufactura_lineas_negocio] FOREIGN KEY ([id_linea_negocio]) REFERENCES [dbo].[lineas_negocio] ([id_linea_negocio]),
    CONSTRAINT [FK_ordenes_manufactura_servicios] FOREIGN KEY ([id_servicio]) REFERENCES [dbo].[servicios] ([id_servicio]),
    CONSTRAINT [FK_ordenes_manufactura_solicitudes] FOREIGN KEY ([id_solicitud]) REFERENCES [dbo].[solicitudes] ([id_solicitud]),
    CONSTRAINT [UK_ordenes_manufactura_01] UNIQUE NONCLUSTERED ([id_cliente] ASC, [numero_orden] ASC)
);



