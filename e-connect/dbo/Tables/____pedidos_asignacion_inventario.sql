CREATE TABLE [dbo].[____pedidos_asignacion_inventario] (
    [id]                   BIGINT        IDENTITY (1, 1) NOT NULL,
    [id_pedido]            BIGINT        NOT NULL,
    [numero_linea]         INT           NOT NULL,
    [unidades]             INT           NOT NULL,
    [lote]                 VARCHAR (30)  NOT NULL,
    [fecha_vencimiento]    DATE          NOT NULL,
    [version]              INT           NOT NULL,
    [fecha_creacion]       DATETIME2 (0) NOT NULL,
    [usuario_creacion]     VARCHAR (50)  NOT NULL,
    [fecha_modificacion]   DATETIME2 (0) NOT NULL,
    [usuario_modificacion] VARCHAR (50)  NOT NULL,
    CONSTRAINT [PK_pedidos_asignacion_inventario] PRIMARY KEY CLUSTERED ([id] ASC) WITH (FILLFACTOR = 80)
);

