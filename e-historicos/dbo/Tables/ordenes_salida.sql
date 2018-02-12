CREATE TABLE [dbo].[ordenes_salida] (
    [id]                 BIGINT        IDENTITY (1, 1) NOT NULL,
	[order_key]          NVARCHAR(200) NOT NULL,
	[line_key]           NVARCHAR(50) NOT NULL,

    [operacion]          NVARCHAR (1) NOT NULL,
    [estado]             NVARCHAR (50) NOT NULL,
    [cambio_notificado]  BIT NOT NULL,
    [fecha_creacion]     DATETIME       NOT NULL,
    [fecha_modificacion] DATETIME       NOT NULL,

    [client_id]          NVARCHAR (32) NOT NULL,
    [wh_id]              NVARCHAR (32) NOT NULL,
    [ordnum]             NVARCHAR (35) NOT NULL,
    [rmanum]             NVARCHAR (30) NOT NULL,
    [ordtyp]             NVARCHAR (4)  NOT NULL,
    [bus_grp]            NVARCHAR (40) NOT NULL,
    [stcust]             NVARCHAR (20) NOT NULL,
    [wave_flg]           INT           NOT NULL,
    [adddte]             DATETIME      NOT NULL,
    [moddte]             DATETIME      NOT NULL,
    [mod_usr_id]         NVARCHAR (40) NOT NULL,

    [ordlin]             NVARCHAR (10) NOT NULL,
    [prtnum]             NVARCHAR (50) NOT NULL,
    [invsts_prg]         NVARCHAR (4)  NOT NULL,
    [ordqty]             INT           NOT NULL,
    [shpqty]             INT           NOT NULL,
    [remqty]             INT           NOT NULL,
    [ordlin_moddte]      DATETIME      NOT NULL,
    [ordlin_mod_usr_id]  NVARCHAR (40) NOT NULL,

    [canpck_candte]      DATETIME      NOT NULL,
    [canpck_can_usr_id]  NVARCHAR (40) NOT NULL,
    CONSTRAINT [PK_ordenes_salida] PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [UK_ordenes_salida_01] UNIQUE NONCLUSTERED ([client_id] ASC, [wh_id] ASC, [ordnum] ASC, [ordlin] ASC)
);
