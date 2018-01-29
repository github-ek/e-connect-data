﻿CREATE TABLE [dbo].[productos_medidas] (
    [id_producto]          BIGINT          NOT NULL,
    [id_bodega]            BIGINT          NOT NULL,
    [id_unidad_medida]     BIGINT          NOT NULL,
    [huella_codigo]        VARCHAR (50)    NOT NULL,
    [nivel]                INT             NOT NULL,
    [factor_conversion]    INT             NOT NULL,
    [largo]                DECIMAL (12, 4) NOT NULL,
    [ancho]                DECIMAL (12, 4) NOT NULL,
    [alto]                 DECIMAL (12, 4) NOT NULL,
    [peso]                 DECIMAL (12, 4) NOT NULL,
    [cas_flg]              BIT             NOT NULL,
    [pal_flg]              BIT             NOT NULL,
    [rcv_flg]              BIT             NOT NULL,
    [version]              INT             NOT NULL DEFAULT 0,
    [usuario_creacion]     VARCHAR (50)    NOT NULL,
    [fecha_creacion]       DATETIME2 (0)   NOT NULL,
    [usuario_modificacion] VARCHAR (50)    NOT NULL,
    [fecha_modificacion]   DATETIME2 (0)   NOT NULL,
    CONSTRAINT [PK_productos_medidas] PRIMARY KEY CLUSTERED ([id_producto] ASC, [id_bodega] ASC, [id_unidad_medida] ASC),
    CONSTRAINT [FK_productos_medidas_bodegas] FOREIGN KEY ([id_bodega]) REFERENCES [dbo].[bodegas] ([id_bodega]),
    CONSTRAINT [FK_productos_medidas_productos] FOREIGN KEY ([id_producto]) REFERENCES [dbo].[productos] ([id_producto])
);

