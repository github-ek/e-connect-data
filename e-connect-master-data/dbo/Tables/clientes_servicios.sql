CREATE TABLE [dbo].[clientes_servicios] (
    [id_cliente]  BIGINT NOT NULL,
    [id_servicio] BIGINT NOT NULL,
    CONSTRAINT [PK_clientes_servicios] PRIMARY KEY CLUSTERED ([id_cliente] ASC, [id_servicio] ASC),
    CONSTRAINT [FK_clientes_servicios_clientes] FOREIGN KEY ([id_cliente]) REFERENCES [dbo].[clientes] ([id_cliente]),
    CONSTRAINT [FK_clientes_servicios_servicios] FOREIGN KEY ([id_servicio]) REFERENCES [dbo].[servicios] ([id_servicio])
);

