CREATE TABLE [dbo].[cmd_config] (
    [cmd_config_id]    NVARCHAR (40)  NOT NULL,
    [cmd_config]       NVARCHAR (100) NOT NULL,
    [cmd_grp]          NVARCHAR (50)  NOT NULL,
    [ins_dt]           DATETIME       NULL,
    [last_upd_dt]      DATETIME       NULL,
    [ins_user_id]      NVARCHAR (40)  NULL,
    [last_upd_user_id] NVARCHAR (40)  NULL,
    CONSTRAINT [cmd_config_pk] PRIMARY KEY CLUSTERED ([cmd_config_id] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Identifier for the available commands configured in the system.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cmd_config', @level2type = N'COLUMN', @level2name = N'cmd_config_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Command to be used', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cmd_config', @level2type = N'COLUMN', @level2name = N'cmd_config';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicates the category for this command', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cmd_config', @level2type = N'COLUMN', @level2name = N'cmd_grp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was inserted', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cmd_config', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was last updated', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cmd_config', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who created the row', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cmd_config', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cmd_config', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

