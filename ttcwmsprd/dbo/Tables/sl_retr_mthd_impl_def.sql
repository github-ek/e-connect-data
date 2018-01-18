CREATE TABLE [dbo].[sl_retr_mthd_impl_def] (
    [retr_mthd_id]         NVARCHAR (30)  NOT NULL,
    [retr_mthd_impl_genid] NVARCHAR (100) NOT NULL,
    [sys_id]               NVARCHAR (30)  NULL,
    [ifd_id]               NVARCHAR (30)  NULL,
    [ifd_ver]              NVARCHAR (15)  NULL,
    [ifd_seg_id]           NVARCHAR (30)  NULL,
    [retr_mthd_impl_cd]    NVARCHAR (5)   NOT NULL,
    [alg_id]               NVARCHAR (30)  NULL,
    [u_version]            NUMERIC (5)    NULL,
    [ins_dt]               DATETIME       NULL,
    [last_upd_dt]          DATETIME       NULL,
    [ins_user_id]          NVARCHAR (40)  NULL,
    [last_upd_user_id]     NVARCHAR (40)  NULL,
    CONSTRAINT [sl_retrmdidefpk] PRIMARY KEY CLUSTERED ([retr_mthd_id] ASC, [retr_mthd_impl_genid] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [sl_etrmdideffkiseg] FOREIGN KEY ([ifd_id], [ifd_ver], [ifd_seg_id]) REFERENCES [dbo].[sl_ifd_seg] ([ifd_id], [ifd_ver], [ifd_seg_id]) ON DELETE CASCADE,
    CONSTRAINT [sl_retrmdideffkalg] FOREIGN KEY ([alg_id]) REFERENCES [dbo].[sl_alg_def] ([alg_id]),
    CONSTRAINT [sl_retrmdideffkrm] FOREIGN KEY ([retr_mthd_id]) REFERENCES [dbo].[sl_retr_mthd_def] ([retr_mthd_id]) ON DELETE CASCADE,
    CONSTRAINT [sl_retrmdideffksys] FOREIGN KEY ([sys_id]) REFERENCES [dbo].[sl_sys_def] ([sys_id])
);


GO
CREATE NONCLUSTERED INDEX [sl_etrmdideffkiseg]
    ON [dbo].[sl_retr_mthd_impl_def]([ifd_id] ASC, [ifd_ver] ASC, [ifd_seg_id] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [sl_retrmdideffkalg]
    ON [dbo].[sl_retr_mthd_impl_def]([alg_id] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [sl_retrmdideffksys]
    ON [dbo].[sl_retr_mthd_impl_def]([sys_id] ASC) WITH (FILLFACTOR = 90);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table defines retrieve method implementation.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_retr_mthd_impl_def';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The retrieve method', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_retr_mthd_impl_def', @level2type = N'COLUMN', @level2name = N'retr_mthd_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The retrieve method implementation', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_retr_mthd_impl_def', @level2type = N'COLUMN', @level2name = N'retr_mthd_impl_genid';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The system', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_retr_mthd_impl_def', @level2type = N'COLUMN', @level2name = N'sys_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The IFD ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_retr_mthd_impl_def', @level2type = N'COLUMN', @level2name = N'ifd_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The IFD version', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_retr_mthd_impl_def', @level2type = N'COLUMN', @level2name = N'ifd_ver';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The IFD segment', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_retr_mthd_impl_def', @level2type = N'COLUMN', @level2name = N'ifd_seg_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The retrieve method implementation type: ALG = Algorithm, SD = SQL Cursor (DB), SI = SQL Cursor (IFD)', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_retr_mthd_impl_def', @level2type = N'COLUMN', @level2name = N'retr_mthd_impl_cd';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The algorithm name', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_retr_mthd_impl_def', @level2type = N'COLUMN', @level2name = N'alg_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The update version', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_retr_mthd_impl_def', @level2type = N'COLUMN', @level2name = N'u_version';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Insert date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_retr_mthd_impl_def', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Last update date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_retr_mthd_impl_def', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User who created this record', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_retr_mthd_impl_def', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User who performed the last update to the entry', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_retr_mthd_impl_def', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

