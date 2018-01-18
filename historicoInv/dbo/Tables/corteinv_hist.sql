CREATE TABLE [dbo].[corteinv_hist] (
    [fecha]          DATE           DEFAULT (CONVERT([date],sysdatetime())) NULL,
    [prt_client_id]  NVARCHAR (32)  NULL,
    [wh_id]          NVARCHAR (32)  NULL,
    [prtnum]         NVARCHAR (50)  NULL,
    [invsts]         NVARCHAR (4)   NULL,
    [lotnum]         NVARCHAR (25)  NULL,
    [untqty]         INT            NULL,
    [lst_arecod]     NVARCHAR (10)  DEFAULT ('HST') NULL,
    [expire_dte]     DATETIME       NULL,
    [inv_attr_str7]  NVARCHAR (100) NULL,
    [stoloc]         NVARCHAR (20)  CONSTRAINT [DF_corteInv_Hist_stoloc] DEFAULT (NULL) NULL,
    [fecha_creacion] DATETIME       NULL
);


GO
CREATE NONCLUSTERED INDEX [IX_corteInv_Hist_01]
    ON [dbo].[corteinv_hist]([fecha] ASC, [prt_client_id] ASC, [wh_id] ASC);

