CREATE TABLE [dbo].[cmd_config_arg] (
    [cmd_config_id]    NVARCHAR (40)  NOT NULL,
    [cmd_config_arg]   NVARCHAR (100) NOT NULL,
    [seq]              INT            NOT NULL,
    [arg_typ]          NVARCHAR (4)   NOT NULL,
    [req_flg]          INT            DEFAULT ((0)) NOT NULL,
    [null_flg]         INT            DEFAULT ((0)) NOT NULL,
    [ins_dt]           DATETIME       NULL,
    [last_upd_dt]      DATETIME       NULL,
    [ins_user_id]      NVARCHAR (40)  NULL,
    [last_upd_user_id] NVARCHAR (40)  NULL,
    CONSTRAINT [cmd_config_arg_pk] PRIMARY KEY CLUSTERED ([cmd_config_id] ASC, [cmd_config_arg] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [cmdcfg_nullflg_ck] CHECK ([null_flg]=(0) OR [null_flg]=(1)),
    CONSTRAINT [cmdcfg_reqflg_ck] CHECK ([req_flg]=(0) OR [req_flg]=(1))
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Identifier for the available command configured in the system.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cmd_config_arg', @level2type = N'COLUMN', @level2name = N'cmd_config_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Configurable argument for the rule command.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cmd_config_arg', @level2type = N'COLUMN', @level2name = N'cmd_config_arg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Order by which the argument should be displayed.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cmd_config_arg', @level2type = N'COLUMN', @level2name = N'seq';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Data type of the argument.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cmd_config_arg', @level2type = N'COLUMN', @level2name = N'arg_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicates if an argument is required by the rule.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cmd_config_arg', @level2type = N'COLUMN', @level2name = N'req_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicates if the argument value can be null.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cmd_config_arg', @level2type = N'COLUMN', @level2name = N'null_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was inserted', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cmd_config_arg', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was last updated', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cmd_config_arg', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who created the row', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cmd_config_arg', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cmd_config_arg', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

