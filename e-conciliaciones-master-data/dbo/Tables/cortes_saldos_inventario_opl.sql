﻿CREATE TABLE [dbo].[cortes_saldos_inventario_opl] (
    [id]                           BIGINT        IDENTITY (1, 1) NOT NULL,
    [id_corte_saldo_inventario]    BIGINT        NOT NULL,
    [bodega_codigo]                VARCHAR (32)  NOT NULL,
    [producto_codigo]              VARCHAR (50)  NOT NULL,
    [id_estado_conciliacion]       BIGINT        NOT NULL,
    [id_bodega]                    BIGINT        NOT NULL,
    [id_producto]                  BIGINT        NOT NULL,
    [unidades]                     INT           NOT NULL,
    [unidades_wms]                 INT           NOT NULL,
    [unidades_en_proceso_despacho] INT           NOT NULL,
    [unidades_en_proceso_recibo]   INT           NOT NULL,
    [id_estado_inventario]         VARCHAR (50)  NOT NULL,
    [prtstyle]                     VARCHAR (30)  NOT NULL,
    [version]                      INT           CONSTRAINT [DF_cortes_saldos_inventario_opl_version] DEFAULT ((0)) NOT NULL,
    [usuario_creacion]             VARCHAR (50)  NOT NULL,
    [fecha_creacion]               DATETIME2 (0) NOT NULL,
    [usuario_modificacion]         VARCHAR (50)  NOT NULL,
    [fecha_modificacion]           DATETIME2 (0) NOT NULL,
    CONSTRAINT [PK_cortes_saldos_inventario_opl] PRIMARY KEY NONCLUSTERED ([id] ASC),
    CONSTRAINT [FK_cortes_saldos_inventario_opl_cortes_saldos_inventario] FOREIGN KEY ([id_corte_saldo_inventario]) REFERENCES [dbo].[cortes_saldos_inventario] ([id_corte_saldo_inventario]) ON DELETE CASCADE,
    CONSTRAINT [FK_cortes_saldos_inventario_opl_estados_conciliacion] FOREIGN KEY ([id_estado_conciliacion]) REFERENCES [dbo].[estados_conciliacion] ([id_estado_conciliacion]),
    CONSTRAINT [UK_cortes_saldos_inventario_opl_01] UNIQUE CLUSTERED ([id_corte_saldo_inventario] ASC, [bodega_codigo] ASC, [producto_codigo] ASC, [id_estado_inventario] ASC)
);

