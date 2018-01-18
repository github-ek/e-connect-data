CREATE TABLE [dbo].[sl_ifd_data_dtl_ol] (
    [ifd_data_seq]     NUMERIC (12)   NOT NULL,
    [ifd_data_dtl_seq] NUMERIC (6)    NOT NULL,
    [fld_tag]          NVARCHAR (60)  NOT NULL,
    [fld_val]          NVARCHAR (MAX) NULL,
    [ins_dt]           DATETIME       NULL,
    [last_upd_dt]      DATETIME       NULL,
    [ins_user_id]      NVARCHAR (40)  NULL,
    [last_upd_user_id] NVARCHAR (40)  NULL,
    CONSTRAINT [sl_ifddtdtlolpk] PRIMARY KEY CLUSTERED ([ifd_data_seq] ASC, [ifd_data_dtl_seq] ASC, [fld_tag] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [sl_ifddtdtlolfkdtl] FOREIGN KEY ([ifd_data_seq], [ifd_data_dtl_seq]) REFERENCES [dbo].[sl_ifd_data_dtl] ([ifd_data_seq], [ifd_data_dtl_seq]) ON DELETE CASCADE
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table contains over-loaded IFD data for instance of an IFD segment.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_data_dtl_ol';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The IFD data sequence', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_data_dtl_ol', @level2type = N'COLUMN', @level2name = N'ifd_data_seq';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The IFD data detail sequence', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_data_dtl_ol', @level2type = N'COLUMN', @level2name = N'ifd_data_dtl_seq';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The field tag', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_data_dtl_ol', @level2type = N'COLUMN', @level2name = N'fld_tag';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The field value', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_data_dtl_ol', @level2type = N'COLUMN', @level2name = N'fld_val';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Insert date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_data_dtl_ol', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Last update date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_data_dtl_ol', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User who created this record', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_data_dtl_ol', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User who performed the last update to the entry', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_data_dtl_ol', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

