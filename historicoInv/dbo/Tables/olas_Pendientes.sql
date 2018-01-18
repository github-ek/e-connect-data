CREATE TABLE [dbo].[olas_pendientes] (
    [schbat]    NVARCHAR (32)   NULL,
    [wh_id]     NVARCHAR (32)   NULL,
    [adddte]    DATETIME        NULL,
    [numsls]    INT             NULL,
    [totpcs]    INT             NULL,
    [palvol]    NUMERIC (19, 4) NULL,
    [estwgt]    NUMERIC (19, 4) NULL,
    [batsts]    NVARCHAR (2000) NULL,
    [client_id] NVARCHAR (32)   NULL,
    [appqty]    INT             NULL,
    [pckqty]    INT             NULL,
    [partes]    INT             NULL
);

