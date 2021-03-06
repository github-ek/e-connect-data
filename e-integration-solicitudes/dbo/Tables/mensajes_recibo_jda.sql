﻿CREATE TABLE [dbo].[mensajes_recibo_jda] (
    [id_mensaje]               BIGINT         NOT NULL,
    [id_orden_recibo]          BIGINT        NOT NULL,
    [estado]                   VARCHAR (50)  NOT NULL,
    [fecha_envio]              DATETIME2 (0) NULL,
    [fecha_confirmacion_envio] DATETIME2 (0) NULL,
    [whse_id]                  NVARCHAR (32) NOT NULL,
    [client_id]                NVARCHAR (32) NOT NULL,
    [invtyp]                   NVARCHAR (4)  NOT NULL,
    [invnum]                   NVARCHAR (35) NOT NULL,
    [wh_id]                    NVARCHAR (32) NOT NULL,
    [rimsts]                   NVARCHAR (40) NOT NULL,
    [supnum]                   NVARCHAR (32) NOT NULL,
    [invdte]                   NVARCHAR (20) NOT NULL,
    [version]                  INT           CONSTRAINT [DF_mensajes_recibo_jda_version] DEFAULT ((0)) NOT NULL,
    [usuario_creacion]         VARCHAR (50)  NOT NULL,
    [fecha_creacion]           DATETIME2 (0) NOT NULL,
    [usuario_modificacion]     VARCHAR (50)  NOT NULL,
    [fecha_modificacion]       DATETIME2 (0) NOT NULL,
    CONSTRAINT [PK_mensajes_recibo_jda] PRIMARY KEY CLUSTERED ([id_mensaje] ASC) WITH (FILLFACTOR = 80)
);

