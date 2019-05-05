CREATE TABLE [dbo].[ordenes_alistamiento_canpck] (
    [id]                 BIGINT        NOT NULL,
    [id_orden_linea]     BIGINT        NOT NULL,
    [prtnum]             VARCHAR (50)  NOT NULL,
    [cancod]             VARCHAR (40)  NOT NULL,
    [lngdsc]             VARCHAR (100) NOT NULL,
    [remqty]             INT           NOT NULL,
    [can_usr_id]         VARCHAR (50)  NOT NULL,
    [candte]             DATETIME2 (7) NOT NULL,
    [version]            INT           NOT NULL,
    [fecha_creacion]     DATETIME2 (0) NOT NULL,
    [fecha_modificacion] DATETIME2 (0) NOT NULL,
    CONSTRAINT [PK_ordenes_alistamiento_canpck] PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [FK_ordenes_alistamiento_canpck_ordenes_alistamiento_shipment_line] FOREIGN KEY ([id_orden_linea]) REFERENCES [dbo].[ordenes_alistamiento_shipment_line] ([id_orden_linea]) ON DELETE CASCADE
);

