CREATE TABLE [dbo].[Recibidos_Hist] (
    [fecha]      DATETIME      NOT NULL,
    [client_id]  NVARCHAR (32) NOT NULL,
    [wh_id]      NVARCHAR (32) NOT NULL,
    [invnum]     NVARCHAR (35) NULL,
    [prtnum]     NVARCHAR (50) NOT NULL,
    [rcvsts]     NVARCHAR (4)  NOT NULL,
    [lotnum]     NVARCHAR (25) NOT NULL,
    [expqty]     INT           NOT NULL,
    [idnqty]     INT           NOT NULL,
    [invtyp]     NVARCHAR (4)  NULL,
    [expire_dte] DATETIME      NULL,
    [retcod]     NVARCHAR (4)  NULL
);

