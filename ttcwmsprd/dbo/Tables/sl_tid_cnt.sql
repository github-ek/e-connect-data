CREATE TABLE [dbo].[sl_tid_cnt] (
    [tid]    NVARCHAR (24) NOT NULL,
    [sys_id] NVARCHAR (30) NOT NULL,
    [count]  NUMERIC (12)  NOT NULL,
    CONSTRAINT [sl_tidcntpk] PRIMARY KEY CLUSTERED ([tid] ASC, [sys_id] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table is used by Integrator to keep a record of (T)ransaction (ID)entifiers and their frequencies, for duplicate checking.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_tid_cnt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The given TID (see tid column in sl_ifd_data_hdr)', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_tid_cnt', @level2type = N'COLUMN', @level2name = N'tid';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The system that received the TID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_tid_cnt', @level2type = N'COLUMN', @level2name = N'sys_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The number of times said TID has occured. This should always be >= 1.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_tid_cnt', @level2type = N'COLUMN', @level2name = N'count';

