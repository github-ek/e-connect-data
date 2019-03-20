CREATE TABLE [logs].[clientes] (
    [id_log]             BIGINT        IDENTITY (1, 1) NOT NULL,
    [id]                 BIGINT        NOT NULL,
    [operacion]          NVARCHAR (1)  NOT NULL,
    [cambio_notificado]  BIT           NOT NULL,
    [fecha_creacion]     DATETIME      NOT NULL,
    [fecha_modificacion] DATETIME      NOT NULL,
    [client_id]          NVARCHAR (32) NOT NULL,
    [adrnam]             NVARCHAR (40) NOT NULL,
    [host_ext_id]        NVARCHAR (40) NOT NULL,
    [activo]             BIT           NOT NULL,
    CONSTRAINT [PK_clientes] PRIMARY KEY CLUSTERED ([id_log] ASC) WITH (FILLFACTOR = 80)
);


