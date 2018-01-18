CREATE TABLE [dbo].[job_definition_exec] (
    [job_id]    NVARCHAR (256)  NOT NULL,
    [node_url]  NVARCHAR (256)  NOT NULL,
    [start_dte] DATETIME        NOT NULL,
    [status]    INT             NULL,
    [message]   NVARCHAR (2000) NULL,
    [end_dte]   DATETIME        NULL,
    CONSTRAINT [job_definition_exec_pk] PRIMARY KEY CLUSTERED ([job_id] ASC, [node_url] ASC, [start_dte] ASC) WITH (FILLFACTOR = 90)
);


GO
CREATE NONCLUSTERED INDEX [job_definition_exec_idx1]
    ON [dbo].[job_definition_exec]([start_dte] ASC) WITH (FILLFACTOR = 90);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table contains the job executions for the instance or cluster.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'job_definition_exec';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Part 1 of the primary key.  This is the primary identifier for the given job.  This is a foreign key into the job_definition table.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'job_definition_exec', @level2type = N'COLUMN', @level2name = N'job_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Part 3 of the primary key.  Field that tells the url for the node of which this job ran on.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'job_definition_exec', @level2type = N'COLUMN', @level2name = N'node_url';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Part 2 of the primary key.  This is the primary identifier saying when the job execution started.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'job_definition_exec', @level2type = N'COLUMN', @level2name = N'start_dte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The MOCA status code of the command execution.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'job_definition_exec', @level2type = N'COLUMN', @level2name = N'status';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The Exception message that was encountered if a non zero status is returned.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'job_definition_exec', @level2type = N'COLUMN', @level2name = N'message';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'When the job execution completed.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'job_definition_exec', @level2type = N'COLUMN', @level2name = N'end_dte';

