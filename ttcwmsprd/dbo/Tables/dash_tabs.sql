CREATE TABLE [dbo].[dash_tabs] (
    [tab_id]       NVARCHAR (50) NOT NULL,
    [template_flg] INT           NOT NULL,
    [grp_nam]      NVARCHAR (40) NULL,
    CONSTRAINT [dash_tabs_pk] PRIMARY KEY CLUSTERED ([tab_id] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Holds the base information about all the tabs available for dashboards to use', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dash_tabs';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The ID of the tab. This is a sequence number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dash_tabs', @level2type = N'COLUMN', @level2name = N'tab_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicates if this configuration is a template', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dash_tabs', @level2type = N'COLUMN', @level2name = N'template_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The name of the group for distributed data', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dash_tabs', @level2type = N'COLUMN', @level2name = N'grp_nam';

