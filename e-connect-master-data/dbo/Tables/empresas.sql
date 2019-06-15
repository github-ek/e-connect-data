CREATE TABLE [dbo].[empresas] (
    [id_empresa]            BIGINT        NOT NULL,
    [codigo]                VARCHAR (20)  NOT NULL,
    [nombre]                VARCHAR (100) NOT NULL,
    [tipo_identificacion]   VARCHAR (20)  NOT NULL,
    [numero_identificacion] VARCHAR (20)  NOT NULL,
    [digito_verificacion]   VARCHAR (1)   NOT NULL,
    [ordinal]               INT           NOT NULL,
    [activo]                BIT           NOT NULL,
    [version]               INT           NOT NULL,
    [usuario_creacion]      VARCHAR (50)  NOT NULL,
    [fecha_creacion]        DATETIME2 (0) NOT NULL,
    [usuario_modificacion]  VARCHAR (50)  NOT NULL,
    [fecha_modificacion]    DATETIME2 (0) NOT NULL,
    CONSTRAINT [PK_empresas] PRIMARY KEY CLUSTERED ([id_empresa] ASC),
    CONSTRAINT [UK_empresas_01] UNIQUE NONCLUSTERED ([codigo] ASC),
    CONSTRAINT [UK_empresas_02] UNIQUE NONCLUSTERED ([nombre] ASC),
    CONSTRAINT [UK_empresas_03] UNIQUE NONCLUSTERED ([numero_identificacion] ASC)
);

