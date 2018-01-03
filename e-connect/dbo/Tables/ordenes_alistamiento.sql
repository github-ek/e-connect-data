﻿CREATE TABLE [dbo].[ordenes_alistamiento] (
    [id_orden_alistamiento]   BIGINT        IDENTITY (1, 1) NOT NULL,
    [id_orden]                BIGINT        NOT NULL,
    [estado]                  VARCHAR (50)  NOT NULL,
    [id_bodega]               BIGINT        NOT NULL,
    [id_cliente]              BIGINT        NOT NULL,
    [id_servicio]             BIGINT        NOT NULL,
    [id_tercero]              BIGINT        NULL,
    [tercero_codigo_alterno]  VARCHAR (20)  NOT NULL,
    [tercero_nombre]          VARCHAR (100) NOT NULL,
    [id_linea_negocio]        BIGINT        NOT NULL,
    [fecha_minima_solicitada] DATE          NULL,
    [fecha_maxima_solicitada] DATE          NULL,
    [fecha_cita]              DATE          NULL,
    [hora_cita_minima]        TIME (0)      NULL,
    [hora_cita_maxima]        TIME (0)      NULL,
    [client_id]               NVARCHAR (32) NOT NULL,
    [ordtyp]                  NVARCHAR (4)  NOT NULL,
    [ordnum]                  NVARCHAR (35) NOT NULL,
    [wh_id]                   NVARCHAR (32) NOT NULL,
    [rmanum]                  NVARCHAR (30) NOT NULL,
    [bus_grp]                 NVARCHAR (40) NOT NULL,
    [btcust]                  NVARCHAR (20) NOT NULL,
    [stcust]                  NVARCHAR (20) NOT NULL,
    [rtcust]                  NVARCHAR (20) NOT NULL,
    [bt_host_adr_id]          NVARCHAR (20) NOT NULL,
    [st_host_adr_id]          NVARCHAR (20) NOT NULL,
    [rt_host_adr_id]          NVARCHAR (20) NOT NULL,
    [cpodte]                  DATETIME      NOT NULL,
    [shipby]                  NVARCHAR (10) NOT NULL,
    [moddte]                  DATETIME      NULL,
    [mod_usr_id]              NVARCHAR (40) NULL,
    [nota_cierre]             VARCHAR (200) NOT NULL,
    [usuario_cierre]          VARCHAR (50)  NOT NULL,
    [fecha_cierre]            DATETIME2 (0) NULL,
    [id_causal_anulacion]     BIGINT        NULL,
    [nota_anulacion]          VARCHAR (200) NOT NULL,
    [usuario_anulacion]       VARCHAR (50)  NOT NULL,
    [fecha_anulacion]         DATETIME2 (0) NULL,
    [version]                 INT           NOT NULL,
    [usuario_creacion]        VARCHAR (50)  NOT NULL,
    [fecha_creacion]          DATETIME2 (0) NOT NULL,
    [usuario_modificacion]    VARCHAR (50)  NOT NULL,
    [fecha_modificacion]      DATETIME2 (0) NOT NULL,
    CONSTRAINT [PK_ordenes_alistamiento] PRIMARY KEY CLUSTERED ([id_orden_alistamiento] ASC) WITH (FILLFACTOR = 80),
    CONSTRAINT [FK_ordenes_alistamiento_bodegas] FOREIGN KEY ([id_bodega]) REFERENCES [dbo].[bodegas] ([id_bodega]),
    CONSTRAINT [FK_ordenes_alistamiento_clientes] FOREIGN KEY ([id_cliente]) REFERENCES [dbo].[clientes] ([id_cliente]),
    CONSTRAINT [FK_ordenes_alistamiento_servicios] FOREIGN KEY ([id_servicio]) REFERENCES [dbo].[servicios] ([id_servicio]),
    CONSTRAINT [FK_ordenes_alistamiento_terceros] FOREIGN KEY ([id_tercero]) REFERENCES [dbo].[terceros] ([id_tercero])
);

