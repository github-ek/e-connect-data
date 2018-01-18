CREATE TABLE [dbo].[sl_i_ifd_evt_map] (
    [ifd_id]            NVARCHAR (30) NOT NULL,
    [ifd_ver]           NVARCHAR (15) NOT NULL,
    [ifd_action]        NVARCHAR (5)  NOT NULL,
    [sys_id]            NVARCHAR (30) NOT NULL,
    [ifd_action_alg_id] NVARCHAR (30) NULL,
    [evt_id]            NVARCHAR (30) NULL,
    [ena_flg]           NVARCHAR (1)  NULL,
    [u_version]         NUMERIC (5)   NULL,
    [ins_dt]            DATETIME      NULL,
    [last_upd_dt]       DATETIME      NULL,
    [ins_user_id]       NVARCHAR (40) NULL,
    [last_upd_user_id]  NVARCHAR (40) NULL,
    CONSTRAINT [sl_iifdevtmappk] PRIMARY KEY CLUSTERED ([ifd_id] ASC, [ifd_ver] ASC, [ifd_action] ASC, [sys_id] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [sl_fdevtmapfksysid] FOREIGN KEY ([sys_id], [ifd_id], [ifd_ver]) REFERENCES [dbo].[sl_i_sys_ifd_id] ([sys_id], [ifd_id], [ifd_ver]) ON DELETE CASCADE,
    CONSTRAINT [sl_iifdevtmapfkalg] FOREIGN KEY ([ifd_action_alg_id]) REFERENCES [dbo].[sl_alg_def] ([alg_id]),
    CONSTRAINT [sl_iifdevtmapfkevt] FOREIGN KEY ([evt_id]) REFERENCES [dbo].[sl_evt_def] ([evt_id])
);


GO
CREATE NONCLUSTERED INDEX [sl_fdevtmapfksysid]
    ON [dbo].[sl_i_ifd_evt_map]([sys_id] ASC, [ifd_id] ASC, [ifd_ver] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [sl_iifdevtmapfkalg]
    ON [dbo].[sl_i_ifd_evt_map]([ifd_action_alg_id] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [sl_iifdevtmapfkevt]
    ON [dbo].[sl_i_ifd_evt_map]([evt_id] ASC) WITH (FILLFACTOR = 90);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table defines inbound IFD event mapping data.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_i_ifd_evt_map';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The IFD name', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_i_ifd_evt_map', @level2type = N'COLUMN', @level2name = N'ifd_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The IFD version', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_i_ifd_evt_map', @level2type = N'COLUMN', @level2name = N'ifd_ver';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The IFD action', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_i_ifd_evt_map', @level2type = N'COLUMN', @level2name = N'ifd_action';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The system name', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_i_ifd_evt_map', @level2type = N'COLUMN', @level2name = N'sys_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The algorithm name of the IFD action', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_i_ifd_evt_map', @level2type = N'COLUMN', @level2name = N'ifd_action_alg_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The event name', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_i_ifd_evt_map', @level2type = N'COLUMN', @level2name = N'evt_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Enable the IFD event mapping', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_i_ifd_evt_map', @level2type = N'COLUMN', @level2name = N'ena_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The version number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_i_ifd_evt_map', @level2type = N'COLUMN', @level2name = N'u_version';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Insert date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_i_ifd_evt_map', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Last update date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_i_ifd_evt_map', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User who created this record', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_i_ifd_evt_map', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User who performed the last update to the entry', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_i_ifd_evt_map', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

