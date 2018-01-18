CREATE TABLE [dbo].[appt_note] (
    [appt_id]          NVARCHAR (10) NOT NULL,
    [notlin]           NVARCHAR (4)  NOT NULL,
    [nottxt]           NVARCHAR (40) NOT NULL,
    [edtflg]           INT           DEFAULT ((0)) NULL,
    [u_version]        INT           NULL,
    [ins_dt]           DATETIME      NULL,
    [last_upd_dt]      DATETIME      NULL,
    [ins_user_id]      NVARCHAR (40) NULL,
    [last_upd_user_id] NVARCHAR (40) NULL,
    CONSTRAINT [appt_note_pk] PRIMARY KEY CLUSTERED ([appt_id] ASC, [notlin] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [appt_note_edtflgck] CHECK ([edtflg]=(0) OR [edtflg]=(1))
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The appointment note table defines notes for a particular appointment.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'appt_note';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Appointment ID.  A unique user defined or system generated id which uniquely identifies each individual appointment.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'appt_note', @level2type = N'COLUMN', @level2name = N'appt_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Note Line.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'appt_note', @level2type = N'COLUMN', @level2name = N'notlin';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Note Text.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'appt_note', @level2type = N'COLUMN', @level2name = N'nottxt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Edit Flag.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'appt_note', @level2type = N'COLUMN', @level2name = N'edtflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The version number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'appt_note', @level2type = N'COLUMN', @level2name = N'u_version';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was inserted', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'appt_note', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was last updated', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'appt_note', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who created the row', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'appt_note', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'appt_note', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

