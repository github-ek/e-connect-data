﻿CREATE TABLE [dbo].[cortes_saldos_inventario_cliente] (
    [id]                                 BIGINT          IDENTITY (1, 1) NOT NULL,
    [id_corte_saldo_inventario]          BIGINT          NOT NULL,
    [bodega_codigo_alterno]              VARCHAR (50)    NOT NULL,
    [producto_codigo]                    VARCHAR (50)    NOT NULL,
    [id_estado_conciliacion]             BIGINT          NOT NULL,
    [id_bodega]                          BIGINT          NOT NULL,
    [id_producto]                        BIGINT          NOT NULL,
    [unidades_cliente]                   INT             NOT NULL,
    [valor_unitario]                     INT             NOT NULL,
    [estado_conciliacion_codigo_alterno] VARCHAR (50)    NOT NULL,
    [unidad_medida_codigo_alterno]       VARCHAR (50)    NOT NULL,
    [cantidad_reportada]                 DECIMAL (12, 4) NOT NULL,
    [unidades_equivalentes]              INT             NOT NULL,
    [version]                            INT             CONSTRAINT [DF_cortes_saldos_inventario_cliente_version] DEFAULT ((0)) NOT NULL,
    [usuario_creacion]                   VARCHAR (50)    NOT NULL,
    [fecha_creacion]                     DATETIME2 (0)   NOT NULL,
    [usuario_modificacion]               VARCHAR (50)    NOT NULL,
    [fecha_modificacion]                 DATETIME2 (0)   NOT NULL,
    CONSTRAINT [PK_cortes_saldos_inventario_cliente] PRIMARY KEY NONCLUSTERED ([id] ASC),
    CONSTRAINT [FK_cortes_saldos_inventario_cliente_cortes_saldos_inventario] FOREIGN KEY ([id_corte_saldo_inventario]) REFERENCES [dbo].[cortes_saldos_inventario] ([id_corte_saldo_inventario]) ON DELETE CASCADE,
    CONSTRAINT [FK_cortes_saldos_inventario_cliente_estados_conciliacion] FOREIGN KEY ([id_estado_conciliacion]) REFERENCES [dbo].[estados_conciliacion] ([id_estado_conciliacion]),
    CONSTRAINT [UK_cortes_saldos_inventario_cliente_01] UNIQUE CLUSTERED ([id_corte_saldo_inventario] ASC, [bodega_codigo_alterno] ASC, [producto_codigo] ASC, [estado_conciliacion_codigo_alterno] ASC)
);
