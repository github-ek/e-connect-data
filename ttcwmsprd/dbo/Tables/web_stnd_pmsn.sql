CREATE TABLE [dbo].[web_stnd_pmsn] (
    [page_id]   NVARCHAR (40) NOT NULL,
    [role_id]   NVARCHAR (20) NOT NULL,
    [pmsn_mask] INT           NOT NULL,
    CONSTRAINT [web_stnd_pmsn_pk] PRIMARY KEY CLUSTERED ([page_id] ASC, [role_id] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Waffle Framework Standard Permissions.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'web_stnd_pmsn';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Unique Identifier for this page.  Model Name for custom models and DDA ID for DDAs.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'web_stnd_pmsn', @level2type = N'COLUMN', @level2name = N'page_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Role ID for which you are specifying standard permissions.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'web_stnd_pmsn', @level2type = N'COLUMN', @level2name = N'role_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Permission Mask for this page for this role.  Determined using bitpos for standard permissions in les_ath_pmsn.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'web_stnd_pmsn', @level2type = N'COLUMN', @level2name = N'pmsn_mask';

