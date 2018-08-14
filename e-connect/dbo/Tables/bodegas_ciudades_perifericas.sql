CREATE TABLE [dbo].[bodegas_ciudades_perifericas] (
    [id_bodega] BIGINT NOT NULL,
    [id_ciudad] BIGINT NOT NULL,
    CONSTRAINT [PK_bodegas_ciudades_perifericas] PRIMARY KEY CLUSTERED ([id_bodega] ASC, [id_ciudad] ASC),
    CONSTRAINT [FK_bodegas_ciudades_perifericas_bodegas] FOREIGN KEY ([id_bodega]) REFERENCES [dbo].[bodegas] ([id_bodega]),
    CONSTRAINT [FK_bodegas_ciudades_perifericas_ciudades] FOREIGN KEY ([id_ciudad]) REFERENCES [dbo].[ciudades] ([id_ciudad])
);

