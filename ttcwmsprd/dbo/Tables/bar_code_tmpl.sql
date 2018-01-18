CREATE TABLE [dbo].[bar_code_tmpl] (
    [bar_code_tmpl_id] NVARCHAR (32) NOT NULL,
    [def_flg]          INT           DEFAULT ((0)) NOT NULL,
    [ins_dt]           DATETIME      NULL,
    [last_upd_dt]      DATETIME      NULL,
    [ins_user_id]      NVARCHAR (40) NULL,
    [last_upd_user_id] NVARCHAR (40) NULL,
    CONSTRAINT [bar_code_tmpl_pk] PRIMARY KEY CLUSTERED ([bar_code_tmpl_id] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [bar_code_tmpl_defflg] CHECK ([def_flg]=(0) OR [def_flg]=(1))
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Defines barcode templates for suppliers.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bar_code_tmpl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Stores the unique identifier for the barcode template.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bar_code_tmpl', @level2type = N'COLUMN', @level2name = N'bar_code_tmpl_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default Flag.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bar_code_tmpl', @level2type = N'COLUMN', @level2name = N'def_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was inserted.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bar_code_tmpl', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was last updated.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bar_code_tmpl', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who created the row.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bar_code_tmpl', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bar_code_tmpl', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

