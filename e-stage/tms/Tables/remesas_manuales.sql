CREATE TABLE [tms].[remesas_manuales] (
    [id]                     BIGINT           IDENTITY (1, 1) NOT NULL,
    [id_archivo]             BIGINT           NOT NULL,
    [estado]                 VARCHAR (50)     NOT NULL,
    [numero_linea]           INT              NOT NULL,
    [cliente_codigo_alterno] VARCHAR (20)     NOT NULL,
    [numero_orden]           VARCHAR (20)     NOT NULL,
    [placa]                  VARCHAR (20)     NOT NULL,
    [fecha_hora_estimada]    DATETIME2 (0)    NOT NULL,
    [cx]                     DECIMAL (18, 14) NOT NULL,
    [cy]                     DECIMAL (18, 14) NOT NULL,
    [id_cliente]             BIGINT           NULL,
    [id_orden]               BIGINT           NULL,
    [version]                INT              NOT NULL,
    [fecha_creacion]         DATETIME2 (0)    NOT NULL,
    [usuario_creacion]       VARCHAR (50)     NOT NULL,
    [fecha_modificacion]     DATETIME2 (0)    NOT NULL,
    [usuario_modificacion]   VARCHAR (50)     NOT NULL,
    CONSTRAINT [PK_rutas_manuales] PRIMARY KEY CLUSTERED ([id] ASC)
);

