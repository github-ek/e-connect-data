﻿CREATE TABLE [dbo].[sl_ifd_seg_sql_group_by] (
    [ifd_id]           NVARCHAR (30)  NOT NULL,
    [ifd_ver]          NVARCHAR (15)  NOT NULL,
    [ifd_seg_id]       NVARCHAR (30)  NOT NULL,
    [sql_group_by]     NVARCHAR (MAX) NULL,
    [sql_group_by_len] NUMERIC (8)    NULL,
    [ins_dt]           DATETIME       NULL,
    [last_upd_dt]      DATETIME       NULL,
    [ins_user_id]      NVARCHAR (40)  NULL,
    [last_upd_user_id] NVARCHAR (40)  NULL,
    CONSTRAINT [sl_ifdsegsqlgrppk] PRIMARY KEY CLUSTERED ([ifd_id] ASC, [ifd_ver] ASC, [ifd_seg_id] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [sl_dsegsqlgrpfkise] FOREIGN KEY ([ifd_id], [ifd_ver], [ifd_seg_id]) REFERENCES [dbo].[sl_ifd_seg] ([ifd_id], [ifd_ver], [ifd_seg_id]) ON DELETE CASCADE
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table defines a SQL group by clause for IFD segment.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_seg_sql_group_by';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The IFD name', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_seg_sql_group_by', @level2type = N'COLUMN', @level2name = N'ifd_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The IFD version', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_seg_sql_group_by', @level2type = N'COLUMN', @level2name = N'ifd_ver';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The IFD segment name', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_seg_sql_group_by', @level2type = N'COLUMN', @level2name = N'ifd_seg_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The fields that should be placed in group by clause', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_seg_sql_group_by', @level2type = N'COLUMN', @level2name = N'sql_group_by';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The length of the fields in group by clause', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_seg_sql_group_by', @level2type = N'COLUMN', @level2name = N'sql_group_by_len';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Insert date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_seg_sql_group_by', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Last update date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_seg_sql_group_by', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User who created this record', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_seg_sql_group_by', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User who performed the last update to the entry', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_seg_sql_group_by', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

