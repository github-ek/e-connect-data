CREATE TABLE [dbo].[les_var_lkp] (
    [var_nam]  NVARCHAR (40)  NOT NULL,
    [appl_id]  NVARCHAR (20)  NOT NULL,
    [frm_id]   NVARCHAR (40)  NOT NULL,
    [addon_id] NVARCHAR (512) NOT NULL,
    [srt_seq]  INT            NOT NULL,
    [cust_lvl] INT            NOT NULL,
    [lkp_id]   NVARCHAR (20)  NOT NULL,
    [ena_flg]  INT            NOT NULL,
    [ret_fld]  NVARCHAR (256) NULL,
    [inp_fld]  NVARCHAR (256) NULL,
    [mult_flg] INT            DEFAULT ((1)) NOT NULL,
    [grp_nam]  NVARCHAR (40)  NULL,
    CONSTRAINT [les_var_lkp_pk] PRIMARY KEY CLUSTERED ([var_nam] ASC, [appl_id] ASC, [frm_id] ASC, [addon_id] ASC, [lkp_id] ASC, [cust_lvl] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table contains data that allows configuration of client-side variables, specifically assignment of variable lookup functionality to a field.  Variable lookups appear as buttons in a text box.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_var_lkp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The unique identifier.  This field represents the client-side tag name of the variable.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_var_lkp', @level2type = N'COLUMN', @level2name = N'var_nam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Part of the unique identifier.  Associates this record to a specific application.  A value of LES applies to all applications.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_var_lkp', @level2type = N'COLUMN', @level2name = N'appl_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Part of the unique identifier.  Associates this record to a specific form.  A value of LES applies it to all forms.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_var_lkp', @level2type = N'COLUMN', @level2name = N'frm_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Part of the unique identifier.  This associates the record to a specific add on identifier.  A value of LES applies to all add-ons', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_var_lkp', @level2type = N'COLUMN', @level2name = N'addon_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Allows different customization levels for customer and project teams.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_var_lkp', @level2type = N'COLUMN', @level2name = N'cust_lvl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Points to a les_lkp table entry that configures a variable lookup.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_var_lkp', @level2type = N'COLUMN', @level2name = N'lkp_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Specifies that this variable lookup is enabled.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_var_lkp', @level2type = N'COLUMN', @level2name = N'ena_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This is a comma-delimited list of values to return from the lookup dialog.  A lookup can return multiple columns and any number of these columns can be returned.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_var_lkp', @level2type = N'COLUMN', @level2name = N'ret_fld';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A comma-delimited list that specifies which values to pass to the lookup dialog from the calling form.  Aliasing is done just as in the ret_fld column.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_var_lkp', @level2type = N'COLUMN', @level2name = N'inp_fld';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Specifies that this variable lookup allows multiple values to be selected.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_var_lkp', @level2type = N'COLUMN', @level2name = N'mult_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Specifies which product group was responsible for loading this data row.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_var_lkp', @level2type = N'COLUMN', @level2name = N'grp_nam';

