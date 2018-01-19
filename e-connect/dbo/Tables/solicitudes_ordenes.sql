CREATE TABLE [dbo].[solicitudes_ordenes]
(
    [id_solicitud_orden] BIGINT IDENTITY (1, 1) NOT NULL,
    [tipo_solicitud] VARCHAR (50)  NOT NULL,
    [id_solicitud]   BIGINT NOT NULL,
    
    [tipo_orden] VARCHAR (50)  NOT NULL,
    [id_orden]   BIGINT NULL,
    [numero_orden] VARCHAR (50)  NOT NULL DEFAULT '',
    [estado] VARCHAR (50)  NOT NULL DEFAULT '',
    [resultado] VARCHAR (50)  NULL DEFAULT 'NO_PROCESADA',

    [id_orden_origen]   BIGINT NULL,
    [numero_orden_origen] VARCHAR (50)  NOT NULL DEFAULT '',

    [version]                  INT           NOT NULL DEFAULT 0,
    [usuario_creacion]         VARCHAR (50)  NOT NULL,
    [fecha_creacion]           DATETIME2 (0) NOT NULL,
    [usuario_modificacion]     VARCHAR (50)  NOT NULL,
    [fecha_modificacion]       DATETIME2 (0) NOT NULL, 
    CONSTRAINT [FK_solicitudes_ordenes_solicitudes] FOREIGN KEY ([id_solicitud]) REFERENCES [solicitudes]([id_solicitud]), 
    CONSTRAINT [PK_solicitudes_ordenes] PRIMARY KEY ([id_solicitud_orden]),
)
