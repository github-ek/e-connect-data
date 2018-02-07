CREATE TABLE [dbo].[bodegas] (
    [id]                 BIGINT        IDENTITY (1, 1) NOT NULL,
    [operacion]          VARCHAR (1)   NOT NULL,
    [fecha_creacion]     DATETIME2 (0) NOT NULL,
    [fecha_modificacion] DATETIME2 (0) NOT NULL,
    [id_bodega]          BIGINT        NOT NULL,
    [wh_id]              NVARCHAR (32) NOT NULL,
    [nombre]             VARCHAR (100) NOT NULL,
    [id_ciudad]          BIGINT        NOT NULL,
    [ciudad_nombre]      VARCHAR (100) NOT NULL,
    CONSTRAINT [PK_bodegas] PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [UK_bodegas_01] UNIQUE NONCLUSTERED ([wh_id] ASC)
);



