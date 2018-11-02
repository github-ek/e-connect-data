CREATE TABLE [dbo].[clientes] (
    [id_cliente]              BIGINT        NOT NULL,
    [codigo]                  VARCHAR (32)  NOT NULL,
    [nombre]                  VARCHAR (100) NOT NULL,
    [tipo_identificacion]     VARCHAR (20)  CONSTRAINT [DF__clientes__tipo_i__15702A09] DEFAULT ('NI') NOT NULL,
    [numero_identificacion]   VARCHAR (20)  NOT NULL,
    [digito_verificacion]     VARCHAR (1)   NOT NULL,
    [id_empresa]              BIGINT        NOT NULL,
    [codigo_alterno_wms]      VARCHAR (32)  NOT NULL,
    [habilitado_conciliacion] BIT           CONSTRAINT [DF_clientes_habilitado_conciliacion] DEFAULT ((0)) NOT NULL,
    [activo]                  BIT           CONSTRAINT [DF__clientes__activo__16644E42] DEFAULT ((1)) NOT NULL,
    [version]                 INT           CONSTRAINT [DF__clientes__versio__1758727B] DEFAULT ((0)) NOT NULL,
    [usuario_creacion]        VARCHAR (50)  NOT NULL,
    [fecha_creacion]          DATETIME2 (0) NOT NULL,
    [usuario_modificacion]    VARCHAR (50)  NOT NULL,
    [fecha_modificacion]      DATETIME2 (0) NOT NULL,
    CONSTRAINT [PK_clientes] PRIMARY KEY CLUSTERED ([id_cliente] ASC),
    CONSTRAINT [FK_clientes_empresas] FOREIGN KEY ([id_empresa]) REFERENCES [dbo].[empresas] ([id_empresa]),
    CONSTRAINT [UK_clientes_01] UNIQUE NONCLUSTERED ([codigo] ASC),
    CONSTRAINT [UK_clientes_02] UNIQUE NONCLUSTERED ([nombre] ASC),
    CONSTRAINT [UK_clientes_03] UNIQUE NONCLUSTERED ([numero_identificacion] ASC)
);



