CREATE TABLE [dbo].[productos] (
    [id]                 BIGINT         IDENTITY (1, 1) NOT NULL,
    [operacion]          NVARCHAR (50)  NOT NULL,
    [fecha_creacion]     DATETIME       NOT NULL,
    [fecha_modificacion] DATETIME       NOT NULL,
    [id_producto]        BIGINT         NOT NULL,
    [prt_client_id]      NVARCHAR (32)  NOT NULL,
    [prtnum]             NVARCHAR (50)  NOT NULL,
    [nombre]             NVARCHAR (250) NOT NULL,
    CONSTRAINT [PK_productos] PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [UK_productos_01] UNIQUE NONCLUSTERED ([prt_client_id] ASC, [prtnum] ASC)
);

