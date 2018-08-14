CREATE TABLE [dbo].[archivos] (
    [id_archivo]           BIGINT         IDENTITY (1, 1) NOT NULL,
    [id_tipo_archivo]      BIGINT         NOT NULL,
    [nombre]               VARCHAR (300)  NOT NULL,
    [estado]               VARCHAR (50)   NOT NULL,
    [ruta]                 VARCHAR (1024) NOT NULL,
    [version]              INT            DEFAULT ((0)) NOT NULL,
    [usuario_creacion]     VARCHAR (50)   DEFAULT ('') NOT NULL,
    [fecha_creacion]       DATETIME2 (0)  DEFAULT (sysdatetime()) NOT NULL,
    [usuario_modificacion] VARCHAR (50)   DEFAULT ('') NOT NULL,
    [fecha_modificacion]   DATETIME2 (0)  DEFAULT (sysdatetime()) NOT NULL,
    CONSTRAINT [PK_archivos] PRIMARY KEY CLUSTERED ([id_archivo] ASC)
);




GO
CREATE NONCLUSTERED INDEX [IX_archivos_01]
    ON [dbo].[archivos]([estado] ASC)
    INCLUDE([id_tipo_archivo]);

