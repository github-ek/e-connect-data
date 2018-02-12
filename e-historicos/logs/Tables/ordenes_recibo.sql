﻿CREATE TABLE [logs].[ordenes_recibo] (
    [id_log]             BIGINT         IDENTITY (1, 1) NOT NULL,
    [id]                 BIGINT         NOT NULL,
	[order_key]          NVARCHAR(200) NOT NULL,
	[line_key]           NVARCHAR(50) NOT NULL,
    [operacion]          NVARCHAR (1) NOT NULL,
    [estado]             NVARCHAR (50) NOT NULL,
    [cambio_notificado]  BIT NOT NULL,
    [fecha_creacion]     DATETIME       NOT NULL,
    [fecha_modificacion] DATETIME       NOT NULL,

    [client_id]          NVARCHAR (32)  NOT NULL,
    [wh_id]              NVARCHAR (32)  NOT NULL,
    [supnum]             NVARCHAR (32)  NOT NULL,
    [invnum]             NVARCHAR (35)  NOT NULL,
    [trknum]             NVARCHAR (20)  NOT NULL,
    [po_num]             NVARCHAR (35)  NOT NULL,
    [invtyp]             NVARCHAR (4)   NOT NULL,
    [invdte]             DATETIME       NOT NULL,
    [moddte]             DATETIME       NOT NULL,
    [mod_usr_id]         NVARCHAR (40)  NOT NULL,

    [invlin]             NVARCHAR (10)  NOT NULL,
    [invsln]             NVARCHAR (10)  NOT NULL,
    [seqnum]             INT            NOT NULL,
    [prtnum]             NVARCHAR (50)  NOT NULL,
    [rcvsts]             NVARCHAR (4)   NOT NULL,
    [expqty]             INT            NOT NULL,
    [rcvqty]             INT            NOT NULL,
    [lotnum]             NVARCHAR (25)  NOT NULL,
    [mandte]             DATETIME       NOT NULL,
    [expire_dte]         DATETIME       NOT NULL,
    [inv_attr_str7]      NVARCHAR (100) NOT NULL,
    [rcvkey]             NVARCHAR (30) NOT NULL,
    [edtflg]             INT            NOT NULL, 
    [blind_flg]          INT            NOT NULL, 
    [rcvlin_moddte]      DATETIME       NOT NULL,
    [rcvlin_mod_usr_id]  NVARCHAR (40)  NOT NULL,

    [rcvtrk_stat]        NVARCHAR (8)   NOT NULL,
    [devcod]             NVARCHAR (20)  NOT NULL,
    [rcvtrk_clsdte]      DATETIME       NOT NULL,
    [rcvtrk_moddte]      DATETIME       NOT NULL,
    [rcvtrk_mod_usr_id]  NVARCHAR (40)  NOT NULL,

    [trlr_id]            NVARCHAR (20)  NOT NULL,
    [trlr_num]           NVARCHAR (20)  NOT NULL,
    [trlr_stat]          NVARCHAR (8)   NOT NULL,
    [trlr_typ]           NVARCHAR (4)   NOT NULL,
    [trlr_size]          INT            NOT NULL, 
    [refrig_flg]          INT            NOT NULL, 
    [trlr_cod]           NVARCHAR (4)   NOT NULL,
    [trlr_cond]          NVARCHAR (10)  NOT NULL,
    [safe_sts]           NVARCHAR (1)  NOT NULL,
    [carcod]             NVARCHAR (10)  NOT NULL,
    [tractor_num]        NVARCHAR (10)  NOT NULL,
    [driver_nam]         NVARCHAR (40)  NOT NULL,
    [driver_lic_num]     NVARCHAR (40)  NOT NULL,
    [arrdte]             DATETIME       NOT NULL,
    [close_dte]          DATETIME       NOT NULL,
    [dispatch_dte]       DATETIME       NOT NULL,
    [trlr_seal1]         NVARCHAR (30)  NOT NULL,
    [trlr_seal2]         NVARCHAR (30)  NOT NULL,
    [trlr_seal3]         NVARCHAR (30)  NOT NULL,
    [trlr_seal4]         NVARCHAR (30)  NOT NULL,
    [trlr_moddte]        DATETIME       NOT NULL,
    [trlr_mod_usr_id]    NVARCHAR (40)  NOT NULL,
    CONSTRAINT [PK_ordenes_recibo] PRIMARY KEY CLUSTERED ([id_log] ASC)
)ON [PRIMARY]
