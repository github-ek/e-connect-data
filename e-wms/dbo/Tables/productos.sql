CREATE TABLE [dbo].[productos] (
    [id]                 BIGINT         IDENTITY (1, 1) NOT NULL,
    [operacion]          VARCHAR (1)    NOT NULL,
    [fecha_creacion]     DATETIME2 (0)  NOT NULL,
    [fecha_modificacion] DATETIME2 (0)  NOT NULL,
    [id_producto]        BIGINT         NOT NULL,
    [id_cliente]         BIGINT         NOT NULL,
    [prt_client_id]      NVARCHAR (32)  NOT NULL,
    [prtnum]             NVARCHAR (50)  NOT NULL,
    [nombre]             NVARCHAR (250) NOT NULL,
    [dept_cod]           NVARCHAR (5)   NOT NULL,
    CONSTRAINT [PK_productos] PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [UK_productos_01] UNIQUE NONCLUSTERED ([prt_client_id] ASC, [prtnum] ASC)
);



