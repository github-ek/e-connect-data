CREATE TABLE [dbo].[dock_cap] (
    [dock_cap_id]      NVARCHAR (10)   NOT NULL,
    [wh_id]            NVARCHAR (32)   NOT NULL,
    [bldg_id]          NVARCHAR (10)   NOT NULL,
    [arecod]           NVARCHAR (10)   NOT NULL,
    [daycod]           NVARCHAR (1)    NOT NULL,
    [start_tim]        DATETIME        NOT NULL,
    [end_tim]          DATETIME        NOT NULL,
    [cap_cod]          NVARCHAR (40)   NOT NULL,
    [capacity]         NUMERIC (6)     NOT NULL,
    [cmnt]             NVARCHAR (2000) NULL,
    [ins_dt]           DATETIME        NULL,
    [ins_user_id]      NVARCHAR (40)   NULL,
    [last_upd_dt]      DATETIME        NULL,
    [last_upd_user_id] NVARCHAR (40)   NULL,
    CONSTRAINT [dock_cap_pk] PRIMARY KEY CLUSTERED ([dock_cap_id] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Stores dock capacity schedules.  Capacity schedules are specified for a week days.  There can be more than one capacity schedule for a day.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dock_cap';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Facility/Warehouse ID.Can be manually created.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dock_cap', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Dock Area', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dock_cap', @level2type = N'COLUMN', @level2name = N'arecod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Starting day of week for this capacity schedule (Sunday - 1, Monday - 2, etc.)', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dock_cap', @level2type = N'COLUMN', @level2name = N'daycod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Start time of day (in HH24:MI format)', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dock_cap', @level2type = N'COLUMN', @level2name = N'start_tim';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'End time of day (in HH24:MI format)', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dock_cap', @level2type = N'COLUMN', @level2name = N'end_tim';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Can be appointment or pallet', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dock_cap', @level2type = N'COLUMN', @level2name = N'cap_cod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Capacity of this dock during the specified time interval.Type can be pallet or appointment', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dock_cap', @level2type = N'COLUMN', @level2name = N'capacity';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Comment/description for this dock capacity', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dock_cap', @level2type = N'COLUMN', @level2name = N'cmnt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date of the create.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dock_cap', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User ID of the user that created the record.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dock_cap', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date of the last update.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dock_cap', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User ID of the user that last modified the record.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dock_cap', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

