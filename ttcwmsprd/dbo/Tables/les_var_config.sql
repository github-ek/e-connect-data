CREATE TABLE [dbo].[les_var_config] (
    [var_nam]   NVARCHAR (40)  NOT NULL,
    [appl_id]   NVARCHAR (20)  NOT NULL,
    [frm_id]    NVARCHAR (40)  NOT NULL,
    [addon_id]  NVARCHAR (512) NOT NULL,
    [cust_lvl]  INT            NOT NULL,
    [vis_flg]   INT            NOT NULL,
    [ena_flg]   INT            NOT NULL,
    [fld_typ]   NVARCHAR (40)  NULL,
    [ctrl_typ]  NVARCHAR (80)  NULL,
    [ctxt_flg]  INT            NOT NULL,
    [dsp_wid]   INT            NULL,
    [dsp_hgt]   INT            NULL,
    [ctrl_prop] NVARCHAR (512) NULL,
    [grp_nam]   NVARCHAR (40)  NULL,
    CONSTRAINT [les_var_config_pk] PRIMARY KEY CLUSTERED ([var_nam] ASC, [appl_id] ASC, [frm_id] ASC, [addon_id] ASC, [cust_lvl] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table contains data that allows configuration of client-side variables.  This table deals specifically with the appearance and type of controls as well as the links to help topics.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_var_config';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The unique identifier.  This field represents the client-side tag name of the variable.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_var_config', @level2type = N'COLUMN', @level2name = N'var_nam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Part of the unique identifier.  Associates this record to a specific application.  A value of LES applies to all applications.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_var_config', @level2type = N'COLUMN', @level2name = N'appl_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Part of the unique identifier.  Associates this record to a specific form.  A value of LES applies it to all forms.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_var_config', @level2type = N'COLUMN', @level2name = N'frm_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Part of the unique identifier.  This associates the record to a specific add on identifier.  A value of LES applies to all add-ons', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_var_config', @level2type = N'COLUMN', @level2name = N'addon_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Allows different customization levels for customer and project teams.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_var_config', @level2type = N'COLUMN', @level2name = N'cust_lvl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Specifies that the control is visible or hidden. Default value is true.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_var_config', @level2type = N'COLUMN', @level2name = N'vis_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Specifies that the control is enabled or disabled. Default value is true.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_var_config', @level2type = N'COLUMN', @level2name = N'ena_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Specifies the control as a flag, a combo box, or a date type.  This is used by the grid to determine how to format the column. Values: C=Combo, F=Flag, D=Date/Time', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_var_config', @level2type = N'COLUMN', @level2name = N'fld_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This is the Class ID of the Active X control used when this field is created dynamically. (e.g.  VB.TextBox, VB.ComboBox, etc...)', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_var_config', @level2type = N'COLUMN', @level2name = N'ctrl_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Determines if controls of this variable are pushed automatically on the context by a PushContext operation.  Default value is TRUE', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_var_config', @level2type = N'COLUMN', @level2name = N'ctxt_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Not currently in use.  Intended as a way to specify the size of a control in data.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_var_config', @level2type = N'COLUMN', @level2name = N'dsp_wid';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Intended as a way to specify the size of a control in data.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_var_config', @level2type = N'COLUMN', @level2name = N'dsp_hgt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Allows customization of .Net control objects.  This is a pipe (|) delimited list of properties and values. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_var_config', @level2type = N'COLUMN', @level2name = N'ctrl_prop';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Specifies which product group was responsible for loading this data row.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_var_config', @level2type = N'COLUMN', @level2name = N'grp_nam';

