CREATE TABLE [logs].[estados_inventario]
(
    [id_log]             BIGINT          NOT NULL,
    [id]                 BIGINT         NOT NULL,
    [operacion]          NVARCHAR (1) NOT NULL,
    [cambio_notificado]  BIT NOT NULL,
    [fecha_creacion]     DATETIME       NOT NULL,
    [fecha_modificacion] DATETIME       NOT NULL,

    [invsts]               NVARCHAR (4)   NOT NULL,
    [lngdsc]              NVARCHAR (100)  NOT NULL,

    CONSTRAINT [PK_estados_inventario] PRIMARY KEY CLUSTERED ([id_log] ASC)
) ON [PRIMARY]
