CREATE TABLE [dbo].[documentos_solicitudes] (
    [id_documento_solicitud]        BIGINT         NOT NULL,
    [integracion]                   VARCHAR (50)  NOT NULL,
    [id_externo]                    VARCHAR (100) NOT NULL,
    [correlacion]                   VARCHAR (100) NOT NULL,
    [cliente_codigo_alterno]        VARCHAR (50)  NOT NULL,
    [tipo_documento_codigo_alterno] VARCHAR (50)  NOT NULL,
    [numero_solicitud]              VARCHAR (20)  NOT NULL,
    [prefijo]                       VARCHAR (20)  NOT NULL,
    [numero_solicitud_sin_prefijo]  VARCHAR (20)  NOT NULL,
    [numero_documento]              VARCHAR (20)  NOT NULL,
    [prefijo_documento]             VARCHAR (20)  NOT NULL,
    [numero_documento_sin_prefijo]  VARCHAR (20)  NOT NULL,
    [id_cliente]                    BIGINT        NULL,
    [id_tipo_documento]             BIGINT        NULL,
    [id_solicitud]                  BIGINT        NULL,
    [version]                       INT           NOT NULL,
    [fecha_creacion]                DATETIME2 (0) NOT NULL,
    [fecha_modificacion]            DATETIME2 (0) NOT NULL,
    CONSTRAINT [PK_documentos_solicitudes] PRIMARY KEY CLUSTERED ([id_documento_solicitud] ASC)
);

