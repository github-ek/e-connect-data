CREATE TABLE [dbo].[les_mnu_itm] (
    [mnu_grp] NVARCHAR (20) NOT NULL,
    [mnu_itm] NVARCHAR (50) NOT NULL,
    [mnu_seq] INT           NOT NULL,
    [opt_nam] NVARCHAR (50) NOT NULL,
    [grp_nam] NVARCHAR (40) NULL,
    CONSTRAINT [les_mnu_itm_pk] PRIMARY KEY CLUSTERED ([mnu_grp] ASC, [mnu_itm] ASC) WITH (FILLFACTOR = 90)
);


GO
CREATE NONCLUSTERED INDEX [les_mnu_itm_optnam]
    ON [dbo].[les_mnu_itm]([opt_nam] ASC) WITH (FILLFACTOR = 90);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table contains configuration data for all menu items in the MCS Framework.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_mnu_itm';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Specifies which menu group is this item''''s parent.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_mnu_itm', @level2type = N'COLUMN', @level2name = N'mnu_grp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The unique identifier.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_mnu_itm', @level2type = N'COLUMN', @level2name = N'mnu_itm';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'An integer value to provide specific sorting of the items.  The sorting method is by sort sequence first, then by alphabetical by description.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_mnu_itm', @level2type = N'COLUMN', @level2name = N'mnu_seq';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Identifier of the les_mnu_opt record that this item represents.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_mnu_itm', @level2type = N'COLUMN', @level2name = N'opt_nam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Specifies which product group was responsible for loading this data row.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_mnu_itm', @level2type = N'COLUMN', @level2name = N'grp_nam';

