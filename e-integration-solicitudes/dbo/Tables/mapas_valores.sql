CREATE TABLE [dbo].[mapas_valores] (
    [id_mapa]              BIGINT        NOT NULL,
    [clave]                VARCHAR (200) NOT NULL,
    [valor]                VARCHAR (200) NOT NULL,
    [version]              INT           DEFAULT ((0)) NOT NULL,
    [usuario_creacion]     VARCHAR (50)  DEFAULT ('') NOT NULL,
    [fecha_creacion]       DATETIME2 (0) DEFAULT (sysdatetime()) NOT NULL,
    [usuario_modificacion] VARCHAR (50)  DEFAULT ('') NOT NULL,
    [fecha_modificacion]   DATETIME2 (0) DEFAULT (sysdatetime()) NOT NULL,
    CONSTRAINT [PK_mapas_valores] PRIMARY KEY CLUSTERED ([id_mapa] ASC, [clave] ASC),
    CONSTRAINT [FK_mapas_valores_mapas] FOREIGN KEY ([id_mapa]) REFERENCES [dbo].[mapas] ([id_mapa])
);

