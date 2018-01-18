CREATE TABLE [dbo].[pmsn_ctl_assoc] (
    [pmsn_id]     NVARCHAR (20) NOT NULL,
    [appl_id]     NVARCHAR (20) NOT NULL,
    [frm_id]      NVARCHAR (40) NOT NULL,
    [ctrl_id]     NVARCHAR (30) NOT NULL,
    [pmsn_mask]   INT           NOT NULL,
    [hid_flg]     INT           NOT NULL,
    [web_ctl_typ] NVARCHAR (4)  NULL,
    CONSTRAINT [pmsn_ctl_assoc_pk] PRIMARY KEY CLUSTERED ([pmsn_id] ASC, [appl_id] ASC, [frm_id] ASC, [ctrl_id] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table lists the custom permissions and the controls associated to them.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pmsn_ctl_assoc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Permission ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pmsn_ctl_assoc', @level2type = N'COLUMN', @level2name = N'pmsn_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Application ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pmsn_ctl_assoc', @level2type = N'COLUMN', @level2name = N'appl_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Form ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pmsn_ctl_assoc', @level2type = N'COLUMN', @level2name = N'frm_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Control ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pmsn_ctl_assoc', @level2type = N'COLUMN', @level2name = N'ctrl_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Permission Mask for bit positions related to this permission', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pmsn_ctl_assoc', @level2type = N'COLUMN', @level2name = N'pmsn_mask';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Hide Flag to indicate if control is to be hidden when permissions isn''t assigned', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pmsn_ctl_assoc', @level2type = N'COLUMN', @level2name = N'hid_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Specifies the type of control this permission applies to.  Waffle Framework Only.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pmsn_ctl_assoc', @level2type = N'COLUMN', @level2name = N'web_ctl_typ';

