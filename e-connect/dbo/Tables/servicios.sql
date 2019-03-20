CREATE TABLE [dbo].[servicios] (
    [id_servicio]          BIGINT        NOT NULL,
    [codigo]               VARCHAR (20)  NOT NULL,
    [nombre]               VARCHAR (100) NOT NULL,
    [descripcion]          VARCHAR (200) NOT NULL,
    [id_tipo_solicitud]    BIGINT        NOT NULL,
    [ordinal]              INT           NOT NULL,
    [activo]               BIT           CONSTRAINT [DF_servicios_activo] DEFAULT ((1)) NOT NULL,
    [version]              INT           CONSTRAINT [DF_servicios_version] DEFAULT ((0)) NOT NULL,
    [usuario_creacion]     VARCHAR (50)  CONSTRAINT [DF_servicios_usuario_creacion] DEFAULT ('') NOT NULL,
    [fecha_creacion]       DATETIME2 (0) CONSTRAINT [DF_servicios_fecha_creacion] DEFAULT (getdate()) NOT NULL,
    [usuario_modificacion] VARCHAR (50)  CONSTRAINT [DF_servicios_usuario_modificacion] DEFAULT ('') NOT NULL,
    [fecha_modificacion]   DATETIME2 (0) CONSTRAINT [DF_servicios_fecha_modificacion] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_servicios] PRIMARY KEY CLUSTERED ([id_servicio] ASC) WITH (FILLFACTOR = 80),
    CONSTRAINT [FK_servicios_tipos_solicitud] FOREIGN KEY ([id_tipo_solicitud]) REFERENCES [dbo].[tipos_solicitud] ([id_tipo_solicitud]),
    CONSTRAINT [UK_servicios_01] UNIQUE NONCLUSTERED ([codigo] ASC) WITH (FILLFACTOR = 80),
    CONSTRAINT [UK_servicios_02] UNIQUE NONCLUSTERED ([nombre] ASC) WITH (FILLFACTOR = 80)
);



