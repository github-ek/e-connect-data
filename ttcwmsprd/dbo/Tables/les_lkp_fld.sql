CREATE TABLE [dbo].[les_lkp_fld] (
    [lkp_id]   NVARCHAR (20) NOT NULL,
    [cust_lvl] INT           NOT NULL,
    [fld_nam]  NVARCHAR (40) NOT NULL,
    [srt_seq]  INT           NOT NULL,
    [fld_var]  NVARCHAR (40) NULL,
    [inp_flg]  INT           NOT NULL,
    [grp_nam]  NVARCHAR (40) NULL,
    CONSTRAINT [les_lkp_fld_pk] PRIMARY KEY CLUSTERED ([lkp_id] ASC, [cust_lvl] ASC, [fld_nam] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table contains data for configuring fields on the variable lookup dialogs.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_lkp_fld';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The unique identifier', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_lkp_fld', @level2type = N'COLUMN', @level2name = N'lkp_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Allows different customization levels for customer and project teams.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_lkp_fld', @level2type = N'COLUMN', @level2name = N'cust_lvl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This represents the name of the column to be passed to the command.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_lkp_fld', @level2type = N'COLUMN', @level2name = N'fld_nam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Order of the fields on the dialog.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_lkp_fld', @level2type = N'COLUMN', @level2name = N'srt_seq';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If this field is used, the input control will behave as though it were this variable.  This allows the control to behave like one control but pass its value as another variable name.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_lkp_fld', @level2type = N'COLUMN', @level2name = N'fld_var';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Not currently used.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_lkp_fld', @level2type = N'COLUMN', @level2name = N'inp_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Specifies which product group was responsible for loading this data row.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_lkp_fld', @level2type = N'COLUMN', @level2name = N'grp_nam';

