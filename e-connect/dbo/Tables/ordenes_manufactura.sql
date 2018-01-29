CREATE TABLE [dbo].[ordenes_manufactura] (
    [id_orden_manufactura]    BIGINT          IDENTITY (1, 1) NOT NULL,
    [tipo_orden]               VARCHAR (50)  NOT NULL,
    [numero_orden]             VARCHAR(20)  NOT NULL,
    [estado]                   VARCHAR(50)   NOT NULL,
    [id_linea_negocio]         BIGINT        NOT NULL,

    [id_solicitud_orden]       BIGINT        NOT NULL,
    [id_solicitud]             BIGINT        NOT NULL,
    [numero_solicitud]         VARCHAR (20)  NOT NULL,

    [id_bodega]               BIGINT          NOT NULL,
    [id_cliente]              BIGINT          NOT NULL,
    [id_servicio]             BIGINT          NOT NULL,

    [fecha_minima_solicitada] DATE            NULL,
    [fecha_maxima_solicitada] DATE            NULL,

    [nota]                     VARCHAR (200) NOT NULL,

	[id_causal_anulacion] [bigint] NULL,
	[nota_cierre] [varchar](200) NOT NULL DEFAULT '',
    [cerrada]                  BIT NOT NULL DEFAULT 0,
    [cierre_notificado]        BIT NOT NULL DEFAULT 0,
	[usuario_cierre] [varchar](50) NOT NULL DEFAULT '',
	[fecha_cierre] [datetime2](0) NULL ,

    [version]                  INT           NOT NULL DEFAULT 0,
    [usuario_creacion]         VARCHAR (50)  NOT NULL DEFAULT '',
    [fecha_creacion]           DATETIME2 (0) NOT NULL,
    [usuario_modificacion]     VARCHAR (50)  NOT NULL DEFAULT '',
    [fecha_modificacion]       DATETIME2 (0) NOT NULL, 

    CONSTRAINT [PK_ordenes_manufactura] PRIMARY KEY CLUSTERED ([id_orden_manufactura] ASC) WITH (FILLFACTOR = 80),
    CONSTRAINT [FK_ordenes_manufactura_lineas_negocio] FOREIGN KEY ([id_linea_negocio]) REFERENCES [dbo].[lineas_negocio] ([id_linea_negocio]),
    CONSTRAINT [FK_ordenes_manufactura_solicitudes] FOREIGN KEY ([id_solicitud]) REFERENCES [dbo].[solicitudes] ([id_solicitud]),
    CONSTRAINT [FK_ordenes_manufactura_solicitudes_ordenes] FOREIGN KEY ([id_solicitud_orden]) REFERENCES [dbo].[solicitudes_ordenes] ([id_solicitud_orden]),

    CONSTRAINT [FK_ordenes_manufactura_bodegas] FOREIGN KEY ([id_bodega]) REFERENCES [dbo].[bodegas] ([id_bodega]),
    CONSTRAINT [FK_ordenes_manufactura_clientes] FOREIGN KEY ([id_cliente]) REFERENCES [dbo].[clientes] ([id_cliente]),
    CONSTRAINT [FK_ordenes_manufactura_servicios] FOREIGN KEY ([id_servicio]) REFERENCES [dbo].[servicios] ([id_servicio]),
    CONSTRAINT [UK_ordenes_manufactura_01] UNIQUE ([id_cliente], [numero_orden])
);

