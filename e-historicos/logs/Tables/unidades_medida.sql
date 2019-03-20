CREATE TABLE [logs].[unidades_medida] (
    [id_log]             BIGINT         IDENTITY (1, 1) NOT NULL,
    [id]                 BIGINT         NOT NULL,
    [operacion]          NVARCHAR (1)   NOT NULL,
    [cambio_notificado]  BIT            NOT NULL,
    [fecha_creacion]     DATETIME       NOT NULL,
    [fecha_modificacion] DATETIME       NOT NULL,
    [uomcod]             NVARCHAR (2)   NOT NULL,
    [lngdsc]             NVARCHAR (100) NOT NULL,
    CONSTRAINT [PK_unidades_medida] PRIMARY KEY CLUSTERED ([id_log] ASC) WITH (FILLFACTOR = 80)
);


