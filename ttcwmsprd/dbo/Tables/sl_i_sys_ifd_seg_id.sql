CREATE TABLE [dbo].[sl_i_sys_ifd_seg_id] (
    [ifd_id]           NVARCHAR (30)  NOT NULL,
    [ifd_ver]          NVARCHAR (15)  NOT NULL,
    [sys_id]           NVARCHAR (30)  NOT NULL,
    [ifd_seg_id]       NVARCHAR (30)  NOT NULL,
    [ifd_fld_id]       NVARCHAR (30)  NOT NULL,
    [fld_val]          NVARCHAR (MAX) NULL,
    [u_version]        NUMERIC (5)    NULL,
    [ins_dt]           DATETIME       NULL,
    [last_upd_dt]      DATETIME       NULL,
    [ins_user_id]      NVARCHAR (40)  NULL,
    [last_upd_user_id] NVARCHAR (40)  NULL,
    CONSTRAINT [sl_isysifdsegidpk] PRIMARY KEY CLUSTERED ([ifd_id] ASC, [ifd_ver] ASC, [sys_id] ASC, [ifd_seg_id] ASC, [ifd_fld_id] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [sl_fdsegidfkifdfld] FOREIGN KEY ([ifd_id], [ifd_ver], [ifd_seg_id], [ifd_fld_id]) REFERENCES [dbo].[sl_ifd_fld] ([ifd_id], [ifd_ver], [ifd_seg_id], [ifd_fld_id]),
    CONSTRAINT [sl_ysifdsegidfksid] FOREIGN KEY ([sys_id], [ifd_id], [ifd_ver]) REFERENCES [dbo].[sl_i_sys_ifd_id] ([sys_id], [ifd_id], [ifd_ver]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [sl_fdsegidfkifdfld]
    ON [dbo].[sl_i_sys_ifd_seg_id]([ifd_id] ASC, [ifd_ver] ASC, [ifd_seg_id] ASC, [ifd_fld_id] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [sl_ysifdsegidfksid]
    ON [dbo].[sl_i_sys_ifd_seg_id]([sys_id] ASC, [ifd_id] ASC, [ifd_ver] ASC) WITH (FILLFACTOR = 90);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table defines inbound IFD segment field identications for system.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_i_sys_ifd_seg_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The IFD name', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_i_sys_ifd_seg_id', @level2type = N'COLUMN', @level2name = N'ifd_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The IFD version', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_i_sys_ifd_seg_id', @level2type = N'COLUMN', @level2name = N'ifd_ver';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The system name', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_i_sys_ifd_seg_id', @level2type = N'COLUMN', @level2name = N'sys_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The IFD segment name', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_i_sys_ifd_seg_id', @level2type = N'COLUMN', @level2name = N'ifd_seg_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The IFD field name', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_i_sys_ifd_seg_id', @level2type = N'COLUMN', @level2name = N'ifd_fld_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The field value', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_i_sys_ifd_seg_id', @level2type = N'COLUMN', @level2name = N'fld_val';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The version number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_i_sys_ifd_seg_id', @level2type = N'COLUMN', @level2name = N'u_version';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Insert date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_i_sys_ifd_seg_id', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Last update date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_i_sys_ifd_seg_id', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User who created this record', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_i_sys_ifd_seg_id', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User who performed the last update to the entry', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_i_sys_ifd_seg_id', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

