CREATE TABLE [dbo].[suscripciones] (
    [id]                 BIGINT        NOT NULL,
    [suscripcion]        VARCHAR (50)  NOT NULL,
    [id_externo]         VARCHAR (100) NOT NULL,
    [estado_suscripcion] VARCHAR (50)  NOT NULL,
    [arg0]               VARCHAR (100) NULL,
    [arg1]               VARCHAR (100) NULL,
    [arg2]               VARCHAR (100) NULL,
    [arg3]               VARCHAR (100) NULL,
    [arg4]               VARCHAR (100) NULL,
    [arg5]               VARCHAR (100) NULL,
    [arg6]               VARCHAR (100) NULL,
    [arg7]               VARCHAR (100) NULL,
    [arg8]               VARCHAR (100) NULL,
    [arg9]               VARCHAR (100) NULL,
    [version]            INT           CONSTRAINT [DF_suscripciones_version] DEFAULT ((0)) NOT NULL,
    [fecha_creacion]     DATETIME2 (0) CONSTRAINT [DF__suscripci__fecha__1920BF5C] DEFAULT (sysdatetime()) NOT NULL,
    [fecha_modificacion] DATETIME2 (0) CONSTRAINT [DF__suscripci__fecha__1A14E395] DEFAULT (sysdatetime()) NOT NULL,
    CONSTRAINT [PK_suscripciones] PRIMARY KEY CLUSTERED ([id] ASC) WITH (FILLFACTOR = 80),
    CONSTRAINT [UK_suscripciones_01] UNIQUE NONCLUSTERED ([suscripcion] ASC, [id_externo] ASC) WITH (FILLFACTOR = 80)
);

