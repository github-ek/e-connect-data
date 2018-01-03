CREATE TABLE [dbo].[ordenes_alistamiento_lineas] (
    [id]                       BIGINT          IDENTITY (1, 1) NOT NULL,
    [id_orden_alistamiento]    BIGINT          NOT NULL,
    [numero_linea]             INT             NOT NULL,
    [id_producto]              BIGINT          NOT NULL,
    [producto_codigo]          VARCHAR (50)    NOT NULL,
    [id_estado_inventario]     VARCHAR (4)     NOT NULL,
    [unidades_solicitadas]     INT             NOT NULL,
    [unidades_despachadas]     INT             NOT NULL,
    [factor_conversion]        INT             NOT NULL,
    [valor_unitario_declarado] DECIMAL (10, 2) NOT NULL,
    [lote]                     VARCHAR (30)    NOT NULL,
    [predistribucion]          VARCHAR (200)   NOT NULL,
    [version]                  INT             NOT NULL,
    [fecha_creacion]           DATETIME2 (0)   NOT NULL,
    [usuario_creacion]         VARCHAR (50)    NOT NULL,
    [fecha_modificacion]       DATETIME2 (0)   NOT NULL,
    [usuario_modificacion]     VARCHAR (50)    NOT NULL,
    CONSTRAINT [PK_ordenes_alistamiento_lineas] PRIMARY KEY CLUSTERED ([id] ASC) WITH (FILLFACTOR = 80)
);

