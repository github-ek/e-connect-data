CREATE TABLE [dbo].[sl_col_domain] (
    [col_domain_id]    NVARCHAR (30)  NOT NULL,
    [descr]            NVARCHAR (250) NULL,
    [def_db_col_id]    NVARCHAR (30)  NOT NULL,
    [col_data_len]     NUMERIC (5)    NULL,
    [db_data_typ_cd]   NVARCHAR (5)   NULL,
    [u_version]        NUMERIC (5)    NULL,
    [ins_dt]           DATETIME       NULL,
    [last_upd_dt]      DATETIME       NULL,
    [ins_user_id]      NVARCHAR (40)  NULL,
    [last_upd_user_id] NVARCHAR (40)  NULL,
    CONSTRAINT [sl_col_domain_pk] PRIMARY KEY CLUSTERED ([col_domain_id] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table defines the column domain.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_col_domain';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The column domain identifier', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_col_domain', @level2type = N'COLUMN', @level2name = N'col_domain_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The description of column domain', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_col_domain', @level2type = N'COLUMN', @level2name = N'descr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The default database column the column domain belongs to', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_col_domain', @level2type = N'COLUMN', @level2name = N'def_db_col_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The length of column data', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_col_domain', @level2type = N'COLUMN', @level2name = N'col_data_len';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The data type of the column domain in database', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_col_domain', @level2type = N'COLUMN', @level2name = N'db_data_typ_cd';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The version number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_col_domain', @level2type = N'COLUMN', @level2name = N'u_version';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Insert date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_col_domain', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Last update date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_col_domain', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User who created this record', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_col_domain', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User who performed the last update to the entry', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_col_domain', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

