CREATE TABLE [dbo].[cst_wh_schedule] (
    [cstnum]           NVARCHAR (20) NOT NULL,
    [client_id]        NVARCHAR (32) NOT NULL,
    [wh_id]            NVARCHAR (32) NOT NULL,
    [route_id]         NVARCHAR (10) NOT NULL,
    [begdaycod]        NVARCHAR (1)  NOT NULL,
    [begtim]           DATETIME      NOT NULL,
    [enddaycod]        NVARCHAR (1)  NOT NULL,
    [endtim]           DATETIME      NOT NULL,
    [stop_seq]         INT           NULL,
    [ins_dt]           DATETIME      NULL,
    [last_upd_dt]      DATETIME      NULL,
    [ins_user_id]      NVARCHAR (40) NULL,
    [last_upd_user_id] NVARCHAR (40) NULL,
    CONSTRAINT [cst_wh_schedule_pk] PRIMARY KEY CLUSTERED ([cstnum] ASC, [client_id] ASC, [wh_id] ASC, [route_id] ASC, [begdaycod] ASC, [begtim] ASC, [enddaycod] ASC, [endtim] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table defines the store''s schedule for allocating and shipping distros', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cst_wh_schedule';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Customer Number - The Customer that a distribution will be sent to', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cst_wh_schedule', @level2type = N'COLUMN', @level2name = N'cstnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Client Id - The client for which this distribution is to be allocated/processed', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cst_wh_schedule', @level2type = N'COLUMN', @level2name = N'client_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warehouse Identifier - warehouse this store is configured for', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cst_wh_schedule', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Route Identifier - The route that store is associated with', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cst_wh_schedule', @level2type = N'COLUMN', @level2name = N'route_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Begin Day - Example: Sunday, Monday, Tuesday', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cst_wh_schedule', @level2type = N'COLUMN', @level2name = N'begdaycod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Begin Time - time when distros for this store become active on the scheduled day.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cst_wh_schedule', @level2type = N'COLUMN', @level2name = N'begtim';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'End Day - Example: Sunday, Monday, Tuesday', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cst_wh_schedule', @level2type = N'COLUMN', @level2name = N'enddaycod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'End Time - time when distros for this store become inactive on the scheduled day.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cst_wh_schedule', @level2type = N'COLUMN', @level2name = N'endtim';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Stop Sequence - The order in which the stops will be made by the trailer', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cst_wh_schedule', @level2type = N'COLUMN', @level2name = N'stop_seq';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date the row was inserted', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cst_wh_schedule', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date the row was last updated', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cst_wh_schedule', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User ID of the person who created the row', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cst_wh_schedule', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User ID of the person who most recently updated the row', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cst_wh_schedule', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

