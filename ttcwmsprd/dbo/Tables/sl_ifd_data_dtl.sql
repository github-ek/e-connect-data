CREATE TABLE [dbo].[sl_ifd_data_dtl] (
    [ifd_data_seq]     NUMERIC (12)   NOT NULL,
    [ifd_data_dtl_seq] NUMERIC (6)    NOT NULL,
    [ifd_id]           NVARCHAR (30)  NULL,
    [ifd_ver]          NVARCHAR (15)  NULL,
    [ifd_seg_id]       NVARCHAR (30)  NULL,
    [ifd_seg_data]     NVARCHAR (MAX) NULL,
    [ins_dt]           DATETIME       NULL,
    [last_upd_dt]      DATETIME       NULL,
    [ins_user_id]      NVARCHAR (40)  NULL,
    [last_upd_user_id] NVARCHAR (40)  NULL,
    [dwnld_lin_seq]    NUMERIC (12)   NULL,
    [src_def_typ_cd]   NVARCHAR (5)   NULL,
    [src_data_seq]     NUMERIC (12)   NULL,
    [src_data_dtl_seq] NUMERIC (6)    NULL,
    [ol_exists_flg]    NVARCHAR (1)   NULL,
    [modified_flg]     NVARCHAR (1)   NULL,
    CONSTRAINT [sl_ifd_data_dtl_pk] PRIMARY KEY CLUSTERED ([ifd_data_seq] ASC, [ifd_data_dtl_seq] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [sl_ifddtdtlfkhdr] FOREIGN KEY ([ifd_data_seq]) REFERENCES [dbo].[sl_ifd_data_hdr] ([ifd_data_seq]) ON DELETE CASCADE
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table contains instances of data for an IFD segment.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_data_dtl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The IFD data sequence', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_data_dtl', @level2type = N'COLUMN', @level2name = N'ifd_data_seq';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The IFD data detail sequence', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_data_dtl', @level2type = N'COLUMN', @level2name = N'ifd_data_dtl_seq';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The IFD name', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_data_dtl', @level2type = N'COLUMN', @level2name = N'ifd_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The IFD version', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_data_dtl', @level2type = N'COLUMN', @level2name = N'ifd_ver';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The IFD segment name', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_data_dtl', @level2type = N'COLUMN', @level2name = N'ifd_seg_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The IFD segment data', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_data_dtl', @level2type = N'COLUMN', @level2name = N'ifd_seg_data';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Insert date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_data_dtl', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Last update date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_data_dtl', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User who created this record', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_data_dtl', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User who performed the last update to the entry', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_data_dtl', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The download line sequence', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_data_dtl', @level2type = N'COLUMN', @level2name = N'dwnld_lin_seq';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The type of source data: COMM = Communication, DWNLD = Download, EO = Event Output, EVT = Event, IFD = IFD', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_data_dtl', @level2type = N'COLUMN', @level2name = N'src_def_typ_cd';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The source data sequence', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_data_dtl', @level2type = N'COLUMN', @level2name = N'src_data_seq';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The source data detail sequence', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_data_dtl', @level2type = N'COLUMN', @level2name = N'src_data_dtl_seq';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Does over-loaded data exists', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_data_dtl', @level2type = N'COLUMN', @level2name = N'ol_exists_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Is IFD detail data modified?', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_data_dtl', @level2type = N'COLUMN', @level2name = N'modified_flg';

