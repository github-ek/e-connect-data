CREATE TABLE [dbo].[sl_eo_col] (
    [eo_id]                NVARCHAR (30)  NOT NULL,
    [eo_ver]               NVARCHAR (15)  NOT NULL,
    [eo_seg_id]            NVARCHAR (30)  NOT NULL,
    [eo_fld_id]            NVARCHAR (30)  NOT NULL,
    [sql_component_seq]    NUMERIC (6)    NOT NULL,
    [retr_mthd_id]         NVARCHAR (30)  NOT NULL,
    [retr_mthd_impl_genid] NVARCHAR (100) NOT NULL,
    [sql_crsr_col]         NVARCHAR (MAX) NOT NULL,
    [grp_by_flg]           NVARCHAR (1)   NOT NULL,
    [u_version]            NUMERIC (5)    NULL,
    [ins_dt]               DATETIME       NULL,
    [last_upd_dt]          DATETIME       NULL,
    [ins_user_id]          NVARCHAR (40)  NULL,
    [last_upd_user_id]     NVARCHAR (40)  NULL,
    CONSTRAINT [sl_eo_col_pk] PRIMARY KEY CLUSTERED ([eo_id] ASC, [eo_ver] ASC, [eo_seg_id] ASC, [eo_fld_id] ASC, [sql_component_seq] ASC, [retr_mthd_id] ASC, [retr_mthd_impl_genid] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [sl_eo_col_fk_eofld] FOREIGN KEY ([eo_id], [eo_ver], [eo_seg_id], [eo_fld_id]) REFERENCES [dbo].[sl_eo_fld] ([eo_id], [eo_ver], [eo_seg_id], [eo_fld_id]) ON DELETE CASCADE,
    CONSTRAINT [sl_eocolfksqlcrsr] FOREIGN KEY ([retr_mthd_id], [retr_mthd_impl_genid], [sql_component_seq]) REFERENCES [dbo].[sl_sql_crsr_component] ([retr_mthd_id], [retr_mthd_impl_genid], [sql_component_seq]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [sl_eocolfksqlcrsr]
    ON [dbo].[sl_eo_col]([retr_mthd_impl_genid] ASC, [sql_component_seq] ASC, [retr_mthd_id] ASC) WITH (FILLFACTOR = 90);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table defines event output segment column.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_eo_col';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) Event output name', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_eo_col', @level2type = N'COLUMN', @level2name = N'eo_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) Event output version', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_eo_col', @level2type = N'COLUMN', @level2name = N'eo_ver';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) EO segment name', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_eo_col', @level2type = N'COLUMN', @level2name = N'eo_seg_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) EO segment field name', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_eo_col', @level2type = N'COLUMN', @level2name = N'eo_fld_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) SQL component sequence', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_eo_col', @level2type = N'COLUMN', @level2name = N'sql_component_seq';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) Retreive method name', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_eo_col', @level2type = N'COLUMN', @level2name = N'retr_mthd_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) Retreive method implementation name', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_eo_col', @level2type = N'COLUMN', @level2name = N'retr_mthd_impl_genid';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'SQL column name', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_eo_col', @level2type = N'COLUMN', @level2name = N'sql_crsr_col';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Flag for group', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_eo_col', @level2type = N'COLUMN', @level2name = N'grp_by_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The version number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_eo_col', @level2type = N'COLUMN', @level2name = N'u_version';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Insert date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_eo_col', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Last update date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_eo_col', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User who created this record', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_eo_col', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User who performed the last update to the entry', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_eo_col', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

