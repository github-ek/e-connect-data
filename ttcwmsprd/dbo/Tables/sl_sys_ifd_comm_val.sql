CREATE TABLE [dbo].[sl_sys_ifd_comm_val] (
    [sys_id]             NVARCHAR (30)  NOT NULL,
    [comm_mode_cd]       NVARCHAR (5)   NOT NULL,
    [comm_dir_cd]        NVARCHAR (5)   NOT NULL,
    [ifd_id]             NVARCHAR (30)  NOT NULL,
    [ifd_ver]            NVARCHAR (15)  NOT NULL,
    [comm_mthd_id]       NVARCHAR (30)  NOT NULL,
    [comm_mthd_attr]     NVARCHAR (30)  NOT NULL,
    [comm_mthd_attr_val] NVARCHAR (MAX) NULL,
    [alg_id]             NVARCHAR (30)  NULL,
    [kw_id]              NVARCHAR (30)  NULL,
    [u_version]          NUMERIC (5)    NULL,
    [ins_dt]             DATETIME       NULL,
    [last_upd_dt]        DATETIME       NULL,
    [ins_user_id]        NVARCHAR (40)  NULL,
    [last_upd_user_id]   NVARCHAR (40)  NULL,
    CONSTRAINT [sl_sysifdcmvalpk] PRIMARY KEY CLUSTERED ([sys_id] ASC, [comm_mode_cd] ASC, [comm_dir_cd] ASC, [ifd_id] ASC, [ifd_ver] ASC, [comm_mthd_id] ASC, [comm_mthd_attr] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [sl_sifdcmvalfksysc] FOREIGN KEY ([sys_id], [comm_mode_cd], [comm_dir_cd]) REFERENCES [dbo].[sl_sys_comm] ([sys_id], [comm_mode_cd], [comm_dir_cd]) ON DELETE CASCADE,
    CONSTRAINT [sl_sysifdcmvalfkkw] FOREIGN KEY ([kw_id]) REFERENCES [dbo].[sl_kw_def] ([kw_id]),
    CONSTRAINT [sl_ysifdcmvalfkalg] FOREIGN KEY ([alg_id]) REFERENCES [dbo].[sl_alg_def] ([alg_id]),
    CONSTRAINT [sl_ysifdcmvalfkcat] FOREIGN KEY ([comm_mthd_id], [comm_mthd_attr]) REFERENCES [dbo].[sl_comm_mthd_attr] ([comm_mthd_id], [comm_mthd_attr]),
    CONSTRAINT [sl_ysifdcmvalfkifd] FOREIGN KEY ([ifd_id], [ifd_ver]) REFERENCES [dbo].[sl_ifd_def] ([ifd_id], [ifd_ver])
);


GO
CREATE NONCLUSTERED INDEX [sl_sifdcmvalfksysc]
    ON [dbo].[sl_sys_ifd_comm_val]([sys_id] ASC, [comm_dir_cd] ASC, [comm_mode_cd] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [sl_sysifdcmvalfkkw]
    ON [dbo].[sl_sys_ifd_comm_val]([kw_id] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [sl_ysifdcmvalfkalg]
    ON [dbo].[sl_sys_ifd_comm_val]([alg_id] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [sl_ysifdcmvalfkcat]
    ON [dbo].[sl_sys_ifd_comm_val]([comm_mthd_id] ASC, [comm_mthd_attr] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [sl_ysifdcmvalfkifd]
    ON [dbo].[sl_sys_ifd_comm_val]([ifd_id] ASC, [ifd_ver] ASC) WITH (FILLFACTOR = 90);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table defines system IFD communication value attribute.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_sys_ifd_comm_val';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The system identifier', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_sys_ifd_comm_val', @level2type = N'COLUMN', @level2name = N'sys_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The communication mode code', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_sys_ifd_comm_val', @level2type = N'COLUMN', @level2name = N'comm_mode_cd';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The communication direction', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_sys_ifd_comm_val', @level2type = N'COLUMN', @level2name = N'comm_dir_cd';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The system IFD name', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_sys_ifd_comm_val', @level2type = N'COLUMN', @level2name = N'ifd_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The system IFD version', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_sys_ifd_comm_val', @level2type = N'COLUMN', @level2name = N'ifd_ver';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The communication method name', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_sys_ifd_comm_val', @level2type = N'COLUMN', @level2name = N'comm_mthd_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The communication method attribute name', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_sys_ifd_comm_val', @level2type = N'COLUMN', @level2name = N'comm_mthd_attr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The communication method attribute value', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_sys_ifd_comm_val', @level2type = N'COLUMN', @level2name = N'comm_mthd_attr_val';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The algorithm is used by this attribute', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_sys_ifd_comm_val', @level2type = N'COLUMN', @level2name = N'alg_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The keyword is used by this attribute', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_sys_ifd_comm_val', @level2type = N'COLUMN', @level2name = N'kw_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The version number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_sys_ifd_comm_val', @level2type = N'COLUMN', @level2name = N'u_version';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Insert date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_sys_ifd_comm_val', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Last update date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_sys_ifd_comm_val', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User who created this record', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_sys_ifd_comm_val', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User who performed the last update to the entry', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_sys_ifd_comm_val', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

