CREATE TABLE [dbo].[les_usr_nav_bar] (
    [usr_id]      NVARCHAR (40) NOT NULL,
    [nav_bar_id]  NVARCHAR (20) NOT NULL,
    [nav_bar_seq] INT           NOT NULL,
    [grp_nam]     NVARCHAR (40) NULL,
    CONSTRAINT [les_usr_nav_bar_pk] PRIMARY KEY CLUSTERED ([usr_id] ASC, [nav_bar_id] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table indicates which navigation bar tabs are displayed for each user. If no entries exist for a user, they will see all tabs defined in the les_nav_bar_tab table that have the all_usrs_flg set.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_usr_nav_bar';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This is a specific user ID.  If a user does not have any entries in this table, they will have all tabs that have the all_usrs_flg set in the les_nav_bar_tab table.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_usr_nav_bar', @level2type = N'COLUMN', @level2name = N'usr_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This is the identifier of the les_usr_nav_bar entry.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_usr_nav_bar', @level2type = N'COLUMN', @level2name = N'nav_bar_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Sort sequence for the tabs, left to right', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_usr_nav_bar', @level2type = N'COLUMN', @level2name = N'nav_bar_seq';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Specifies which product group was responsible for loading this data row.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_usr_nav_bar', @level2type = N'COLUMN', @level2name = N'grp_nam';

