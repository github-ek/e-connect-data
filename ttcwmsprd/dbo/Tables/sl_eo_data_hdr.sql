CREATE TABLE [dbo].[sl_eo_data_hdr] (
    [eo_data_seq]      NUMERIC (12)  NOT NULL,
    [eo_id]            NVARCHAR (30) NOT NULL,
    [eo_ver]           NVARCHAR (15) NOT NULL,
    [evt_data_seq]     NUMERIC (12)  NOT NULL,
    [cre_dt]           DATETIME      NOT NULL,
    [cre_ts]           NUMERIC (20)  NULL,
    [cmpl_dt]          DATETIME      NULL,
    [cmpl_ts]          NUMERIC (20)  NULL,
    [ins_dt]           DATETIME      NULL,
    [last_upd_dt]      DATETIME      NULL,
    [ins_user_id]      NVARCHAR (40) NULL,
    [last_upd_user_id] NVARCHAR (40) NULL,
    CONSTRAINT [sl_eo_data_hdr_pk] PRIMARY KEY NONCLUSTERED ([eo_data_seq] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [sl_eodthdrfkevtd] FOREIGN KEY ([evt_data_seq]) REFERENCES [dbo].[sl_evt_data] ([evt_data_seq]) ON DELETE CASCADE
);


GO
CREATE CLUSTERED INDEX [sl_eodthdrfkevtd]
    ON [dbo].[sl_eo_data_hdr]([evt_data_seq] ASC) WITH (FILLFACTOR = 90);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table contains instances of data for an event output.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_eo_data_hdr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) EO data sequence', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_eo_data_hdr', @level2type = N'COLUMN', @level2name = N'eo_data_seq';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Event output name', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_eo_data_hdr', @level2type = N'COLUMN', @level2name = N'eo_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Event output version', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_eo_data_hdr', @level2type = N'COLUMN', @level2name = N'eo_ver';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Event sequence', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_eo_data_hdr', @level2type = N'COLUMN', @level2name = N'evt_data_seq';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Create date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_eo_data_hdr', @level2type = N'COLUMN', @level2name = N'cre_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Create time stamp', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_eo_data_hdr', @level2type = N'COLUMN', @level2name = N'cre_ts';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Complete date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_eo_data_hdr', @level2type = N'COLUMN', @level2name = N'cmpl_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Complete time stamp', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_eo_data_hdr', @level2type = N'COLUMN', @level2name = N'cmpl_ts';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Insert date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_eo_data_hdr', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Last update date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_eo_data_hdr', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User who created this record', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_eo_data_hdr', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User who performed the last update to the entry', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_eo_data_hdr', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

