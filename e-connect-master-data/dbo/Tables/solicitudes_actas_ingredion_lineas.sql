CREATE TABLE [dbo].[solicitudes_actas_ingredion_lineas] (
    [id]                               BIGINT        IDENTITY (1, 1) NOT NULL,
    [id_solicitud_acta]                BIGINT        NOT NULL,
    [producto_codigo]                  VARCHAR (50)  NOT NULL,
    [estado_inventario_codigo_alterno] VARCHAR (50)  NOT NULL,
    [bodega_virtual_codigo_alterno]    VARCHAR (50)  NOT NULL,
    [lote]                             VARCHAR (30)  NOT NULL,
    [unidades_solicitadas]             INT           NOT NULL,
    [id_producto]                      BIGINT        NOT NULL,
    [id_estado_inventario]             VARCHAR (4)   NOT NULL,
    [id_bodega_virtual]                BIGINT        NULL,
    [version]                          INT           CONSTRAINT [DF_solicitudes_actas_ingredion_lineas_version] DEFAULT ((0)) NOT NULL,
    [fecha_creacion]                   DATETIME2 (0) NOT NULL,
    [fecha_modificacion]               DATETIME2 (0) CONSTRAINT [DF_solicitudes_actas_ingredion_lineas_usuario_modificacion] DEFAULT ('') NOT NULL,
    CONSTRAINT [PK_solicitudes_actas_ingredion_lineas] PRIMARY KEY CLUSTERED ([id] ASC) WITH (FILLFACTOR = 80),
    CONSTRAINT [FK_solicitudes_actas_ingredion_lineas_bodegas_virtuales] FOREIGN KEY ([id_bodega_virtual]) REFERENCES [dbo].[bodegas_virtuales] ([id_bodega_virtual]),
    CONSTRAINT [FK_solicitudes_actas_ingredion_lineas_estados_inventario] FOREIGN KEY ([id_estado_inventario]) REFERENCES [dbo].[estados_inventario] ([id_estado_inventario]),
    CONSTRAINT [FK_solicitudes_actas_ingredion_lineas_productos] FOREIGN KEY ([id_producto]) REFERENCES [dbo].[productos] ([id_producto]),
    CONSTRAINT [FK_solicitudes_actas_ingredion_lineas_solicitudes_actas_ingredion] FOREIGN KEY ([id_solicitud_acta]) REFERENCES [dbo].[solicitudes_actas_ingredion] ([id_solicitud_acta])
);

