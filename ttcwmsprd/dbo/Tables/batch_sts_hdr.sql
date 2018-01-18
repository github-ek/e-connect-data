CREATE TABLE [dbo].[batch_sts_hdr] (
    [batch_id]      NVARCHAR (12) NOT NULL,
    [batch_cmd_sts] INT           NOT NULL,
    [batch_cnt]     INT           NOT NULL,
    CONSTRAINT [batch_sts_hdr_pk] PRIMARY KEY CLUSTERED ([batch_id] ASC, [batch_cmd_sts] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Holds the return status information for the batch jobs that are run.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'batch_sts_hdr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Job ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'batch_sts_hdr', @level2type = N'COLUMN', @level2name = N'batch_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Moca Status', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'batch_sts_hdr', @level2type = N'COLUMN', @level2name = N'batch_cmd_sts';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The number of commands finished with this status.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'batch_sts_hdr', @level2type = N'COLUMN', @level2name = N'batch_cnt';

