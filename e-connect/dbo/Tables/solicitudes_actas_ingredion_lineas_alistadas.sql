CREATE TABLE [dbo].[solicitudes_actas_ingredion_lineas_alistadas] (
    [id]                                BIGINT          IDENTITY (1, 1) NOT NULL,
    [id_solicitud_acta]                 BIGINT          NOT NULL,
    [prtnum]                            VARCHAR (50)    NOT NULL,
    [invsts]                            VARCHAR (4)     NOT NULL,
    [orgcod]                            VARCHAR (25)    NOT NULL,
    [lotnum]                            VARCHAR (25)    NOT NULL,
    [expire_dte]                        DATETIME        NOT NULL,
    [untqty]                            INT             NOT NULL,
    [untcas]                            INT             NOT NULL,
    [empaques]                          DECIMAL (23, 8) NOT NULL,
    [peso_empaques]                     DECIMAL (23, 8) NULL,
    [volumen_empaques]                  DECIMAL (23, 8) NULL,
    [id_producto]                       BIGINT          NULL,
    [producto_nombre]                   VARCHAR (250)   NULL,
    [id_estado_inventario]              VARCHAR (4)     NOT NULL,
    [estado_inventario_nombre]          VARCHAR (100)   NULL,
    [id_bodega_virtual]                 BIGINT          NULL,
    [id_unidad_medida]                  BIGINT          NULL,
    [unidad_medida_codigo_alterno_tms]  VARCHAR (50)    NULL,
    [id_unidad_empaque]                 BIGINT          NULL,
    [unidad_empaque_codigo_alterno_tms] VARCHAR (50)    NULL,
    [version]                           INT             CONSTRAINT [DF_solicitudes_actas_ingredion_lineas_alistadas_version] DEFAULT ((0)) NOT NULL,
    [fecha_creacion]                    DATETIME2 (0)   CONSTRAINT [DF_solicitudes_actas_ingredion_lineas_alistadas_fecha_creacion] DEFAULT (sysdatetime()) NOT NULL,
    [fecha_modificacion]                DATETIME2 (0)   CONSTRAINT [DF_solicitudes_actas_ingredion_lineas_alistadas_fecha_modificacion] DEFAULT (sysdatetime()) NOT NULL,
    CONSTRAINT [PK_solicitudes_actas_ingredion_lineas_alistadas] PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [FK_solicitudes_actas_ingredion_lineas_alistadas_bodegas_virtuales] FOREIGN KEY ([id_bodega_virtual]) REFERENCES [dbo].[bodegas_virtuales] ([id_bodega_virtual]),
    CONSTRAINT [FK_solicitudes_actas_ingredion_lineas_alistadas_estados_inventario] FOREIGN KEY ([id_estado_inventario]) REFERENCES [dbo].[estados_inventario] ([id_estado_inventario]),
    CONSTRAINT [FK_solicitudes_actas_ingredion_lineas_alistadas_productos] FOREIGN KEY ([id_producto]) REFERENCES [dbo].[productos] ([id_producto]),
    CONSTRAINT [FK_solicitudes_actas_ingredion_lineas_alistadas_solicitudes_actas_ingredion] FOREIGN KEY ([id_solicitud_acta]) REFERENCES [dbo].[solicitudes_actas_ingredion] ([id_solicitud_acta]),
    CONSTRAINT [FK_solicitudes_actas_ingredion_lineas_alistadas_unidades_empaque] FOREIGN KEY ([id_unidad_empaque]) REFERENCES [dbo].[unidades_medida] ([id_unidad_medida]),
    CONSTRAINT [FK_solicitudes_actas_ingredion_lineas_alistadas_unidades_medida] FOREIGN KEY ([id_unidad_medida]) REFERENCES [dbo].[unidades_medida] ([id_unidad_medida])
);


GO
CREATE NONCLUSTERED INDEX [IX_solicitudes_actas_ingredion_lineas_alistadas]
    ON [dbo].[solicitudes_actas_ingredion_lineas_alistadas]([id_solicitud_acta] ASC);

