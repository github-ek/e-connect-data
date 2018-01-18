CREATE TABLE [dbo].[despachos_hist] (
    [trlr_num]  NVARCHAR (20) NULL,
    [client_id] NVARCHAR (32) NULL,
    [wh_id]     NVARCHAR (32) NULL,
    [loddte]    DATETIME      NULL,
    [ordnum]    NVARCHAR (35) NULL,
    [prtnum]    NVARCHAR (50) NULL,
    [ordqty]    INT           NULL,
    [shpqty]    INT           NULL,
    [pckgr3]    NVARCHAR (20) NULL
);

