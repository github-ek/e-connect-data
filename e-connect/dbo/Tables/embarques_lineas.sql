﻿CREATE TABLE [dbo].[embarques_lineas]
(
    [id]                       BIGINT          NOT NULL,
    [id_embarque]              BIGINT NOT NULL,
    [id_cliente]               BIGINT          NOT NULL,
    [numero_orden]             VARCHAR(35)   NOT NULL,
    [id_orden_alistamiento]    BIGINT          NULL,
    [numero_linea]             INT             NOT NULL,

    [id_producto]              BIGINT          NOT NULL,
    [producto_codigo]          VARCHAR (50)    NOT NULL,
    [id_unidad_medida]         BIGINT          NOT NULL,

    [unidades_despachadas]     INT             NOT NULL,

    [lote]                     VARCHAR (30)    NOT NULL,

    [version]                  INT           NOT NULL DEFAULT 0,
    [usuario_creacion]         VARCHAR (50)  NOT NULL DEFAULT '',
    [fecha_creacion]           DATETIME2 (0) NOT NULL,
    [usuario_modificacion]     VARCHAR (50)  NOT NULL DEFAULT '',
    [fecha_modificacion]       DATETIME2 (0) NOT NULL, 
    CONSTRAINT [PK_embarques_lineas] PRIMARY KEY CLUSTERED ([id] ASC) WITH (FILLFACTOR = 80),
    CONSTRAINT [FK_embarques_lineas_embarques] FOREIGN KEY ([id_embarque]) REFERENCES [dbo].[embarques] ([id_embarque]),
    CONSTRAINT [FK_embarques_lineas_clientes] FOREIGN KEY ([id_cliente]) REFERENCES [dbo].[clientes] ([id_cliente]),
    CONSTRAINT [FK_embarques_lineas_ordenes_alistamiento] FOREIGN KEY ([id_orden_alistamiento]) REFERENCES [dbo].[ordenes_alistamiento] ([id_orden_alistamiento]),
    CONSTRAINT [FK_embarques_lineas_productos] FOREIGN KEY ([id_producto]) REFERENCES [dbo].[productos] ([id_producto]),
    CONSTRAINT [FK_embarques_lineas_unidades_medida] FOREIGN KEY ([id_unidad_medida]) REFERENCES [dbo].[unidades_medida] ([id_unidad_medida]), 
)ON [PRIMARY]
