CREATE TABLE [dbo].[bar_code_tmpl_dtl] (
    [bar_code_tmpl_id] NVARCHAR (32) NOT NULL,
    [bar_code_appl_id] NVARCHAR (32) NOT NULL,
    [map_fld]          NVARCHAR (32) NULL,
    [map_fld_len]      INT           NOT NULL,
    [dat_fmt]          NVARCHAR (40) NULL,
    [frac_digits]      INT           NULL,
    [ins_dt]           DATETIME      NULL,
    [last_upd_dt]      DATETIME      NULL,
    [ins_user_id]      NVARCHAR (40) NULL,
    [last_upd_user_id] NVARCHAR (40) NULL,
    CONSTRAINT [barcodetmpldtl_pk] PRIMARY KEY CLUSTERED ([bar_code_tmpl_id] ASC, [bar_code_appl_id] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Stores detail information about the barcode templates.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bar_code_tmpl_dtl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Stores the unique identifier for the barcode template.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bar_code_tmpl_dtl', @level2type = N'COLUMN', @level2name = N'bar_code_tmpl_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Identifier used to associate a receiving field with a barcode template.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bar_code_tmpl_dtl', @level2type = N'COLUMN', @level2name = N'bar_code_appl_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Receiving field in WMS that the application identifier is mapped to.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bar_code_tmpl_dtl', @level2type = N'COLUMN', @level2name = N'map_fld';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Stores the number of characters that the field will occupy in the barcode template.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bar_code_tmpl_dtl', @level2type = N'COLUMN', @level2name = N'map_fld_len';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Stores the expected date format of the receiving field.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bar_code_tmpl_dtl', @level2type = N'COLUMN', @level2name = N'dat_fmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Stores the decimal precision of a numerical value.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bar_code_tmpl_dtl', @level2type = N'COLUMN', @level2name = N'frac_digits';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was inserted.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bar_code_tmpl_dtl', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was last updated.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bar_code_tmpl_dtl', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who created the row.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bar_code_tmpl_dtl', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bar_code_tmpl_dtl', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

