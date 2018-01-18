CREATE TABLE [dbo].[sl_db_constraint] (
    [db_constraint_id] NVARCHAR (30) NOT NULL,
    [parent_table_id]  NVARCHAR (30) NOT NULL,
    [child_table_id]   NVARCHAR (30) NOT NULL,
    [ri_action]        NVARCHAR (30) NOT NULL,
    CONSTRAINT [sl_dbconstraintpk] PRIMARY KEY CLUSTERED ([db_constraint_id] ASC) WITH (FILLFACTOR = 90)
);


GO
CREATE NONCLUSTERED INDEX [sl_straintskpartab]
    ON [dbo].[sl_db_constraint]([parent_table_id] ASC) WITH (FILLFACTOR = 90);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table defines a set of constraints between tables that should exist in the database.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_db_constraint';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The constraint identifier', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_db_constraint', @level2type = N'COLUMN', @level2name = N'db_constraint_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The parent table name', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_db_constraint', @level2type = N'COLUMN', @level2name = N'parent_table_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The child table name', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_db_constraint', @level2type = N'COLUMN', @level2name = N'child_table_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The constraint action: cascade, restrict', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_db_constraint', @level2type = N'COLUMN', @level2name = N'ri_action';

