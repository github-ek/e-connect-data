CREATE TABLE [dbo].[les_usr_fav] (
    [usr_id]  NVARCHAR (40) NOT NULL,
    [opt_nam] NVARCHAR (50) NOT NULL,
    [mnu_seq] INT           NOT NULL,
    [grp_nam] NVARCHAR (40) NULL,
    CONSTRAINT [les_usr_fav_pk] PRIMARY KEY CLUSTERED ([usr_id] ASC, [opt_nam] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table lists favorite menu items for each user.  These items are seen on the favorites tab and menu in the framework.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_usr_fav';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Part of the unique identifier.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_usr_fav', @level2type = N'COLUMN', @level2name = N'usr_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Specifies an option that will appear in the favorites.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_usr_fav', @level2type = N'COLUMN', @level2name = N'opt_nam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Sort order of this option in the favorites menu.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_usr_fav', @level2type = N'COLUMN', @level2name = N'mnu_seq';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Specifies which product group was responsible for loading this data row.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_usr_fav', @level2type = N'COLUMN', @level2name = N'grp_nam';

