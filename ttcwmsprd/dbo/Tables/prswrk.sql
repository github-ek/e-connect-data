CREATE TABLE [dbo].[prswrk] (
    [prsreq] INT             NOT NULL,
    [lblsts] NVARCHAR (1)    NOT NULL,
    [prtadr] NVARCHAR (10)   NULL,
    [lbldte] DATETIME        NULL,
    [lblfmt] NVARCHAR (20)   NULL,
    [lblqty] INT             NOT NULL,
    [lbdata] NVARCHAR (2000) NULL,
    [wrkref] NVARCHAR (12)   NULL,
    CONSTRAINT [prswrk_pk] PRIMARY KEY CLUSTERED ([prsreq] ASC) WITH (FILLFACTOR = 90)
);

