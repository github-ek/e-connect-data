CREATE TABLE [dbo].[pol_grp] (
    [pol_are_id]   NVARCHAR (50) NOT NULL,
    [pol_chld_id]  NVARCHAR (50) NOT NULL,
    [pol_chld_typ] NVARCHAR (1)  NOT NULL,
    [grp_nam]      NVARCHAR (40) NULL,
    CONSTRAINT [pol_grp_pk] PRIMARY KEY CLUSTERED ([pol_are_id] ASC, [pol_chld_id] ASC, [pol_chld_typ] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table provides a means of putting policies into funciontal policy areas.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pol_grp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Part of the unique key.  Name of the most detailed policy area.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pol_grp', @level2type = N'COLUMN', @level2name = N'pol_are_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Part of the unique key. Used to distinguish if its a policy area or policy information record.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pol_grp', @level2type = N'COLUMN', @level2name = N'pol_chld_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Specifies which product group was responsible for loading this data row.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pol_grp', @level2type = N'COLUMN', @level2name = N'grp_nam';

