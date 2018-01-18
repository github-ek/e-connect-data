CREATE TABLE [dbo].[dash_tab_assign] (
    [ath_id]      NVARCHAR (40)  NOT NULL,
    [ath_typ]     NVARCHAR (1)   NOT NULL,
    [tab_id]      NVARCHAR (50)  NOT NULL,
    [srtseq]      INT            NOT NULL,
    [description] NVARCHAR (250) NULL,
    [grp_nam]     NVARCHAR (40)  NULL,
    CONSTRAINT [dash_tab_assign_pk] PRIMARY KEY CLUSTERED ([ath_id] ASC, [ath_typ] ASC, [tab_id] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Determines which roles and/or users are assigned to view a given tab', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dash_tab_assign';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The authorization ID that owns this tab. Currently this is just a user id', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dash_tab_assign', @level2type = N'COLUMN', @level2name = N'ath_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The authorization type that owns this config', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dash_tab_assign', @level2type = N'COLUMN', @level2name = N'ath_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The ID of the tab', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dash_tab_assign', @level2type = N'COLUMN', @level2name = N'tab_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The sequence of the tab', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dash_tab_assign', @level2type = N'COLUMN', @level2name = N'srtseq';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The description or title of the config, this overrides any sys_dsc_mst entries', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dash_tab_assign', @level2type = N'COLUMN', @level2name = N'description';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The name of the group for distributed data', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dash_tab_assign', @level2type = N'COLUMN', @level2name = N'grp_nam';

