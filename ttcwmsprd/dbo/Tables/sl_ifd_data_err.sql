CREATE TABLE [dbo].[sl_ifd_data_err] (
    [ifd_data_err_seq] NUMERIC (12)   NOT NULL,
    [dwnld_seq]        NUMERIC (12)   NULL,
    [dwnld_lin_seq]    NUMERIC (12)   NOT NULL,
    [ifd_seg_data]     NVARCHAR (MAX) NULL,
    [u_version]        NUMERIC (5)    NULL,
    [ins_dt]           DATETIME       NULL,
    [last_upd_dt]      DATETIME       NULL,
    [ins_user_id]      NVARCHAR (40)  NULL,
    [last_upd_user_id] NVARCHAR (40)  NULL,
    [modified_flg]     NVARCHAR (1)   NULL,
    CONSTRAINT [sl_ifd_data_err_pk] PRIMARY KEY NONCLUSTERED ([ifd_data_err_seq] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [sl_fddterrfkdldseq] FOREIGN KEY ([dwnld_seq]) REFERENCES [dbo].[sl_dwnld] ([dwnld_seq]) ON DELETE CASCADE
);


GO
CREATE CLUSTERED INDEX [sl_fddterrfkdldseq]
    ON [dbo].[sl_ifd_data_err]([dwnld_seq] ASC) WITH (FILLFACTOR = 90);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table contains data that fails to identify as an IFD.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_data_err';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The IFD data error sequence', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_data_err', @level2type = N'COLUMN', @level2name = N'ifd_data_err_seq';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The download sequence', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_data_err', @level2type = N'COLUMN', @level2name = N'dwnld_seq';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The download line sequence', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_data_err', @level2type = N'COLUMN', @level2name = N'dwnld_lin_seq';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The IFD segment data', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_data_err', @level2type = N'COLUMN', @level2name = N'ifd_seg_data';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The version number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_data_err', @level2type = N'COLUMN', @level2name = N'u_version';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Insert date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_data_err', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Last update date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_data_err', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User who created this record', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_data_err', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User who performed the last update to the entry', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_data_err', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Is IFD error data modified?', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_data_err', @level2type = N'COLUMN', @level2name = N'modified_flg';

