CREATE TABLE [dbo].[clientes_bodegas] (
    [id_cliente]                               BIGINT        NOT NULL,
    [codigo_alterno]                           VARCHAR (50)  NOT NULL,
    [habilitado_conversion_cliente_wms]        INT           NOT NULL,
    [bodega_cliente_nombre]                    VARCHAR (100) NULL,
    [id_bodega]                                BIGINT        NOT NULL,
    [id_estado_inventario]                     VARCHAR (4)   NOT NULL,
    [id_estado_inventario_equivalente_cliente] VARCHAR (4)   NOT NULL,
    CONSTRAINT [PK_clientes_bodegas] PRIMARY KEY CLUSTERED ([id_cliente] ASC, [codigo_alterno] ASC, [habilitado_conversion_cliente_wms] ASC)
);

