CREATE TABLE [dbo].[ordenes_alistamiento] (
    [id_orden_alistamiento] BIGINT         NOT NULL,
    [integracion]           VARCHAR (50)  NOT NULL,
    [id_externo]            VARCHAR (100) NOT NULL,
    [correlacion]           VARCHAR (100) NOT NULL,
    [client_id]             VARCHAR (32)  NOT NULL,
    [wh_id]                 VARCHAR (32)  NOT NULL,
    [ordnum]                VARCHAR (35)  NOT NULL,
    [ordtyp]                VARCHAR (4)   NOT NULL,
    [id_cliente]            BIGINT        NULL,
    [id_bodega]             BIGINT        NULL,
    [id_orden]              BIGINT        NULL,
    [version]               INT           NOT NULL,
    [fecha_creacion]        DATETIME2 (0) NOT NULL,
    [fecha_modificacion]    DATETIME2 (0) NOT NULL,
    CONSTRAINT [PK_ordenes_alistamiento] PRIMARY KEY CLUSTERED ([id_orden_alistamiento] ASC)
);

