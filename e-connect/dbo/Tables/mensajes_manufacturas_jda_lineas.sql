CREATE TABLE [dbo].[mensajes_manufacturas_jda_lineas] (
    [id]                   BIGINT          IDENTITY (1, 1) NOT NULL,
    [id_orden_manufactura] BIGINT          NOT NULL,
    [numero_linea]         INT             NOT NULL,
    [numero_sublinea]      INT             NOT NULL,
    [wkolin]               NVARCHAR (10)   NOT NULL,
    [prtnum]               NVARCHAR (50)   NOT NULL,
    [linqty]               INT             NOT NULL,
    [bom_cnsqty]           NUMERIC (19, 4) NOT NULL,
    [invsts]               NVARCHAR (4)    NOT NULL,
    [invsts_prg]           NVARCHAR (4)    NOT NULL,
    [ordinv]               NVARCHAR (30)   NOT NULL,
    [dte_code]             NVARCHAR (5)    NOT NULL,
    CONSTRAINT [PK_mensajes_manufacturas_jda_lineas] PRIMARY KEY CLUSTERED ([id] ASC) WITH (FILLFACTOR = 80)
);


