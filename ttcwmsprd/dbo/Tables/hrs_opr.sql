CREATE TABLE [dbo].[hrs_opr] (
    [hrs_opr_id]       NVARCHAR (16) NOT NULL,
    [hrs_opr_set_id]   NVARCHAR (16) NOT NULL,
    [day_of_week]      INT           NOT NULL,
    [beg_tim]          DATETIME      NOT NULL,
    [end_tim]          DATETIME      NOT NULL,
    [u_version]        INT           NULL,
    [ins_dt]           DATETIME      NULL,
    [last_upd_dt]      DATETIME      NULL,
    [ins_user_id]      NVARCHAR (40) NULL,
    [last_upd_user_id] NVARCHAR (40) NULL,
    CONSTRAINT [hrs_opr_pk] PRIMARY KEY CLUSTERED ([hrs_opr_id] ASC) WITH (FILLFACTOR = 90)
);


GO
CREATE NONCLUSTERED INDEX [hrs_opr_set_id]
    ON [dbo].[hrs_opr]([hrs_opr_set_id] ASC) WITH (FILLFACTOR = 90);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'An operational hour range for a day-of-week. Ranges within a day-of-week should not overlap. The end time of a range may have the same value as the start time of the next range. intervals are defined by [beg_tim, end_tim).', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'hrs_opr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(PK, Required) Unique internally generated identifier for an operational hours range.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'hrs_opr', @level2type = N'COLUMN', @level2name = N'hrs_opr_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK:hrs_opr_set, Required) Operation hours set this day-of-week/time-range is a part of.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'hrs_opr', @level2type = N'COLUMN', @level2name = N'hrs_opr_set_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(Required) Day-of week.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'hrs_opr', @level2type = N'COLUMN', @level2name = N'day_of_week';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(Required) The time is stored in a date-time representation. The date portion of the datatype is ignored during processing.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'hrs_opr', @level2type = N'COLUMN', @level2name = N'beg_tim';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(Required) The time is stored in a date-time representation. The date portion of the datatype is ignored during processing.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'hrs_opr', @level2type = N'COLUMN', @level2name = N'end_tim';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(Required) Generation Number (used for optimistic locking).', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'hrs_opr', @level2type = N'COLUMN', @level2name = N'u_version';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date of the create.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'hrs_opr', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date of the last update.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'hrs_opr', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User ID of the user that created the record.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'hrs_opr', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User ID of the user that last modified the record.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'hrs_opr', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

