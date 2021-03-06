﻿CREATE TABLE [dbo].[productos_medidas] (
    [id]                      BIGINT          IDENTITY (1, 1) NOT NULL,
    [operacion]               NVARCHAR (1)    NOT NULL,
    [cambio_notificado]       BIT             DEFAULT ((0)) NOT NULL,
    [fecha_creacion]          DATETIME        NOT NULL,
    [fecha_modificacion]      DATETIME        NOT NULL,
    [prt_client_id]           NVARCHAR (32)   NOT NULL,
    [prtnum]                  NVARCHAR (50)   NOT NULL,
    [wh_id]                   NVARCHAR (32)   NOT NULL,
    [uomcod]                  NVARCHAR (2)    NOT NULL,
    [ftpcod]                  VARCHAR (30)    NOT NULL,
    [uomlvl]                  INT             NOT NULL,
    [untqty]                  INT             NOT NULL,
    [len]                     DECIMAL (19, 4) NOT NULL,
    [wid]                     DECIMAL (19, 4) NOT NULL,
    [hgt]                     DECIMAL (19, 4) NOT NULL,
    [grswgt]                  DECIMAL (23, 8) NOT NULL,
    [rcv_flg]                 BIT             NOT NULL,
    [cas_flg]                 BIT             NOT NULL,
    [pal_flg]                 BIT             NOT NULL,
    [last_upd_dt]             DATETIME        NOT NULL,
    [last_upd_user_id]        NVARCHAR (40)   NOT NULL,
    [prtftp_last_upd_dt]      DATETIME        NOT NULL,
    [prtftp_last_upd_user_id] NVARCHAR (40)   NOT NULL,
    CONSTRAINT [PK_productos_medidas] PRIMARY KEY CLUSTERED ([id] ASC) WITH (FILLFACTOR = 80),
    CONSTRAINT [UK_productos_medidas_01] UNIQUE NONCLUSTERED ([prt_client_id] ASC, [prtnum] ASC, [wh_id] ASC, [uomcod] ASC) WITH (FILLFACTOR = 80)
);



