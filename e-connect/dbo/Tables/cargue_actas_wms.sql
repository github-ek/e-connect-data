CREATE TABLE [dbo].[cargue_actas_wms] (
    [id_almacen]        VARCHAR (50)  NOT NULL,
    [orden_factura]     VARCHAR (150) NOT NULL,
    [acta]              VARCHAR (100) NOT NULL,
    [numero_articulo]   VARCHAR (100) NOT NULL,
    [descripcion]       VARCHAR (150) NULL,
    [codigo_origen]     VARCHAR (50)  NOT NULL,
    [lote]              BIGINT        NOT NULL,
    [fecha_vencimiento] DATE          NOT NULL,
    [cantidad]          BIGINT        NOT NULL,
    [fecha_creacion]    DATETIME2 (0) NULL
);

