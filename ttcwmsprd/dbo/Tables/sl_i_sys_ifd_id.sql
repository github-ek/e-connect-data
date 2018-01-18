CREATE TABLE [dbo].[sl_i_sys_ifd_id] (
    [sys_id]           NVARCHAR (30) NOT NULL,
    [ifd_id]           NVARCHAR (30) NOT NULL,
    [ifd_ver]          NVARCHAR (15) NOT NULL,
    [id_seg_alg_id]    NVARCHAR (30) NULL,
    [ord_ind]          NUMERIC (5)   NOT NULL,
    [ena_flg]          NVARCHAR (1)  NULL,
    [u_version]        NUMERIC (5)   NULL,
    [ins_dt]           DATETIME      NULL,
    [last_upd_dt]      DATETIME      NULL,
    [ins_user_id]      NVARCHAR (40) NULL,
    [last_upd_user_id] NVARCHAR (40) NULL,
    CONSTRAINT [sl_i_sys_ifd_id_pk] PRIMARY KEY CLUSTERED ([sys_id] ASC, [ifd_id] ASC, [ifd_ver] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [sl_isysifdidfkalg] FOREIGN KEY ([id_seg_alg_id]) REFERENCES [dbo].[sl_alg_def] ([alg_id]),
    CONSTRAINT [sl_isysifdidfkifd] FOREIGN KEY ([ifd_id], [ifd_ver]) REFERENCES [dbo].[sl_ifd_def] ([ifd_id], [ifd_ver]),
    CONSTRAINT [sl_isysifdidfksys] FOREIGN KEY ([sys_id]) REFERENCES [dbo].[sl_sys_def] ([sys_id])
);


GO
CREATE NONCLUSTERED INDEX [sl_isysifdidfkalg]
    ON [dbo].[sl_i_sys_ifd_id]([id_seg_alg_id] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [sl_isysifdidfkifd]
    ON [dbo].[sl_i_sys_ifd_id]([ifd_id] ASC, [ifd_ver] ASC) WITH (FILLFACTOR = 90);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table defines inbound IFD for system.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_i_sys_ifd_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The system name', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_i_sys_ifd_id', @level2type = N'COLUMN', @level2name = N'sys_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The IFD name', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_i_sys_ifd_id', @level2type = N'COLUMN', @level2name = N'ifd_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The IFD version', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_i_sys_ifd_id', @level2type = N'COLUMN', @level2name = N'ifd_ver';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The algorithm name of IFD segment', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_i_sys_ifd_id', @level2type = N'COLUMN', @level2name = N'id_seg_alg_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The order indicator', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_i_sys_ifd_id', @level2type = N'COLUMN', @level2name = N'ord_ind';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Enable the IFD in this system', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_i_sys_ifd_id', @level2type = N'COLUMN', @level2name = N'ena_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The version number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_i_sys_ifd_id', @level2type = N'COLUMN', @level2name = N'u_version';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Insert date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_i_sys_ifd_id', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Last update date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_i_sys_ifd_id', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User who created this record', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_i_sys_ifd_id', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User who performed the last update to the entry', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_i_sys_ifd_id', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

