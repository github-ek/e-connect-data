CREATE TABLE [dbo].[res_fltr_rule] (
    [res_key]          NVARCHAR (100) NOT NULL,
    [res_val]          NVARCHAR (100) NOT NULL,
    [arg_key]          NVARCHAR (100) NOT NULL,
    [arg_val]          NVARCHAR (100) NOT NULL,
    [incl_flg]         INT            NULL,
    [ins_dt]           DATETIME       NULL,
    [last_upd_dt]      DATETIME       NULL,
    [ins_user_id]      NVARCHAR (40)  NULL,
    [last_upd_user_id] NVARCHAR (40)  NULL,
    CONSTRAINT [res_fltr_rule_pk] PRIMARY KEY CLUSTERED ([res_key] ASC, [res_val] ASC, [arg_key] ASC, [arg_val] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table stores filtering configurations.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'res_fltr_rule';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Results key.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'res_fltr_rule', @level2type = N'COLUMN', @level2name = N'res_key';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Results key value.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'res_fltr_rule', @level2type = N'COLUMN', @level2name = N'res_val';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Argument key.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'res_fltr_rule', @level2type = N'COLUMN', @level2name = N'arg_key';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Argument value', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'res_fltr_rule', @level2type = N'COLUMN', @level2name = N'arg_val';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Include flag.  Determines if this rule is an inclusion or an exclusion.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'res_fltr_rule', @level2type = N'COLUMN', @level2name = N'incl_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was inserted', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'res_fltr_rule', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was last updated', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'res_fltr_rule', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who created the row', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'res_fltr_rule', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'res_fltr_rule', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

