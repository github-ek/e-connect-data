CREATE TABLE [dbo].[ordenes_alistamiento_lineas] (
    [id]                    BIGINT        IDENTITY (1, 1) NOT NULL,
    [id_orden_alistamiento] BIGINT        NOT NULL,
    [numero_linea]          INT           NOT NULL,
    [id_producto]           BIGINT        NOT NULL,
    [producto_codigo]       VARCHAR (50)  NOT NULL,
    [id_estado_inventario]  VARCHAR (4)   NOT NULL,
    [id_unidad_medida]      BIGINT        NOT NULL,
    [unidades_solicitadas]  INT           NOT NULL,
    [unidades_despachadas]  INT           NOT NULL,
    [unidades_canceladas]   INT           NOT NULL,
    [lote]                  VARCHAR (30)  NOT NULL,
    [predistribucion]       VARCHAR (200) NOT NULL,
    [version]               INT           DEFAULT ((0)) NOT NULL,
    [usuario_creacion]      VARCHAR (50)  DEFAULT ('') NOT NULL,
    [fecha_creacion]        DATETIME2 (0) NOT NULL,
    [usuario_modificacion]  VARCHAR (50)  DEFAULT ('') NOT NULL,
    [fecha_modificacion]    DATETIME2 (0) NOT NULL,
    CONSTRAINT [PK_ordenes_alistamiento_lineas] PRIMARY KEY CLUSTERED ([id] ASC) WITH (FILLFACTOR = 80),
    CONSTRAINT [FK_ordenes_alistamiento_lineas_estados_inventario] FOREIGN KEY ([id_estado_inventario]) REFERENCES [dbo].[estados_inventario] ([id_estado_inventario]),
    CONSTRAINT [FK_ordenes_alistamiento_lineas_ordenes_alistamiento] FOREIGN KEY ([id_orden_alistamiento]) REFERENCES [dbo].[ordenes_alistamiento] ([id_orden_alistamiento]) ON DELETE CASCADE,
    CONSTRAINT [FK_ordenes_alistamiento_lineas_productos] FOREIGN KEY ([id_producto]) REFERENCES [dbo].[productos] ([id_producto]),
    CONSTRAINT [FK_ordenes_alistamiento_lineas_unidades_medida] FOREIGN KEY ([id_unidad_medida]) REFERENCES [dbo].[unidades_medida] ([id_unidad_medida]),
    CONSTRAINT [UK_ordenes_alistamiento_lineas_01] UNIQUE NONCLUSTERED ([id_orden_alistamiento] ASC, [numero_linea] ASC)
);



