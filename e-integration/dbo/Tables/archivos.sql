CREATE TABLE [dbo].[archivos] (
    [id_archivo]           BIGINT         IDENTITY (1, 1) NOT NULL,
    [id_tipo_archivo]      BIGINT         NOT NULL,
    [nombre]               VARCHAR (300)  NOT NULL,
    [estado]               VARCHAR (50)   NOT NULL,
    [ruta]                 VARCHAR (1024) NOT NULL,
    [version]              INT           NOT NULL DEFAULT 0,
    [usuario_creacion]     VARCHAR (50)  NOT NULL DEFAULT '',
    [fecha_creacion]       DATETIME2 (0) NOT NULL DEFAULT SYSDATETIME(),
    [usuario_modificacion] VARCHAR (50)  NOT NULL DEFAULT '',
    [fecha_modificacion]   DATETIME2 (0) NOT NULL DEFAULT SYSDATETIME(),
    CONSTRAINT [PK_archivos] PRIMARY KEY CLUSTERED ([id_archivo] ASC)
);

