CREATE TABLE [dbo].[batch_ops] (
    [batch_id]         NVARCHAR (12)   NOT NULL,
    [batch_nam]        NVARCHAR (32)   NULL,
    [batch_cmd]        NVARCHAR (4000) NOT NULL,
    [batch_qual]       NVARCHAR (2000) NULL,
    [batch_op_stat_cd] NVARCHAR (4)    NOT NULL,
    [ena_flg]          INT             NULL,
    [commit_flg]       INT             NULL,
    [allow_repeat]     INT             NULL,
    [usr_id]           NVARCHAR (40)   NOT NULL,
    [ins_dt]           DATETIME        NOT NULL,
    [start_dt]         DATETIME        NULL,
    CONSTRAINT [batch_ops_pk] PRIMARY KEY CLUSTERED ([batch_id] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The operations table which holds the command information and job status.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'batch_ops';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Job ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'batch_ops', @level2type = N'COLUMN', @level2name = N'batch_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Used as an identifier for a type of operation ro prevent repeated runs.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'batch_ops', @level2type = N'COLUMN', @level2name = N'batch_nam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The command to run.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'batch_ops', @level2type = N'COLUMN', @level2name = N'batch_cmd';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The where list of qualifiers.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'batch_ops', @level2type = N'COLUMN', @level2name = N'batch_qual';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The status of the Job.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'batch_ops', @level2type = N'COLUMN', @level2name = N'batch_op_stat_cd';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Run the job?', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'batch_ops', @level2type = N'COLUMN', @level2name = N'ena_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Allow multiple runs?', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'batch_ops', @level2type = N'COLUMN', @level2name = N'allow_repeat';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The User ID of the user who created the batch job.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'batch_ops', @level2type = N'COLUMN', @level2name = N'usr_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the batch job was created.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'batch_ops', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'When to start the job.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'batch_ops', @level2type = N'COLUMN', @level2name = N'start_dt';

