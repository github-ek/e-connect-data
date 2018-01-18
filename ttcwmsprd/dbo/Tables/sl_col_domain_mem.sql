CREATE TABLE [dbo].[sl_col_domain_mem] (
    [db_col_id]        NVARCHAR (30) NOT NULL,
    [col_domain_id]    NVARCHAR (30) NULL,
    [u_version]        NUMERIC (5)   NULL,
    [ins_dt]           DATETIME      NULL,
    [last_upd_dt]      DATETIME      NULL,
    [ins_user_id]      NVARCHAR (40) NULL,
    [last_upd_user_id] NVARCHAR (40) NULL,
    CONSTRAINT [sl_coldommempk] PRIMARY KEY CLUSTERED ([db_col_id] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [sl_coldommemfkcdmn] FOREIGN KEY ([col_domain_id]) REFERENCES [dbo].[sl_col_domain] ([col_domain_id]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [sl_coldommemfkcdmn]
    ON [dbo].[sl_col_domain_mem]([col_domain_id] ASC) WITH (FILLFACTOR = 90);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table defines the each database column''s membership to a column domain.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_col_domain_mem';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The database column identifier', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_col_domain_mem', @level2type = N'COLUMN', @level2name = N'db_col_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The column domain identifier', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_col_domain_mem', @level2type = N'COLUMN', @level2name = N'col_domain_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The version number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_col_domain_mem', @level2type = N'COLUMN', @level2name = N'u_version';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Insert date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_col_domain_mem', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Last update date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_col_domain_mem', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User who created this record', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_col_domain_mem', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User who performed the last update to the entry', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_col_domain_mem', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

