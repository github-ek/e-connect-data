CREATE TABLE [dbo].[date_range_def] (
    [range_nam]     NVARCHAR (40)   NOT NULL,
    [locale_id]     NVARCHAR (20)   NOT NULL,
    [cust_lvl]      INT             NOT NULL,
    [category_id]   NVARCHAR (40)   NULL,
    [range_formula] NVARCHAR (4000) NOT NULL,
    [cmd_flg]       INT             NULL,
    [description]   NVARCHAR (250)  NOT NULL,
    [grp_nam]       NVARCHAR (40)   NULL,
    CONSTRAINT [date_range_def_pk] PRIMARY KEY CLUSTERED ([range_nam] ASC, [locale_id] ASC, [cust_lvl] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [dtrngdef_cmdflgck] CHECK ([cmd_flg]=(0) OR [cmd_flg]=(1))
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table contains definitions of preset date ranges for the date range control.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'date_range_def';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Part of the unique identifier.  Indicates the range identifier name.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'date_range_def', @level2type = N'COLUMN', @level2name = N'range_nam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Part of the unique indentifier.  This allows different descriptions and formats for different locales', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'date_range_def', @level2type = N'COLUMN', @level2name = N'locale_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Part of the unique identifier.  The customization level, allowing for definitions to be customized.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'date_range_def', @level2type = N'COLUMN', @level2name = N'cust_lvl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Optional. A category to group the preset into. If no category is specified the item goes into the top level menu.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'date_range_def', @level2type = N'COLUMN', @level2name = N'category_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Required. The server command or range forumla used to calulcate the dates for the range.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'date_range_def', @level2type = N'COLUMN', @level2name = N'range_formula';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Required. A flag indicating wither the specified range formula is a server command to be executed.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'date_range_def', @level2type = N'COLUMN', @level2name = N'cmd_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The localized description for this preset.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'date_range_def', @level2type = N'COLUMN', @level2name = N'description';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Specifies which product group was responsible for loading this data row.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'date_range_def', @level2type = N'COLUMN', @level2name = N'grp_nam';

