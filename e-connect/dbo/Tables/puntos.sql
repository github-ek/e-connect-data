CREATE TABLE [dbo].[puntos] (
    [id_punto]             BIGINT        NOT NULL,
    [id_tercero]           BIGINT        NOT NULL,
    [codigo]               VARCHAR (20)  NOT NULL,
    [nombre]               VARCHAR (100) NOT NULL,
    [id_ciudad]            BIGINT        NOT NULL,
    [direccion]            VARCHAR (150) NOT NULL,
    [id_direccion]         BIGINT        NULL,
    [activo]               BIT           NOT NULL,
    [version]              INT           NOT NULL,
    [usuario_creacion]     VARCHAR (50)  NOT NULL,
    [fecha_creacion]       DATETIME2 (0) NOT NULL,
    [usuario_modificacion] VARCHAR (50)  NOT NULL,
    [fecha_modificacion]   DATETIME2 (0) NOT NULL,
    CONSTRAINT [PK_puntos] PRIMARY KEY CLUSTERED ([id_punto] ASC),
    CONSTRAINT [FK_puntos_ciudades] FOREIGN KEY ([id_ciudad]) REFERENCES [dbo].[ciudades] ([id_ciudad]),
    CONSTRAINT [FK_puntos_direcciones] FOREIGN KEY ([id_direccion]) REFERENCES [dbo].[direcciones] ([id_direccion]),
    CONSTRAINT [FK_puntos_terceros] FOREIGN KEY ([id_tercero]) REFERENCES [dbo].[terceros] ([id_tercero])
);

