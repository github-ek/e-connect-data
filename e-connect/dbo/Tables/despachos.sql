CREATE TABLE [dbo].[despachos] (
    [id_despacho]                     BIGINT        NOT NULL,
    [numero_embarque]                 VARCHAR (30)  NOT NULL,
    [estado]                          VARCHAR (50)  NOT NULL,
    [id_bodega]                       BIGINT        NOT NULL,
    [numero_remolque]                 VARCHAR (20)  NOT NULL,
    [placa]                           VARCHAR (20)  NOT NULL,
    [conductor_numero_identificacion] VARCHAR (20)  NOT NULL,
    [conductor_nombre]                VARCHAR (100) NOT NULL,
    [fecha_arribo]                    DATETIME2 (0) NOT NULL,
    [fecha_cierre]                    DATETIME2 (0) NOT NULL,
    [fecha_despacho]                  DATETIME2 (0) NOT NULL,
    [version]                         INT           DEFAULT ((0)) NOT NULL,
    [usuario_creacion]                VARCHAR (50)  NOT NULL,
    [fecha_creacion]                  DATETIME2 (0) NOT NULL,
    [usuario_modificacion]            VARCHAR (50)  NOT NULL,
    [fecha_modificacion]              DATETIME2 (0) NOT NULL,
    CONSTRAINT [PK_despachos] PRIMARY KEY CLUSTERED ([id_despacho] ASC),
    CONSTRAINT [FK_despachos_bodegas] FOREIGN KEY ([id_bodega]) REFERENCES [dbo].[bodegas] ([id_bodega])
);

