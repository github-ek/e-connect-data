CREATE TABLE [dbo].[ordenes_alistamiento]
(
    [id_orden_alistamiento]    BIGINT        IDENTITY (1, 1) NOT NULL,
    [numero_orden]             VARCHAR(35)  NOT NULL,
    [estado]                   VARCHAR(50)   NOT NULL,
    [id_linea_negocio]         BIGINT        NOT NULL,

    [id_solicitud_orden]       BIGINT        NOT NULL,
    [id_solicitud]             BIGINT        NOT NULL,

    [id_bodega]                BIGINT        NOT NULL,
    [id_cliente]               BIGINT        NOT NULL,
    [id_servicio]              BIGINT        NOT NULL,
    [id_tercero]               BIGINT        NULL,
    [tercero_identificacion]   VARCHAR (20)  NOT NULL,
    [tercero_nombre]           VARCHAR (100) NOT NULL,
    [id_canal]                 BIGINT        NULL,

    [fecha_minima_solicitada]  DATE          NOT NULL,
    [fecha_maxima_solicitada]  DATE          NOT NULL,
    [hora_minima_solicitada]   TIME (0)      NULL,
    [hora_maxima_solicitada]   TIME (0)      NULL,
    [fecha_cita_entrega]            DATE          NULL,
    [hora_cita_entrega_minima]      TIME (0)      NULL,
    [hora_cita_entrega_maxima]      TIME (0)      NULL,

    [requiere_transporte]      BIT   NOT NULL,
    [id_ciudad_destinatario]             BIGINT        NOT NULL,
    [direccion_destinatario]             VARCHAR (150) NOT NULL,

    [nota]                     VARCHAR (200) NOT NULL,

	[id_causal_anulacion] [bigint] NULL,
	[nota_cierre] [varchar](200) NOT NULL DEFAULT '',
    [cerrada]                  BIT NOT NULL DEFAULT 0,
    [cierre_notificado]        BIT NOT NULL DEFAULT 0,
	[usuario_cierre] [varchar](50) NOT NULL DEFAULT '',
	[fecha_cierre] [datetime2](0) NULL ,

    [version]                  INT           NOT NULL DEFAULT 0,
    [usuario_creacion]         VARCHAR (50)  NOT NULL,
    [fecha_creacion]           DATETIME2 (0) NOT NULL,
    [usuario_modificacion]     VARCHAR (50)  NOT NULL,
    [fecha_modificacion]       DATETIME2 (0) NOT NULL, 

    CONSTRAINT [PK_ordenes_alistamiento] PRIMARY KEY CLUSTERED ([id_orden_alistamiento] ASC),
	CONSTRAINT [FK_ordenes_alistamiento_lineas_negocio] FOREIGN KEY ([id_linea_negocio]) REFERENCES [dbo].[lineas_negocio] ([id_linea_negocio]),
	CONSTRAINT [FK_ordenes_alistamiento_solicitudes] FOREIGN KEY ([id_solicitud]) REFERENCES [dbo].[solicitudes] ([id_solicitud]),
	CONSTRAINT [FK_ordenes_alistamiento_solicitudes_ordenes] FOREIGN KEY ([id_solicitud_orden]) REFERENCES [dbo].[solicitudes_ordenes] ([id_solicitud_orden]),

    CONSTRAINT [FK_ordenes_alistamiento_bodegas] FOREIGN KEY ([id_bodega]) REFERENCES [dbo].[bodegas] ([id_bodega]),
    CONSTRAINT [FK_ordenes_alistamiento_canales] FOREIGN KEY ([id_canal]) REFERENCES [dbo].[canales] ([id_canal]),
    CONSTRAINT [FK_ordenes_alistamiento_clientes] FOREIGN KEY ([id_cliente]) REFERENCES [dbo].[clientes] ([id_cliente]),
    CONSTRAINT [FK_ordenes_alistamiento_servicios] FOREIGN KEY ([id_servicio]) REFERENCES [dbo].[servicios] ([id_servicio]),
    CONSTRAINT [FK_ordenes_alistamiento_terceros] FOREIGN KEY ([id_tercero]) REFERENCES [dbo].[terceros] ([id_tercero]), 
    CONSTRAINT [UK_ordenes_alistamiento_01] UNIQUE ([id_cliente], [numero_orden])
)
