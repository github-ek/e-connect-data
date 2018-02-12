CREATE TABLE [dbo].[embarques_lineas]
(
    [id_embarque]                       BIGINT NOT NULL,
    [id_orden_alistamiento]    BIGINT          NOT NULL,
    [numero_linea]             INT             NOT NULL,

    [id_producto]              BIGINT          NOT NULL,
    [producto_codigo]          VARCHAR (50)    NOT NULL,
    [id_estado_inventario]     VARCHAR (4)     NOT NULL,
    [id_unidad_medida]         BIGINT          NOT NULL,

    [unidades_despachadas]     INT             NOT NULL,

    [lote]                     VARCHAR (30)    NOT NULL,

    [version]                  INT           NOT NULL DEFAULT 0,
    [usuario_creacion]         VARCHAR (50)  NOT NULL DEFAULT '',
    [fecha_creacion]           DATETIME2 (0) NOT NULL,
    [usuario_modificacion]     VARCHAR (50)  NOT NULL DEFAULT '',
    [fecha_modificacion]       DATETIME2 (0) NOT NULL, 
)ON [PRIMARY]
