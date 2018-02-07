CREATE TABLE [dbo].[clientes] (
    [id]                    BIGINT        IDENTITY (1, 1) NOT NULL,
    [operacion]             VARCHAR (1)   NOT NULL,
    [fecha_creacion]        DATETIME2 (0) NOT NULL,
    [fecha_modificacion]    DATETIME2 (0) NOT NULL,
    [id_cliente]            BIGINT        NOT NULL,
    [client_id]             NVARCHAR (32) NOT NULL,
    [codigo]                VARCHAR (32)  NOT NULL,
    [nombre]                VARCHAR (100) NOT NULL,
    [numero_identificacion] VARCHAR (20)  NOT NULL,
    CONSTRAINT [PK_clientes] PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [UK_clientes_01] UNIQUE NONCLUSTERED ([client_id] ASC)
);



