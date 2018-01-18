CREATE TABLE [dbo].[task_definition_exec] (
    [task_id]     NVARCHAR (256)  NOT NULL,
    [node_url]    NVARCHAR (256)  NOT NULL,
    [start_dte]   DATETIME        NOT NULL,
    [end_dte]     DATETIME        NULL,
    [start_cause] NVARCHAR (2000) NULL,
    [status]      NVARCHAR (2000) NULL,
    CONSTRAINT [task_definition_exec_pk] PRIMARY KEY CLUSTERED ([task_id] ASC, [node_url] ASC, [start_dte] ASC) WITH (FILLFACTOR = 90)
);


GO
CREATE NONCLUSTERED INDEX [task_definition_exec_idx1]
    ON [dbo].[task_definition_exec]([start_dte] ASC) WITH (FILLFACTOR = 90);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table contains the task executions for the instance or cluster.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'task_definition_exec';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Part 1 of the primary key.  This is the primary identifier for the given task.  This is a foreign key into the task_definition table.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'task_definition_exec', @level2type = N'COLUMN', @level2name = N'task_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Part 3 of the primary key.  Field that tells the url for the node of which this task ran on.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'task_definition_exec', @level2type = N'COLUMN', @level2name = N'node_url';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Part 2 of the primary key.  This is the primary identifier saying when the task execution started.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'task_definition_exec', @level2type = N'COLUMN', @level2name = N'start_dte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'When the task execution completed.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'task_definition_exec', @level2type = N'COLUMN', @level2name = N'end_dte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The reason this task was started.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'task_definition_exec', @level2type = N'COLUMN', @level2name = N'start_cause';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The status of the task.  If a server crash occurs this may not be reflect the proper status.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'task_definition_exec', @level2type = N'COLUMN', @level2name = N'status';

