CREATE TABLE [dbo].[schagt_stats] (
    [taskid] NVARCHAR (20) NOT NULL,
    [sucdte] DATETIME      NOT NULL,
    CONSTRAINT [schagt_stats_pk] PRIMARY KEY CLUSTERED ([taskid] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table keeps track of recurring scheduled processes and/or components stats', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'schagt_stats';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Task ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'schagt_stats', @level2type = N'COLUMN', @level2name = N'taskid';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Last successfully executed date (ignores failures based on agent entry) ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'schagt_stats', @level2type = N'COLUMN', @level2name = N'sucdte';

