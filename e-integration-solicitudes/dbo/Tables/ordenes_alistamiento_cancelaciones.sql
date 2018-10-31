CREATE TABLE [dbo].[ordenes_alistamiento_cancelaciones] (
    [id]                          BIGINT        IDENTITY (1, 1) NOT NULL,
    [id_orden_alistamiento_linea] BIGINT        NOT NULL,
    [prtnum]                      VARCHAR (50)  NOT NULL,
    [cancod]                      VARCHAR (40)  NOT NULL,
    [lngdsc]                      VARCHAR (100) NOT NULL,
    [remqty]                      INT           NOT NULL,
    [can_usr_id]                  VARCHAR (50)  NOT NULL,
    [candte]                      DATETIME2 (7) NOT NULL,
    [id_producto]                 BIGINT        NULL,
    [id_causal_cancelacion]       VARCHAR (40)  NULL,
    [version]                     INT           NOT NULL,
    [fecha_creacion]              DATETIME2 (0) NOT NULL,
    [fecha_modificacion]          DATETIME2 (0) NOT NULL,
    CONSTRAINT [PK_ordenes_alistamiento_cancelaciones] PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [FK_ordenes_alistamiento_cancelaciones_ordenes_alistamiento_lineas] FOREIGN KEY ([id_orden_alistamiento_linea]) REFERENCES [dbo].[ordenes_alistamiento_lineas] ([id_orden_alistamiento_linea]) ON DELETE CASCADE
);

