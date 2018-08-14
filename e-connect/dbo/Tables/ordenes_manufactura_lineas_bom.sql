CREATE TABLE [dbo].[ordenes_manufactura_lineas_bom] (
    [id]                      BIGINT        IDENTITY (1, 1) NOT NULL,
    [id_orden_manufactura]    BIGINT        NOT NULL,
    [numero_suborden]         VARCHAR (20)  NOT NULL,
    [numero_linea]            INT           NOT NULL,
    [id_producto]             BIGINT        NOT NULL,
    [producto_codigo]         VARCHAR (50)  NOT NULL,
    [id_estado_inventario]    VARCHAR (4)   NOT NULL,
    [id_subestado_inventario] VARCHAR (25)  NULL,
    [unidades]                INT           NOT NULL,
    [lote]                    VARCHAR (30)  NOT NULL,
    [version]                 INT           DEFAULT ((0)) NOT NULL,
    [usuario_creacion]        VARCHAR (50)  DEFAULT ('') NOT NULL,
    [fecha_creacion]          DATETIME2 (0) NOT NULL,
    [usuario_modificacion]    VARCHAR (50)  DEFAULT ('') NOT NULL,
    [fecha_modificacion]      DATETIME2 (0) NOT NULL,
    CONSTRAINT [PK_ordenes_manufactura_lineas_bom] PRIMARY KEY CLUSTERED ([id] ASC) WITH (FILLFACTOR = 80),
    CONSTRAINT [FK_ordenes_manufactura_lineas_bom_estados_inventario] FOREIGN KEY ([id_estado_inventario]) REFERENCES [dbo].[estados_inventario] ([id_estado_inventario]),
    CONSTRAINT [FK_ordenes_manufactura_lineas_bom_ordenes_manufactura] FOREIGN KEY ([id_orden_manufactura]) REFERENCES [dbo].[ordenes_manufactura] ([id_orden_manufactura]) ON DELETE CASCADE,
    CONSTRAINT [FK_ordenes_manufactura_lineas_bom_productos] FOREIGN KEY ([id_producto]) REFERENCES [dbo].[productos] ([id_producto]),
    CONSTRAINT [FK_ordenes_manufactura_lineas_bom_subestados_inventario] FOREIGN KEY ([id_subestado_inventario]) REFERENCES [dbo].[subestados_inventario] ([id_subestado_inventario])
);

