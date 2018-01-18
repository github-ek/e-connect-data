CREATE TABLE [dbo].[batch_vars] (
    [batch_id] NVARCHAR (12)   NOT NULL,
    [seqnum]   INT             NOT NULL,
    [colnam]   NVARCHAR (100)  NOT NULL,
    [colval]   NVARCHAR (2000) NULL,
    CONSTRAINT [batch_vars_pk] PRIMARY KEY CLUSTERED ([batch_id] ASC, [seqnum] ASC, [colnam] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The variable table which holds the optional comma-delimited variables.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'batch_vars';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Job ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'batch_vars', @level2type = N'COLUMN', @level2name = N'batch_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Sequence of the variable.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'batch_vars', @level2type = N'COLUMN', @level2name = N'seqnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Name of the variable.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'batch_vars', @level2type = N'COLUMN', @level2name = N'colnam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Column value', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'batch_vars', @level2type = N'COLUMN', @level2name = N'colval';

