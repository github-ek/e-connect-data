CREATE TABLE [dbo].[task_env_definition] (
    [task_id] NVARCHAR (256)  NOT NULL,
    [name]    NVARCHAR (256)  NOT NULL,
    [value]   NVARCHAR (2000) NULL,
    CONSTRAINT [task_env_definition_pk] PRIMARY KEY CLUSTERED ([task_id] ASC, [name] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table contains the environment settings for task definitions for the given server instance', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'task_env_definition';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Part 1 of the primary key.  This is the primary identifier for the given task.  This is a foreign key into the task_definition table.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'task_env_definition', @level2type = N'COLUMN', @level2name = N'task_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Part 2 of the primary key.  The name of the setting.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'task_env_definition', @level2type = N'COLUMN', @level2name = N'name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The value of this environment setting.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'task_env_definition', @level2type = N'COLUMN', @level2name = N'value';

