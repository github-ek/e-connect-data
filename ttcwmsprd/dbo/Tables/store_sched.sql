CREATE TABLE [dbo].[store_sched] (
    [store_id]         NVARCHAR (35) NOT NULL,
    [wh_id]            NVARCHAR (32) NOT NULL,
    [begdaycod]        NVARCHAR (1)  NOT NULL,
    [begtim]           DATETIME      NOT NULL,
    [enddaycod]        NVARCHAR (1)  NOT NULL,
    [endtim]           DATETIME      NOT NULL,
    [u_version]        INT           NULL,
    [ins_dt]           DATETIME      NULL,
    [last_upd_dt]      DATETIME      NULL,
    [ins_user_id]      NVARCHAR (40) NULL,
    [last_upd_user_id] NVARCHAR (40) NULL,
    CONSTRAINT [store_sched_pk] PRIMARY KEY CLUSTERED ([store_id] ASC, [wh_id] ASC, [begdaycod] ASC, [begtim] ASC, [enddaycod] ASC, [endtim] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table defines the store''s schedule for allocating and shipping distros', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'store_sched';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Store Identifier - store a distribution will be sent to', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'store_sched', @level2type = N'COLUMN', @level2name = N'store_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warehouse Identifier - warehouse this store is configured for', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'store_sched', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Begin Day - Example: Sunday, Monday, Tuesday', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'store_sched', @level2type = N'COLUMN', @level2name = N'begdaycod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Begin Time - time when distros for this store become active on the scheduled day.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'store_sched', @level2type = N'COLUMN', @level2name = N'begtim';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'End Day - Example: Sunday, Monday, Tuesday', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'store_sched', @level2type = N'COLUMN', @level2name = N'enddaycod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'End Time - time when distros for this store become inactive on the scheduled day.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'store_sched', @level2type = N'COLUMN', @level2name = N'endtim';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Version number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'store_sched', @level2type = N'COLUMN', @level2name = N'u_version';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date the row was inserted', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'store_sched', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date the row was last updated', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'store_sched', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User ID of the person who created the row', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'store_sched', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User ID of the person who most recently updated the row', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'store_sched', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

