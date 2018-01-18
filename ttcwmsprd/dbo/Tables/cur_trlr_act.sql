CREATE TABLE [dbo].[cur_trlr_act] (
    [trlr_id]          NVARCHAR (20) NOT NULL,
    [usr_id]           NVARCHAR (40) NOT NULL,
    [devcod]           NVARCHAR (20) NOT NULL,
    [wh_id]            NVARCHAR (32) NOT NULL,
    [activity]         NVARCHAR (10) NULL,
    [start_dt]         DATETIME      NULL,
    [ins_dt]           DATETIME      NULL,
    [last_upd_dt]      DATETIME      NULL,
    [ins_user_id]      NVARCHAR (40) NULL,
    [last_upd_user_id] NVARCHAR (40) NULL,
    CONSTRAINT [cur_trlr_act_pk] PRIMARY KEY CLUSTERED ([trlr_id] ASC, [usr_id] ASC, [devcod] ASC, [wh_id] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The table that tracks the current activity for trailers.  Basically, if a trailer has any entries in this table, it will be denoted as busy.  This means that someone actively working on the trailer, so the system prevents users (RF or GUI) from moving a trailer from the dock door.  This is being done as moving a trailer with a worker within the trailer or moving the trailer when the worker expects to be there is a safety hazard.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cur_trlr_act';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Trailer ID for which the activity is for.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cur_trlr_act', @level2type = N'COLUMN', @level2name = N'trlr_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User ID for which the activity is for.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cur_trlr_act', @level2type = N'COLUMN', @level2name = N'usr_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Device code that performed the activity to insert.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cur_trlr_act', @level2type = N'COLUMN', @level2name = N'devcod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warehouse ID of where trailer activity occurred.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cur_trlr_act', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Activity for the record, either RECEIVE or LOAD.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cur_trlr_act', @level2type = N'COLUMN', @level2name = N'activity';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Start date of the trailer activity.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cur_trlr_act', @level2type = N'COLUMN', @level2name = N'start_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was inserted.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cur_trlr_act', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was last updated.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cur_trlr_act', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who created the row.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cur_trlr_act', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cur_trlr_act', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

