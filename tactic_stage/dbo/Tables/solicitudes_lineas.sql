CREATE TABLE [dbo].[solicitudes_lineas] (
    [id_solicitud]               BIGINT NOT NULL,
    [numero_item]                INT    NOT NULL,
    [cantidad]                   INT    NOT NULL,
    [id_producto]                BIGINT NOT NULL,
    [id_unidad_medida]           BIGINT NULL,
    [valor_declarado_por_unidad] BIGINT NOT NULL,
    CONSTRAINT [PK_solicitudes_lineas] PRIMARY KEY CLUSTERED ([id_solicitud] ASC, [numero_item] ASC),
    CONSTRAINT [FK_solicitudes_lineas_solicitudes] FOREIGN KEY ([id_solicitud]) REFERENCES [dbo].[solicitudes] ([id_solicitud]) ON DELETE CASCADE
);

