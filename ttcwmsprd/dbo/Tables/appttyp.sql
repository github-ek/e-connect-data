CREATE TABLE [dbo].[appttyp] (
    [rec_appt_id]      NVARCHAR (10) NOT NULL,
    [rec_appt_typ]     NVARCHAR (4)  NOT NULL,
    [days_of_weekly]   NVARCHAR (8)  NULL,
    [month_of_year]    INT           NULL,
    [day_of_rec]       INT           NULL,
    [end_after]        INT           NULL,
    [ins_dt]           DATETIME      NULL,
    [last_upd_dt]      DATETIME      NULL,
    [ins_user_id]      NVARCHAR (40) NULL,
    [last_upd_user_id] NVARCHAR (40) NULL,
    CONSTRAINT [appttyp_pk] PRIMARY KEY CLUSTERED ([rec_appt_id] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The appttyp table will have the recurring type information of each recurring appointment. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'appttyp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Recurring appointment id. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'appttyp', @level2type = N'COLUMN', @level2name = N'rec_appt_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Recurring appointment type(D for daily,W for weekly,M for Monthly and Y for Yearly).', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'appttyp', @level2type = N'COLUMN', @level2name = N'rec_appt_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Appointment will recur on days mentioned in this column.The days of the week will be appended together and saved.For example ''012'', Sunday ''0'' , Monday ''1'' , Tuesday ''2''.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'appttyp', @level2type = N'COLUMN', @level2name = N'days_of_weekly';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Appointment will recur on month of a year.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'appttyp', @level2type = N'COLUMN', @level2name = N'month_of_year';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Appointment will recur on day depending on the appointment type', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'appttyp', @level2type = N'COLUMN', @level2name = N'day_of_rec';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Appointment will recur upto the specified number of occurrence mentioned in this column', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'appttyp', @level2type = N'COLUMN', @level2name = N'end_after';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was inserted', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'appttyp', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was last updated', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'appttyp', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who created the row', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'appttyp', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'appttyp', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

