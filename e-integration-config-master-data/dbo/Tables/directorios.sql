CREATE TABLE [dbo].[directorios] (
    [id_directorio]          BIGINT        IDENTITY (1, 1) NOT NULL,
    [id_tipo_archivo]        BIGINT        NOT NULL,
    [subdirectorio_template] VARCHAR (300) NOT NULL,
    [regexp]                 VARCHAR (50)  NOT NULL,
    [directorio_entradas]    VARCHAR (300) NOT NULL,
    [directorio_temporal]    VARCHAR (300) NOT NULL,
    [directorio_dump]        VARCHAR (300) NOT NULL,
    [directorio_procesados]  VARCHAR (300) NOT NULL,
    [directorio_errores]     VARCHAR (300) NOT NULL,
    [directorio_salidas]     VARCHAR (300) NOT NULL,
    [version]                INT           DEFAULT ((0)) NOT NULL,
    [usuario_creacion]       VARCHAR (50)  DEFAULT ('') NOT NULL,
    [fecha_creacion]         DATETIME2 (0) DEFAULT (sysdatetime()) NOT NULL,
    [usuario_modificacion]   VARCHAR (50)  DEFAULT ('') NOT NULL,
    [fecha_modificacion]     DATETIME2 (0) DEFAULT (sysdatetime()) NOT NULL,
    CONSTRAINT [PK_directorios] PRIMARY KEY CLUSTERED ([id_directorio] ASC),
    CONSTRAINT [FK_directorios_tipos_archivo] FOREIGN KEY ([id_tipo_archivo]) REFERENCES [dbo].[tipos_archivo] ([id_tipo_archivo])
);

