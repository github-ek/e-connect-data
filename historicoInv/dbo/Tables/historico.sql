CREATE TABLE [dbo].[historico] (
    [identificador] INT            IDENTITY (1, 1) NOT NULL,
    [fechaInv]      DATETIME       DEFAULT (sysdatetime()) NULL,
    [prt_client_id] NVARCHAR (32)  NULL,
    [wh_id]         NVARCHAR (32)  NULL,
    [prtnum]        NVARCHAR (50)  NULL,
    [lngdsc]        NVARCHAR (250) NULL,
    [lotnum]        NVARCHAR (25)  NULL,
    [invsts]        NVARCHAR (4)   NULL,
    [expire_dte]    DATETIME       NULL,
    [untqty]        INT            NULL
);

