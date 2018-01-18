﻿CREATE TABLE [dbo].[sl_eo_seg_sql_where] (
    [eo_id]                NVARCHAR (30)  NOT NULL,
    [eo_ver]               NVARCHAR (15)  NOT NULL,
    [eo_seg_id]            NVARCHAR (30)  NOT NULL,
    [retr_mthd_id]         NVARCHAR (30)  NOT NULL,
    [retr_mthd_impl_genid] NVARCHAR (100) NOT NULL,
    [sql_where]            NVARCHAR (MAX) NULL,
    [sql_where_len]        NUMERIC (8)    NULL,
    [ins_dt]               DATETIME       NULL,
    [last_upd_dt]          DATETIME       NULL,
    [ins_user_id]          NVARCHAR (40)  NULL,
    [last_upd_user_id]     NVARCHAR (40)  NULL,
    CONSTRAINT [sl_eosegsqlwhpk] PRIMARY KEY CLUSTERED ([eo_id] ASC, [eo_ver] ASC, [eo_seg_id] ASC, [retr_mthd_id] ASC, [retr_mthd_impl_genid] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [sl_eosegsqlwhfkrmi] FOREIGN KEY ([retr_mthd_id], [retr_mthd_impl_genid]) REFERENCES [dbo].[sl_retr_mthd_impl_def] ([retr_mthd_id], [retr_mthd_impl_genid]) ON DELETE CASCADE,
    CONSTRAINT [sl_segsqlwhfkeoseg] FOREIGN KEY ([eo_id], [eo_ver], [eo_seg_id]) REFERENCES [dbo].[sl_eo_seg] ([eo_id], [eo_ver], [eo_seg_id]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [sl_eosegsqlwhfkrmi]
    ON [dbo].[sl_eo_seg_sql_where]([retr_mthd_impl_genid] ASC, [retr_mthd_id] ASC) WITH (FILLFACTOR = 90);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table defines a SQL where clause for EO segment''s retrieve method (if needed).', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_eo_seg_sql_where';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) Event output name', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_eo_seg_sql_where', @level2type = N'COLUMN', @level2name = N'eo_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) Event output version', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_eo_seg_sql_where', @level2type = N'COLUMN', @level2name = N'eo_ver';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) EO segment name', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_eo_seg_sql_where', @level2type = N'COLUMN', @level2name = N'eo_seg_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) Retrieve method name', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_eo_seg_sql_where', @level2type = N'COLUMN', @level2name = N'retr_mthd_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) Retreive method implementation name', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_eo_seg_sql_where', @level2type = N'COLUMN', @level2name = N'retr_mthd_impl_genid';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'SQL where clause', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_eo_seg_sql_where', @level2type = N'COLUMN', @level2name = N'sql_where';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The length of SQL where clause', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_eo_seg_sql_where', @level2type = N'COLUMN', @level2name = N'sql_where_len';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Insert date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_eo_seg_sql_where', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Last update date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_eo_seg_sql_where', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User who created this record', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_eo_seg_sql_where', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User who performed the last update to the entry', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_eo_seg_sql_where', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

