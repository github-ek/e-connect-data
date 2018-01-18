CREATE TABLE [dbo].[job_definition] (
    [job_id]      NVARCHAR (256)  NOT NULL,
    [role_id]     NVARCHAR (256)  NULL,
    [name]        NVARCHAR (2000) NOT NULL,
    [enabled]     INT             NOT NULL,
    [type]        NVARCHAR (60)   NOT NULL,
    [command]     NVARCHAR (MAX)  NOT NULL,
    [log_file]    NVARCHAR (2000) NULL,
    [trace_level] NVARCHAR (60)   NULL,
    [overlap]     INT             NOT NULL,
    [schedule]    NVARCHAR (2000) NULL,
    [start_delay] INT             NULL,
    [timer]       INT             NULL,
    [grp_nam]     NVARCHAR (40)   NULL,
    CONSTRAINT [job_definition_pk] PRIMARY KEY CLUSTERED ([job_id] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table contains the job definitions for the given server instance', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'job_definition';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The primary key.  This is the primary identifier for the given job.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'job_definition', @level2type = N'COLUMN', @level2name = N'job_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This job will run as part of this role in a clustered environment.  All tasks/jobs that have the same role are guaranteed to run on the same physical machine.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'job_definition', @level2type = N'COLUMN', @level2name = N'role_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The name of the job.  This is not unique and is used to easier find a job.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'job_definition', @level2type = N'COLUMN', @level2name = N'name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Controls whether this job is enabled.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'job_definition', @level2type = N'COLUMN', @level2name = N'enabled';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The type of job -- cron or timer', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'job_definition', @level2type = N'COLUMN', @level2name = N'type';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The MOCA command line this job should execute when running.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'job_definition', @level2type = N'COLUMN', @level2name = N'command';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The name of the log file the standard output will go to.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'job_definition', @level2type = N'COLUMN', @level2name = N'log_file';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The trace level for the execution of this job.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'job_definition', @level2type = N'COLUMN', @level2name = N'trace_level';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Controls whether multiple jobs can run at the same time', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'job_definition', @level2type = N'COLUMN', @level2name = N'overlap';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If a schedule-type job, the cron-style schedule of this job', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'job_definition', @level2type = N'COLUMN', @level2name = N'schedule';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If a timer job, the start delay before the first run', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'job_definition', @level2type = N'COLUMN', @level2name = N'start_delay';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If a timer job, the time delay between runs', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'job_definition', @level2type = N'COLUMN', @level2name = N'timer';

