CREATE TABLE [dbo].[std_dck_sched] (
    [sched_id]     NVARCHAR (10) NOT NULL,
    [stoloc]       NVARCHAR (20) NOT NULL,
    [wh_id]        NVARCHAR (32) NOT NULL,
    [start_daycod] INT           NOT NULL,
    [end_daycod]   INT           NOT NULL,
    [start_tim]    DATETIME      NOT NULL,
    [end_tim]      DATETIME      NOT NULL,
    [moddte]       DATETIME      NULL,
    [mod_usr_id]   NVARCHAR (40) NULL,
    CONSTRAINT [std_dck_sched_pk] PRIMARY KEY CLUSTERED ([sched_id] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The Standard Dock Schedule table holds a weekly template showing availability of dock doors.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'std_dck_sched';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Schedule ID.  This field is used as a primary key for this table.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'std_dck_sched', @level2type = N'COLUMN', @level2name = N'sched_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Dock door', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'std_dck_sched', @level2type = N'COLUMN', @level2name = N'stoloc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warehouse ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'std_dck_sched', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Start Day of the week (1-Sunday, 2-Monday, ..., 7-Saturday)', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'std_dck_sched', @level2type = N'COLUMN', @level2name = N'start_daycod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'End Day of the week (1-Sunday, 2-Monday, ..., 7-Saturday)', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'std_dck_sched', @level2type = N'COLUMN', @level2name = N'end_daycod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Starting time of availability (Military Time)', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'std_dck_sched', @level2type = N'COLUMN', @level2name = N'start_tim';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Ending time of availability (Military Time)', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'std_dck_sched', @level2type = N'COLUMN', @level2name = N'end_tim';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date and time record was last modified', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'std_dck_sched', @level2type = N'COLUMN', @level2name = N'moddte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User who last modified this record', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'std_dck_sched', @level2type = N'COLUMN', @level2name = N'mod_usr_id';

