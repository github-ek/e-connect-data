﻿CREATE TABLE [dbo].[solicitudes_lineas] (
    [id]                                        BIGINT          NOT NULL,
    [id_solicitud]                              BIGINT          NOT NULL,
    [numero_linea]                              INT             NOT NULL,
    [numero_linea_externo]                      VARCHAR (50)    NOT NULL,
    [numero_sublinea_externo]                   VARCHAR (50)    NOT NULL,
    [id_producto]                               BIGINT          NOT NULL,
    [producto_codigo]                           VARCHAR (50)    NOT NULL,
    [producto_nombre]                           VARCHAR (200)   NOT NULL,
    [id_estado_inventario]                      VARCHAR (4)     NOT NULL,
    [unidades_solicitadas]                      INT             NOT NULL,
    [id_unidad_medida]                          BIGINT          NULL,
    [lote]                                      VARCHAR (30)    CONSTRAINT [DF__tmp_ms_xx___lote__1A1FD08D] DEFAULT ('') NOT NULL,
    [predistribucion]                           VARCHAR (200)   NOT NULL,
    [valor_unitario_declarado]                  DECIMAL (10, 2) NULL,
    [id_unidad_medida_solicitada]               BIGINT          NULL,
    [unidad_medida_solicitada_codigo_alterno]   VARCHAR (50)    NOT NULL,
    [cantidad_solicitada]                       INT             NOT NULL,
    [factor_conversion]                         INT             NOT NULL,
    [bodega_codigo_alterno]                     VARCHAR (50)    NOT NULL,
    [estado_inventario_codigo_alterno]          VARCHAR (50)    NOT NULL,
    [bodega_traslado_codigo_alterno]            VARCHAR (50)    CONSTRAINT [DF__tmp_ms_xx__bodeg__1B13F4C6] DEFAULT ('') NOT NULL,
    [estado_traslado_inventario_codigo_alterno] VARCHAR (50)    CONSTRAINT [DF__tmp_ms_xx__estad__1C0818FF] DEFAULT ('') NOT NULL,
    [version]                                   INT             CONSTRAINT [DF__tmp_ms_xx__versi__1CFC3D38] DEFAULT ((0)) NOT NULL,
    [usuario_creacion]                          VARCHAR (50)    NOT NULL,
    [fecha_creacion]                            DATETIME2 (0)   NOT NULL,
    [usuario_modificacion]                      VARCHAR (50)    NOT NULL,
    [fecha_modificacion]                        DATETIME2 (0)   NOT NULL,
    CONSTRAINT [PK_solicitudes_lineas] PRIMARY KEY CLUSTERED ([id] ASC) WITH (FILLFACTOR = 80),
    CONSTRAINT [FK_solicitudes_lineas_estados_inventario] FOREIGN KEY ([id_estado_inventario]) REFERENCES [dbo].[estados_inventario] ([id_estado_inventario]),
    CONSTRAINT [FK_solicitudes_lineas_productos] FOREIGN KEY ([id_producto]) REFERENCES [dbo].[productos] ([id_producto]),
    CONSTRAINT [FK_solicitudes_lineas_solicitudes] FOREIGN KEY ([id_solicitud]) REFERENCES [dbo].[solicitudes] ([id_solicitud]) ON DELETE CASCADE,
    CONSTRAINT [FK_solicitudes_lineas_unidades_medida] FOREIGN KEY ([id_unidad_medida]) REFERENCES [dbo].[unidades_medida] ([id_unidad_medida]),
    CONSTRAINT [FK_solicitudes_lineas_unidades_medida_solicitada] FOREIGN KEY ([id_unidad_medida_solicitada]) REFERENCES [dbo].[unidades_medida] ([id_unidad_medida]),
    CONSTRAINT [UK_solicitudes_lineas_01] UNIQUE NONCLUSTERED ([id_solicitud] ASC, [numero_linea] ASC)
);





