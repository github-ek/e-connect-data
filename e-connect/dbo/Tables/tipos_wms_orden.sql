CREATE TABLE [dbo].[tipos_wms_orden] (
    [id_tipo_orden_wms]       BIGINT        NOT NULL,
    [codigo]                  VARCHAR (20)  NOT NULL,
    [nombre]                  VARCHAR (100) NOT NULL,
    [descripcion]             VARCHAR (200) NOT NULL,
    [id_tipo_wms_integracion] BIGINT        NOT NULL,
    [codigo_wms]              VARCHAR (20)  NOT NULL,
    [ordinal]                 INT           NOT NULL,
    [activo]                  BIT           NOT NULL,
    [version]                 INT           NOT NULL,
    [usuario_creacion]        VARCHAR (50)  NOT NULL,
    [fecha_creacion]          DATETIME2 (0) NOT NULL,
    [usuario_modificacion]    VARCHAR (50)  NOT NULL,
    [fecha_modificacion]      DATETIME2 (0) NOT NULL,
    CONSTRAINT [PK_tipos_orden_wms] PRIMARY KEY CLUSTERED ([id_tipo_orden_wms] ASC),
    CONSTRAINT [FK_tipos_wms_orden_tipos_wms_integracion] FOREIGN KEY ([id_tipo_wms_integracion]) REFERENCES [dbo].[tipos_wms_integracion] ([id_tipo_wms_integracion]),
    CONSTRAINT [UK_tipos_orden_wms_01] UNIQUE NONCLUSTERED ([codigo] ASC),
    CONSTRAINT [UK_tipos_orden_wms_02] UNIQUE NONCLUSTERED ([nombre] ASC)
);

