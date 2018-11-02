CREATE TABLE [dbo].[tarifas_secundaria] (
    [id_tarifa_secundaria]                   BIGINT          NOT NULL,
    [id_cliente]                             BIGINT          NOT NULL,
    [id_bodega]                              BIGINT          NOT NULL,
    [nombre]                                 VARCHAR (100)   NOT NULL,
    [liquidar_por_kilos]                     BIT             NOT NULL,
    [id_unidad_medida]                       BIGINT          NOT NULL,
    [cantidad_minima]                        INT             NOT NULL,
    [tarifa_normal]                          DECIMAL (10, 2) NOT NULL,
    [tarifa_diferencial_por_despacho_minimo] DECIMAL (10, 2) NOT NULL,
    [porcentaje_seguro]                      DECIMAL (3, 3)  NOT NULL,
    [tiene_ciudades_asociadas]               BIT             NOT NULL,
    [activo]                                 BIT             CONSTRAINT [DF_tarifas_secundaria_activo] DEFAULT ((1)) NOT NULL,
    [version]                                INT             CONSTRAINT [DF_tarifas_secundaria_version] DEFAULT ((0)) NOT NULL,
    [usuario_creacion]                       VARCHAR (50)    CONSTRAINT [DF_tarifas_secundaria_usuario_creacion] DEFAULT ('') NOT NULL,
    [fecha_creacion]                         DATETIME2 (0)   CONSTRAINT [DF_tarifas_secundaria_fecha_creacion] DEFAULT (sysdatetime()) NOT NULL,
    [usuario_modificacion]                   VARCHAR (50)    CONSTRAINT [DF_tarifas_secundaria_usuario_modificacion] DEFAULT ('') NOT NULL,
    [fecha_modificacion]                     DATETIME2 (0)   CONSTRAINT [DF_tarifas_secundaria_fecha_modificacion] DEFAULT (sysdatetime()) NOT NULL,
    CONSTRAINT [PK_tarifas_secundaria] PRIMARY KEY CLUSTERED ([id_tarifa_secundaria] ASC),
    CONSTRAINT [FK_tarifas_secundaria_bodegas] FOREIGN KEY ([id_bodega]) REFERENCES [dbo].[bodegas] ([id_bodega]),
    CONSTRAINT [FK_tarifas_secundaria_clientes] FOREIGN KEY ([id_cliente]) REFERENCES [dbo].[clientes] ([id_cliente]),
    CONSTRAINT [FK_tarifas_secundaria_unidades_medida] FOREIGN KEY ([id_unidad_medida]) REFERENCES [dbo].[unidades_medida] ([id_unidad_medida])
);

