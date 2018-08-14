CREATE TABLE [dbo].[remesas_secundaria_estado_final] (
    [id]                             BIGINT        IDENTITY (1, 1) NOT NULL,
    [id_archivo]                     BIGINT        NULL,
    [estado]                         VARCHAR (50)  CONSTRAINT [DF_remesas_secundaria_estado_final_estado] DEFAULT ('ESTRUCTURA_VALIDA') NOT NULL,
    [numero_linea]                   INT           NOT NULL,
    [placa_programada]               VARCHAR (20)  NOT NULL,
    [fecha_programada]               DATE          NOT NULL,
    [cliente_codigo_alterno]         VARCHAR (32)  NOT NULL,
    [numero_solicitud]               VARCHAR (20)  NOT NULL,
    [estado_codigo_alterno]          VARCHAR (50)  NOT NULL,
    [causal_novedad_codigo_alterno]  VARCHAR (50)  NOT NULL,
    [responsable_novedad]            VARCHAR (50)  NOT NULL,
    [estado_cumplido_codigo_alterno] VARCHAR (50)  NOT NULL,
    [id_cliente]                     BIGINT        NULL,
    [id_solicitud]                   BIGINT        NULL,
    [version]                        INT           CONSTRAINT [DF_remesas_secundaria_estado_final_version] DEFAULT ((0)) NOT NULL,
    [fecha_creacion]                 DATETIME2 (0) CONSTRAINT [DF_remesas_secundaria_estado_final_fecha_creacion] DEFAULT (sysdatetime()) NOT NULL,
    [usuario_creacion]               VARCHAR (50)  CONSTRAINT [DF_remesas_secundaria_estado_final_usuario_creacion] DEFAULT ('') NOT NULL,
    [fecha_modificacion]             DATETIME2 (0) CONSTRAINT [DF_remesas_secundaria_estado_final_fecha_modificacion] DEFAULT (sysdatetime()) NOT NULL,
    [usuario_modificacion]           VARCHAR (50)  CONSTRAINT [DF_remesas_secundaria_estado_final_usuario_modificacion] DEFAULT ('') NOT NULL,
    CONSTRAINT [PK_remesas_secundarias_cierres] PRIMARY KEY CLUSTERED ([id] ASC)
);

