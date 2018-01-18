CREATE TABLE [dbo].[batch_sts_dtl] (
    [batch_id]      NVARCHAR (12)   NOT NULL,
    [seqnum]        INT             NOT NULL,
    [batch_cmd_sts] INT             NOT NULL,
    [batch_sts_txt] NVARCHAR (2000) NULL,
    [batch_cmd_txt] NVARCHAR (4000) NULL,
    [end_dt]        DATETIME        NOT NULL,
    CONSTRAINT [batch_sts_dtl_pk] PRIMARY KEY CLUSTERED ([batch_id] ASC, [seqnum] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Holds the return status information for the batch job commands that are run.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'batch_sts_dtl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Job ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'batch_sts_dtl', @level2type = N'COLUMN', @level2name = N'batch_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Sequence Number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'batch_sts_dtl', @level2type = N'COLUMN', @level2name = N'seqnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Moca Status', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'batch_sts_dtl', @level2type = N'COLUMN', @level2name = N'batch_cmd_sts';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Moca Status Text', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'batch_sts_dtl', @level2type = N'COLUMN', @level2name = N'batch_sts_txt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The command that was run.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'batch_sts_dtl', @level2type = N'COLUMN', @level2name = N'batch_cmd_txt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The time the command finished.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'batch_sts_dtl', @level2type = N'COLUMN', @level2name = N'end_dt';

