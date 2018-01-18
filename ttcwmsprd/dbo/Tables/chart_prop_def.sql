CREATE TABLE [dbo].[chart_prop_def] (
    [graph_type]  INT           NOT NULL,
    [var_nam]     NVARCHAR (40) NOT NULL,
    [posn]        INT           DEFAULT ((-1)) NOT NULL,
    [category_id] NVARCHAR (40) NOT NULL,
    [chart_usage] NVARCHAR (1)  NOT NULL,
    [grp_nam]     NVARCHAR (40) NULL,
    CONSTRAINT [chart_prop_def_pk] PRIMARY KEY CLUSTERED ([graph_type] ASC, [var_nam] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table defines what properties are available in what framework for which chart type', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'chart_prop_def';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The type of graph being displayed', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'chart_prop_def', @level2type = N'COLUMN', @level2name = N'graph_type';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The variable name of the property', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'chart_prop_def', @level2type = N'COLUMN', @level2name = N'var_nam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The position of the control within the category', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'chart_prop_def', @level2type = N'COLUMN', @level2name = N'posn';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The id of the category this property belongs to, this should also have a dscmst entry', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'chart_prop_def', @level2type = N'COLUMN', @level2name = N'category_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicates which frameworks the property is available to: F = GUI Framework, W = Web and B = Both (uses DDA Usage)', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'chart_prop_def', @level2type = N'COLUMN', @level2name = N'chart_usage';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Specifies which product group was responsible for loading this data row.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'chart_prop_def', @level2type = N'COLUMN', @level2name = N'grp_nam';

