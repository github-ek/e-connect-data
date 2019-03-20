CREATE TABLE [dbo].[ordenes_alistamiento_lotes] (
    [id]                    BIGINT        NOT NULL,
    [id_orden_alistamiento] BIGINT        NOT NULL,
    [numero_linea]          INT           NOT NULL,
    [unidades_alistadas]    INT           NOT NULL,
    [lote]                  VARCHAR (25)  NOT NULL,
    [id_estado_inventario]  VARCHAR (4)   NOT NULL,
    [fecha_vencimiento]     DATETIME2 (0) NULL,
    [orgcod]                VARCHAR (25)  NOT NULL,
    [version]               INT           NOT NULL,
    [usuario_creacion]      VARCHAR (50)  NOT NULL,
    [fecha_creacion]        DATETIME2 (0) NOT NULL,
    [usuario_modificacion]  VARCHAR (50)  NOT NULL,
    [fecha_modificacion]    DATETIME2 (0) NOT NULL,
    CONSTRAINT [PK_ordenes_alistamiento_lotes] PRIMARY KEY CLUSTERED ([id] ASC) WITH (FILLFACTOR = 80)
);

