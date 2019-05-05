CREATE TABLE [dbo].[ordenes_alistamiento_shipment_line] (
    [id_orden_linea]       BIGINT        NOT NULL,
    [id_orden]             BIGINT        NOT NULL,
    [ordlin]               VARCHAR (10)  NOT NULL,
    [prtnum]               VARCHAR (50)  NOT NULL,
    [invsts]               VARCHAR (4)   NOT NULL,
    [ordqty]               INT           NOT NULL,
    [stgqty]               INT           NOT NULL,
    [shpqty]               INT           NOT NULL,
    [numero_linea]         INT           NULL,
    [id_producto]          BIGINT        NULL,
    [id_estado_inventario] VARCHAR (4)   NULL,
    [version]              INT           NOT NULL,
    [fecha_creacion]       DATETIME2 (0) NOT NULL,
    [fecha_modificacion]   DATETIME2 (0) NOT NULL,
    CONSTRAINT [PK_ordenes_alistamiento_shipment_line] PRIMARY KEY CLUSTERED ([id_orden_linea] ASC),
    CONSTRAINT [FK_ordenes_alistamiento_shipment_line_ordenes_alistamiento_ord] FOREIGN KEY ([id_orden]) REFERENCES [dbo].[ordenes_alistamiento_ord] ([id_orden]) ON DELETE CASCADE
);

