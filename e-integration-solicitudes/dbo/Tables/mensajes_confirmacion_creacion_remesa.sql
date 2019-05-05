CREATE TABLE [dbo].[mensajes_confirmacion_creacion_remesa] (
    [confirmación_econnect] BIGINT         IDENTITY (1, 1) NOT NULL,
    [fecha_registro]        DATETIME2 (7)  NOT NULL,
    [numero_confirmacion]   BIGINT         NULL,
    [datos_enviados]        NVARCHAR (MAX) NULL,
    [datos_recibidos]       NVARCHAR (MAX) NULL,
    [success]               VARCHAR (7)    NULL,
    [id_ordentransporte]    VARCHAR (100)  NULL,
    [remesa_codigo]         VARCHAR (100)  NULL,
    [success_response]      VARCHAR (7)    NULL,
    CONSTRAINT [PK_mensajes_confirmacion_creacion_remesa] PRIMARY KEY CLUSTERED ([confirmación_econnect] ASC)
);

