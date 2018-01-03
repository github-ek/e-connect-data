CREATE TABLE [tms].[remesas_toursolver] (
    [id]                   BIGINT        IDENTITY (1, 1) NOT NULL,
    [id_archivo]           BIGINT        NOT NULL,
    [estado]               VARCHAR (50)  NOT NULL,
    [numero_linea]         INT           NOT NULL,
    [cliente_codigo]       VARCHAR (50)  NOT NULL,
    [id_orden]             BIGINT        NOT NULL,
    [placa]                VARCHAR (20)  NOT NULL,
    [fecha_estimada]       DATE          NOT NULL,
    [hora_estimada]        TIME (0)      NOT NULL,
    [particularidades]     VARCHAR (50)  NOT NULL,
    [version]              INT           NOT NULL,
    [fecha_creacion]       DATETIME2 (0) NOT NULL,
    [usuario_creacion]     VARCHAR (50)  NOT NULL,
    [fecha_modificacion]   DATETIME2 (0) NOT NULL,
    [usuario_modificacion] VARCHAR (50)  NOT NULL,
    CONSTRAINT [PK_remesas_toursolver] PRIMARY KEY CLUSTERED ([id] ASC)
);

