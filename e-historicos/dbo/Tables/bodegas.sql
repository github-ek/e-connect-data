CREATE TABLE [dbo].[bodegas] (
    [id_bodega]             BIGINT        IDENTITY (1, 1) NOT NULL,
    [codigo]                VARCHAR (20)  NOT NULL,
    [nombre]                VARCHAR (100) NOT NULL,
    [id_centro_costo]       BIGINT        NULL,
    [id_ciudad]             BIGINT        NULL,
    [direccion]             VARCHAR (150) NOT NULL,
    [id_direccion]          BIGINT        NULL,
    [ordinal]               INT           NOT NULL,
    [activo]                BIT           NOT NULL,
    [fecha_actualizacion]   DATETIME2 (0) NOT NULL,
    [usuario_actualizacion] VARCHAR (50)  NOT NULL,
    CONSTRAINT [PK_bodegas] PRIMARY KEY CLUSTERED ([id_bodega] ASC),
    CONSTRAINT [UK_bodegas_01] UNIQUE NONCLUSTERED ([codigo] ASC)
);

