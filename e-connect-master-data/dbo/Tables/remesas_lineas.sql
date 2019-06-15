CREATE TABLE [dbo].[remesas_lineas] (
    [id]                       BIGINT          IDENTITY (1, 1) NOT NULL,
    [id_remesa]                BIGINT          NOT NULL,
    [numero_linea]             INT             NOT NULL,
    [id_producto]              BIGINT          NOT NULL,
    [producto_codigo]          VARCHAR (50)    NOT NULL,
    [id_estado_inventario]     VARCHAR (4)     NOT NULL,
    [id_unidad_medida]         BIGINT          NOT NULL,
    [unidades_despachadas]     INT             NOT NULL,
    [largo]                    DECIMAL (12, 4) NOT NULL,
    [ancho]                    DECIMAL (12, 4) NOT NULL,
    [alto]                     DECIMAL (12, 4) NOT NULL,
    [peso]                     DECIMAL (12, 4) NOT NULL,
    [volumen]                  AS              (([largo]*[ancho])*[alto]),
    [valor_unitario_declarado] INT             NOT NULL,
    [id_unidad_medida_caja]    BIGINT          NOT NULL,
    [factor_conversion]        INT             NOT NULL,
    [cajas_despachadas]        AS              (CONVERT([decimal](10,2),[unidades_despachadas])/CONVERT([decimal](10,2),[factor_conversion])),
    [caja_largo]               DECIMAL (12, 4) NOT NULL,
    [caja_ancho]               DECIMAL (12, 4) NOT NULL,
    [caja_alto]                DECIMAL (12, 4) NOT NULL,
    [caja_peso]                DECIMAL (12, 4) NOT NULL,
    [caja_volumen]             AS              (([caja_largo]*[caja_ancho])*[caja_alto]),
    [version]                  INT             CONSTRAINT [DF__remesas_l__versi__1446FBA6] DEFAULT ((0)) NOT NULL,
    [usuario_creacion]         VARCHAR (50)    CONSTRAINT [DF__remesas_l__usuar__153B1FDF] DEFAULT ('') NOT NULL,
    [fecha_creacion]           DATETIME2 (0)   NOT NULL,
    [usuario_modificacion]     VARCHAR (50)    CONSTRAINT [DF__remesas_l__usuar__162F4418] DEFAULT ('') NOT NULL,
    [fecha_modificacion]       DATETIME2 (0)   NOT NULL,
    CONSTRAINT [PK_remesas_lineas] PRIMARY KEY CLUSTERED ([id] ASC) WITH (FILLFACTOR = 80),
    CONSTRAINT [FK_remesas_lineas_productos] FOREIGN KEY ([id_producto]) REFERENCES [dbo].[productos] ([id_producto]),
    CONSTRAINT [FK_remesas_lineas_remesas] FOREIGN KEY ([id_remesa]) REFERENCES [dbo].[remesas] ([id_remesa]),
    CONSTRAINT [FK_remesas_lineas_unidades_medida] FOREIGN KEY ([id_unidad_medida]) REFERENCES [dbo].[unidades_medida] ([id_unidad_medida]),
    CONSTRAINT [FK_remesas_lineas_unidades_medida_caja] FOREIGN KEY ([id_unidad_medida_caja]) REFERENCES [dbo].[unidades_medida] ([id_unidad_medida])
);


GO
CREATE NONCLUSTERED INDEX [IX_remesas_lineas_01]
    ON [dbo].[remesas_lineas]([id_remesa] ASC);

