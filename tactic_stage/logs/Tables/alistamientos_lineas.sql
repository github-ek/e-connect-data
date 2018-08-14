CREATE TABLE [logs].[alistamientos_lineas] (
    [id]                   BIGINT        IDENTITY (1, 1) NOT NULL,
    [id_alistamiento]      BIGINT        NOT NULL,
    [ordlin]               VARCHAR (10)  NOT NULL,
    [numero_item]          INT           NOT NULL,
    [producto_codigo]      VARCHAR (50)  NOT NULL,
    [id_producto]          BIGINT        NOT NULL,
    [id_estado_inventario] VARCHAR (4)   NOT NULL,
    [id_unidad_medida]     BIGINT        NULL,
    [cantidad_solicitada]  INT           NOT NULL,
    [cantidad_alistada]    INT           NOT NULL,
    [cantidad_despachada]  INT           NOT NULL,
    [cantidad_cancelada]   INT           NOT NULL,
    [usuario_creacion]     VARCHAR (50)  NOT NULL,
    [fecha_creacion]       DATETIME2 (0) NOT NULL,
    [usuario_modificacion] VARCHAR (50)  NOT NULL,
    [fecha_modificacion]   DATETIME2 (0) NOT NULL,
    CONSTRAINT [PK_alistamientos_lineas] PRIMARY KEY CLUSTERED ([id] ASC)
);

