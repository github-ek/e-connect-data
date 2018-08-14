CREATE TABLE [dbo].[mensajes_manufactura_jda_lineas] (
    [id_mensaje]      BIGINT          NOT NULL,
    [numero_sublinea] INT             NOT NULL,
    [wkolin]          NVARCHAR (10)   NOT NULL,
    [prtnum]          NVARCHAR (50)   NOT NULL,
    [linqty]          INT             NOT NULL,
    [bom_cnsqty]      NUMERIC (19, 4) NOT NULL,
    [invsts]          NVARCHAR (4)    NOT NULL,
    [invsts_prg]      NVARCHAR (4)    NOT NULL,
    [orgcod]          NVARCHAR (25)   NOT NULL,
    [lotnum]          NVARCHAR (25)   NOT NULL,
    [ordinv]          NVARCHAR (30)   NOT NULL,
    [dte_code]        NVARCHAR (5)    NOT NULL,
    [rule_nam]        NVARCHAR (20)   NOT NULL,
    CONSTRAINT [PK_mensajes_manufacturas_jda_lineas] PRIMARY KEY CLUSTERED ([id_mensaje] ASC, [numero_sublinea] ASC),
    CONSTRAINT [FK_mensajes_manufactura_jda_lineas_mensajes_manufactura_jda] FOREIGN KEY ([id_mensaje]) REFERENCES [dbo].[mensajes_manufactura_jda] ([id_mensaje]) ON DELETE CASCADE
);

