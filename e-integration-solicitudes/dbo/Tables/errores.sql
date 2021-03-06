﻿CREATE TABLE [dbo].[errores] (
    [id]                  BIGINT        NOT NULL,
    [integracion]         VARCHAR (50)  NOT NULL,
    [correlacion]         VARCHAR (100) NOT NULL,
    [id_externo]          VARCHAR (100) NOT NULL,
    [estado_notificacion] VARCHAR (50)  NOT NULL,
    [fecha_notificacion]  DATETIME2 (0) NULL,
    [codigo]              VARCHAR (100) NOT NULL,
    [mensaje]             VARCHAR (MAX) NOT NULL,
    [arg0]                VARCHAR (100) NULL,
    [arg1]                VARCHAR (100) NULL,
    [arg2]                VARCHAR (100) NULL,
    [arg3]                VARCHAR (100) NULL,
    [arg4]                VARCHAR (100) NULL,
    [arg5]                VARCHAR (100) NULL,
    [arg6]                VARCHAR (100) NULL,
    [arg7]                VARCHAR (100) NULL,
    [arg8]                VARCHAR (100) NULL,
    [arg9]                VARCHAR (100) NULL,
    [version]             INT           CONSTRAINT [DF_integraciones_actualizaciones_errores_version] DEFAULT ((0)) NOT NULL,
    [fecha_creacion]      DATETIME2 (0) NOT NULL,
    [fecha_modificacion]  DATETIME2 (0) NOT NULL,
    CONSTRAINT [PK_errores] PRIMARY KEY CLUSTERED ([id] ASC)
);





