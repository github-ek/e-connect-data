CREATE TABLE [dbo].[rule_set_cmd] (
    [rule_set]         NVARCHAR (10)   NOT NULL,
    [rule_seq]         INT             NOT NULL,
    [cmd_config_id]    NVARCHAR (40)   NOT NULL,
    [cmd_arg]          NVARCHAR (1000) NULL,
    [cmd_grp]          NVARCHAR (50)   NOT NULL,
    [ins_dt]           DATETIME        NULL,
    [ins_user_id]      NVARCHAR (40)   NULL,
    [last_upd_dt]      DATETIME        NULL,
    [last_upd_user_id] NVARCHAR (40)   NULL,
    CONSTRAINT [rule_set_cmd_pk] PRIMARY KEY CLUSTERED ([rule_set] ASC, [rule_seq] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table defines a sequence of rules with associated commands.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rule_set_cmd';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The set is a group of rules to be applied in sequence.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rule_set_cmd', @level2type = N'COLUMN', @level2name = N'rule_set';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The sequence in which the rule will be executed.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rule_set_cmd', @level2type = N'COLUMN', @level2name = N'rule_seq';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Link to the command id for this rule command.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rule_set_cmd', @level2type = N'COLUMN', @level2name = N'cmd_config_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Defines the configuration parameters for the action to be taken when the rule is applied.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rule_set_cmd', @level2type = N'COLUMN', @level2name = N'cmd_arg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicates the category for this rule.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rule_set_cmd', @level2type = N'COLUMN', @level2name = N'cmd_grp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was inserted.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rule_set_cmd', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who created the row.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rule_set_cmd', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was last updated.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rule_set_cmd', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rule_set_cmd', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

