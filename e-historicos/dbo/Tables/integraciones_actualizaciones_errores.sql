CREATE TABLE [dbo].[integraciones_actualizaciones_errores] (
    [id]                           BIGINT        IDENTITY (1, 1) NOT NULL,
    [id_integracion_actualizacion] BIGINT        NOT NULL,
    [codigo]                       VARCHAR (50)  NOT NULL,
    [mensaje]                      VARCHAR (MAX) NOT NULL,
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
    [version]                      INT           CONSTRAINT [DF_integraciones_actualizaciones_errores_version] DEFAULT ((0)) NOT NULL,
    [fecha_creacion]               DATETIME2 (0) NOT NULL,
    [fecha_modificacion]           DATETIME2 (0) NOT NULL,
    CONSTRAINT [PK_integraciones_actualizaciones_errores] PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [FK_integraciones_actualizaciones_errores_integraciones_actualizaciones] FOREIGN KEY ([id_integracion_actualizacion]) REFERENCES [dbo].[integraciones_actualizaciones] ([id_integracion_actualizacion]) ON DELETE CASCADE
);

