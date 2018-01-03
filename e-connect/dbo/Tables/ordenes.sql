﻿CREATE TABLE [dbo].[ordenes] (
    [id_orden]                 BIGINT        IDENTITY (1, 1) NOT NULL,
    [id_tipo_documento]        VARCHAR (20)  NOT NULL,
    [numero_orden]             VARCHAR (20)  NOT NULL,
    [prefijo]                  VARCHAR (20)  NOT NULL,
    [numero_orden_sin_prefijo] VARCHAR (20)  NOT NULL,
    [estado]                   VARCHAR (50)  NOT NULL,
    [id_bodega]                BIGINT        NOT NULL,
    [id_cliente]               BIGINT        NOT NULL,
    [id_servicio]              BIGINT        NOT NULL,
    [servicio_codigo_alterno]  VARCHAR (50)  NOT NULL,
    [id_empresa]               BIGINT        NOT NULL,
    [id_tercero]               BIGINT        NULL,
    [tercero_codigo_alterno]   VARCHAR (20)  NOT NULL,
    [tercero_nombre]           VARCHAR (100) NOT NULL,
    [id_canal]                 BIGINT        NULL,
    [canal_codigo_alterno]     VARCHAR (50)  NOT NULL,
    [fecha_minima_solicitada]  DATE          NOT NULL,
    [fecha_maxima_solicitada]  DATE          NOT NULL,
    [hora_minima_solicitada]   TIME (0)      NULL,
    [hora_maxima_solicitada]   TIME (0)      NULL,
    [requiere_transporte]      VARCHAR (1)   NOT NULL,
    [requiere_recaudo]         VARCHAR (1)   NOT NULL,
    [nota]                     VARCHAR (200) NOT NULL,
    [numero_orden_anulado]     VARCHAR (20)  NOT NULL,
    [id_causal_anulacion]      BIGINT        NULL,
    [nota_anulacion]           VARCHAR (200) NOT NULL,
    [usuario_anulacion]        VARCHAR (50)  NOT NULL,
    [fecha_anulacion]          DATETIME2 (0) NULL,
    [version]                  INT           NOT NULL,
    [usuario_creacion]         VARCHAR (50)  NOT NULL,
    [fecha_creacion]           DATETIME2 (0) NOT NULL,
    [usuario_modificacion]     VARCHAR (50)  NOT NULL,
    [fecha_modificacion]       DATETIME2 (0) NOT NULL,
    CONSTRAINT [PK_ordenes] PRIMARY KEY CLUSTERED ([id_orden] ASC) WITH (FILLFACTOR = 80),
    CONSTRAINT [FK_ordenes_bodegas] FOREIGN KEY ([id_bodega]) REFERENCES [dbo].[bodegas] ([id_bodega]),
    CONSTRAINT [FK_ordenes_canales] FOREIGN KEY ([id_canal]) REFERENCES [dbo].[canales] ([id_canal]),
    CONSTRAINT [FK_ordenes_clientes] FOREIGN KEY ([id_cliente]) REFERENCES [dbo].[clientes] ([id_cliente]),
    CONSTRAINT [FK_ordenes_servicios] FOREIGN KEY ([id_servicio]) REFERENCES [dbo].[servicios] ([id_servicio]),
    CONSTRAINT [FK_ordenes_terceros] FOREIGN KEY ([id_tercero]) REFERENCES [dbo].[terceros] ([id_tercero]),
    CONSTRAINT [FK_ordenes_tipos_identificacion] FOREIGN KEY ([id_tipo_documento]) REFERENCES [dbo].[tipos_identificacion] ([id_tipo_identificacion])
);

