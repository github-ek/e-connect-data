CREATE TABLE [dbo].[bodegas_virtuales] (
    [id_bodega_virtual]    BIGINT        NOT NULL,
    [id_cliente]           BIGINT        NOT NULL,
    [codigo]               VARCHAR (32)  NOT NULL,
    [nombre]               VARCHAR (100) NOT NULL,
    [id_ciudad]            BIGINT        NOT NULL,
    [direccion]            VARCHAR (150) NOT NULL,
    [id_direccion]         BIGINT        NULL,
    [contacto]             VARCHAR (50)  NOT NULL,
    [telefono]             VARCHAR (50)  NOT NULL,
    [ordinal]              INT           NOT NULL,
    [activo]               BIT           NOT NULL,
    [version]              INT           NOT NULL,
    [usuario_creacion]     VARCHAR (50)  NOT NULL,
    [fecha_creacion]       DATETIME2 (0) NOT NULL,
    [usuario_modificacion] VARCHAR (50)  NOT NULL,
    [fecha_modificacion]   DATETIME2 (0) NOT NULL,
    CONSTRAINT [PK_bodegas_virtuales] PRIMARY KEY CLUSTERED ([id_bodega_virtual] ASC),
    CONSTRAINT [FK_bodegas_virtuales_ciudades] FOREIGN KEY ([id_ciudad]) REFERENCES [dbo].[ciudades] ([id_ciudad]),
    CONSTRAINT [FK_bodegas_virtuales_clientes] FOREIGN KEY ([id_cliente]) REFERENCES [dbo].[clientes] ([id_cliente]),
    CONSTRAINT [FK_bodegas_virtuales_direcciones] FOREIGN KEY ([id_direccion]) REFERENCES [dbo].[direcciones] ([id_direccion]),
    CONSTRAINT [UK_bodegas_virtuales_01] UNIQUE NONCLUSTERED ([id_cliente] ASC, [codigo] ASC)
);

