CREATE TABLE [dbo].[sl_o_ifd_sys_map_alg_bnd_dat] (
    [ifd_id]           NVARCHAR (30)  NOT NULL,
    [ifd_ver]          NVARCHAR (15)  NOT NULL,
    [sys_id]           NVARCHAR (30)  NOT NULL,
    [alg_id]           NVARCHAR (30)  NOT NULL,
    [in_bnd_var_id]    NVARCHAR (30)  NOT NULL,
    [bnd_data]         NVARCHAR (200) NULL,
    [u_version]        NUMERIC (5)    NULL,
    [ins_dt]           DATETIME       NULL,
    [last_upd_dt]      DATETIME       NULL,
    [ins_user_id]      NVARCHAR (40)  NULL,
    [last_upd_user_id] NVARCHAR (40)  NULL,
    CONSTRAINT [sl_ysmapalgbnddapk] PRIMARY KEY CLUSTERED ([ifd_id] ASC, [ifd_ver] ASC, [sys_id] ASC, [alg_id] ASC, [in_bnd_var_id] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [sl_smapalgbnddtfka] FOREIGN KEY ([alg_id], [in_bnd_var_id]) REFERENCES [dbo].[sl_alg_in_bnd_var] ([alg_id], [in_bnd_var_id]),
    CONSTRAINT [sl_smapalgbnddtfkm] FOREIGN KEY ([ifd_id], [ifd_ver], [sys_id]) REFERENCES [dbo].[sl_o_ifd_sys_map] ([ifd_id], [ifd_ver], [sys_id]) ON DELETE CASCADE
);




GO
CREATE NONCLUSTERED INDEX [sl_smapalgbnddtfka]
    ON [dbo].[sl_o_ifd_sys_map_alg_bnd_dat]([alg_id] ASC, [in_bnd_var_id] ASC) WITH (FILLFACTOR = 90);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table defines outbound IFD system mappings bind variable data.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_o_ifd_sys_map_alg_bnd_dat';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The result IFD', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_o_ifd_sys_map_alg_bnd_dat', @level2type = N'COLUMN', @level2name = N'ifd_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The IFD version', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_o_ifd_sys_map_alg_bnd_dat', @level2type = N'COLUMN', @level2name = N'ifd_ver';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The system', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_o_ifd_sys_map_alg_bnd_dat', @level2type = N'COLUMN', @level2name = N'sys_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The algorithm name', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_o_ifd_sys_map_alg_bnd_dat', @level2type = N'COLUMN', @level2name = N'alg_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The input bind variable', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_o_ifd_sys_map_alg_bnd_dat', @level2type = N'COLUMN', @level2name = N'in_bnd_var_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The bind variable data', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_o_ifd_sys_map_alg_bnd_dat', @level2type = N'COLUMN', @level2name = N'bnd_data';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The update version', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_o_ifd_sys_map_alg_bnd_dat', @level2type = N'COLUMN', @level2name = N'u_version';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Insert date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_o_ifd_sys_map_alg_bnd_dat', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Last update date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_o_ifd_sys_map_alg_bnd_dat', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User who created this record', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_o_ifd_sys_map_alg_bnd_dat', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User who performed the last update to the entry', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_o_ifd_sys_map_alg_bnd_dat', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

