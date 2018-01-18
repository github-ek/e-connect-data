CREATE TABLE [dbo].[sl_i_sys_ifd_nonrec_key] (
    [ifd_id]           NVARCHAR (30) NOT NULL,
    [ifd_ver]          NVARCHAR (15) NOT NULL,
    [sys_id]           NVARCHAR (30) NOT NULL,
    [ifd_seg_id]       NVARCHAR (30) NOT NULL,
    [ifd_fld_id]       NVARCHAR (30) NULL,
    [u_version]        NUMERIC (5)   NULL,
    [ins_dt]           DATETIME      NULL,
    [last_upd_dt]      DATETIME      NULL,
    [ins_user_id]      NVARCHAR (40) NULL,
    [last_upd_user_id] NVARCHAR (40) NULL,
    CONSTRAINT [sl_isysifdnonrecpk] PRIMARY KEY CLUSTERED ([ifd_id] ASC, [ifd_ver] ASC, [sys_id] ASC, [ifd_seg_id] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [sl_sifdnonrecfkifl] FOREIGN KEY ([ifd_id], [ifd_ver], [ifd_seg_id], [ifd_fld_id]) REFERENCES [dbo].[sl_ifd_fld] ([ifd_id], [ifd_ver], [ifd_seg_id], [ifd_fld_id]),
    CONSTRAINT [sl_sifdnonrecfkise] FOREIGN KEY ([ifd_id], [ifd_ver], [ifd_seg_id]) REFERENCES [dbo].[sl_ifd_seg] ([ifd_id], [ifd_ver], [ifd_seg_id]),
    CONSTRAINT [sl_sifdnonrecfksid] FOREIGN KEY ([sys_id], [ifd_id], [ifd_ver]) REFERENCES [dbo].[sl_i_sys_ifd_id] ([sys_id], [ifd_id], [ifd_ver]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [sl_sifdnonrecfkifl]
    ON [dbo].[sl_i_sys_ifd_nonrec_key]([ifd_id] ASC, [ifd_ver] ASC, [ifd_seg_id] ASC, [ifd_fld_id] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [sl_sifdnonrecfksid]
    ON [dbo].[sl_i_sys_ifd_nonrec_key]([sys_id] ASC, [ifd_id] ASC, [ifd_ver] ASC) WITH (FILLFACTOR = 90);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table defines inbound IFD Non-recursive Key for system.(not currently used)', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_i_sys_ifd_nonrec_key';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The IFD name', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_i_sys_ifd_nonrec_key', @level2type = N'COLUMN', @level2name = N'ifd_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The IFD version', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_i_sys_ifd_nonrec_key', @level2type = N'COLUMN', @level2name = N'ifd_ver';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The system name', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_i_sys_ifd_nonrec_key', @level2type = N'COLUMN', @level2name = N'sys_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The IFD segment name', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_i_sys_ifd_nonrec_key', @level2type = N'COLUMN', @level2name = N'ifd_seg_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The IFD field name', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_i_sys_ifd_nonrec_key', @level2type = N'COLUMN', @level2name = N'ifd_fld_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The version number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_i_sys_ifd_nonrec_key', @level2type = N'COLUMN', @level2name = N'u_version';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Insert date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_i_sys_ifd_nonrec_key', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Last update date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_i_sys_ifd_nonrec_key', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User who created this record', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_i_sys_ifd_nonrec_key', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User who performed the last update to the entry', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_i_sys_ifd_nonrec_key', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

