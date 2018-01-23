CREATE TABLE [dbo].[ordenes_recibo_lineas] (
    [id]                       BIGINT          IDENTITY (1, 1) NOT NULL,
    [id_orden_recibo]          BIGINT          NOT NULL,
    [numero_linea]             INT             NOT NULL,
    [id_producto]              BIGINT          NOT NULL,
    [producto_codigo]          VARCHAR (50)    NOT NULL,
    [producto_nombre]          VARCHAR (250)  NOT NULL,
    [id_estado_inventario]     VARCHAR (4)     NOT NULL,
    [id_unidad_medida]         BIGINT          NOT NULL,

    [unidades_solicitadas]     INT             NOT NULL,

    [lote]                     VARCHAR (30)    NOT NULL,
    [bl]                       VARCHAR (30)    NOT NULL,
    [contenedor]               VARCHAR (30)    NOT NULL,

    [version]                  INT             NOT NULL DEFAULT 0,
    [fecha_creacion]           DATETIME2 (0)   NOT NULL,
    [usuario_creacion]         VARCHAR (50)    NOT NULL,
    [fecha_modificacion]       DATETIME2 (0)   NOT NULL,
    [usuario_modificacion]     VARCHAR (50)    NOT NULL,
    CONSTRAINT [PK_ordenes_recibo_lineas] PRIMARY KEY CLUSTERED ([id] ASC) WITH (FILLFACTOR = 80),
    CONSTRAINT [FK_ordenes_recibo_lineas_ordenes_recibo] FOREIGN KEY ([id_orden_recibo]) REFERENCES [dbo].[ordenes_recibo] ([id_orden_recibo]),
    CONSTRAINT [FK_ordenes_recibo_lineas_productos] FOREIGN KEY ([id_producto]) REFERENCES [dbo].[productos] ([id_producto]),
    CONSTRAINT [FK_ordenes_recibo_lineas_estados_inventario] FOREIGN KEY ([id_estado_inventario]) REFERENCES [dbo].[estados_inventario] ([id_estado_inventario]),
    CONSTRAINT [FK_ordenes_recibo_lineas_unidades_medida] FOREIGN KEY ([id_unidad_medida]) REFERENCES [dbo].[unidades_medida] ([id_unidad_medida]),
    CONSTRAINT [UK_ordenes_recibo_lineas_01] UNIQUE ([id_orden_recibo],[numero_linea]), 
);

