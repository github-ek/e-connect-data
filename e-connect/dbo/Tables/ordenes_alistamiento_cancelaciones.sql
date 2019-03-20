CREATE TABLE [dbo].[ordenes_alistamiento_cancelaciones] (
    [id]                      BIGINT        NOT NULL,
    [id_orden_alistamiento]   BIGINT        NOT NULL,
    [numero_linea]            INT           NOT NULL,
    [unidades_canceladas]     INT           NOT NULL,
    [cancelacion_codigo]      VARCHAR (40)  NOT NULL,
    [cancelacion_descripcion] VARCHAR (100) NOT NULL,
    [version]                 INT           NOT NULL,
    [usuario_creacion]        VARCHAR (50)  NOT NULL,
    [fecha_creacion]          DATETIME2 (0) NOT NULL,
    [usuario_modificacion]    VARCHAR (50)  NOT NULL,
    [fecha_modificacion]      DATETIME2 (0) NOT NULL,
    CONSTRAINT [PK_ordenes_alistamiento_cancelaciones] PRIMARY KEY CLUSTERED ([id] ASC) WITH (FILLFACTOR = 80),
    CONSTRAINT [FK_ordenes_alistamiento_cancelaciones_ordenes_alistamiento] FOREIGN KEY ([id_orden_alistamiento]) REFERENCES [dbo].[ordenes_alistamiento] ([id_orden_alistamiento])
);

