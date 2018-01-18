CREATE TABLE [dbo].[sl_db_constraint_cols] (
    [db_constraint_id] NVARCHAR (30) NOT NULL,
    [parent_col_id]    NVARCHAR (30) NOT NULL,
    [child_col_id]     NVARCHAR (30) NOT NULL,
    CONSTRAINT [sl_onstraintcolspk] PRIMARY KEY CLUSTERED ([db_constraint_id] ASC, [parent_col_id] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [sl_raintcolsfkcons] FOREIGN KEY ([db_constraint_id]) REFERENCES [dbo].[sl_db_constraint] ([db_constraint_id]) ON DELETE CASCADE
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table defines the constraint columns that should exist in the database.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_db_constraint_cols';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The constraint identifier', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_db_constraint_cols', @level2type = N'COLUMN', @level2name = N'db_constraint_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The parent column name', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_db_constraint_cols', @level2type = N'COLUMN', @level2name = N'parent_col_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The child column name', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_db_constraint_cols', @level2type = N'COLUMN', @level2name = N'child_col_id';

