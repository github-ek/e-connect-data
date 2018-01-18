CREATE TABLE [dbo].[recur_sched] (
    [recur_sched_id]   NVARCHAR (12)  NOT NULL,
    [effect_dte]       DATETIME       NULL,
    [expire_dte]       DATETIME       NULL,
    [iterations]       INT            NULL,
    [sched_typ]        NVARCHAR (40)  NULL,
    [step]             INT            NULL,
    [start_time]       DATETIME       NULL,
    [duration]         INT            NULL,
    [day]              INT            NULL,
    [day_of_week]      NVARCHAR (100) NULL,
    [month]            INT            NULL,
    [week]             INT            NULL,
    [ins_dt]           DATETIME       NULL,
    [ins_user_id]      NVARCHAR (40)  NULL,
    [last_upd_dt]      DATETIME       NULL,
    [last_upd_user_id] NVARCHAR (40)  NULL,
    [u_version]        INT            NULL,
    CONSTRAINT [recur_sched_pk] PRIMARY KEY CLUSTERED ([recur_sched_id] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Schedule information used to arrange a schedule.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'recur_sched';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Schedule ID.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'recur_sched', @level2type = N'COLUMN', @level2name = N'recur_sched_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Effective Date Of Schedule.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'recur_sched', @level2type = N'COLUMN', @level2name = N'effect_dte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Expire Date Of Schedule.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'recur_sched', @level2type = N'COLUMN', @level2name = N'expire_dte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Max Recurring Occurrence Times.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'recur_sched', @level2type = N'COLUMN', @level2name = N'iterations';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Schedule Type. Include:DAY; WEEK; MONTH; YEAR.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'recur_sched', @level2type = N'COLUMN', @level2name = N'sched_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Interval between two Occurrence.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'recur_sched', @level2type = N'COLUMN', @level2name = N'step';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The start time of every Occurrence.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'recur_sched', @level2type = N'COLUMN', @level2name = N'start_time';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Time span between start time and end time', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'recur_sched', @level2type = N'COLUMN', @level2name = N'duration';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The day of the month,1-31.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'recur_sched', @level2type = N'COLUMN', @level2name = N'day';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Day Of Week,1-7 (multiple, comma sep,1=Sunday,2=Monday,...,6=Saturday).', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'recur_sched', @level2type = N'COLUMN', @level2name = N'day_of_week';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Th month.(1=January, 2=February,...,12=December)', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'recur_sched', @level2type = N'COLUMN', @level2name = N'month';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The (1=First, 2=Second, 3=Third, 4=Fourth, 5=Last) week', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'recur_sched', @level2type = N'COLUMN', @level2name = N'week';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date of the create.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'recur_sched', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User ID of the user that created the record.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'recur_sched', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date of the last update.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'recur_sched', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User ID of the user that last modified the record.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'recur_sched', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Version of this record (incremented on each update).', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'recur_sched', @level2type = N'COLUMN', @level2name = N'u_version';

