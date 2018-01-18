CREATE TABLE [dbo].[grd_def] (
    [lvl_id]        NVARCHAR (40)  NOT NULL,
    [appl_id]       NVARCHAR (20)  NOT NULL,
    [frm_id]        NVARCHAR (40)  NOT NULL,
    [addon_id]      NVARCHAR (512) NOT NULL,
    [cust_lvl]      INT            NOT NULL,
    [parent_lvl_id] NVARCHAR (40)  NOT NULL,
    [grd_var_nam]   NVARCHAR (40)  NOT NULL,
    [grd_cmd]       NVARCHAR (200) NULL,
    [grd_init_qual] NVARCHAR (512) NULL,
    [par_col]       NVARCHAR (250) NULL,
    [child_col]     NVARCHAR (250) NULL,
    [enable_flg]    INT            NOT NULL,
    [ext_parm_flg]  INT            DEFAULT ((1)) NULL,
    [grd_mnu_nam]   NVARCHAR (50)  NULL,
    [grp_nam]       NVARCHAR (40)  NULL,
    CONSTRAINT [grd_def_pk] PRIMARY KEY CLUSTERED ([lvl_id] ASC, [appl_id] ASC, [frm_id] ASC, [addon_id] ASC, [cust_lvl] ASC, [parent_lvl_id] ASC, [grd_var_nam] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [grd_def_enaflgck] CHECK ([enable_flg]=(0) OR [enable_flg]=(1)),
    CONSTRAINT [grddefextparmflgck] CHECK ([ext_parm_flg]=(0) OR [ext_parm_flg]=(1))
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Each level has a parent level ID that related the nodes together allowing views to be subordinate to one another. It also allows them to be peer so a view of Accounts would expand to show tabs that could contain Orders, Contacts, etc.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'grd_def';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'PK for the Entity.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'grd_def', @level2type = N'COLUMN', @level2name = N'lvl_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The application ID.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'grd_def', @level2type = N'COLUMN', @level2name = N'appl_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The ID of the Form.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'grd_def', @level2type = N'COLUMN', @level2name = N'frm_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The addon ID of the Form.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'grd_def', @level2type = N'COLUMN', @level2name = N'addon_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The customization level.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'grd_def', @level2type = N'COLUMN', @level2name = N'cust_lvl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Defines the Parent level for linking.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'grd_def', @level2type = N'COLUMN', @level2name = N'parent_lvl_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The name of the owner grid.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'grd_def', @level2type = N'COLUMN', @level2name = N'grd_var_nam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The List command used to populate the view (not necessary if it exists in the view definition)', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'grd_def', @level2type = N'COLUMN', @level2name = N'grd_cmd';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A static qualifier to apply to the grd_cmd when the grid is initialized.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'grd_def', @level2type = N'COLUMN', @level2name = N'grd_init_qual';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The name of the parent column names.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'grd_def', @level2type = N'COLUMN', @level2name = N'par_col';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The name of the child column names.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'grd_def', @level2type = N'COLUMN', @level2name = N'child_col';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicates if the level is enabled.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'grd_def', @level2type = N'COLUMN', @level2name = N'enable_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicates if the level uses external parameters', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'grd_def', @level2type = N'COLUMN', @level2name = N'ext_parm_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The top group of the context menu to link to.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'grd_def', @level2type = N'COLUMN', @level2name = N'grd_mnu_nam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Group Name for the Data.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'grd_def', @level2type = N'COLUMN', @level2name = N'grp_nam';

