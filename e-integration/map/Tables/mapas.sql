CREATE TABLE [map].[mapas] (
    [id_mapa]              BIGINT        NOT NULL,
    [id_grupo_mapa]        BIGINT        NOT NULL,
    [codigo]               VARCHAR (50)  NOT NULL,
    [nombre]               VARCHAR (100) NOT NULL,
    [descripcion]          VARCHAR (200) NOT NULL,
    [patron_clave]         VARCHAR (200) NOT NULL,
    [ordinal]              INT           NOT NULL,
    [activo]               BIT           NOT NULL,
    [version]              INT           NOT NULL,
    [usuario_creacion]     VARCHAR (50)  NOT NULL,
    [fecha_creacion]       DATETIME2 (0) NOT NULL,
    [usuario_modificacion] VARCHAR (50)  NOT NULL,
    [fecha_modificacion]   DATETIME2 (0) NOT NULL,
    CONSTRAINT [PK_mapas] PRIMARY KEY CLUSTERED ([id_mapa] ASC),
    CONSTRAINT [FK_mapas_grupos_mapa] FOREIGN KEY ([id_grupo_mapa]) REFERENCES [map].[grupos_mapa] ([id_grupo_mapa]),
    CONSTRAINT [UK_mapas_01] UNIQUE NONCLUSTERED ([codigo] ASC)
);



