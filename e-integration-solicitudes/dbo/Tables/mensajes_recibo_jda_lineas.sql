CREATE TABLE [dbo].[mensajes_recibo_jda_lineas] (
    [id_mensaje]    BIGINT         NOT NULL,
    [numero_linea]  INT            NOT NULL,
    [invlin]        NVARCHAR (10)  NOT NULL,
    [invsln]        NVARCHAR (10)  NOT NULL,
    [prtnum]        NVARCHAR (50)  NOT NULL,
    [expqty]        INT            NOT NULL,
    [rcvsts]        NVARCHAR (4)   NOT NULL,
    [lotnum]        NVARCHAR (25)  NOT NULL,
    [inv_attr_str7] NVARCHAR (100) NOT NULL,
    CONSTRAINT [PK_mensajes_recibo_jda_lineas] PRIMARY KEY CLUSTERED ([id_mensaje] ASC, [numero_linea] ASC),
    CONSTRAINT [FK_mensajes_recibo_jda_lineas_mensajes_recibo_jda] FOREIGN KEY ([id_mensaje]) REFERENCES [dbo].[mensajes_recibo_jda] ([id_mensaje]) ON DELETE CASCADE
);

