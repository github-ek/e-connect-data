CREATE TABLE [dbo].[solicitudes_transporte] (
    [id_solicitud_transporte]                BIGINT        IDENTITY (1, 1) NOT NULL,
    [id_solicitud]                           BIGINT        NOT NULL,
    [id_tipo_ruta]                       BIGINT        NULL,
    [id_tipo_vehiculo]                   BIGINT        NULL,
    
    [id_ciudad_remitente]                BIGINT        NOT NULL,
    [ciudad_remitente_codigo_alterno]    VARCHAR (50)  NOT NULL,
    [direccion_remitente]                VARCHAR (150) NOT NULL,
    [id_direccion_remitente]             BIGINT        NULL,
    [id_punto_remitente]                 BIGINT        NULL,
    [punto_remitente_codigo_alterno]     VARCHAR (50)  NOT NULL,
    [punto_remitente_nombre]             VARCHAR (100) NOT NULL,
    [requiere_cita_remitente]            VARCHAR (1)   NOT NULL,
    [fecha_cita_remitente]               DATE          NULL,
    [hora_cita_minima_remitente]         TIME (0)      NULL,
    [hora_cita_maxima_remitente]         TIME (0)      NULL,
    
    [id_ciudad_destinatario]             BIGINT        NOT NULL,
    [ciudad_destinatario_codigo_alterno] VARCHAR (50)  NOT NULL,
    [direccion_destinatario]             VARCHAR (150) NOT NULL,
    [id_direccion_destinatario]          BIGINT        NULL,
    [id_punto_destinatario]              BIGINT        NULL,
    [punto_destinatario_codigo_alterno]  VARCHAR (50)  NOT NULL,
    [punto_destinatario_nombre]          VARCHAR (100) NOT NULL,
    [requiere_cita_destinatario]         VARCHAR (1)   NOT NULL,
    [fecha_cita_destinatario]            DATE          NULL,
    [hora_cita_minima_destinatario]      TIME (0)      NULL,
    [hora_cita_maxima_destinatario]      TIME (0)      NULL,

    [version]                            INT           NOT NULL,
    [usuario_creacion]                   VARCHAR (50)  NOT NULL,
    [fecha_creacion]                     DATETIME2 (0) NOT NULL,
    [usuario_modificacion]               VARCHAR (50)  NOT NULL,
    [fecha_modificacion]                 DATETIME2 (0) NOT NULL,
    CONSTRAINT [PK_solicitudes_transporte] PRIMARY KEY CLUSTERED ([id_solicitud_transporte] ASC) WITH (FILLFACTOR = 80)
);

