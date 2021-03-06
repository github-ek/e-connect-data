﻿CREATE TABLE [dbo].[planillas_rutacontrol] (
    [id]                            BIGINT         IDENTITY (1, 1) NOT NULL,
    [id_archivo]                    BIGINT         NOT NULL,
    [estado]                        VARCHAR (50)   NOT NULL,
    [numero_linea]                  INT            NOT NULL,
    [placa_programada]              VARCHAR (20)   NOT NULL,
    [fecha_programada]              DATE           NOT NULL,
    [cliente_identificacion]        VARCHAR (20)   NOT NULL,
    [numero_solicitud]              VARCHAR (20)   NOT NULL,
    [estado_codigo_alterno]         VARCHAR (50)   NOT NULL,
    [causal_novedad_codigo_alterno] VARCHAR (50)   NOT NULL,
    [fecha_hora_inicio]             DATETIME2 (0)  NULL,
    [fecha_hora_fin]                DATETIME2 (0)  NULL,
    [observaciones]                 VARCHAR (1000) NOT NULL,
    [id_cliente]                    BIGINT         NULL,
    [id_solicitud]                  BIGINT         NULL,
    [version]                       INT            NOT NULL,
    [fecha_creacion]                DATETIME2 (0)  NOT NULL,
    [usuario_creacion]              VARCHAR (50)   NOT NULL,
    [fecha_modificacion]            DATETIME2 (0)  NOT NULL,
    [usuario_modificacion]          VARCHAR (50)   NOT NULL,
    CONSTRAINT [PK_planillas_rutacontrol] PRIMARY KEY CLUSTERED ([id] ASC)
);

