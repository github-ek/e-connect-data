﻿CREATE TABLE [dbo].[solicitudes_lineas] (
    [id]                               BIGINT        IDENTITY (1, 1) NOT NULL,
    [id_solicitud]                     BIGINT        NOT NULL,
    [numero_linea]                     INT           NOT NULL,
    [id_producto]                      BIGINT        NOT NULL,
    [producto_codigo]                  VARCHAR (50)  NOT NULL,
    [producto_nombre]                  VARCHAR (250)  NOT NULL,
    [id_estado_inventario]             VARCHAR (4)  NOT NULL,
    [id_unidad_medida]                 BIGINT        NOT NULL,
    [cantidad]                         INT           NOT NULL,
    [lote]                             VARCHAR (30)  NOT NULL, 
    [valor_unitario_declarado]         DECIMAL(10,2) NOT NULL, 

    [cantidad_solicitada]              INT           NOT NULL,
    [id_unidad_medida_solicitada]      BIGINT        NOT NULL,
    [unidad_medida_solicitada_codigo_alterno]     VARCHAR (50)  NOT NULL,
    [bodega_codigo_alterno]            VARCHAR (50)  NOT NULL,
    [estado_inventario_codigo_alterno] VARCHAR (50)  NOT NULL,
    [bodega_traslado_codigo_alterno]            VARCHAR (50)  NOT NULL,
    [estado_traslado_inventario_codigo_alterno] VARCHAR (50)  NOT NULL,

    [version]                          INT           NOT NULL DEFAULT 0,
    [fecha_creacion]                   DATETIME2 (0) NOT NULL,
    [usuario_creacion]                 VARCHAR (50)  NOT NULL,
    [fecha_modificacion]               DATETIME2 (0) NOT NULL,
    [usuario_modificacion]             VARCHAR (50)  NOT NULL,
    CONSTRAINT [PK_solicitudes_lineas] PRIMARY KEY CLUSTERED ([id] ASC) WITH (FILLFACTOR = 80),
    CONSTRAINT [FK_solicitudes_lineas_solicitudes] FOREIGN KEY ([id_solicitud]) REFERENCES [dbo].[solicitudes] ([id_solicitud]),
    CONSTRAINT [FK_solicitudes_lineas_productos] FOREIGN KEY ([id_producto]) REFERENCES [dbo].[productos] ([id_producto]),
    CONSTRAINT [FK_solicitudes_lineas_estados_inventario] FOREIGN KEY ([id_estado_inventario]) REFERENCES [dbo].[estados_inventario] ([id_estado_inventario]),
    CONSTRAINT [FK_solicitudes_lineas_unidades_medida] FOREIGN KEY ([id_unidad_medida]) REFERENCES [dbo].[unidades_medida] ([id_unidad_medida]),
    CONSTRAINT [FK_solicitudes_lineas_unidades_medida_solicitada] FOREIGN KEY ([id_unidad_medida_solicitada]) REFERENCES [dbo].[unidades_medida] ([id_unidad_medida]),

);

