CREATE TABLE [dbo].[servicios_tipos_wms_orden] (
    [id_servicio]           BIGINT NOT NULL,
    [id_tipo_orden_wms]     BIGINT NOT NULL,
    [generacion_automatica] BIT    NOT NULL,
    CONSTRAINT [FK_servicios_tipos_wms_orden_servicios] FOREIGN KEY ([id_servicio]) REFERENCES [dbo].[servicios] ([id_servicio]),
    CONSTRAINT [FK_servicios_tipos_wms_orden_tipos_wms_orden] FOREIGN KEY ([id_tipo_orden_wms]) REFERENCES [dbo].[tipos_wms_orden] ([id_tipo_orden_wms])
);

