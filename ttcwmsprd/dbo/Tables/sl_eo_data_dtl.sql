CREATE TABLE [dbo].[sl_eo_data_dtl] (
    [eo_data_seq]      NUMERIC (12)   NOT NULL,
    [eo_data_dtl_seq]  NUMERIC (6)    NOT NULL,
    [eo_id]            NVARCHAR (30)  NOT NULL,
    [eo_ver]           NVARCHAR (15)  NOT NULL,
    [eo_seg_id]        NVARCHAR (30)  NOT NULL,
    [seg_lin]          NUMERIC (6)    NOT NULL,
    [eo_seg_data]      NVARCHAR (MAX) NULL,
    [ins_dt]           DATETIME       NULL,
    [last_upd_dt]      DATETIME       NULL,
    [ins_user_id]      NVARCHAR (40)  NULL,
    [last_upd_user_id] NVARCHAR (40)  NULL,
    [src_def_typ_cd]   NVARCHAR (5)   NULL,
    [src_data_seq]     NUMERIC (12)   NULL,
    [src_data_dtl_seq] NUMERIC (6)    NULL,
    [ol_exists_flg]    NVARCHAR (1)   NULL,
    CONSTRAINT [sl_eo_data_dtl_pk] PRIMARY KEY CLUSTERED ([eo_data_seq] ASC, [eo_data_dtl_seq] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [sl_eodtdtkfkhdr] FOREIGN KEY ([eo_data_seq]) REFERENCES [dbo].[sl_eo_data_hdr] ([eo_data_seq]) ON DELETE CASCADE
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table contains instances of data for an event output segment.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_eo_data_dtl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) EO data sequence', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_eo_data_dtl', @level2type = N'COLUMN', @level2name = N'eo_data_seq';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'EO date detail sequence', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_eo_data_dtl', @level2type = N'COLUMN', @level2name = N'eo_data_dtl_seq';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Event output name', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_eo_data_dtl', @level2type = N'COLUMN', @level2name = N'eo_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Event output version', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_eo_data_dtl', @level2type = N'COLUMN', @level2name = N'eo_ver';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'EO segment name', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_eo_data_dtl', @level2type = N'COLUMN', @level2name = N'eo_seg_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'EO segment line', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_eo_data_dtl', @level2type = N'COLUMN', @level2name = N'seg_lin';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'EO segment data', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_eo_data_dtl', @level2type = N'COLUMN', @level2name = N'eo_seg_data';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Insert date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_eo_data_dtl', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Last update date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_eo_data_dtl', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User who created this record', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_eo_data_dtl', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User who performed the last update to the entry', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_eo_data_dtl', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The type of source data: IFD = Interface Document, EO = Event Output', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_eo_data_dtl', @level2type = N'COLUMN', @level2name = N'src_def_typ_cd';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Source data sequence', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_eo_data_dtl', @level2type = N'COLUMN', @level2name = N'src_data_seq';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Source data detail sequence', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_eo_data_dtl', @level2type = N'COLUMN', @level2name = N'src_data_dtl_seq';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Flag for over-loaded data exists', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_eo_data_dtl', @level2type = N'COLUMN', @level2name = N'ol_exists_flg';

