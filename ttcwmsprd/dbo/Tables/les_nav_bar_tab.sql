CREATE TABLE [dbo].[les_nav_bar_tab] (
    [mnu_grp]      NVARCHAR (20) NOT NULL,
    [nav_bar_id]   NVARCHAR (20) NOT NULL,
    [srt_seq]      INT           NULL,
    [all_usrs_flg] INT           NOT NULL,
    [grp_nam]      NVARCHAR (40) NULL,
    CONSTRAINT [les_nav_bar_tab_pk] PRIMARY KEY CLUSTERED ([mnu_grp] ASC, [nav_bar_id] ASC) WITH (FILLFACTOR = 90)
);


GO
CREATE NONCLUSTERED INDEX [lesnavbar_navbarid]
    ON [dbo].[les_nav_bar_tab]([nav_bar_id] ASC) WITH (FILLFACTOR = 90);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table lists configured tabs and their top level menu groups for the framework navigation bar.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_nav_bar_tab';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A top level menu group for this tab.  Points to an les_mnu_grp entry.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_nav_bar_tab', @level2type = N'COLUMN', @level2name = N'mnu_grp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The unique identifier of a tab.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_nav_bar_tab', @level2type = N'COLUMN', @level2name = N'nav_bar_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The sequence that the tabs will be displayed.  If null, the tab will be displayed in alphabetical order.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_nav_bar_tab', @level2type = N'COLUMN', @level2name = N'srt_seq';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A flag that indicates this tab will be available to all users by default if the user does not have a record in the les_usr_nav_bar table.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_nav_bar_tab', @level2type = N'COLUMN', @level2name = N'all_usrs_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Specifies which product group was responsible for loading this data row.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_nav_bar_tab', @level2type = N'COLUMN', @level2name = N'grp_nam';

