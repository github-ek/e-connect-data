CREATE TABLE [map].[mapas_valores] (
    [id_mapa]              BIGINT        NOT NULL,
    [clave]                VARCHAR (200) NOT NULL,
    [valor]                VARCHAR (200) NOT NULL,
    [version]              INT           NOT NULL DEFAULT 0,
    [usuario_creacion]     VARCHAR (50)  NOT NULL DEFAULT '',
    [fecha_creacion]       DATETIME2 (0) NOT NULL DEFAULT SYSDATETIME(),
    [usuario_modificacion] VARCHAR (50)  NOT NULL DEFAULT '',
    [fecha_modificacion]   DATETIME2 (0) NOT NULL DEFAULT SYSDATETIME(),
    CONSTRAINT [PK_mapas_valores] PRIMARY KEY CLUSTERED ([id_mapa] ASC, [clave] ASC),
    CONSTRAINT [FK_mapas_valores_mapas] FOREIGN KEY ([id_mapa]) REFERENCES [map].[mapas] ([id_mapa])
);

