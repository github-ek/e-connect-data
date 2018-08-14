CREATE TABLE [dbo].[remesas_secundaria_estado_final] (
    [id_remesa_secundaria_estado_final] BIGINT        IDENTITY (1, 1) NOT NULL,
    [id_solicitud]                      BIGINT        NOT NULL,
    [placa_programada]                  VARCHAR (20)  NOT NULL,
    [fecha_programada]                  DATE          NOT NULL,
    [estado]                            VARCHAR (50)  NOT NULL,
    [causal_novedad]                    VARCHAR (50)  NOT NULL,
    [responsable_novedad]               VARCHAR (50)  NOT NULL,
    [estado_cumplido]                   VARCHAR (50)  NOT NULL,
    [version]                           INT           NOT NULL,
    [fecha_creacion]                    DATETIME2 (0) NOT NULL,
    [fecha_modificacion]                DATETIME2 (0) NOT NULL,
    [estado_liquidacion]                VARCHAR (20)  NULL,
    CONSTRAINT [PK_remesas_secundarias_cierres] PRIMARY KEY CLUSTERED ([id_remesa_secundaria_estado_final] ASC)
);

