CREATE TABLE [dbo].[sl_ifd_def_grp] (
    [ifd_grp_id]       NVARCHAR (30)  NOT NULL,
    [ifd_grp_descr]    NVARCHAR (250) NULL,
    [ifd_grp_tag]      NVARCHAR (60)  NULL,
    [u_version]        NUMERIC (5)    NULL,
    [ins_dt]           DATETIME       NULL,
    [last_upd_dt]      DATETIME       NULL,
    [ins_user_id]      NVARCHAR (40)  NULL,
    [last_upd_user_id] NVARCHAR (40)  NULL,
    CONSTRAINT [sl_ifd_def_grp_pk] PRIMARY KEY CLUSTERED ([ifd_grp_id] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table defines an IFD group.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_def_grp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The IFD group name', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_def_grp', @level2type = N'COLUMN', @level2name = N'ifd_grp_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The IFD group description', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_def_grp', @level2type = N'COLUMN', @level2name = N'ifd_grp_descr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The IFD group tag', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_def_grp', @level2type = N'COLUMN', @level2name = N'ifd_grp_tag';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The version number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_def_grp', @level2type = N'COLUMN', @level2name = N'u_version';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Insert date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_def_grp', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Last update date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_def_grp', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User who created this record', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_def_grp', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User who performed the last update to the entry', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_def_grp', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

