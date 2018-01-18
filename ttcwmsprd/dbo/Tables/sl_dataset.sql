CREATE TABLE [dbo].[sl_dataset] (
    [ds_name] NVARCHAR (40)  NOT NULL,
    [ds_desc] NVARCHAR (80)  NOT NULL,
    [ds_dir]  NVARCHAR (512) NOT NULL,
    [ds_seq]  NUMERIC (10)   NOT NULL,
    CONSTRAINT [sl_dataset_pk] PRIMARY KEY CLUSTERED ([ds_name] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table defines which data sets are loading in database.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_dataset';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The dataset name', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_dataset', @level2type = N'COLUMN', @level2name = N'ds_name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The description of dataset', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_dataset', @level2type = N'COLUMN', @level2name = N'ds_desc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The directory of dataset', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_dataset', @level2type = N'COLUMN', @level2name = N'ds_dir';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The sequence of dataset', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_dataset', @level2type = N'COLUMN', @level2name = N'ds_seq';

