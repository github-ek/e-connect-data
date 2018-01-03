CREATE TABLE [dbo].[ordenes_manufactura_lineas_originales] (
    [id]                               BIGINT        IDENTITY (1, 1) NOT NULL,
    [id_orden_manufactura]             BIGINT        NOT NULL,
    [numero_linea]                     INT           NOT NULL,
    [producto_codigo_alterno]          VARCHAR (50)  NOT NULL,
    [producto_nombre]                  VARCHAR (200) NOT NULL,
    [id_unidad]                        BIGINT        NOT NULL,
    [unidad_codigo_alterno]            VARCHAR (50)  NOT NULL,
    [cantidad]                         INT           NOT NULL,
    [bodega_codigo_alterno]            VARCHAR (50)  NOT NULL,
    [estado_inventario_codigo_alterno] VARCHAR (50)  NOT NULL,
    [version]                          INT           NOT NULL,
    [fecha_creacion]                   DATETIME2 (0) NOT NULL,
    [usuario_creacion]                 VARCHAR (50)  NOT NULL,
    [fecha_modificacion]               DATETIME2 (0) NOT NULL,
    [usuario_modificacion]             VARCHAR (50)  NOT NULL,
    CONSTRAINT [PK_ordenes_manufactura_lineas_originales] PRIMARY KEY CLUSTERED ([id] ASC) WITH (FILLFACTOR = 80)
);

