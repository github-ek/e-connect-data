CREATE TABLE [dbo].[sl_evt_data_ems_blk] (
    [evt_data_seq]     NUMERIC (12)  NOT NULL,
    [ins_dt]           DATETIME      NULL,
    [last_upd_dt]      DATETIME      NULL,
    [ins_user_id]      NVARCHAR (40) NULL,
    [last_upd_user_id] NVARCHAR (40) NULL,
    CONSTRAINT [sl_evtdtemsblkpk] PRIMARY KEY CLUSTERED ([evt_data_seq] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [sl_tdtemsblkfkevtd] FOREIGN KEY ([evt_data_seq]) REFERENCES [dbo].[sl_evt_data] ([evt_data_seq]) ON DELETE CASCADE
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table contains EMS blocks for event data.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_evt_data_ems_blk';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Event data sequence', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_evt_data_ems_blk', @level2type = N'COLUMN', @level2name = N'evt_data_seq';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Insert date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_evt_data_ems_blk', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Last update date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_evt_data_ems_blk', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User who created this record', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_evt_data_ems_blk', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User who performed the last update to the entry ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_evt_data_ems_blk', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

