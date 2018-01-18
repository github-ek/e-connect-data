CREATE TABLE [dbo].[chart_mst] (
    [chart_id]   NVARCHAR (40)   NOT NULL,
    [cust_lvl]   INT             NOT NULL,
    [graph_type] INT             NOT NULL,
    [x_axis]     NVARCHAR (40)   NOT NULL,
    [y_series]   NVARCHAR (2000) NOT NULL,
    [title_pos]  INT             DEFAULT ((0)) NOT NULL,
    [legend_pos] INT             DEFAULT ((0)) NOT NULL,
    [grp_nam]    NVARCHAR (40)   NULL,
    CONSTRAINT [chart_mst_pk] PRIMARY KEY CLUSTERED ([chart_id] ASC, [cust_lvl] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table defines the core definition of a chart configuration', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'chart_mst';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A unique identifier for the chart', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'chart_mst', @level2type = N'COLUMN', @level2name = N'chart_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Allows different customization levels for customer and project teams.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'chart_mst', @level2type = N'COLUMN', @level2name = N'cust_lvl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The type of graph being displayed.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'chart_mst', @level2type = N'COLUMN', @level2name = N'graph_type';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The name of the column that represents the X axis of the data.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'chart_mst', @level2type = N'COLUMN', @level2name = N'x_axis';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A comma separated list of columns that represent the different series to display.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'chart_mst', @level2type = N'COLUMN', @level2name = N'y_series';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Represents the position of the title on the form: 0-None, 1-Top, 2-Bottom.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'chart_mst', @level2type = N'COLUMN', @level2name = N'title_pos';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Represents the position of the legend on the form: 0-None, 1-Top, 2-Left, 3-Bottom, 4-Right.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'chart_mst', @level2type = N'COLUMN', @level2name = N'legend_pos';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Specifies which product group was responsible for loading this data row.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'chart_mst', @level2type = N'COLUMN', @level2name = N'grp_nam';

