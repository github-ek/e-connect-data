CREATE TABLE [dbo].[archivos_errores] (
    [id]                   BIGINT         IDENTITY (1, 1) NOT NULL,
    [id_archivo]           BIGINT         NOT NULL,
    [numero_linea]         INT            NOT NULL,
    [codigo]               VARCHAR (50)   NOT NULL,
    [mensaje]              VARCHAR (1024) NOT NULL,
    [datos]                VARCHAR (MAX)  NOT NULL,
    [version]              INT            DEFAULT ((0)) NOT NULL,
    [usuario_creacion]     VARCHAR (50)   DEFAULT ('') NOT NULL,
    [fecha_creacion]       DATETIME2 (0)  DEFAULT (sysdatetime()) NOT NULL,
    [usuario_modificacion] VARCHAR (50)   DEFAULT ('') NOT NULL,
    [fecha_modificacion]   DATETIME2 (0)  DEFAULT (sysdatetime()) NOT NULL,
    CONSTRAINT [PK_archivos_errores] PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [FK_archivos_errores_archivos] FOREIGN KEY ([id_archivo]) REFERENCES [dbo].[archivos] ([id_archivo]) ON DELETE CASCADE
);






GO
CREATE NONCLUSTERED INDEX [IX_archivos_errores]
    ON [dbo].[archivos_errores]([id_archivo] ASC, [numero_linea] ASC);

