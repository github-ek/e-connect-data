CREATE TABLE [dbo].[solicitudes_lineas_bom] (
    [id]                                      BIGINT        IDENTITY (1, 1) NOT NULL,
    [id_solicitud]                            BIGINT        NOT NULL,
    [numero_linea]                            INT           NOT NULL,
    [id_producto]                             BIGINT        NOT NULL,
    [producto_codigo]                         VARCHAR (50)  NOT NULL,
    [id_estado_inventario]                    VARCHAR (4)   NOT NULL,
    [id_subestado_inventario]                 VARCHAR (25)  NULL,
    [unidades]                                INT           NOT NULL,
    [lote]                                    VARCHAR (30)  CONSTRAINT [DF__solicitude__lote__76A18A26] DEFAULT ('') NOT NULL,
    [estado_inventario_bom_codigo_alterno]    VARCHAR (50)  NOT NULL,
    [subestado_inventario_bom_codigo_alterno] VARCHAR (50)  NOT NULL,
    [version]                                 INT           CONSTRAINT [DF_solicitudes_lineas_bom_version] DEFAULT ((0)) NOT NULL,
    [usuario_creacion]                        VARCHAR (50)  NOT NULL,
    [fecha_creacion]                          DATETIME2 (0) NOT NULL,
    [usuario_modificacion]                    VARCHAR (50)  NOT NULL,
    [fecha_modificacion]                      DATETIME2 (0) NOT NULL,
    CONSTRAINT [PK_solicitudes_lineas_bom] PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [FK_solicitudes_lineas_bom_estados_inventario] FOREIGN KEY ([id_estado_inventario]) REFERENCES [dbo].[estados_inventario] ([id_estado_inventario]),
    CONSTRAINT [FK_solicitudes_lineas_bom_productos] FOREIGN KEY ([id_producto]) REFERENCES [dbo].[productos] ([id_producto]),
    CONSTRAINT [FK_solicitudes_lineas_bom_solicitudes] FOREIGN KEY ([id_solicitud]) REFERENCES [dbo].[solicitudes] ([id_solicitud]) ON DELETE CASCADE,
    CONSTRAINT [FK_solicitudes_lineas_bom_sub_estados_inventario] FOREIGN KEY ([id_subestado_inventario]) REFERENCES [dbo].[subestados_inventario] ([id_subestado_inventario])
);

