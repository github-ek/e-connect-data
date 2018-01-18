CREATE TABLE [dbo].[sl_sys_ifd_comm_val_bnd_data] (
    [sys_id]           NVARCHAR (30)  NOT NULL,
    [comm_mode_cd]     NVARCHAR (5)   NOT NULL,
    [comm_dir_cd]      NVARCHAR (5)   NOT NULL,
    [ifd_id]           NVARCHAR (30)  NOT NULL,
    [ifd_ver]          NVARCHAR (15)  NOT NULL,
    [comm_mthd_id]     NVARCHAR (30)  NOT NULL,
    [comm_mthd_attr]   NVARCHAR (30)  NOT NULL,
    [alg_id]           NVARCHAR (30)  NOT NULL,
    [in_bnd_var_id]    NVARCHAR (30)  NOT NULL,
    [bnd_data]         NVARCHAR (200) NULL,
    [u_version]        NUMERIC (5)    NULL,
    [ins_dt]           DATETIME       NULL,
    [last_upd_dt]      DATETIME       NULL,
    [ins_user_id]      NVARCHAR (40)  NULL,
    [last_upd_user_id] NVARCHAR (40)  NULL,
    CONSTRAINT [sl_fdcmvalbnddatpk] PRIMARY KEY CLUSTERED ([sys_id] ASC, [comm_mode_cd] ASC, [comm_dir_cd] ASC, [ifd_id] ASC, [ifd_ver] ASC, [comm_mthd_id] ASC, [comm_mthd_attr] ASC, [alg_id] ASC, [in_bnd_var_id] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [sl_dcmvalbddatfkai] FOREIGN KEY ([alg_id], [in_bnd_var_id]) REFERENCES [dbo].[sl_alg_in_bnd_var] ([alg_id], [in_bnd_var_id]),
    CONSTRAINT [sl_dcmvalbddatfkcv] FOREIGN KEY ([sys_id], [comm_mode_cd], [comm_dir_cd], [ifd_id], [ifd_ver], [comm_mthd_id], [comm_mthd_attr]) REFERENCES [dbo].[sl_sys_ifd_comm_val] ([sys_id], [comm_mode_cd], [comm_dir_cd], [ifd_id], [ifd_ver], [comm_mthd_id], [comm_mthd_attr]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [sl_dcmvalbddatfkai]
    ON [dbo].[sl_sys_ifd_comm_val_bnd_data]([alg_id] ASC, [in_bnd_var_id] ASC) WITH (FILLFACTOR = 90);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table defines system IFD communication value attribute bind variable data.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_sys_ifd_comm_val_bnd_data';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The system identifier', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_sys_ifd_comm_val_bnd_data', @level2type = N'COLUMN', @level2name = N'sys_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The communication mode code', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_sys_ifd_comm_val_bnd_data', @level2type = N'COLUMN', @level2name = N'comm_mode_cd';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The communication direction', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_sys_ifd_comm_val_bnd_data', @level2type = N'COLUMN', @level2name = N'comm_dir_cd';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The system IFD name', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_sys_ifd_comm_val_bnd_data', @level2type = N'COLUMN', @level2name = N'ifd_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The system IFD version', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_sys_ifd_comm_val_bnd_data', @level2type = N'COLUMN', @level2name = N'ifd_ver';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The communication method name', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_sys_ifd_comm_val_bnd_data', @level2type = N'COLUMN', @level2name = N'comm_mthd_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The communication method attribute name', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_sys_ifd_comm_val_bnd_data', @level2type = N'COLUMN', @level2name = N'comm_mthd_attr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The algorithm is used by this attribute', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_sys_ifd_comm_val_bnd_data', @level2type = N'COLUMN', @level2name = N'alg_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The input bind variable', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_sys_ifd_comm_val_bnd_data', @level2type = N'COLUMN', @level2name = N'in_bnd_var_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The bind variable data', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_sys_ifd_comm_val_bnd_data', @level2type = N'COLUMN', @level2name = N'bnd_data';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The version number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_sys_ifd_comm_val_bnd_data', @level2type = N'COLUMN', @level2name = N'u_version';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Insert date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_sys_ifd_comm_val_bnd_data', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Last update date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_sys_ifd_comm_val_bnd_data', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User who created this record', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_sys_ifd_comm_val_bnd_data', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User who performed the last update to the entry', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_sys_ifd_comm_val_bnd_data', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

