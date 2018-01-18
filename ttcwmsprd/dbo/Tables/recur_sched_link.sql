CREATE TABLE [dbo].[recur_sched_link] (
    [recur_sched_link_id]  NVARCHAR (12) NOT NULL,
    [recur_sched_id]       NVARCHAR (12) NULL,
    [last_sched_u_version] INT           NULL,
    [last_iteration]       INT           NULL,
    [last_date]            DATETIME      NULL,
    CONSTRAINT [recur_sched_link_pk] PRIMARY KEY CLUSTERED ([recur_sched_link_id] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Schedule link used to link a user to a schedule.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'recur_sched_link';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Schedule Link ID.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'recur_sched_link', @level2type = N'COLUMN', @level2name = N'recur_sched_link_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Schedule ID.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'recur_sched_link', @level2type = N'COLUMN', @level2name = N'recur_sched_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Last seen version of the referenced schedule.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'recur_sched_link', @level2type = N'COLUMN', @level2name = N'last_sched_u_version';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Times of Occurrence have recurred.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'recur_sched_link', @level2type = N'COLUMN', @level2name = N'last_iteration';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date of last Occurrence.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'recur_sched_link', @level2type = N'COLUMN', @level2name = N'last_date';

