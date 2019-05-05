CREATE TABLE [dbo].[solicitudes_actas_ingredion_lineas] (
    [id]                               BIGINT        IDENTITY (1, 1) NOT NULL,
    [id_solicitud_acta]                BIGINT        NOT NULL,
    [numero_linea]                     INT           NOT NULL,
    [producto_codigo_alterno]          VARCHAR (50)  NOT NULL,
    [cantidad]                         INT           NOT NULL,
    [estado_inventario_codigo_alterno] VARCHAR (50)  NOT NULL,
    [id_producto]                      BIGINT        NULL,
    [id_estado_inventario]             VARCHAR (4)   NULL,
    [version]                          INT           CONSTRAINT [DF_solicitudes_actas_ingredion_lineas_version] DEFAULT ((0)) NOT NULL,
    [fecha_creacion]                   DATETIME2 (0) CONSTRAINT [DF_solicitudes_actas_ingredion_lineas_fecha_creacion] DEFAULT (sysdatetime()) NOT NULL,
    [fecha_modificacion]               DATETIME2 (0) CONSTRAINT [DF_solicitudes_actas_ingredion_lineas_fecha_modificacion] DEFAULT (sysdatetime()) NOT NULL,
    CONSTRAINT [PK_solicitudes_actas_ingredion_lineas] PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [FK_solicitudes_actas_ingredion_lineas_solicitudes_actas_ingredion] FOREIGN KEY ([id_solicitud_acta]) REFERENCES [dbo].[solicitudes_actas_ingredion] ([id_solicitud_acta]),
    CONSTRAINT [UK_solicitudes_actas_ingredion_lineas] UNIQUE NONCLUSTERED ([id_solicitud_acta] ASC, [numero_linea] ASC)
);

