CREATE TABLE [dbo].[integraciones_actualizaciones] (
    [id] BIGINT        NOT NULL,
    [integracion]                  VARCHAR (50)  NOT NULL,
    [correlacion]                  VARCHAR (100) NOT NULL,
    [id_externo]                   VARCHAR (100) NOT NULL,
    [estado_integracion]           VARCHAR (50)  NOT NULL,
    [subestado_integracion]        VARCHAR (50)  NOT NULL,
    [estado_notificacion]          VARCHAR (50)  NULL,
    [entradas_en_cola]             INT           NOT NULL,
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
    [datos]                        VARCHAR (MAX) NULL,
    [version]                      INT           CONSTRAINT [DF_integraciones_actualizaciones_version] DEFAULT ((0)) NOT NULL,
    [fecha_creacion]               DATETIME2 (0) NOT NULL,
    [fecha_modificacion]           DATETIME2 (0) NOT NULL,
    [estado_externo]               VARCHAR (50)  NULL,
    CONSTRAINT [PK_integraciones_actualizaciones] PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [UK_integraciones_actualizaciones_01] UNIQUE NONCLUSTERED ([integracion] ASC, [id_externo] ASC)
);



