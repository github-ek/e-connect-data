CREATE TABLE [dbo].[ordenes_manufactura_lineas] (
    [id]                      BIGINT        IDENTITY (1, 1) NOT NULL,
    [id_orden_manufactura]    BIGINT        NOT NULL,
    [numero_linea]            INT           NOT NULL,
    [numero_suborden]         VARCHAR (20)  NOT NULL,
    [numero_revision]         VARCHAR (20)  NOT NULL,
    [id_producto]             BIGINT        NOT NULL,
    [producto_codigo]         VARCHAR (50)  NOT NULL,
    [id_estado_inventario]    VARCHAR (4)   NOT NULL,
    [unidades_solicitadas]    INT           NOT NULL,
    [unidades_manufacturadas] INT           NOT NULL,
    [factor_conversion]       INT           NOT NULL,
    [lote]                    VARCHAR (30)  NOT NULL,
    [version]                 INT           NOT NULL,
    [fecha_creacion]          DATETIME2 (0) NOT NULL,
    [usuario_creacion]        VARCHAR (50)  NOT NULL,
    [fecha_modificacion]      DATETIME2 (0) NOT NULL,
    [usuario_modificacion]    VARCHAR (50)  NOT NULL,
    CONSTRAINT [PK_ordenes_manufactura_lineas] PRIMARY KEY CLUSTERED ([id] ASC) WITH (FILLFACTOR = 80)
);

