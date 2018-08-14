CREATE TABLE [dbo].[saldos_inventario] (
    [id]                                 BIGINT          IDENTITY (1, 1) NOT NULL,
    [id_archivo]                         BIGINT          NOT NULL,
    [estado]                             VARCHAR (50)    NOT NULL,
    [numero_linea]                       INT             NOT NULL,
    [cliente_codigo]                     VARCHAR (20)    NOT NULL,
    [fecha]                              DATE            NOT NULL,
    [fecha_corte]                        DATETIME2 (0)   NOT NULL,
    [producto_codigo_alterno]            VARCHAR (50)    NOT NULL,
    [bodega_codigo_alterno]              VARCHAR (50)    NOT NULL,
    [estado_conciliacion_codigo_alterno] VARCHAR (50)    NOT NULL,
    [unidad_medida_codigo_alterno]       VARCHAR (50)    NOT NULL,
    [unidades_por_empaque]               INT             NULL,
    [cantidad]                           DECIMAL (12, 4) NOT NULL,
    [valor_unitario]                     INT             NULL,
    [id_cliente]                         BIGINT          NULL,
    [id_producto]                        BIGINT          NULL,
    [id_bodega]                          BIGINT          NULL,
    [id_estado_conciliacion]             BIGINT          NULL,
    [id_unidad_medida]                   BIGINT          NULL,
    [version]                            INT             NOT NULL,
    [fecha_creacion]                     DATETIME2 (0)   NOT NULL,
    [usuario_creacion]                   VARCHAR (50)    NOT NULL,
    [fecha_modificacion]                 DATETIME2 (0)   NOT NULL,
    [usuario_modificacion]               VARCHAR (50)    NOT NULL,
    CONSTRAINT [PK_saldos_inventario] PRIMARY KEY CLUSTERED ([id] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_saldos_inventario_01]
    ON [dbo].[saldos_inventario]([id_archivo] DESC);

