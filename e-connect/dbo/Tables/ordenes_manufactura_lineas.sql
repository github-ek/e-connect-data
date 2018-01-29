CREATE TABLE [dbo].[ordenes_manufactura_lineas] (
    [id]                      BIGINT        IDENTITY (1, 1) NOT NULL,
    [id_orden_manufactura]    BIGINT        NOT NULL,
    [numero_suborden]         VARCHAR (20)  NOT NULL,

    [numero_linea]            INT           NOT NULL,
    [id_producto]             BIGINT          NOT NULL,
    [producto_codigo]         VARCHAR (50)    NOT NULL,
    [producto_nombre]         VARCHAR (250)  NOT NULL,
    [id_estado_inventario]    VARCHAR (4)   NOT NULL,
    [id_unidad_medida]        BIGINT          NOT NULL,

    [unidades_solicitadas]    INT           NOT NULL,
    [unidades_manufacturadas] INT           NOT NULL,
    [unidades_canceladas]      INT             NOT NULL,

    [lote]                    VARCHAR (30)  NOT NULL,

    [version]                  INT           NOT NULL DEFAULT 0,
    [usuario_creacion]         VARCHAR (50)  NOT NULL DEFAULT '',
    [fecha_creacion]           DATETIME2 (0) NOT NULL,
    [usuario_modificacion]     VARCHAR (50)  NOT NULL DEFAULT '',
    [fecha_modificacion]       DATETIME2 (0) NOT NULL, 

    CONSTRAINT [PK_ordenes_manufactura_lineas] PRIMARY KEY CLUSTERED ([id] ASC) WITH (FILLFACTOR = 80),
    CONSTRAINT [FK_ordenes_manufactura_lineas_ordenes_manufactura] FOREIGN KEY ([id_orden_manufactura]) REFERENCES [dbo].[ordenes_manufactura] ([id_orden_manufactura]),
    CONSTRAINT [FK_ordenes_manufactura_lineas_productos] FOREIGN KEY ([id_producto]) REFERENCES [dbo].[productos] ([id_producto]),
    CONSTRAINT [FK_ordenes_manufactura_lineas_estados_inventario] FOREIGN KEY ([id_estado_inventario]) REFERENCES [dbo].[estados_inventario] ([id_estado_inventario]),
    CONSTRAINT [FK_ordenes_manufactura_lineas_unidades_medida] FOREIGN KEY ([id_unidad_medida]) REFERENCES [dbo].[unidades_medida] ([id_unidad_medida]),
    CONSTRAINT [UK_ordenes_manufactura_lineas_01] UNIQUE ([id_orden_manufactura],[numero_linea]),
);

