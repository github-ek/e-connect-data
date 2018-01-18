CREATE TABLE [dbo].[web_cust_pmsn] (
    [pmsn_id]     NVARCHAR (20) NOT NULL,
    [page_id]     NVARCHAR (40) NOT NULL,
    [ctrl_id]     NVARCHAR (50) NOT NULL,
    [web_ctl_typ] NVARCHAR (4)  NULL,
    [hid_flg]     INT           NOT NULL,
    CONSTRAINT [web_cust_pmsn_pk] PRIMARY KEY CLUSTERED ([pmsn_id] ASC, [page_id] ASC, [ctrl_id] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Waffle Framework Custom Permission Definitions.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'web_cust_pmsn';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Permission ID.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'web_cust_pmsn', @level2type = N'COLUMN', @level2name = N'pmsn_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Unique Identifier for this page.  Model Name for custom models and DDA ID for DDAs.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'web_cust_pmsn', @level2type = N'COLUMN', @level2name = N'page_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Physical ID of the web control for which you are defining permissions.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'web_cust_pmsn', @level2type = N'COLUMN', @level2name = N'ctrl_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Control type of the control for which this permission is defined.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'web_cust_pmsn', @level2type = N'COLUMN', @level2name = N'web_ctl_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Hide Flag.  Should this control be hidden if user is not authorized to use it?', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'web_cust_pmsn', @level2type = N'COLUMN', @level2name = N'hid_flg';

