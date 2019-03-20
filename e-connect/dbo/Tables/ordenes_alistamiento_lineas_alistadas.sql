CREATE TABLE [dbo].[ordenes_alistamiento_lineas_alistadas] (
    [id]                    BIGINT        NOT NULL,
    [id_orden_alistamiento] BIGINT        NOT NULL,
    [numero_linea]          INT           NOT NULL,
    [unidades_alistadas]    INT           NOT NULL,
    [ordlin]                VARCHAR (10)  NOT NULL,
    [version]               INT           NOT NULL,
    [usuario_creacion]      VARCHAR (50)  NOT NULL,
    [fecha_creacion]        DATETIME2 (0) NOT NULL,
    [usuario_modificacion]  VARCHAR (50)  NOT NULL,
    [fecha_modificacion]    DATETIME2 (0) NOT NULL,
    CONSTRAINT [PK_ordenes_alistamiento_lineas_alistadas] PRIMARY KEY CLUSTERED ([id] ASC) WITH (FILLFACTOR = 80)
);

