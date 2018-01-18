CREATE TABLE [dbo].[sl_eo_fld] (
    [eo_id]            NVARCHAR (30)  NOT NULL,
    [eo_ver]           NVARCHAR (15)  NOT NULL,
    [eo_seg_id]        NVARCHAR (30)  NOT NULL,
    [eo_fld_id]        NVARCHAR (30)  NOT NULL,
    [eo_fld_descr]     NVARCHAR (250) NULL,
    [data_typ_cd]      NVARCHAR (5)   NOT NULL,
    [eo_fld_ordr]      NUMERIC (5)    NOT NULL,
    [eo_fld_sql_ordr]  NUMERIC (5)    NULL,
    [eo_fld_len]       NUMERIC (8)    NULL,
    [u_version]        NUMERIC (5)    NULL,
    [ins_dt]           DATETIME       NULL,
    [last_upd_dt]      DATETIME       NULL,
    [ins_user_id]      NVARCHAR (40)  NULL,
    [last_upd_user_id] NVARCHAR (40)  NULL,
    [eo_fld_max_chars] NUMERIC (8)    NULL,
    CONSTRAINT [sl_eo_fld_pk] PRIMARY KEY CLUSTERED ([eo_id] ASC, [eo_ver] ASC, [eo_seg_id] ASC, [eo_fld_id] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [sl_eo_fld_fk_eoseg] FOREIGN KEY ([eo_id], [eo_ver], [eo_seg_id]) REFERENCES [dbo].[sl_eo_seg] ([eo_id], [eo_ver], [eo_seg_id]) ON DELETE CASCADE
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table defines event output segment fields.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_eo_fld';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) Event output name', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_eo_fld', @level2type = N'COLUMN', @level2name = N'eo_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) Event output version', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_eo_fld', @level2type = N'COLUMN', @level2name = N'eo_ver';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) EO segment name', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_eo_fld', @level2type = N'COLUMN', @level2name = N'eo_seg_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'EO segment field name', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_eo_fld', @level2type = N'COLUMN', @level2name = N'eo_fld_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The description of eo segment field', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_eo_fld', @level2type = N'COLUMN', @level2name = N'eo_fld_descr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The data type of eo segment field: C = Character, D = Date/Time, N = Number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_eo_fld', @level2type = N'COLUMN', @level2name = N'data_typ_cd';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The order of eo segment field', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_eo_fld', @level2type = N'COLUMN', @level2name = N'eo_fld_ordr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The SQL order of eo segment field', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_eo_fld', @level2type = N'COLUMN', @level2name = N'eo_fld_sql_ordr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The length of eo segment field', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_eo_fld', @level2type = N'COLUMN', @level2name = N'eo_fld_len';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The version number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_eo_fld', @level2type = N'COLUMN', @level2name = N'u_version';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Insert date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_eo_fld', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Last update date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_eo_fld', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User who created this record', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_eo_fld', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User who performed the last update to the entry', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_eo_fld', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

