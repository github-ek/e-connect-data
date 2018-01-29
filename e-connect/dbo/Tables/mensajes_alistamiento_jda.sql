CREATE TABLE [dbo].[mensajes_alistamiento_jda] (
    [id_mensaje]   BIGINT        IDENTITY (1, 1) NOT NULL,
    [id_orden_alistamiento]   BIGINT        NOT NULL,
    [estado]                    VARCHAR(50)   NOT NULL,
    [fecha_envio]               DATETIME2(0)   NULL,
    [fecha_confirmacion_envio]  DATETIME2(0)   NULL,

    [whse_id]                   NVARCHAR (32) NOT NULL,
    [client_id]               NVARCHAR (32) NOT NULL,
    [ordtyp]                  NVARCHAR (4)  NOT NULL,
    [ordnum]                  NVARCHAR (35) NOT NULL,
    [wh_id]                   NVARCHAR (32) NOT NULL,
    [shipby]                  NVARCHAR (10) NOT NULL,
    [rmanum]                  NVARCHAR (30) NOT NULL,
    [bus_grp]                 NVARCHAR (40) NOT NULL,
    [btcust]                  NVARCHAR (20) NOT NULL,
    [stcust]                  NVARCHAR (20) NOT NULL,
    [rtcust]                  NVARCHAR (20) NOT NULL,
    [bt_host_adr_id]          NVARCHAR (20) NOT NULL,
    [st_host_adr_id]          NVARCHAR (20) NOT NULL,
    [rt_host_adr_id]          NVARCHAR (20) NOT NULL,
    [cpodte]                  DATETIME      NOT NULL,

    [version]                  INT             NOT NULL DEFAULT 0,
    [usuario_creacion]         VARCHAR(50)    NOT NULL,
    [fecha_creacion]           DATETIME2(0)   NOT NULL,
    [usuario_modificacion]     VARCHAR(50)    NOT NULL,
    [fecha_modificacion]       DATETIME2(0)   NOT NULL,

    CONSTRAINT [PK_mensajes_alistamiento_jda] PRIMARY KEY CLUSTERED ([id_mensaje] ASC) WITH (FILLFACTOR = 80), 
    CONSTRAINT [FK_mensajes_alistamiento_jda_ordenes_alistamiento] FOREIGN KEY ([id_orden_alistamiento]) REFERENCES [ordenes_alistamiento]([id_orden_alistamiento])
);

