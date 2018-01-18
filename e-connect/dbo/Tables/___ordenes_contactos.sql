CREATE TABLE [dbo].[___ordenes_contactos] (
    [id]                     BIGINT        IDENTITY (1, 1) NOT NULL,
    [id_orden]               BIGINT        NOT NULL,
    [id_tipo_contacto]       VARCHAR (50)  NOT NULL,
    [id_tipo_identificacion] VARCHAR (20)  NOT NULL,
    [numero_identificacion]  VARCHAR (20)  NOT NULL,
    [nombres]                VARCHAR (100) NOT NULL,
    [telefonos]              VARCHAR (100) NOT NULL,
    [email]                  VARCHAR (100) NOT NULL,
    [version]                INT           NOT NULL,
    [usuario_creacion]       VARCHAR (50)  NOT NULL,
    [fecha_creacion]         DATETIME2 (0) NOT NULL,
    [usuario_modificacion]   VARCHAR (50)  NOT NULL,
    [fecha_modificacion]     DATETIME2 (0) NOT NULL,
    CONSTRAINT [PK_ordenes_contactos] PRIMARY KEY CLUSTERED ([id_orden] ASC) WITH (FILLFACTOR = 80),
    CONSTRAINT [FK_ordenes_contactos_ordenes] FOREIGN KEY ([id_orden]) REFERENCES [dbo].[solicitudes] ([id_solicitud])
);

