﻿CREATE TABLE [dbo].[tipos_archivo] (
    [id_tipo_archivo]           BIGINT        NOT NULL,
    [id_grupo_tipo_archivo]     BIGINT        NOT NULL,
    [codigo]                    VARCHAR (50)  NOT NULL,
    [nombre]                    VARCHAR (100) NOT NULL,
    [descripcion]               VARCHAR (200) NOT NULL,
    [separador_registros]       VARCHAR (4)   NOT NULL,
    [separador_campos]          VARCHAR (4)   NOT NULL,
    [cargue_manual_habilitado]  BIT           NOT NULL,
    [web_api_url_base_template] VARCHAR (300) NOT NULL,
    [ordinal]                   INT           NOT NULL,
    [activo]                    BIT           DEFAULT ((1)) NOT NULL,
    [version]                   INT           DEFAULT ((0)) NOT NULL,
    [usuario_creacion]          VARCHAR (50)  DEFAULT ('') NOT NULL,
    [fecha_creacion]            DATETIME2 (0) DEFAULT (sysdatetime()) NOT NULL,
    [usuario_modificacion]      VARCHAR (50)  DEFAULT ('') NOT NULL,
    [fecha_modificacion]        DATETIME2 (0) DEFAULT (sysdatetime()) NOT NULL,
    CONSTRAINT [PK_tipos_archivo] PRIMARY KEY CLUSTERED ([id_tipo_archivo] ASC),
    CONSTRAINT [FK_tipo_archivo_grupos_tipo_archivo] FOREIGN KEY ([id_grupo_tipo_archivo]) REFERENCES [dbo].[grupos_tipo_archivo] ([id_grupo_tipo_archivo]),
    CONSTRAINT [UK_tipos_archivo_01] UNIQUE NONCLUSTERED ([codigo] ASC)
);

