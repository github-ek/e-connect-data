CREATE TABLE [dbo].[les_var_inp] (
    [var_nam]       NVARCHAR (40)  NOT NULL,
    [appl_id]       NVARCHAR (20)  NOT NULL,
    [frm_id]        NVARCHAR (40)  NOT NULL,
    [addon_id]      NVARCHAR (512) NOT NULL,
    [locale_id]     NVARCHAR (20)  NOT NULL,
    [cust_lvl]      INT            NOT NULL,
    [ena_flg]       INT            NOT NULL,
    [min_lgth]      INT            NULL,
    [max_lgth]      INT            NULL,
    [inp_mask]      NVARCHAR (200) NULL,
    [dsp_mask_flg]  INT            NOT NULL,
    [auto_mask_flg] INT            NOT NULL,
    [mult_line_flg] INT            NOT NULL,
    [grp_nam]       NVARCHAR (40)  NULL,
    CONSTRAINT [les_var_inp_pk] PRIMARY KEY CLUSTERED ([var_nam] ASC, [appl_id] ASC, [frm_id] ASC, [addon_id] ASC, [locale_id] ASC, [cust_lvl] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table contains data that allows configuration of client-side variables.  This table deals specifically with the control of input and user interface in a control.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_var_inp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The unique identifier.  This field represents the client-side tag name of the variable.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_var_inp', @level2type = N'COLUMN', @level2name = N'var_nam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Part of the unique identifier.  Associates this record to a specific application.  A value of LES applies to all applications.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_var_inp', @level2type = N'COLUMN', @level2name = N'appl_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Part of the unique identifier.  Associates this record to a specific form.  A value of LES applies it to all forms.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_var_inp', @level2type = N'COLUMN', @level2name = N'frm_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Part of the unique identifier.  This associates the record to a specific add on identifier.  A value of LES applies to all add-ons', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_var_inp', @level2type = N'COLUMN', @level2name = N'addon_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Part of the unique identifier.  This associates the record to a specific locale.  A value of LES applies to all locales.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_var_inp', @level2type = N'COLUMN', @level2name = N'locale_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Allows different customization levels for customer and project teams.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_var_inp', @level2type = N'COLUMN', @level2name = N'cust_lvl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Specifies that this configuration is active.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_var_inp', @level2type = N'COLUMN', @level2name = N'ena_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Minimum length of a text input for this field.  If null or less than 1, no length is required.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_var_inp', @level2type = N'COLUMN', @level2name = N'min_lgth';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Maximum length of a text input for this field.  If null or less than 1, no length is required.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_var_inp', @level2type = N'COLUMN', @level2name = N'max_lgth';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This fld can contain a combination of the following: /INTEGER=int num value /FLOAT=floating point num /POSITIVE=combined with /INTEGER or /FLOAT to specify a postive num /UPPER & /LOWER=convert chars to upper/lower case respectively.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_var_inp', @level2type = N'COLUMN', @level2name = N'inp_mask';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Not currently used.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_var_inp', @level2type = N'COLUMN', @level2name = N'dsp_mask_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Specifies which product group was responsible for loading this data row.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_var_inp', @level2type = N'COLUMN', @level2name = N'grp_nam';

