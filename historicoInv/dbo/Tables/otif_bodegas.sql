CREATE TABLE [dbo].[otif_bodegas] (
    [adddte]        DATETIME      NULL,
    [client_id]     NVARCHAR (32) NULL,
    [ordnum]        NVARCHAR (35) NULL,
    [rmanum]        NVARCHAR (30) NULL,
    [invsts_prg]    NVARCHAR (4)  NULL,
    [lin_ord]       INT           NULL,
    [cnt_ord]       INT           NULL,
    [cnt_env]       INT           NULL,
    [cnt_prg]       INT           NULL,
    [cnt_stg]       INT           NULL,
    [peso]          INT           NULL,
    [cajas]         INT           NULL,
    [schbat]        NVARCHAR (32) NULL,
    [trlr_num]      NVARCHAR (20) NULL,
    [cpodate]       DATETIME      NULL,
    [dispatch_date] DATETIME      NULL,
    [ordtyp]        NVARCHAR (4)  NULL,
    [stcust]        NVARCHAR (20) NULL,
    [wh_id]         NVARCHAR (32) NULL
);

