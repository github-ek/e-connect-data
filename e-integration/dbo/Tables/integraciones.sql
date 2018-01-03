CREATE TABLE [dbo].[integraciones] (
    [id_integracion]          BIGINT        NOT NULL,
    [codigo]                  VARCHAR (50)  NOT NULL,
    [nombre]                  VARCHAR (100) NOT NULL,
    [descripcion]             VARCHAR (200) NOT NULL,
    [fecha_ultima_extraccion] DATETIME2 (0) NOT NULL,
    [ordinal]                 INT           NOT NULL,
    [activo]                  BIT           NOT NULL,
    [version]                 INT           NOT NULL,
    [fecha_creacion]          DATETIME2 (0) NOT NULL,
    [usuario_creacion]        VARCHAR (50)  NOT NULL,
    [fecha_modificacion]      DATETIME2 (0) NOT NULL,
    [usuario_modificacion]    VARCHAR (50)  NOT NULL,
    CONSTRAINT [PK_integraciones] PRIMARY KEY CLUSTERED ([id_integracion] ASC),
    CONSTRAINT [UK_integraciones_01] UNIQUE NONCLUSTERED ([codigo] ASC),
    CONSTRAINT [UK_integraciones_02] UNIQUE NONCLUSTERED ([nombre] ASC)
);

