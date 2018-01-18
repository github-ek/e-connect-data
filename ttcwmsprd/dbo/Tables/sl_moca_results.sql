CREATE TABLE [dbo].[sl_moca_results] (
    [sl_moca_results_seq] NUMERIC (12)   NOT NULL,
    [subscriber_id]       NVARCHAR (60)  NULL,
    [data]                NVARCHAR (MAX) NULL,
    [data_len]            NUMERIC (8)    NULL,
    [stat]                NUMERIC (12)   NULL,
    [msg]                 NVARCHAR (MAX) NULL,
    CONSTRAINT [sl_moca_results_pk] PRIMARY KEY CLUSTERED ([sl_moca_results_seq] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table contains MOCA results for asynchrounous MOCA command (not currently used).', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_moca_results';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The MOCA results sequence', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_moca_results', @level2type = N'COLUMN', @level2name = N'sl_moca_results_seq';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The MOCA result subscriber Id', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_moca_results', @level2type = N'COLUMN', @level2name = N'subscriber_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Data', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_moca_results', @level2type = N'COLUMN', @level2name = N'data';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Length of Data', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_moca_results', @level2type = N'COLUMN', @level2name = N'data_len';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The return status', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_moca_results', @level2type = N'COLUMN', @level2name = N'stat';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The status message', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_moca_results', @level2type = N'COLUMN', @level2name = N'msg';

