CREATE TABLE [dbo].[appt_mstrcpt] (
    [trknum]           NVARCHAR (20) NOT NULL,
    [appt_id]          NVARCHAR (10) NOT NULL,
    [ins_dt]           DATETIME      NULL,
    [last_upd_dt]      DATETIME      NULL,
    [ins_user_id]      NVARCHAR (40) NULL,
    [last_upd_user_id] NVARCHAR (40) NULL,
    CONSTRAINT [appt_mstrcpt_pk] PRIMARY KEY CLUSTERED ([trknum] ASC, [appt_id] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Appointment master receipt table will be used to store Master receipt Associated with an appointment for a trailer.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'appt_mstrcpt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Master Receipt ID.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'appt_mstrcpt', @level2type = N'COLUMN', @level2name = N'trknum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Appointment ID.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'appt_mstrcpt', @level2type = N'COLUMN', @level2name = N'appt_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was inserted', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'appt_mstrcpt', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was last updated', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'appt_mstrcpt', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who created the row', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'appt_mstrcpt', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'appt_mstrcpt', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

