﻿CREATE TABLE [dbo].[ordenes_transporte_lineas] (
    [id]                          BIGINT          NOT NULL,
    [id_orden_transporte]         BIGINT          NOT NULL,
    [numero_linea]                INT             NOT NULL,
    [id_producto]                 BIGINT          NOT NULL,
    [producto_codigo]             VARCHAR (50)    NOT NULL,
    [producto_nombre]             VARCHAR (250)   NOT NULL,
    [id_tipo_naturaleza_producto] BIGINT          NULL,
    [id_tipo_producto]            BIGINT          NULL,
    [producto_codigo_ministerio]  VARCHAR (50)    NOT NULL,
    [id_unidad_medida]            BIGINT          NOT NULL,
    [unidades]                    INT             NOT NULL,
    [factor_conversion]           DECIMAL (12, 4) NOT NULL,
    [id_unidad_medida_embalaje]   BIGINT          NOT NULL,
    [unidades_embalaje]           DECIMAL (12, 4) NOT NULL,
    [peso_unitario]               DECIMAL (12, 4) NULL,
    [peso_bruto_unitario]         DECIMAL (12, 4) NULL,
    [volumen_unitario]            DECIMAL (12, 4) NULL,
    [peso_embalaje]               DECIMAL (12, 4) NULL,
    [peso_bruto_embalaje]         DECIMAL (12, 4) NULL,
    [volumen_embalaje]            DECIMAL (12, 4) NULL,
    [valor_declarado_unitario]    DECIMAL (12, 2) NULL,
    [predistribucion]             VARCHAR (200)   NOT NULL,
    [version]                     INT             NOT NULL,
    [usuario_creacion]            VARCHAR (50)    NOT NULL,
    [fecha_creacion]              DATETIME2 (0)   NOT NULL,
    [usuario_modificacion]        VARCHAR (50)    NOT NULL,
    [fecha_modificacion]          DATETIME2 (0)   NOT NULL,
    CONSTRAINT [PK_ordenes_transporte_lineas] PRIMARY KEY CLUSTERED ([id] ASC) WITH (FILLFACTOR = 80),
    CONSTRAINT [FK_ordenes_transporte_lineas_ordenes_transporte] FOREIGN KEY ([id_orden_transporte]) REFERENCES [dbo].[ordenes_transporte] ([id_orden_transporte]),
    CONSTRAINT [FK_ordenes_transporte_lineas_productos] FOREIGN KEY ([id_producto]) REFERENCES [dbo].[productos] ([id_producto]),
    CONSTRAINT [FK_ordenes_transporte_lineas_tipos_naturaleza_producto] FOREIGN KEY ([id_tipo_naturaleza_producto]) REFERENCES [dbo].[tipos_naturaleza_producto] ([id_tipo_naturaleza_producto]),
    CONSTRAINT [FK_ordenes_transporte_lineas_tipos_producto] FOREIGN KEY ([id_tipo_producto]) REFERENCES [dbo].[tipos_producto] ([id_tipo_producto]),
    CONSTRAINT [FK_ordenes_transporte_lineas_unidades_medida] FOREIGN KEY ([id_unidad_medida]) REFERENCES [dbo].[unidades_medida] ([id_unidad_medida]),
    CONSTRAINT [FK_ordenes_transporte_lineas_unidades_medida_embalaje] FOREIGN KEY ([id_unidad_medida_embalaje]) REFERENCES [dbo].[unidades_medida] ([id_unidad_medida]),
    CONSTRAINT [UK_ordenes_transporte_lineas_01] UNIQUE NONCLUSTERED ([id_orden_transporte] ASC, [numero_linea] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_ordenes_transporte_lineas]
    ON [dbo].[ordenes_transporte_lineas]([id] ASC);

