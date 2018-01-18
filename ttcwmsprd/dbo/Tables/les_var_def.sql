CREATE TABLE [dbo].[les_var_def] (
    [var_nam]   NVARCHAR (40)   NOT NULL,
    [appl_id]   NVARCHAR (20)   NOT NULL,
    [frm_id]    NVARCHAR (40)   NOT NULL,
    [addon_id]  NVARCHAR (512)  NOT NULL,
    [cust_lvl]  INT             NOT NULL,
    [ena_flg]   INT             NOT NULL,
    [const_flg] INT             NOT NULL,
    [def_typ]   NVARCHAR (1)    NULL,
    [char_val]  NVARCHAR (2000) NULL,
    [int_val]   INT             NULL,
    [flt_val]   NUMERIC (19, 4) NULL,
    [dt_val]    DATETIME        NULL,
    [def_cmd]   NVARCHAR (2000) NULL,
    [grp_nam]   NVARCHAR (40)   NULL,
    CONSTRAINT [les_var_def_pk] PRIMARY KEY CLUSTERED ([var_nam] ASC, [appl_id] ASC, [frm_id] ASC, [addon_id] ASC, [cust_lvl] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table contains data that allows configuration of client-side variables.  This table deals specifically with the setting of default and constant values for controls.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_var_def';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The unique identifier.  This field represents the client-side tag name of the variable.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_var_def', @level2type = N'COLUMN', @level2name = N'var_nam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Part of the unique identifier.  Associates this record to a specific application.  A value of LES applies to all applications.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_var_def', @level2type = N'COLUMN', @level2name = N'appl_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Part of the unique identifier.  Associates this record to a specific form.  A value of LES applies it to all forms.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_var_def', @level2type = N'COLUMN', @level2name = N'frm_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Part of the unique identifier.  This associates the record to a specific add on identifier.  A value of LES applies to all add-ons', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_var_def', @level2type = N'COLUMN', @level2name = N'addon_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Allows different customization levels for customer and project teams.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_var_def', @level2type = N'COLUMN', @level2name = N'cust_lvl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Specifies that the control is enabled or disabled. Default value is true.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_var_def', @level2type = N'COLUMN', @level2name = N'ena_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Specifies that the default value is a constant.  This means the value is set whenever the control is cleared.  Otherwise the value is set only when the SetDefaults is called.  For example, MSAP calls it when doing an AddNew.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_var_def', @level2type = N'COLUMN', @level2name = N'const_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Specifies the type of default value. It is used in combination with def_cmd column for client function type default values.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_var_def', @level2type = N'COLUMN', @level2name = N'def_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If set, this represents the character string value for the default.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_var_def', @level2type = N'COLUMN', @level2name = N'char_val';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If set, this represents the integer value.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_var_def', @level2type = N'COLUMN', @level2name = N'int_val';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If set, this represents the floating point (double) value.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_var_def', @level2type = N'COLUMN', @level2name = N'flt_val';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If set, this represents a date time value.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_var_def', @level2type = N'COLUMN', @level2name = N'dt_val';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If this field is set, this command is executed to generate a value to be used as the default.  This command supports client-side variable replacement.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_var_def', @level2type = N'COLUMN', @level2name = N'def_cmd';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Specifies which product group was responsible for loading this data row.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_var_def', @level2type = N'COLUMN', @level2name = N'grp_nam';

