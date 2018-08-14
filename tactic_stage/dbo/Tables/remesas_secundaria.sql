CREATE TABLE [dbo].[remesas_secundaria] (
    [id_remesa_secundaria] BIGINT         IDENTITY (1, 1) NOT NULL,
    [id_solicitud]         BIGINT         NOT NULL,
    [placa_programada]     VARCHAR (20)   NOT NULL,
    [fecha_programada]     DATE           NOT NULL,
    [estado]               VARCHAR (50)   NOT NULL,
    [causal_novedad]       VARCHAR (50)   NOT NULL,
    [responsable_novedad]  VARCHAR (50)   NOT NULL,
    [fecha_hora_inicio]    DATETIME2 (0)  NULL,
    [fecha_hora_fin]       DATETIME2 (0)  NULL,
    [observaciones]        VARCHAR (1000) NOT NULL,
    [version]              INT            NOT NULL,
    [fecha_creacion]       DATETIME2 (0)  NOT NULL,
    [fecha_modificacion]   DATETIME2 (0)  NOT NULL,
    [estado_liquidacion]   VARCHAR (20)   NULL,
    CONSTRAINT [PK_remesas_secundaria] PRIMARY KEY CLUSTERED ([id_remesa_secundaria] ASC),
    CONSTRAINT [UK_remesas_secundaria_01] UNIQUE NONCLUSTERED ([id_solicitud] ASC, [placa_programada] ASC, [fecha_programada] ASC)
);

