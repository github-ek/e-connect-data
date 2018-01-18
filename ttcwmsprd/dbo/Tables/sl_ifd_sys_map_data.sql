CREATE TABLE [dbo].[sl_ifd_sys_map_data] (
    [evt_data_seq]     NUMERIC (12)  NOT NULL,
    [ifd_id]           NVARCHAR (30) NOT NULL,
    [ifd_ver]          NVARCHAR (15) NOT NULL,
    [sys_id]           NVARCHAR (30) NOT NULL,
    [ena_flg]          NVARCHAR (1)  NOT NULL,
    [snd_ordr]         NUMERIC (5)   NULL,
    [blkd_flg]         NVARCHAR (1)  NOT NULL,
    [blk_alg_id]       NVARCHAR (30) NULL,
    [blk_alg_eval_cd]  NVARCHAR (5)  NULL,
    [cre_dt]           DATETIME      NULL,
    [cre_ts]           NUMERIC (20)  NULL,
    [snd_dt]           DATETIME      NULL,
    [snd_ts]           NUMERIC (20)  NULL,
    [comm_mode_cd]     NVARCHAR (5)  NULL,
    [comm_mthd_id]     NVARCHAR (30) NULL,
    [grp_ordr]         NUMERIC (5)   NULL,
    [head_evt_id]      NVARCHAR (30) NULL,
    [tail_evt_id]      NVARCHAR (30) NULL,
    [fail_evt_id]      NVARCHAR (30) NULL,
    [ins_dt]           DATETIME      NULL,
    [last_upd_dt]      DATETIME      NULL,
    [ins_user_id]      NVARCHAR (40) NULL,
    [last_upd_user_id] NVARCHAR (40) NULL,
    [succ_evt_id]      NVARCHAR (30) NULL,
    [blk_reason]       NVARCHAR (10) NULL,
    CONSTRAINT [sl_ifdsysmapdtpk] PRIMARY KEY CLUSTERED ([evt_data_seq] ASC, [ifd_id] ASC, [ifd_ver] ASC, [sys_id] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [sl_dsysmapdtfkevtd] FOREIGN KEY ([evt_data_seq]) REFERENCES [dbo].[sl_evt_data] ([evt_data_seq]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [sl_fdsysmapdtsksys]
    ON [dbo].[sl_ifd_sys_map_data]([sys_id] ASC, [ena_flg] ASC, [blkd_flg] ASC, [comm_mode_cd] ASC) WITH (FILLFACTOR = 90);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table contains evaluated IFD system mappings of logged events.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_sys_map_data';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The event data sequence', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_sys_map_data', @level2type = N'COLUMN', @level2name = N'evt_data_seq';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The IFD name', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_sys_map_data', @level2type = N'COLUMN', @level2name = N'ifd_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The IFD version', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_sys_map_data', @level2type = N'COLUMN', @level2name = N'ifd_ver';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The system name', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_sys_map_data', @level2type = N'COLUMN', @level2name = N'sys_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Is enable the IFD system mapping', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_sys_map_data', @level2type = N'COLUMN', @level2name = N'ena_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The IFD send order', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_sys_map_data', @level2type = N'COLUMN', @level2name = N'snd_ordr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Is blocked?', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_sys_map_data', @level2type = N'COLUMN', @level2name = N'blkd_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The blocking algorithm', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_sys_map_data', @level2type = N'COLUMN', @level2name = N'blk_alg_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The blocking algorithm evaluation type: B = If T returned then Block, S = If T returned then Send', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_sys_map_data', @level2type = N'COLUMN', @level2name = N'blk_alg_eval_cd';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Create date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_sys_map_data', @level2type = N'COLUMN', @level2name = N'cre_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Create time stamp', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_sys_map_data', @level2type = N'COLUMN', @level2name = N'cre_ts';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Send date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_sys_map_data', @level2type = N'COLUMN', @level2name = N'snd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Send time stamp', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_sys_map_data', @level2type = N'COLUMN', @level2name = N'snd_ts';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The communication mode code: ASYNC = Asynchronous, SYNCD = Synchronous Delivery, SYNCE = Synchronous Except Send', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_sys_map_data', @level2type = N'COLUMN', @level2name = N'comm_mode_cd';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The communication method', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_sys_map_data', @level2type = N'COLUMN', @level2name = N'comm_mthd_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The group order', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_sys_map_data', @level2type = N'COLUMN', @level2name = N'grp_ordr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The header event name', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_sys_map_data', @level2type = N'COLUMN', @level2name = N'head_evt_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The tail event name', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_sys_map_data', @level2type = N'COLUMN', @level2name = N'tail_evt_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The fail event name', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_sys_map_data', @level2type = N'COLUMN', @level2name = N'fail_evt_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Insert date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_sys_map_data', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Last update date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_sys_map_data', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User who created this record', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_sys_map_data', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User who performed the last update to the entry', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_sys_map_data', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The success event name', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_sys_map_data', @level2type = N'COLUMN', @level2name = N'succ_evt_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The reason of block', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_sys_map_data', @level2type = N'COLUMN', @level2name = N'blk_reason';

