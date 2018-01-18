CREATE TABLE [dbo].[grd_view_def] (
    [lvl_id]          NVARCHAR (40)  NOT NULL,
    [appl_id]         NVARCHAR (20)  NOT NULL,
    [frm_id]          NVARCHAR (40)  NOT NULL,
    [addon_id]        NVARCHAR (512) NOT NULL,
    [grd_var_nam]     NVARCHAR (40)  NOT NULL,
    [view_nam]        NVARCHAR (40)  NOT NULL,
    [usr_id]          NVARCHAR (40)  NOT NULL,
    [sys_flg]         INT            DEFAULT ((0)) NULL,
    [grp_flg]         INT            DEFAULT ((0)) NULL,
    [grp_ttl_formula] NVARCHAR (200) NULL,
    [grp_nam]         NVARCHAR (40)  NULL,
    CONSTRAINT [grd_view_def_pk] PRIMARY KEY CLUSTERED ([lvl_id] ASC, [appl_id] ASC, [frm_id] ASC, [addon_id] ASC, [grd_var_nam] ASC, [view_nam] ASC, [usr_id] ASC) WITH (FILLFACTOR = 90)
);


GO
CREATE NONCLUSTERED INDEX [grd_view_def_idx1]
    ON [dbo].[grd_view_def]([grd_var_nam] ASC, [appl_id] ASC, [frm_id] ASC, [usr_id] ASC) WITH (FILLFACTOR = 90);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table handles view creation and customizations, a view is used to customize the column visibility, width and position.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'grd_view_def';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'PK for the Entity.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'grd_view_def', @level2type = N'COLUMN', @level2name = N'lvl_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The application ID.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'grd_view_def', @level2type = N'COLUMN', @level2name = N'appl_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The ID of the Form.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'grd_view_def', @level2type = N'COLUMN', @level2name = N'frm_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The addon ID of the Form.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'grd_view_def', @level2type = N'COLUMN', @level2name = N'addon_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The name of the owner grid.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'grd_view_def', @level2type = N'COLUMN', @level2name = N'grd_var_nam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The name of the view - possible MLS.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'grd_view_def', @level2type = N'COLUMN', @level2name = N'view_nam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user name of the customized view, otherwise LES for system.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'grd_view_def', @level2type = N'COLUMN', @level2name = N'usr_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Header Grouping Formula.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'grd_view_def', @level2type = N'COLUMN', @level2name = N'grp_ttl_formula';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Group Name for the Data.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'grd_view_def', @level2type = N'COLUMN', @level2name = N'grp_nam';

