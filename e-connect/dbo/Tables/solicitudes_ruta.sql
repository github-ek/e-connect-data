﻿CREATE TABLE [dbo].[solicitudes_ruta] (
    [id_solicitud_ruta]      BIGINT          IDENTITY (1, 1) NOT NULL,
    [id_orden_transporte]    BIGINT          NOT NULL,
    [id_tipo_documento]      VARCHAR (20)    NOT NULL,
    [numero_documento]       VARCHAR (20)    NOT NULL,
    [id_tipo_solicitud_ruta] BIGINT          NOT NULL,
    [estado]                 VARCHAR (50)    NOT NULL,
    [id_bodega]              BIGINT          NOT NULL,
    [id_cliente]             BIGINT          NOT NULL,
    [id_servicio]            BIGINT          NOT NULL,
    [id_tercero]             BIGINT          NULL,
    [tercero_codigo_alterno] VARCHAR (20)    NOT NULL,
    [tercero_nombre]         VARCHAR (100)   NOT NULL,
    [id_canal]               BIGINT          NULL,
    [id_linea_negocio]       BIGINT          NOT NULL,
    [id_tipo_ruta]           BIGINT          NOT NULL,
    [id_tipo_vehiculo]       BIGINT          NULL,
    [fecha_cita]             DATE            NULL,
    [hora_cita_minima]       TIME (0)        NULL,
    [hora_cita_maxima]       TIME (0)        NULL,
    [id_ciudad]              BIGINT          NOT NULL,
    [direccion]              VARCHAR (150)   NOT NULL,
    [id_direccion]           BIGINT          NULL,
    [unidades]               INT             NOT NULL,
    [cajas]                  DECIMAL (10, 2) NOT NULL,
    [peso]                   DECIMAL (12, 4) NOT NULL,
    [volumen]                DECIMAL (12, 4) NOT NULL,
    [puntualidad]            INT             NOT NULL,
    [penalizacion_retraso]   INT             NOT NULL,
    [id_corte]               BIGINT          NULL,
    [id_ruta]                BIGINT          NULL,
    [secuencia]              INT             NULL,
    [fecha_hora_estimada]    DATETIME2 (0)   NULL,
    [nota_cierre]            VARCHAR (200)   NOT NULL,
    [usuario_cierre]         VARCHAR (50)    NOT NULL,
    [fecha_cierre]           DATETIME2 (0)   NULL,
    [id_causal_anulacion]    BIGINT          NULL,
    [nota_anulacion]         VARCHAR (200)   NOT NULL,
    [usuario_anulacion]      VARCHAR (50)    NOT NULL,
    [fecha_anulacion]        DATETIME2 (0)   NULL,
    [version]                INT             NOT NULL,
    [usuario_creacion]       VARCHAR (50)    NOT NULL,
    [fecha_creacion]         DATETIME2 (0)   NOT NULL,
    [usuario_modificacion]   VARCHAR (50)    NOT NULL,
    [fecha_modificacion]     DATETIME2 (0)   NOT NULL,
    CONSTRAINT [PK_solicitudes_ruta] PRIMARY KEY CLUSTERED ([id_solicitud_ruta] ASC) WITH (FILLFACTOR = 80),
    CONSTRAINT [FK_solicitudes_ruta_bodegas] FOREIGN KEY ([id_bodega]) REFERENCES [dbo].[bodegas] ([id_bodega]),
    CONSTRAINT [FK_solicitudes_ruta_canales] FOREIGN KEY ([id_canal]) REFERENCES [dbo].[canales] ([id_canal]),
    CONSTRAINT [FK_solicitudes_ruta_clientes] FOREIGN KEY ([id_cliente]) REFERENCES [dbo].[clientes] ([id_cliente]),
    CONSTRAINT [FK_solicitudes_ruta_servicios] FOREIGN KEY ([id_servicio]) REFERENCES [dbo].[servicios] ([id_servicio]),
    CONSTRAINT [FK_solicitudes_ruta_terceros] FOREIGN KEY ([id_tercero]) REFERENCES [dbo].[terceros] ([id_tercero]),
    CONSTRAINT [FK_solicitudes_ruta_tipos_identificacion] FOREIGN KEY ([id_tipo_documento]) REFERENCES [dbo].[tipos_identificacion] ([id_tipo_identificacion])
);

