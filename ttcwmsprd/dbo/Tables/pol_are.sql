CREATE TABLE [dbo].[pol_are] (
    [pol_are_id] NVARCHAR (50) NOT NULL,
    [grp_nam]    NVARCHAR (40) NULL,
    CONSTRAINT [pol_are_pk] PRIMARY KEY CLUSTERED ([pol_are_id] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table provides a means of storing information about ares of policies.  ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pol_are';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Part of the unique key.  Name of the most detailed policy area.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pol_are', @level2type = N'COLUMN', @level2name = N'pol_are_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Specifies which product group was responsible for loading this data row.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pol_are', @level2type = N'COLUMN', @level2name = N'grp_nam';

