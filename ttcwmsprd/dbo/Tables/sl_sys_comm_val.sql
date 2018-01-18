CREATE TABLE [dbo].[sl_sys_comm_val] (
    [sys_id]             NVARCHAR (30)  NOT NULL,
    [comm_mode_cd]       NVARCHAR (5)   NOT NULL,
    [comm_dir_cd]        NVARCHAR (5)   NOT NULL,
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
    CONSTRAINT [sl_sys_comm_val_pk] PRIMARY KEY CLUSTERED ([sys_id] ASC, [comm_mode_cd] ASC, [comm_dir_cd] ASC, [comm_mthd_id] ASC, [comm_mthd_attr] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [sl_syscmvalfkalg] FOREIGN KEY ([alg_id]) REFERENCES [dbo].[sl_alg_def] ([alg_id]),
    CONSTRAINT [sl_syscmvalfkcmat] FOREIGN KEY ([comm_mthd_id], [comm_mthd_attr]) REFERENCES [dbo].[sl_comm_mthd_attr] ([comm_mthd_id], [comm_mthd_attr]),
    CONSTRAINT [sl_syscmvalfkkw] FOREIGN KEY ([kw_id]) REFERENCES [dbo].[sl_kw_def] ([kw_id]),
    CONSTRAINT [sl_syscmvalfksyscm] FOREIGN KEY ([sys_id], [comm_mode_cd], [comm_dir_cd]) REFERENCES [dbo].[sl_sys_comm] ([sys_id], [comm_mode_cd], [comm_dir_cd]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [sl_syscmvalfkalg]
    ON [dbo].[sl_sys_comm_val]([alg_id] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [sl_syscmvalfkcmat]
    ON [dbo].[sl_sys_comm_val]([comm_mthd_id] ASC, [comm_mthd_attr] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [sl_syscmvalfkkw]
    ON [dbo].[sl_sys_comm_val]([kw_id] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [sl_syscmvalfksyscm]
    ON [dbo].[sl_sys_comm_val]([comm_dir_cd] ASC, [comm_mode_cd] ASC, [sys_id] ASC) WITH (FILLFACTOR = 90);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table defines system communication attribute value.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_sys_comm_val';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The system identifier', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_sys_comm_val', @level2type = N'COLUMN', @level2name = N'sys_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The communication mode code', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_sys_comm_val', @level2type = N'COLUMN', @level2name = N'comm_mode_cd';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The communication direction', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_sys_comm_val', @level2type = N'COLUMN', @level2name = N'comm_dir_cd';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The communication method name', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_sys_comm_val', @level2type = N'COLUMN', @level2name = N'comm_mthd_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The communication attribute name', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_sys_comm_val', @level2type = N'COLUMN', @level2name = N'comm_mthd_attr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The communication attribute value', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_sys_comm_val', @level2type = N'COLUMN', @level2name = N'comm_mthd_attr_val';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The algorithm is used by this attribute', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_sys_comm_val', @level2type = N'COLUMN', @level2name = N'alg_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The keyword is used by this attribute', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_sys_comm_val', @level2type = N'COLUMN', @level2name = N'kw_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The version number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_sys_comm_val', @level2type = N'COLUMN', @level2name = N'u_version';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Insert date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_sys_comm_val', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Last update date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_sys_comm_val', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User who created this record', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_sys_comm_val', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User who performed the last update to the entry', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_sys_comm_val', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

