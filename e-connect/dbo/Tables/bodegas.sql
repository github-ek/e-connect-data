CREATE TABLE [dbo].[bodegas] (
    [id_bodega]            BIGINT        NOT NULL,
    [codigo]               VARCHAR (32)  NOT NULL,
    [nombre]               VARCHAR (100) NOT NULL,
    [id_ciudad]            BIGINT        NULL,
    [direccion]            VARCHAR (150) NOT NULL,
    [id_direccion]         BIGINT        NULL,
    [ordinal]              INT           NOT NULL,
    [activo]               BIT           NOT NULL,
    [version]              INT           NOT NULL,
    [usuario_creacion]     VARCHAR (50)  NOT NULL,
    [fecha_creacion]       DATETIME2 (0) NOT NULL,
    [usuario_modificacion] VARCHAR (50)  NOT NULL,
    [fecha_modificacion]   DATETIME2 (0) NOT NULL,
    CONSTRAINT [PK_bodegas] PRIMARY KEY CLUSTERED ([id_bodega] ASC),
    CONSTRAINT [FK_bodegas_ciudades] FOREIGN KEY ([id_ciudad]) REFERENCES [dbo].[ciudades] ([id_ciudad]),
    CONSTRAINT [FK_bodegas_direcciones] FOREIGN KEY ([id_direccion]) REFERENCES [dbo].[direcciones] ([id_direccion]),
    CONSTRAINT [UK_bodegas_01] UNIQUE NONCLUSTERED ([codigo] ASC)
);



