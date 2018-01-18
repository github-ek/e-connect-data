CREATE TABLE [dbo].[subscribed_site] (
    [sitnam]         NVARCHAR (60)   NOT NULL,
    [sittyp]         NVARCHAR (4)    NOT NULL,
    [natnam]         NVARCHAR (60)   NOT NULL,
    [sitprt]         NVARCHAR (10)   NOT NULL,
    [siteip]         NVARCHAR (15)   NOT NULL,
    [custid]         NVARCHAR (20)   NOT NULL,
    [timeout]        NVARCHAR (10)   NULL,
    [adddat]         DATETIME        NULL,
    [adrln1]         NVARCHAR (40)   NULL,
    [adrln2]         NVARCHAR (40)   NULL,
    [adrln3]         NVARCHAR (40)   NULL,
    [adrcty]         NVARCHAR (70)   NULL,
    [adrstc]         NVARCHAR (40)   NULL,
    [adrpsz]         NVARCHAR (20)   NULL,
    [contct]         NVARCHAR (60)   NULL,
    [phnnum]         NVARCHAR (20)   NULL,
    [faxnum]         NVARCHAR (20)   NULL,
    [email_adr]      NVARCHAR (100)  NULL,
    [region_id]      NVARCHAR (40)   NULL,
    [division_id]    NVARCHAR (40)   NULL,
    [business_unit]  NVARCHAR (40)   NULL,
    [location]       NVARCHAR (40)   NULL,
    [building]       NVARCHAR (40)   NULL,
    [sub_region]     NVARCHAR (40)   NULL,
    [region_id1]     NVARCHAR (40)   NULL,
    [region_id2]     NVARCHAR (40)   NULL,
    [moca_sys]       INT             NULL,
    [start_ship_dte] DATETIME        NULL,
    [end_ship_dte]   DATETIME        NULL,
    [start_rcv_dte]  DATETIME        NULL,
    [end_rcv_dte]    DATETIME        NULL,
    [rcv_max_cap]    NUMERIC (19, 4) NULL,
    [wh_id]          NVARCHAR (32)   NULL,
    [prcl_hst]       NVARCHAR (15)   NULL,
    [prcl_prt]       NVARCHAR (10)   NULL,
    [prcl_timeout]   INT             DEFAULT ((0)) NULL,
    [sitown_id]      NVARCHAR (32)   NULL,
    [siturl]         NVARCHAR (100)  NULL,
    CONSTRAINT [subscribed_sits_pk] PRIMARY KEY CLUSTERED ([sitnam] ASC, [sittyp] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [subssite_mocasysck] CHECK ([moca_sys]=(0) OR [moca_sys]=(1))
);


GO
CREATE NONCLUSTERED INDEX [subs_site_sittyp]
    ON [dbo].[subscribed_site]([sittyp] ASC) WITH (FILLFACTOR = 90);

