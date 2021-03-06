﻿CREATE TABLE [dbo].[mensajes_remesas_silogtran] (
    [id_mensaje]                       BIGINT        IDENTITY (1, 1) NOT NULL,
    [estado]                           VARCHAR (50)  NOT NULL,
    [fecha_envio]                      DATETIME2 (0) NULL,
    [fecha_confirmacion_envio]         DATETIME2 (0) NULL,
    [id_remesa]                        BIGINT        NOT NULL,
    [id_bodega]                        BIGINT        NOT NULL,
    [tipo_remesa]                      VARCHAR (50)  NOT NULL,
    [tipo_documento]                   VARCHAR (1)   NOT NULL,
    [numero_solicitud]                 VARCHAR (35)  NOT NULL,
    [placa_remesa]                     VARCHAR (20)  NOT NULL,
    [fecha_compromiso]                 VARCHAR (10)  NOT NULL,
    [hora_compromiso]                  VARCHAR (8)   NOT NULL,
    [linea_negocio_codigo]             VARCHAR (20)  NOT NULL,
    [cliente_codigo]                   VARCHAR (50)  NOT NULL,
    [cliente_division]                 INT           NOT NULL,
    [remitente_nombre]                 VARCHAR (100) NOT NULL,
    [remitente_tipo_documento]         VARCHAR (20)  NOT NULL,
    [remitente_numero_documento]       VARCHAR (20)  NOT NULL,
    [remitente_direccion]              VARCHAR (150) NOT NULL,
    [remitente_telefonos]              VARCHAR (100) NOT NULL,
    [remitente_contacto]               VARCHAR (100) NOT NULL,
    [remitente_ciudad_codigo]          VARCHAR (50)  NOT NULL,
    [remitente_departamento_codigo]    VARCHAR (50)  NOT NULL,
    [remitente_zona]                   VARCHAR (1)   NOT NULL,
    [remitente_cx]                     VARCHAR (20)  NOT NULL,
    [remitente_cy]                     VARCHAR (20)  NOT NULL,
    [destinatario_nombre]              VARCHAR (100) NOT NULL,
    [destinatario_tipo_documento]      VARCHAR (20)  NOT NULL,
    [destinatario_numero_documento]    VARCHAR (20)  NOT NULL,
    [destinatario_direccion]           VARCHAR (150) NOT NULL,
    [destinatario_telefonos]           VARCHAR (100) NOT NULL,
    [destinatario_contacto]            VARCHAR (100) NOT NULL,
    [destinatario_ciudad_codigo]       VARCHAR (50)  NOT NULL,
    [destinatario_departamento_codigo] VARCHAR (50)  NOT NULL,
    [destinatario_zona]                VARCHAR (1)   NOT NULL,
    [destinatario_cx]                  VARCHAR (20)  NOT NULL,
    [destinatario_cy]                  VARCHAR (20)  NOT NULL,
    [observaciones]                    VARCHAR (200) NOT NULL,
    [seguro]                           VARCHAR (20)  NOT NULL,
    [tarifa]                           VARCHAR (20)  NOT NULL,
    [version]                          INT           NOT NULL,
    [usuario_creacion]                 VARCHAR (50)  NOT NULL,
    [fecha_creacion]                   DATETIME2 (0) NOT NULL,
    [usuario_modificacion]             VARCHAR (50)  NOT NULL,
    [fecha_modificacion]               DATETIME2 (0) NOT NULL,
    CONSTRAINT [PK_mensajes_remesas_silogtran] PRIMARY KEY CLUSTERED ([id_mensaje] ASC)
);

