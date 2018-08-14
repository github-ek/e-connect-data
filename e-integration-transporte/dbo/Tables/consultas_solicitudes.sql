CREATE TABLE [dbo].[consultas_solicitudes] (
    [id]                   BIGINT        IDENTITY (1, 1) NOT NULL,
    [id_archivo]           BIGINT        NOT NULL,
    [estado]               VARCHAR (50)  NOT NULL,
    [numero_linea]         INT           NOT NULL,
    [cliente_codigo]       VARCHAR (20)  NOT NULL,
    [numero_solicitud]     VARCHAR (20)  NOT NULL,
    [id_cliente]           BIGINT        NULL,
    [id_solicitud]         BIGINT        NULL,
    [version]              INT           NOT NULL,
    [fecha_creacion]       DATETIME2 (0) NOT NULL,
    [usuario_creacion]     VARCHAR (50)  NOT NULL,
    [fecha_modificacion]   DATETIME2 (0) NOT NULL,
    [usuario_modificacion] VARCHAR (50)  NOT NULL,
    CONSTRAINT [PK_consultas_solicitudes] PRIMARY KEY CLUSTERED ([id] ASC) WITH (FILLFACTOR = 80),
    CONSTRAINT [IX_consultas_solicitudes] UNIQUE NONCLUSTERED ([id_archivo] ASC, [id] ASC)
);

