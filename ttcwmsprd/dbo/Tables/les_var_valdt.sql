CREATE TABLE [dbo].[les_var_valdt] (
    [var_nam]     NVARCHAR (40)   NOT NULL,
    [appl_id]     NVARCHAR (20)   NOT NULL,
    [frm_id]      NVARCHAR (40)   NOT NULL,
    [addon_id]    NVARCHAR (512)  NOT NULL,
    [cust_lvl]    INT             NOT NULL,
    [valdt_cmd]   NVARCHAR (2000) NOT NULL,
    [ena_flg]     INT             NOT NULL,
    [valdt_mod]   NVARCHAR (1)    NULL,
    [ret_fld_flg] INT             NOT NULL,
    [ret_fld]     NVARCHAR (256)  NULL,
    [grp_nam]     NVARCHAR (40)   NULL,
    CONSTRAINT [les_var_valdt_pk] PRIMARY KEY CLUSTERED ([var_nam] ASC, [appl_id] ASC, [frm_id] ASC, [addon_id] ASC, [cust_lvl] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [lesvarval_valmodck] CHECK ([valdt_mod]=N'I' OR [valdt_mod]=N'N' OR [valdt_mod]=N'E' OR [valdt_mod]=N'C' OR [valdt_mod]=N'A')
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table contains data that allows configuration of client-side variables.  This table deals specifically with the validation of data when focus moves from a control.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_var_valdt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The unique identifier.  This field represents the client-side tag name of the variable.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_var_valdt', @level2type = N'COLUMN', @level2name = N'var_nam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Part of the unique identifier.  Associates this record to a specific application.  A value of LES applies to all applications.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_var_valdt', @level2type = N'COLUMN', @level2name = N'appl_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Part of the unique identifier.  Associates this record to a specific form.  A value of LES applies it to all forms.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_var_valdt', @level2type = N'COLUMN', @level2name = N'frm_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Part of the unique identifier.  This associates the record to a specific add on identifier.  A value of LES applies to all add-ons', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_var_valdt', @level2type = N'COLUMN', @level2name = N'addon_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Allows different customization levels for customer and project teams.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_var_valdt', @level2type = N'COLUMN', @level2name = N'cust_lvl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This is the MOCA component executed when focus leaves the control.  This only happens when there is a value in the field (not blank), the control receiving focus has its validate property set to true, and the validations are enabled.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_var_valdt', @level2type = N'COLUMN', @level2name = N'valdt_cmd';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Specifies that this validation configuration is active.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_var_valdt', @level2type = N'COLUMN', @level2name = N'ena_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Allows the validation to be customized to execute during various client input modes:  A - Always, C - Criteria, E = Edit, N = New, I = Input (both Edit and New).', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_var_valdt', @level2type = N'COLUMN', @level2name = N'valdt_mod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If this flag is set and the validate command returns data, the validation will cause fields to be filled in with the returned data.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_var_valdt', @level2type = N'COLUMN', @level2name = N'ret_fld_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This is a comma-delimited list that specifies which fields to return from the validate command.  The ret_fld_flg must also be enabled for this to happen.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_var_valdt', @level2type = N'COLUMN', @level2name = N'ret_fld';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Specifies which product group was responsible for loading this data row.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_var_valdt', @level2type = N'COLUMN', @level2name = N'grp_nam';

