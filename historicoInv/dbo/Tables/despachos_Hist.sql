CREATE TABLE [dbo].[despachos_Hist] (
    [trlr_num]   NVARCHAR (20) NULL,
    [client_id]  NVARCHAR (32) NULL,
    [wh_id]      NVARCHAR (32) NULL,
    [loddte]     DATETIME      NULL,
    [ordnum]     NVARCHAR (35) NULL,
    [prtnum]     NVARCHAR (50) NULL,
    [ordqty]     INT           NULL,
    [shpqty]     INT           NULL,
    [pckgr3]     NVARCHAR (20) NULL,
    [invsts]     NVARCHAR (4)  NULL,
    [lotnum]     NVARCHAR (25) NULL,
    [expire_dte] DATETIME      NULL
);



