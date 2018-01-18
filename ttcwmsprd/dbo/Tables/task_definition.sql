CREATE TABLE [dbo].[task_definition] (
    [task_id]     NVARCHAR (256)  NOT NULL,
    [role_id]     NVARCHAR (256)  NULL,
    [name]        NVARCHAR (2000) NOT NULL,
    [task_typ]    NVARCHAR (1)    NOT NULL,
    [cmd_line]    NVARCHAR (MAX)  NOT NULL,
    [run_dir]     NVARCHAR (2000) NULL,
    [log_file]    NVARCHAR (2000) NULL,
    [trace_level] NVARCHAR (60)   NULL,
    [restart]     INT             NOT NULL,
    [auto_start]  INT             NOT NULL,
    [start_delay] INT             NULL,
    [grp_nam]     NVARCHAR (40)   NULL,
    CONSTRAINT [task_definition_pk] PRIMARY KEY CLUSTERED ([task_id] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table contains the task definitions for the given server instance', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'task_definition';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The primary key.  This is the primary identifier for the given task.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'task_definition', @level2type = N'COLUMN', @level2name = N'task_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This task will run as part of this role in a clustered environment.  All tasks/jobs that have the same role are guaranteed to run on the same physical machine.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'task_definition', @level2type = N'COLUMN', @level2name = N'role_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The name of the task.  This is not unique and is used to easier find a task.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'task_definition', @level2type = N'COLUMN', @level2name = N'name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The task type. This field can be either P or T, for a process-oriented or thread-oriented task.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'task_definition', @level2type = N'COLUMN', @level2name = N'task_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The command line this task should execute when running.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'task_definition', @level2type = N'COLUMN', @level2name = N'cmd_line';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The directory this process should run from.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'task_definition', @level2type = N'COLUMN', @level2name = N'run_dir';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The name of the log file the standard output will go to.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'task_definition', @level2type = N'COLUMN', @level2name = N'log_file';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The trace level for the execution of this task.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'task_definition', @level2type = N'COLUMN', @level2name = N'trace_level';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Whether this task should automatically restart if it were to stop running.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'task_definition', @level2type = N'COLUMN', @level2name = N'restart';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Whether this task should start when the MOCA server starts up.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'task_definition', @level2type = N'COLUMN', @level2name = N'auto_start';

