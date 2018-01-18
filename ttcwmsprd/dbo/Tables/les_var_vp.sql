CREATE TABLE [dbo].[les_var_vp] (
    [var_nam]      NVARCHAR (40)  NOT NULL,
    [appl_id]      NVARCHAR (20)  NOT NULL,
    [frm_id]       NVARCHAR (40)  NOT NULL,
    [addon_id]     NVARCHAR (512) NOT NULL,
    [cust_lvl]     INT            NOT NULL,
    [lkp_id]       NVARCHAR (20)  NOT NULL,
    [ena_flg]      INT            NOT NULL,
    [cod_col]      NVARCHAR (30)  NULL,
    [desc_col]     NVARCHAR (30)  NULL,
    [add_null_flg] INT            NULL,
    [dis_sgl_flg]  INT            NULL,
    [edt_flg]      INT            NULL,
    [srt_col]      NVARCHAR (200) NULL,
    [grd_lkp_cols] NVARCHAR (256) NULL,
    [grp_nam]      NVARCHAR (40)  NULL,
    CONSTRAINT [les_var_vp_pk] PRIMARY KEY CLUSTERED ([var_nam] ASC, [appl_id] ASC, [frm_id] ASC, [addon_id] ASC, [cust_lvl] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table contains data that deals with the assignment of valid possibilities to a field. Valid possibilities work in conjunction with DataCombo controls to give a list of valid values and their descriptions.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_var_vp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The unique identifier.  This field represents the client-side tag name of the variable.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_var_vp', @level2type = N'COLUMN', @level2name = N'var_nam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Part of the unique identifier.  Associates this record to a specific application.  A value of LES applies to all applications.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_var_vp', @level2type = N'COLUMN', @level2name = N'appl_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Part of the unique identifier.  Associates this record to a specific form.  A value of LES applies it to all forms.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_var_vp', @level2type = N'COLUMN', @level2name = N'frm_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Part of the unique identifier.  This associates the record to a specific add on identifier.  A value of LES applies to all add-ons', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_var_vp', @level2type = N'COLUMN', @level2name = N'addon_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Allows different customization levels for customer and project teams.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_var_vp', @level2type = N'COLUMN', @level2name = N'cust_lvl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Points to a les_lkp table entry that configures a command to be used for this valid possibility.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_var_vp', @level2type = N'COLUMN', @level2name = N'lkp_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Specifies that this valid possibility is enabled.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_var_vp', @level2type = N'COLUMN', @level2name = N'ena_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This defines what column is used as the actual value of the field.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_var_vp', @level2type = N'COLUMN', @level2name = N'cod_col';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This defines what column is used as the displayed description.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_var_vp', @level2type = N'COLUMN', @level2name = N'desc_col';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If this flag is set, a blank row is placed at the start of the data so a null value can be selected.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_var_vp', @level2type = N'COLUMN', @level2name = N'add_null_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If this flag is set AND a single row is returned in the valid possibility, that row will be selected and the control will be disabled.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_var_vp', @level2type = N'COLUMN', @level2name = N'dis_sgl_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If this flag is set, the resulting combo box will be editable.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_var_vp', @level2type = N'COLUMN', @level2name = N'edt_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If specified, the valid possibility will be sorted by this column.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_var_vp', @level2type = N'COLUMN', @level2name = N'srt_col';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The lookup columns shown in the grid.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_var_vp', @level2type = N'COLUMN', @level2name = N'grd_lkp_cols';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Specifies which product group was responsible for loading this data row.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_var_vp', @level2type = N'COLUMN', @level2name = N'grp_nam';

