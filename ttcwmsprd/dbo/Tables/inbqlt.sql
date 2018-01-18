CREATE TABLE [dbo].[inbqlt] (
    [inb_qlt_id]       NVARCHAR (16) NOT NULL,
    [wh_id]            NVARCHAR (32) NOT NULL,
    [invtid]           NVARCHAR (30) NULL,
    [prtnum]           NVARCHAR (50) NULL,
    [client_id]        NVARCHAR (32) NULL,
    [invnum]           NVARCHAR (35) NULL,
    [trknum]           NVARCHAR (20) NULL,
    [trlr_num]         NVARCHAR (20) NULL,
    [inbqty]           INT           NULL,
    [supnum]           NVARCHAR (32) NULL,
    [carcod]           NVARCHAR (10) NULL,
    [ib_sntflg]        INT           NULL,
    [ib_issue]         NVARCHAR (40) NULL,
    [u_version]        INT           NULL,
    [ins_dt]           DATETIME      NULL,
    [last_upd_dt]      DATETIME      NULL,
    [ins_user_id]      NVARCHAR (40) NULL,
    [last_upd_user_id] NVARCHAR (40) NULL,
    CONSTRAINT [inbqlt_pk] PRIMARY KEY CLUSTERED ([inb_qlt_id] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [inbqlt_ibsntflgck] CHECK ([ib_sntflg]=(0) OR [ib_sntflg]=(1))
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The inbound quality table is used to represent inbound quality issues for vendors and carriers.  It is maintained by Inbound Quality Maintenance.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inbqlt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'System generated sequence number used to uniquely identify an inbound quality issue.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inbqlt', @level2type = N'COLUMN', @level2name = N'inb_qlt_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warehouse ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inbqlt', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory identifier.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inbqlt', @level2type = N'COLUMN', @level2name = N'invtid';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Item number associated with the issue.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inbqlt', @level2type = N'COLUMN', @level2name = N'prtnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The Client ID associated with the invoice. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inbqlt', @level2type = N'COLUMN', @level2name = N'client_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The invoice number associated with the quality issue.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inbqlt', @level2type = N'COLUMN', @level2name = N'invnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The truck number associated with the quality issue. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inbqlt', @level2type = N'COLUMN', @level2name = N'trknum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The trailer number associated with the quality issue.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inbqlt', @level2type = N'COLUMN', @level2name = N'trlr_num';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The number of items on the invoice that have quality issues. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inbqlt', @level2type = N'COLUMN', @level2name = N'inbqty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If supplier that this issue is associated with.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inbqlt', @level2type = N'COLUMN', @level2name = N'supnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The carrier code that this issue is associated with', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inbqlt', @level2type = N'COLUMN', @level2name = N'carcod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inbound sent flag', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inbqlt', @level2type = N'COLUMN', @level2name = N'ib_sntflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The code value of the issue. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inbqlt', @level2type = N'COLUMN', @level2name = N'ib_issue';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The version number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inbqlt', @level2type = N'COLUMN', @level2name = N'u_version';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was inserted', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inbqlt', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was last updated', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inbqlt', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who created the row', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inbqlt', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inbqlt', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

