﻿CREATE TABLE [logs].[ubicaciones] (
    [id_log]             BIGINT        IDENTITY (1, 1) NOT NULL,
    [id]                 BIGINT        NOT NULL,
    [operacion]          NVARCHAR (50) NOT NULL,
    [fecha_creacion]     DATETIME      NOT NULL,
    [fecha_modificacion] DATETIME      NOT NULL,
    [wh_id]              NVARCHAR (32) NOT NULL,
    [arecod]             NVARCHAR (10) NOT NULL,
    [stoloc]             NVARCHAR (20) NOT NULL,
    [wrkzon]             NVARCHAR (20) NOT NULL,
    [last_upd_dt]        DATETIME      NULL,
    [last_upd_user_id]   NVARCHAR (40) NULL,
    CONSTRAINT [PK_ubicaciones] PRIMARY KEY CLUSTERED ([id_log] ASC) WITH (FILLFACTOR = 80)
);

