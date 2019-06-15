﻿CREATE TABLE [dbo].[_solicitudes_actas_ingredion_deja_de_estar_creando_tablas_backup_en_econnect] (
    [id_solicitud_acta]           BIGINT        IDENTITY (1, 1) NOT NULL,
    [integracion]                 VARCHAR (50)  NOT NULL,
    [correlacion]                 VARCHAR (100) NOT NULL,
    [id_externo]                  VARCHAR (100) NOT NULL,
    [tipo_solicitud]              VARCHAR (50)  NOT NULL,
    [estado_solicitud]            VARCHAR (50)  NOT NULL,
    [subestado_solicitud]         VARCHAR (50)  NOT NULL,
    [numero_solicitud]            VARCHAR (20)  NOT NULL,
    [id_cliente]                  BIGINT        NOT NULL,
    [id_servicio]                 BIGINT        NOT NULL,
    [servicio_codigo_alterno]     VARCHAR (50)  NOT NULL,
    [id_bodega]                   BIGINT        NOT NULL,
    [bodega_codigo_alterno]       VARCHAR (50)  NOT NULL,
    [tercero_identificacion]      VARCHAR (20)  NOT NULL,
    [tercero_nombre]              VARCHAR (150) NOT NULL,
    [fecha_minima_solicitada]     DATE          NOT NULL,
    [fecha_maxima_solicitada]     DATE          NOT NULL,
    [hora_minima_solicitada]      TIME (0)      NOT NULL,
    [hora_maxima_solicitada]      TIME (0)      NOT NULL,
    [id_ciudad]                   BIGINT        NOT NULL,
    [ciudad_codigo_alterno]       VARCHAR (50)  NOT NULL,
    [ciudad_nombre_alterno]       VARCHAR (100) NOT NULL,
    [direccion]                   VARCHAR (150) NOT NULL,
    [punto_codigo_alterno]        VARCHAR (50)  NOT NULL,
    [punto_nombre_alterno]        VARCHAR (150) NOT NULL,
    [periodo]                     VARCHAR (50)  NOT NULL,
    [planta]                      VARCHAR (50)  NOT NULL,
    [identificador]               VARCHAR (50)  NOT NULL,
    [programa_codigo]             VARCHAR (50)  NOT NULL,
    [programa]                    VARCHAR (50)  NOT NULL,
    [regional_codigo]             VARCHAR (50)  NOT NULL,
    [regional]                    VARCHAR (50)  NOT NULL,
    [centro_zonal]                VARCHAR (50)  NOT NULL,
    [responsable_principal]       VARCHAR (150) NOT NULL,
    [responsable_suplente]        VARCHAR (150) NOT NULL,
    [telefono]                    VARCHAR (50)  NOT NULL,
    [ordnum]                      VARCHAR (35)  NULL,
    [wh_id]                       VARCHAR (32)  NULL,
    [client_id]                   VARCHAR (32)  NULL,
    [rmanum]                      VARCHAR (30)  NULL,
    [cliente_codigo_alterno_tms]  VARCHAR (50)  NULL,
    [remitente_identificacion]    VARCHAR (20)  NULL,
    [remitente_nombre]            VARCHAR (150) NULL,
    [remitente_departamento]      VARCHAR (50)  NULL,
    [remitente_ciudad]            VARCHAR (50)  NULL,
    [remitente_direccion]         VARCHAR (150) NULL,
    [remitente_telefono]          VARCHAR (50)  NULL,
    [remitente_contacto]          VARCHAR (150) NULL,
    [destinatario_identificacion] VARCHAR (20)  NULL,
    [destinatario_nombre]         VARCHAR (150) NULL,
    [destinatario_departamento]   VARCHAR (50)  NULL,
    [destinatario_ciudad]         VARCHAR (50)  NULL,
    [destinatario_direccion]      VARCHAR (150) NULL,
    [destinatario_telefono]       VARCHAR (50)  NULL,
    [destinatario_contacto]       VARCHAR (150) NULL,
    [version]                     INT           NOT NULL,
    [fecha_creacion]              DATETIME2 (0) NOT NULL,
    [fecha_modificacion]          DATETIME2 (0) NOT NULL
);
