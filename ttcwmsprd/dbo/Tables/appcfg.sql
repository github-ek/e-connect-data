CREATE TABLE [dbo].[appcfg] (
    [usr_id]  NVARCHAR (40)  NOT NULL,
    [appnam]  NVARCHAR (30)  NOT NULL,
    [frmnam]  NVARCHAR (40)  NULL,
    [ctlnam]  NVARCHAR (30)  NULL,
    [prflbl]  NVARCHAR (50)  NULL,
    [srtseq]  INT            NULL,
    [prfnum]  INT            NULL,
    [prfstr]  NVARCHAR (255) NULL,
    [grp_nam] NVARCHAR (40)  NULL
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [appcfg_uk1]
    ON [dbo].[appcfg]([usr_id] ASC, [appnam] ASC, [frmnam] ASC, [ctlnam] ASC, [prflbl] ASC, [srtseq] ASC) WITH (FILLFACTOR = 90);

