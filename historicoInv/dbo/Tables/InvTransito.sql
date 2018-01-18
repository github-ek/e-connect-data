CREATE TABLE [dbo].[InvTransito] (
    [wh_id]         NVARCHAR (32) NOT NULL,
    [arecod]        NVARCHAR (10) NULL,
    [stoloc]        NVARCHAR (20) NULL,
    [prt_client_id] NVARCHAR (32) NULL,
    [prtnum]        NVARCHAR (50) NULL,
    [lodnum]        NVARCHAR (30) NULL,
    [adddate]       DATETIME      NULL,
    [untqty]        INT           NULL,
    [schbat]        NVARCHAR (32) CONSTRAINT [DF_InvTransito_schbar] DEFAULT (NULL) NULL
);

