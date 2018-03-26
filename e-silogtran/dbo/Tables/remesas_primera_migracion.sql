CREATE TABLE [dbo].[remesas_primera_migracion] (
    [remesa_silogtran] VARCHAR (10) NOT NULL,
    [id_cliente]       BIGINT       NOT NULL,
    [numero_solicitud] VARCHAR (19) NOT NULL,
    [placa_programada] VARCHAR (6)  NOT NULL,
    [fecha_programada] DATE         NOT NULL,
    [client_id]        VARCHAR (39) NOT NULL,
    CONSTRAINT [PK_remesas_primera_migracion] PRIMARY KEY CLUSTERED ([remesa_silogtran] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_remesas_primera_migracion]
    ON [dbo].[remesas_primera_migracion]([client_id] ASC, [numero_solicitud] ASC);

