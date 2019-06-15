CREATE TABLE [dbo].[terceros] (
    [id_tercero]            BIGINT        IDENTITY (1, 1) NOT NULL,
    [id_cliente]            BIGINT        NOT NULL,
    [tipo_identificacion]   VARCHAR (20)  NOT NULL,
    [numero_identificacion] VARCHAR (20)  NOT NULL,
    [nombre]                VARCHAR (100) NOT NULL,
    [activo]                BIT           NOT NULL,
    [version]               INT           NOT NULL,
    [usuario_creacion]      VARCHAR (50)  NOT NULL,
    [fecha_creacion]        DATETIME2 (0) NOT NULL,
    [usuario_modificacion]  VARCHAR (50)  NOT NULL,
    [fecha_modificacion]    DATETIME2 (0) NOT NULL,
    CONSTRAINT [PK_terceros] PRIMARY KEY CLUSTERED ([id_tercero] ASC),
    CONSTRAINT [FK_terceros_clientes] FOREIGN KEY ([id_cliente]) REFERENCES [dbo].[clientes] ([id_cliente]),
    CONSTRAINT [FK_terceros_tipos_identificacion] FOREIGN KEY ([tipo_identificacion]) REFERENCES [dbo].[tipos_identificacion] ([id_tipo_identificacion])
);

