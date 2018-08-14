CREATE TABLE [logs].[alistamientos] (
    [id]                   BIGINT        IDENTITY (1, 1) NOT NULL,
    [id_alistamiento]      BIGINT        NOT NULL,
    [id_externo]           VARCHAR (200) NOT NULL,
    [client_id]            VARCHAR (32)  NOT NULL,
    [ordnum]               VARCHAR (35)  NOT NULL,
    [wh_id]                VARCHAR (32)  NOT NULL,
    [id_cliente]           BIGINT        NULL,
    [id_solicitud]         BIGINT        NULL,
    [id_bodega]            BIGINT        NULL,
    [estado]               VARCHAR (50)  NOT NULL,
    [version]              INT           NOT NULL,
    [usuario_creacion]     VARCHAR (50)  NOT NULL,
    [fecha_creacion]       DATETIME2 (0) NOT NULL,
    [usuario_modificacion] VARCHAR (50)  NOT NULL,
    [fecha_modificacion]   DATETIME2 (0) NOT NULL,
    CONSTRAINT [PK_alistamientos] PRIMARY KEY CLUSTERED ([id] ASC)
);

