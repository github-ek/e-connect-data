﻿CREATE TABLE [dbo].[remesas_programadas] (
    [id_remesa_programada]          BIGINT        IDENTITY (1, 1) NOT NULL,
    [tipo_remesa]                   VARCHAR(50)   NOT NULL,
    [numero_remesa]                 VARCHAR(35)   NOT NULL,
    [estado]                        VARCHAR(50)   NOT NULL,

    [numero_solicitud]              VARCHAR(35)   NOT NULL,

    [id_linea_negocio]              BIGINT        NOT NULL,
    [id_orden_transporte]           BIGINT        NULL,
    [id_bodega]                     BIGINT        NOT NULL,
    [id_cliente]                    BIGINT        NOT NULL,
    [id_servicio]                   BIGINT        NOT NULL,

    [id_tipo_ruta]                  BIGINT        NULL,
    [id_tipo_vehiculo]              BIGINT        NULL,
    [placa_programada]              VARCHAR(20)   NOT NULL,

    [fecha_remesa]                  DATE          NOT NULL,
    [hora_cita_minima]              TIME (0)      NOT NULL,
    [hora_cita_maxima]              TIME (0)      NOT NULL,

    [version]                       INT           NOT NULL,
    [usuario_creacion]              VARCHAR (50)  NOT NULL,
    [fecha_creacion]                DATETIME2 (0) NOT NULL,
    [usuario_modificacion]          VARCHAR (50)  NOT NULL,
    [fecha_modificacion]            DATETIME2 (0) NOT NULL,
    CONSTRAINT [PK_remesas_programadas] PRIMARY KEY CLUSTERED ([id_remesa_programada] ASC) WITH (FILLFACTOR = 80),
    CONSTRAINT [FK_remesas_programadas_lineas_negocio] FOREIGN KEY ([id_linea_negocio]) REFERENCES [dbo].[lineas_negocio] ([id_linea_negocio]),
    CONSTRAINT [FK_remesas_programadas_bodegas] FOREIGN KEY ([id_bodega]) REFERENCES [dbo].[bodegas] ([id_bodega]),
    CONSTRAINT [FK_remesas_programadas_clientes] FOREIGN KEY ([id_cliente]) REFERENCES [dbo].[clientes] ([id_cliente]),
    CONSTRAINT [FK_remesas_programadas_servicios] FOREIGN KEY ([id_servicio]) REFERENCES [dbo].[servicios] ([id_servicio]),
    CONSTRAINT [FK_remesas_programadas_tipos_ruta] FOREIGN KEY ([id_tipo_ruta]) REFERENCES [dbo].[tipos_ruta] ([id_tipo_ruta]),
    CONSTRAINT [FK_remesas_programadas_tipos_vehiculo] FOREIGN KEY ([id_tipo_vehiculo]) REFERENCES [dbo].[tipos_vehiculo] ([id_tipo_vehiculo]),
);
