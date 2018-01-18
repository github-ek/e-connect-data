CREATE TABLE [dbo].[excp_hrs] (
    [excp_hrs_id]      NVARCHAR (16)   NOT NULL,
    [excp_hrs_set_id]  NVARCHAR (16)   NOT NULL,
    [opn_flg]          INT             NULL,
    [beg_dte]          DATETIME        NOT NULL,
    [end_dte]          DATETIME        NOT NULL,
    [cmnt]             NVARCHAR (2000) NULL,
    [subj_txt]         NVARCHAR (250)  NULL,
    [u_version]        INT             NULL,
    [ins_dt]           DATETIME        NULL,
    [last_upd_dt]      DATETIME        NULL,
    [ins_user_id]      NVARCHAR (40)   NULL,
    [last_upd_user_id] NVARCHAR (40)   NULL,
    CONSTRAINT [excp_hrs_pk] PRIMARY KEY CLUSTERED ([excp_hrs_id] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [excphrs_opnflgck] CHECK ([opn_flg]=(0) OR [opn_flg]=(1))
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Exceptions to hours of operations.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'excp_hrs';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(PK, Required) Unique internally generated identifier for an operational hours range.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'excp_hrs', @level2type = N'COLUMN', @level2name = N'excp_hrs_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK, Required) Exceptions to Operation hours set this day-of-week/time-range is a part of.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'excp_hrs', @level2type = N'COLUMN', @level2name = N'excp_hrs_set_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(Required) Exception is about a facility being open (1) or close (0)?', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'excp_hrs', @level2type = N'COLUMN', @level2name = N'opn_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(Required) Range start date.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'excp_hrs', @level2type = N'COLUMN', @level2name = N'beg_dte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(Required) Range end time.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'excp_hrs', @level2type = N'COLUMN', @level2name = N'end_dte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A brief comment about this exception (like the details of an Outlook appointment).', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'excp_hrs', @level2type = N'COLUMN', @level2name = N'cmnt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Subject comment (like the subject field in an Outlook appointment)', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'excp_hrs', @level2type = N'COLUMN', @level2name = N'subj_txt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Generation Number (used for optimistic locking).', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'excp_hrs', @level2type = N'COLUMN', @level2name = N'u_version';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date of the create.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'excp_hrs', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date of the last update.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'excp_hrs', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User ID of the user that created the record.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'excp_hrs', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User ID of the user that last modified the record.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'excp_hrs', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

