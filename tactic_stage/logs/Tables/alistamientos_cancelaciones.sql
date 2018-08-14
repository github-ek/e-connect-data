CREATE TABLE [logs].[alistamientos_cancelaciones] (
    [id]                   BIGINT        IDENTITY (1, 1) NOT NULL,
    [id_alistamiento]      BIGINT        NOT NULL,
    [ordlin]               VARCHAR (10)  NOT NULL,
    [cancelacion_codigo]   VARCHAR (50)  NOT NULL,
    [cantidad_cancelada]   INT           NOT NULL,
    [usuario_creacion]     VARCHAR (50)  NOT NULL,
    [fecha_creacion]       DATETIME2 (0) NOT NULL,
    [usuario_modificacion] VARCHAR (50)  NOT NULL,
    [fecha_modificacion]   DATETIME2 (0) NOT NULL,
    CONSTRAINT [PK_alistamientos_cancelaciones] PRIMARY KEY CLUSTERED ([id] ASC)
);

