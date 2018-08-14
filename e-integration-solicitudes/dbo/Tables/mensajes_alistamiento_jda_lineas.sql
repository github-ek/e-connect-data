CREATE TABLE [dbo].[mensajes_alistamiento_jda_lineas] (
    [id_mensaje]   BIGINT        NOT NULL,
    [numero_linea] INT           NOT NULL,
    [ordlin]       NVARCHAR (10) NOT NULL,
    [ordsln]       NVARCHAR (10) NOT NULL,
    [prtnum]       NVARCHAR (50) NOT NULL,
    [ordqty]       INT           NOT NULL,
    [invsts]       NVARCHAR (4)  NOT NULL,
    [invsts_prg]   NVARCHAR (4)  NOT NULL,
    [lotnum]       NVARCHAR (30) NOT NULL,
    [splflg]       INT           NOT NULL,
    [carcod]       NVARCHAR (10) NOT NULL,
    [srvlvl]       NVARCHAR (10) NOT NULL,
    [ordinv]       NVARCHAR (30) NOT NULL,
    [pckgr1]       NVARCHAR (20) NOT NULL,
    [pckgr2]       NVARCHAR (20) NOT NULL,
    [pckgr3]       NVARCHAR (20) NOT NULL,
    [pckgr4]       NVARCHAR (20) NOT NULL,
    CONSTRAINT [PK_mensajes_alistamiento_jda_lineas] PRIMARY KEY CLUSTERED ([id_mensaje] ASC, [numero_linea] ASC),
    CONSTRAINT [FK_mensajes_alistamiento_jda_lineas_mensajes_alistamiento_jda] FOREIGN KEY ([id_mensaje]) REFERENCES [dbo].[mensajes_alistamiento_jda] ([id_mensaje]) ON DELETE CASCADE
);

