CREATE TABLE [tms].[remesas_programadas] (
    [id]                     BIGINT         IDENTITY (1, 1) NOT NULL,
    [id_archivo]             BIGINT         NOT NULL,
    [estado]                 VARCHAR (50)   NOT NULL,
    [numero_linea]           INT            NOT NULL,
    [placa_programada]       VARCHAR (20)   NOT NULL,
    [fecha_programada]       DATE           NULL,
    [cliente_identificacion] VARCHAR (20)   NOT NULL,
    [numero_solicitud]       VARCHAR (20)   NOT NULL,
    [es_servicio_dedicado]            BIT            NOT NULL,
    [paqueteadora_codigo]    VARCHAR (50)   NOT NULL,
    [id_cliente]             BIGINT         NULL,
    [id_orden]               BIGINT         NULL,
    [version]                INT            NOT NULL,
    [fecha_creacion]         DATETIME2 (0)  NOT NULL,
    [usuario_creacion]       VARCHAR (50)   NOT NULL,
    [fecha_modificacion]     DATETIME2 (0)  NOT NULL,
    [usuario_modificacion]   VARCHAR (50)   NOT NULL,
    CONSTRAINT [PK_remesas_programadas] PRIMARY KEY CLUSTERED ([id] ASC)
);

