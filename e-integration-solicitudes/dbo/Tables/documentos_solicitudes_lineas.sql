CREATE TABLE [dbo].[documentos_solicitudes_lineas] (
    [id]                               BIGINT        IDENTITY (1, 1) NOT NULL,
    [id_documento_solicitud]           BIGINT        NOT NULL,
    [numero_linea]                     INT           NOT NULL,
    [numero_linea_externo]             VARCHAR (50)  NOT NULL,
    [numero_sublinea_externo]          VARCHAR (50)  NOT NULL,
    [producto_codigo_alterno]          VARCHAR (50)  NOT NULL,
    [producto_nombre]                  VARCHAR (200) NOT NULL,
    [cantidad]                         INT           NOT NULL,
    [bodega_codigo_alterno]            VARCHAR (50)  NOT NULL,
    [estado_inventario_codigo_alterno] VARCHAR (50)  NOT NULL,
    [lote]                             VARCHAR (30)  NOT NULL,
    [id_producto]                      BIGINT        NULL,
    [id_bodega]                        BIGINT        NULL,
    [id_estado_inventario]             VARCHAR (4)   NULL,
    [version]                          INT           NOT NULL,
    [fecha_creacion]                   DATETIME2 (0) NOT NULL,
    [fecha_modificacion]               DATETIME2 (0) NOT NULL,
    CONSTRAINT [PK_documentos_solicitudes_lineas] PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [FK_documentos_solicitudes_lineas_documentos_solicitudes] FOREIGN KEY ([id_documento_solicitud]) REFERENCES [dbo].[documentos_solicitudes] ([id_documento_solicitud]) ON DELETE CASCADE
);

