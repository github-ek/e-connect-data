CREATE TABLE [dbo].[mensajes_manufactura_jda] (
    [id_mensaje]           BIGINT        NOT NULL,
    [id_orden_manufactura] BIGINT        NOT NULL,
    [numero_linea]         INT           NOT NULL,
    [estado]               VARCHAR (50)  NOT NULL,
    [data]                 VARCHAR (MAX) NULL,
    [fecha_envio]          DATETIME2 (0) NULL,
    [fecha_confirmacion]   DATETIME2 (0) NULL,
    [wkonum]               NVARCHAR (20) NOT NULL,
    [client_id]            NVARCHAR (32) NOT NULL,
    [wkorev]               NVARCHAR (10) NOT NULL,
    [wh_id]                NVARCHAR (32) NOT NULL,
    [wko_typ]              NVARCHAR (10) NOT NULL,
    [prtnum]               NVARCHAR (50) NOT NULL,
    [invsts]               NVARCHAR (4)  NOT NULL,
    [wkoqty]               INT           NOT NULL,
    [prcpri]               NVARCHAR (1)  NOT NULL,
    [prcare]               NVARCHAR (10) NOT NULL,
    [prdlin]               NVARCHAR (20) NOT NULL,
    [prd_tol_pct]          INT           NOT NULL,
    [version]              INT           CONSTRAINT [DF_mensajes_manufacturas_jda_version] DEFAULT ((0)) NOT NULL,
    [usuario_creacion]     VARCHAR (50)  NOT NULL,
    [fecha_creacion]       DATETIME2 (0) NOT NULL,
    [usuario_modificacion] VARCHAR (50)  NOT NULL,
    [fecha_modificacion]   DATETIME2 (0) NOT NULL,
    CONSTRAINT [PK_ordenes_manufactura_wkohdr] PRIMARY KEY CLUSTERED ([id_mensaje] ASC) WITH (FILLFACTOR = 80)
);



