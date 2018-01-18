CREATE TABLE [dbo].[chart_prop] (
    [chart_id]       NVARCHAR (40)   NOT NULL,
    [cust_lvl]       INT             NOT NULL,
    [var_nam]        NVARCHAR (40)   NOT NULL,
    [chart_prop_val] NVARCHAR (2000) NULL,
    [grp_nam]        NVARCHAR (40)   NULL,
    CONSTRAINT [chart_prop_pk] PRIMARY KEY CLUSTERED ([chart_id] ASC, [cust_lvl] ASC, [var_nam] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table defines the configuration details of a chart that may vary by chart type', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'chart_prop';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A unique identifier for the chart', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'chart_prop', @level2type = N'COLUMN', @level2name = N'chart_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Allows different customization levels for customer and project teams.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'chart_prop', @level2type = N'COLUMN', @level2name = N'cust_lvl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The variable name of the property.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'chart_prop', @level2type = N'COLUMN', @level2name = N'var_nam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The value of the property for this chart instance.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'chart_prop', @level2type = N'COLUMN', @level2name = N'chart_prop_val';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Specifies which product group was responsible for loading this data row.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'chart_prop', @level2type = N'COLUMN', @level2name = N'grp_nam';

