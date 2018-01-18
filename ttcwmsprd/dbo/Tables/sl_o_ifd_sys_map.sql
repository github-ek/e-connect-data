CREATE TABLE [dbo].[sl_o_ifd_sys_map] (
    [ifd_id]           NVARCHAR (30) NOT NULL,
    [ifd_ver]          NVARCHAR (15) NOT NULL,
    [sys_id]           NVARCHAR (30) NOT NULL,
    [blk_alg_id]       NVARCHAR (30) NULL,
    [blk_alg_eval_cd]  NVARCHAR (5)  NULL,
    [comm_mode_cd]     NVARCHAR (5)  NOT NULL,
    [comm_mthd_id]     NVARCHAR (30) NULL,
    [persist_eo_flg]   NVARCHAR (1)  NOT NULL,
    [persist_ifd_flg]  NVARCHAR (1)  NOT NULL,
    [ena_flg]          NVARCHAR (1)  NOT NULL,
    [grp_ordr]         NUMERIC (5)   NULL,
    [snd_ordr]         NUMERIC (5)   NULL,
    [head_evt_id]      NVARCHAR (30) NULL,
    [tail_evt_id]      NVARCHAR (30) NULL,
    [succ_evt_id]      NVARCHAR (30) NULL,
    [u_version]        NUMERIC (5)   NULL,
    [ins_dt]           DATETIME      NULL,
    [last_upd_dt]      DATETIME      NULL,
    [ins_user_id]      NVARCHAR (40) NULL,
    [fail_evt_id]      NVARCHAR (30) NULL,
    [last_upd_user_id] NVARCHAR (40) NULL,
    CONSTRAINT [sl_oifdsysmappk] PRIMARY KEY CLUSTERED ([ifd_id] ASC, [ifd_ver] ASC, [sys_id] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [sl_ifdsysmapfkevtf] FOREIGN KEY ([fail_evt_id]) REFERENCES [dbo].[sl_evt_def] ([evt_id]),
    CONSTRAINT [sl_ifdsysmapfkevth] FOREIGN KEY ([head_evt_id]) REFERENCES [dbo].[sl_evt_def] ([evt_id]),
    CONSTRAINT [sl_ifdsysmapfkevts] FOREIGN KEY ([succ_evt_id]) REFERENCES [dbo].[sl_evt_def] ([evt_id]),
    CONSTRAINT [sl_ifdsysmapfkevtt] FOREIGN KEY ([tail_evt_id]) REFERENCES [dbo].[sl_evt_def] ([evt_id]),
    CONSTRAINT [sl_oifdsysmapfkalg] FOREIGN KEY ([blk_alg_id]) REFERENCES [dbo].[sl_alg_def] ([alg_id]),
    CONSTRAINT [sl_oifdsysmapfkcm] FOREIGN KEY ([comm_mthd_id]) REFERENCES [dbo].[sl_comm_mthd_def] ([comm_mthd_id]),
    CONSTRAINT [sl_oifdsysmapfkifd] FOREIGN KEY ([ifd_id], [ifd_ver]) REFERENCES [dbo].[sl_ifd_def] ([ifd_id], [ifd_ver]),
    CONSTRAINT [sl_oifdsysmapfksys] FOREIGN KEY ([sys_id]) REFERENCES [dbo].[sl_sys_def] ([sys_id])
);


GO
CREATE NONCLUSTERED INDEX [sl_ifdsysmapfkevtf]
    ON [dbo].[sl_o_ifd_sys_map]([fail_evt_id] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [sl_ifdsysmapfkevth]
    ON [dbo].[sl_o_ifd_sys_map]([head_evt_id] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [sl_ifdsysmapfkevts]
    ON [dbo].[sl_o_ifd_sys_map]([succ_evt_id] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [sl_ifdsysmapfkevtt]
    ON [dbo].[sl_o_ifd_sys_map]([tail_evt_id] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [sl_oifdsysmapfkalg]
    ON [dbo].[sl_o_ifd_sys_map]([blk_alg_id] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [sl_oifdsysmapfkcm]
    ON [dbo].[sl_o_ifd_sys_map]([comm_mthd_id] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [sl_oifdsysmapfksys]
    ON [dbo].[sl_o_ifd_sys_map]([sys_id] ASC) WITH (FILLFACTOR = 90);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table defines outbound IFD system mappings.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_o_ifd_sys_map';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The result IFD', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_o_ifd_sys_map', @level2type = N'COLUMN', @level2name = N'ifd_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The IFD version', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_o_ifd_sys_map', @level2type = N'COLUMN', @level2name = N'ifd_ver';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The system', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_o_ifd_sys_map', @level2type = N'COLUMN', @level2name = N'sys_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The blocking algorithm', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_o_ifd_sys_map', @level2type = N'COLUMN', @level2name = N'blk_alg_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The blocking algorithm evaluation code: B = If T returned then Block, S = If T returned then Send', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_o_ifd_sys_map', @level2type = N'COLUMN', @level2name = N'blk_alg_eval_cd';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The communication mode: ASYNC = Asynchronous, SYNCD = Synchronous Delivery, SYNCE = Synchronous Except Send', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_o_ifd_sys_map', @level2type = N'COLUMN', @level2name = N'comm_mode_cd';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK)The communication method', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_o_ifd_sys_map', @level2type = N'COLUMN', @level2name = N'comm_mthd_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If IFD synchronous deliveried, make eo persistent?', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_o_ifd_sys_map', @level2type = N'COLUMN', @level2name = N'persist_eo_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If IFD synchronous deliveried, make ifd persistent?', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_o_ifd_sys_map', @level2type = N'COLUMN', @level2name = N'persist_ifd_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Enabled', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_o_ifd_sys_map', @level2type = N'COLUMN', @level2name = N'ena_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The order indicator', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_o_ifd_sys_map', @level2type = N'COLUMN', @level2name = N'grp_ordr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The order in which to send', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_o_ifd_sys_map', @level2type = N'COLUMN', @level2name = N'snd_ordr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The header event name', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_o_ifd_sys_map', @level2type = N'COLUMN', @level2name = N'head_evt_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The tail event name', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_o_ifd_sys_map', @level2type = N'COLUMN', @level2name = N'tail_evt_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The success event Id', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_o_ifd_sys_map', @level2type = N'COLUMN', @level2name = N'succ_evt_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The update version', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_o_ifd_sys_map', @level2type = N'COLUMN', @level2name = N'u_version';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Insert date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_o_ifd_sys_map', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Last update date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_o_ifd_sys_map', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User who created this record', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_o_ifd_sys_map', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The fail event Id', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_o_ifd_sys_map', @level2type = N'COLUMN', @level2name = N'fail_evt_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User who performed the last update to the entry', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_o_ifd_sys_map', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

