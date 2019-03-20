﻿CREATE TABLE [dbo].[ordenes_alistamiento_lotes] (
    [id]                 BIGINT        NOT NULL,
    [id_orden_linea]     BIGINT        NOT NULL,
    [prtnum]             VARCHAR (50)  NOT NULL,
    [invsts]             VARCHAR (4)   NOT NULL,
    [untqty]             INT           NOT NULL,
    [lotnum]             VARCHAR (25)  NOT NULL,
    [orgcod]             VARCHAR (25)  NOT NULL,
    [expire_dte]         DATETIME2 (0) NULL,
    [version]            INT           NOT NULL,
    [fecha_creacion]     DATETIME2 (0) NOT NULL,
    [fecha_modificacion] DATETIME2 (0) NOT NULL,
    CONSTRAINT [PK_ordenes_alistamiento_lotes] PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [FK_ordenes_alistamiento_lotes_ordenes_alistamiento_lineas] FOREIGN KEY ([id_orden_linea]) REFERENCES [dbo].[ordenes_alistamiento_lineas] ([id_orden_linea]) ON DELETE CASCADE
);



