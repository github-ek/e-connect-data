CREATE TABLE [dbo].[search_cfg] (
    [search_cfg_id] NVARCHAR (20)   NOT NULL,
    [cust_lvl]      INT             NOT NULL,
    [search_cmd]    NVARCHAR (2000) NOT NULL,
    [grp_nam]       NVARCHAR (40)   NULL,
    CONSTRAINT [search_cfg_pk] PRIMARY KEY CLUSTERED ([search_cfg_id] ASC, [cust_lvl] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table holds the search configurations.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'search_cfg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The unique search configuration id.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'search_cfg', @level2type = N'COLUMN', @level2name = N'search_cfg_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The customization level', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'search_cfg', @level2type = N'COLUMN', @level2name = N'cust_lvl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The command executed through the search configuration.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'search_cfg', @level2type = N'COLUMN', @level2name = N'search_cmd';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Group Name for the Data.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'search_cfg', @level2type = N'COLUMN', @level2name = N'grp_nam';

