CREATE TABLE [dbo].[mensajes_envio_ordenes_transporte] (
    [id_envio_ordenes_transporte] BIGINT         IDENTITY (1, 1) NOT NULL,
    [fecha_registro]              DATETIME2 (7)  NOT NULL,
    [datos_enviados]              NVARCHAR (MAX) NULL,
    [datos_recibidos]             NVARCHAR (MAX) NULL,
    CONSTRAINT [PK_mensajes_envio_ordenes_transporte] PRIMARY KEY CLUSTERED ([id_envio_ordenes_transporte] ASC)
);

