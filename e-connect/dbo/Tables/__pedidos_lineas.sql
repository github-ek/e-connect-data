CREATE TABLE [dbo].[__pedidos_lineas] (
    [id]                       BIGINT          IDENTITY (1, 1) NOT NULL,
    [id_pedido]                BIGINT          NOT NULL,
    [numero_linea]             INT             NOT NULL,
    [id_producto]              BIGINT          NOT NULL,
    [id_estado_inventario]     VARCHAR (4)     NOT NULL,
    [unidades]                 INT             NOT NULL,
    [factor_conversion]        INT             NOT NULL,
    [cajas]                    DECIMAL (10, 2) NOT NULL,
    [valor_unitario_declarado] DECIMAL (10, 2) NOT NULL,
    [lote]                     VARCHAR (30)    NOT NULL,
    [predistribucion]          VARCHAR (200)   NOT NULL,
    [version]                  INT             NOT NULL,
    [fecha_creacion]           DATETIME2 (0)   NOT NULL,
    [usuario_creacion]         VARCHAR (50)    NOT NULL,
    [fecha_modificacion]       DATETIME2 (0)   NOT NULL,
    [usuario_modificacion]     VARCHAR (50)    NOT NULL,
    CONSTRAINT [PK_pedidos_lineas] PRIMARY KEY CLUSTERED ([id] ASC) WITH (FILLFACTOR = 80)
);

