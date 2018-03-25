﻿CREATE TABLE [dbo].[remesas] (
    [id_remesa]                     BIGINT           IDENTITY (1, 1) NOT NULL,
    [tipo_remesa]                   VARCHAR (50)     NOT NULL,
    [es_reprogramacion]             BIT              NOT NULL,
    [numero_remesa]                 VARCHAR (35)     NOT NULL,
    [estado]                        VARCHAR (50)     NOT NULL,
    [numero_solicitud]              VARCHAR (35)     NOT NULL,
    [id_linea_negocio]              BIGINT           NOT NULL,
    [id_orden_transporte]           BIGINT           NULL,
    [id_bodega]                     BIGINT           NOT NULL,
    [id_cliente]                    BIGINT           NOT NULL,
    [id_servicio]                   BIGINT           NOT NULL,
    [id_tipo_ruta]                  BIGINT           NULL,
    [id_tipo_vehiculo]              BIGINT           NULL,
    [placa_programada]              VARCHAR (20)     NOT NULL,
    [placa]                         VARCHAR (20)     NOT NULL,
    [fecha_remesa]                  DATE             NOT NULL,
    [hora_cita_minima]              TIME (0)         NOT NULL,
    [hora_cita_maxima]              TIME (0)         NOT NULL,
    [remitente_tipo_documento]      VARCHAR (20)     NOT NULL,
    [remitente_numero_documento]    VARCHAR (20)     NOT NULL,
    [remitente_nombre]              VARCHAR (100)    NOT NULL,
    [id_direccion_remitente]        BIGINT           NULL,
    [id_ciudad_remitente]           BIGINT           NOT NULL,
    [remitente_direccion]           VARCHAR (150)    NOT NULL,
    [remitente_cx]                  DECIMAL (18, 15) NOT NULL,
    [remitente_cy]                  DECIMAL (18, 15) NOT NULL,
    [remitente_telefonos]           VARCHAR (100)    NOT NULL,
    [remitente_contacto]            VARCHAR (100)    NOT NULL,
    [destinatario_tipo_documento]   VARCHAR (20)     NOT NULL,
    [destinatario_numero_documento] VARCHAR (20)     NOT NULL,
    [destinatario_nombre]           VARCHAR (100)    NOT NULL,
    [id_direccion_destinatario]     BIGINT           NULL,
    [id_ciudad_destinatario]        BIGINT           NOT NULL,
    [destinatario_direccion]        VARCHAR (150)    NOT NULL,
    [destinatario_cx]               DECIMAL (18, 15) NOT NULL,
    [destinatario_cy]               DECIMAL (18, 15) NOT NULL,
    [destinatario_telefonos]        VARCHAR (100)    NOT NULL,
    [destinatario_contacto]         VARCHAR (100)    NOT NULL,
    [version]                       INT              CONSTRAINT [DF_remesas_version] DEFAULT ((0)) NOT NULL,
    [usuario_creacion]              VARCHAR (50)     NOT NULL,
    [fecha_creacion]                DATETIME2 (0)    NOT NULL,
    [usuario_modificacion]          VARCHAR (50)     NOT NULL,
    [fecha_modificacion]            DATETIME2 (0)    NOT NULL,
    [id_orden]                      BIGINT           NOT NULL,
    CONSTRAINT [PK_remesas] PRIMARY KEY CLUSTERED ([id_remesa] ASC) WITH (FILLFACTOR = 80),
    CONSTRAINT [FK_remesas_bodegas] FOREIGN KEY ([id_bodega]) REFERENCES [dbo].[bodegas] ([id_bodega]),
    CONSTRAINT [FK_remesas_ciudades_destinatario] FOREIGN KEY ([id_ciudad_destinatario]) REFERENCES [dbo].[ciudades] ([id_ciudad]),
    CONSTRAINT [FK_remesas_ciudades_remitente] FOREIGN KEY ([id_ciudad_remitente]) REFERENCES [dbo].[ciudades] ([id_ciudad]),
    CONSTRAINT [FK_remesas_clientes] FOREIGN KEY ([id_cliente]) REFERENCES [dbo].[clientes] ([id_cliente]),
    CONSTRAINT [FK_remesas_direcciones_destinatario] FOREIGN KEY ([id_direccion_destinatario]) REFERENCES [dbo].[direcciones] ([id_direccion]),
    CONSTRAINT [FK_remesas_direcciones_remitente] FOREIGN KEY ([id_direccion_remitente]) REFERENCES [dbo].[direcciones] ([id_direccion]),
    CONSTRAINT [FK_remesas_lineas_negocio] FOREIGN KEY ([id_linea_negocio]) REFERENCES [dbo].[lineas_negocio] ([id_linea_negocio]),
    CONSTRAINT [FK_remesas_servicios] FOREIGN KEY ([id_servicio]) REFERENCES [dbo].[servicios] ([id_servicio]),
    CONSTRAINT [FK_remesas_tipos_ruta] FOREIGN KEY ([id_tipo_ruta]) REFERENCES [dbo].[tipos_ruta] ([id_tipo_ruta]),
    CONSTRAINT [FK_remesas_tipos_vehiculo] FOREIGN KEY ([id_tipo_vehiculo]) REFERENCES [dbo].[tipos_vehiculo] ([id_tipo_vehiculo]),
    CONSTRAINT [UK_remesas_01] UNIQUE NONCLUSTERED ([id_remesa] ASC, [id_cliente] ASC, [numero_solicitud] ASC),
    CONSTRAINT [UK_remesas_02] UNIQUE NONCLUSTERED ([id_orden] ASC, [fecha_remesa] ASC, [placa] ASC)
);



