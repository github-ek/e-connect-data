CREATE TABLE [dbo].[llaves_campos] (
    [id_llave] BIGINT NOT NULL,
    [id_campo] BIGINT NOT NULL,
    CONSTRAINT [PK_llaves_campos] PRIMARY KEY CLUSTERED ([id_llave] ASC, [id_campo] ASC),
    CONSTRAINT [FK_llaves_campos_campos] FOREIGN KEY ([id_campo]) REFERENCES [dbo].[campos] ([id_campo]),
    CONSTRAINT [FK_llaves_campos_llaves] FOREIGN KEY ([id_llave]) REFERENCES [dbo].[llaves] ([id_llave])
);

