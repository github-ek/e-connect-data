CREATE TABLE [dbo].[servicios] (
    [id_servicio]          BIGINT        NOT NULL,
    [codigo]               VARCHAR (20)  NOT NULL,
    [nombre]               VARCHAR (100) NOT NULL,
    [descripcion]          VARCHAR (200) NOT NULL,
    [ordinal]              INT           NOT NULL,
    [activo]               BIT           NOT NULL,
    [version]              INT           NOT NULL,
    [usuario_creacion]     VARCHAR (50)  NOT NULL,
    [fecha_creacion]       DATETIME2 (0) NOT NULL,
    [usuario_modificacion] VARCHAR (50)  NOT NULL,
    [fecha_modificacion]   DATETIME2 (0) NOT NULL,
    CONSTRAINT [PK_servicios] PRIMARY KEY CLUSTERED ([id_servicio] ASC) WITH (FILLFACTOR = 80),
    CONSTRAINT [UK_servicios_01] UNIQUE NONCLUSTERED ([codigo] ASC) WITH (FILLFACTOR = 80),
    CONSTRAINT [UK_servicios_02] UNIQUE NONCLUSTERED ([nombre] ASC) WITH (FILLFACTOR = 80)
);

