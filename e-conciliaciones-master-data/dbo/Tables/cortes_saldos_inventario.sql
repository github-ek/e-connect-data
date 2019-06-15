CREATE TABLE [dbo].[cortes_saldos_inventario] (
    [id_corte_saldo_inventario] BIGINT        IDENTITY (1, 1) NOT NULL,
    [id_cliente]                BIGINT        NOT NULL,
    [fecha]                     DATE          NOT NULL,
    [estado]                    VARCHAR (50)  NOT NULL,
    [fecha_corte_cliente]       DATETIME2 (0) NOT NULL,
    [fecha_corte_opl]           DATETIME2 (0) NULL,
    [version]                   INT           CONSTRAINT [DF_cortes_saldos_inventario_version] DEFAULT ((0)) NOT NULL,
    [usuario_creacion]          VARCHAR (50)  NOT NULL,
    [fecha_creacion]            DATETIME2 (0) NOT NULL,
    [usuario_modificacion]      VARCHAR (50)  NOT NULL,
    [fecha_modificacion]        DATETIME2 (0) NOT NULL,
    CONSTRAINT [PK_cortes_saldos_inventario] PRIMARY KEY CLUSTERED ([id_corte_saldo_inventario] ASC),
    CONSTRAINT [UK_cortes_saldos_inventario_01] UNIQUE NONCLUSTERED ([id_cliente] ASC, [fecha] DESC)
);

