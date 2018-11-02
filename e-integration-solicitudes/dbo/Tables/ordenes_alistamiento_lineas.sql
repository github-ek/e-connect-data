CREATE TABLE [dbo].[ordenes_alistamiento_lineas] (
    [id_orden_alistamiento_linea] BIGINT         NOT NULL,
    [id_orden_alistamiento]       BIGINT        NOT NULL,
    [ordlin]                      VARCHAR (10)  NOT NULL,
    [prtnum]                      VARCHAR (50)  NOT NULL,
    [invsts]                      VARCHAR (4)   NOT NULL,
    [ordqty]                      INT           NOT NULL,
    [stgqty]                      INT           NOT NULL,
    [shpqty]                      INT           NOT NULL,
    [numero_linea]                INT           NULL,
    [id_producto]                 BIGINT        NULL,
    [id_estado_inventario]        VARCHAR (4)   NULL,
    [version]                     INT           NOT NULL,
    [fecha_creacion]              DATETIME2 (0) NOT NULL,
    [fecha_modificacion]          DATETIME2 (0) NOT NULL,
    CONSTRAINT [PK_ordenes_alistamiento_lineas] PRIMARY KEY CLUSTERED ([id_orden_alistamiento_linea] ASC),
    CONSTRAINT [FK_ordenes_alistamiento_lineas_ordenes_alistamiento] FOREIGN KEY ([id_orden_alistamiento]) REFERENCES [dbo].[ordenes_alistamiento] ([id_orden_alistamiento]) ON DELETE CASCADE
);

