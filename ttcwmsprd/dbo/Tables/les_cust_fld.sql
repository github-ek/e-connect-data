CREATE TABLE [dbo].[les_cust_fld] (
    [var_nam]      NVARCHAR (40)   NOT NULL,
    [frm_id]       NVARCHAR (40)   NOT NULL,
    [ena_flg]      INT             NOT NULL,
    [ctrl_typ]     NVARCHAR (80)   NULL,
    [ctrl_tag]     NVARCHAR (200)  NULL,
    [par_ctrl]     NVARCHAR (40)   NULL,
    [par_ctrl_idx] INT             NULL,
    [tab_idx]      INT             NULL,
    [ctrl_wid]     NUMERIC (19, 4) NULL,
    [ctrl_hgt]     NUMERIC (19, 4) NULL,
    [own_table]    NVARCHAR (40)   NULL,
    [grp_nam]      NVARCHAR (40)   NULL,
    CONSTRAINT [les_cust_fld_pk] PRIMARY KEY CLUSTERED ([var_nam] ASC, [frm_id] ASC) WITH (FILLFACTOR = 90)
);


GO
CREATE NONCLUSTERED INDEX [les_cust_fld_frmid]
    ON [dbo].[les_cust_fld]([frm_id] ASC) WITH (FILLFACTOR = 90);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table allows configuration of custom fields on client applications.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_cust_fld';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Part of the unique identifier.  The variable name of the field being added.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_cust_fld', @level2type = N'COLUMN', @level2name = N'var_nam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Specifies on which form this custom field will appear.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_cust_fld', @level2type = N'COLUMN', @level2name = N'frm_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Allows the field to be turned on or off.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_cust_fld', @level2type = N'COLUMN', @level2name = N'ena_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This is an Active X Class ID specifying what kind of control will be created.  This overides the ctrl_typ on the les_var_config table.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_cust_fld', @level2type = N'COLUMN', @level2name = N'ctrl_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Allows additional text to be placed in the tag property of the created control.  The following is ALWAYS placed in the tag regardless of this field: var_nam=[var_nam]', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_cust_fld', @level2type = N'COLUMN', @level2name = N'ctrl_tag';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This is the name of the control this new control will be placed in.  Note that this is NOT the var_nam, but the actual object name.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_cust_fld', @level2type = N'COLUMN', @level2name = N'par_ctrl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If the parent control is a member of a control array, an index is required to specify which control is the correct parent.  Otherwise this field can be null or -1.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_cust_fld', @level2type = N'COLUMN', @level2name = N'par_ctrl_idx';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Specifies where in the tab order to place the control.  Note that an MCSLayout control uses the tab index to arrange controls.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_cust_fld', @level2type = N'COLUMN', @level2name = N'tab_idx';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This width is in pixels', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_cust_fld', @level2type = N'COLUMN', @level2name = N'ctrl_wid';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This height is in pixels', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_cust_fld', @level2type = N'COLUMN', @level2name = N'ctrl_hgt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Used to indicate what table this field is on.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_cust_fld', @level2type = N'COLUMN', @level2name = N'own_table';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Specifies which product group was responsible for loading this data row.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_cust_fld', @level2type = N'COLUMN', @level2name = N'grp_nam';

