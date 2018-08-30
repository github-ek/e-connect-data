CREATE TABLE [dbo].[suscripciones]
(
	[id_suscripcion] BIGINT IDENTITY (1, 1) NOT NULL,
    [suscripcion] VARCHAR(50) NOT NULL, 
    [id_externo] VARCHAR(100) NOT NULL, 
    [correlacion] VARCHAR(100) NOT NULL,
    [arg0]                         VARCHAR (100) NULL,
    [arg1]                         VARCHAR (100) NULL,
    [arg2]                         VARCHAR (100) NULL,
    [arg3]                         VARCHAR (100) NULL,
    [arg4]                         VARCHAR (100) NULL,
    [arg5]                         VARCHAR (100) NULL,
    [arg6]                         VARCHAR (100) NULL,
    [arg7]                         VARCHAR (100) NULL,
    [arg8]                         VARCHAR (100) NULL,
    [arg9]                         VARCHAR (100) NULL,
    [version]                      INT           CONSTRAINT [DF_suscripciones_version] DEFAULT ((0)) NOT NULL,
    [fecha_creacion]               DATETIME2 (0) NOT NULL DEFAULT SYSDATETIME(),
    [fecha_modificacion]           DATETIME2 (0) NOT NULL DEFAULT SYSDATETIME(),
    CONSTRAINT [PK_suscripciones] PRIMARY KEY CLUSTERED ([id_suscripcion] ASC),
    CONSTRAINT [UK_suscripciones_01] UNIQUE NONCLUSTERED ([suscripcion] ASC, [id_externo] ASC)
)
