CREATE TABLE [dbo].[les_layout] (
    [layout_id]     NVARCHAR (60) NOT NULL,
    [cust_lvl]      INT           NOT NULL,
    [num_cols]      NUMERIC (1)   NULL,
    [navigation]    NUMERIC (1)   NULL,
    [border_style]  INT           NULL,
    [column_offset] INT           NULL,
    [row_offset]    INT           NULL,
    [grp_nam]       NVARCHAR (40) NULL,
    [moddte]        DATETIME      NULL,
    [mod_usr_id]    NVARCHAR (40) NULL,
    CONSTRAINT [les_layout_pk] PRIMARY KEY CLUSTERED ([layout_id] ASC, [cust_lvl] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table allows you to define MCS layout control attributes to be used at run time.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_layout';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The identifer for the layout.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_layout', @level2type = N'COLUMN', @level2name = N'layout_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Allows different customization levels for customer and project teams.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_layout', @level2type = N'COLUMN', @level2name = N'cust_lvl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The number of columns to use in the layout.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_layout', @level2type = N'COLUMN', @level2name = N'num_cols';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The navigation mode to use.  0 = Horizontal, 1 = Vertical.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_layout', @level2type = N'COLUMN', @level2name = N'navigation';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The type of borer to use for the layout.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_layout', @level2type = N'COLUMN', @level2name = N'border_style';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The offset between columns in the layout.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_layout', @level2type = N'COLUMN', @level2name = N'column_offset';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The offset between rows in the layout.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_layout', @level2type = N'COLUMN', @level2name = N'row_offset';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Specifies which product group was responsible for loading this data row.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_layout', @level2type = N'COLUMN', @level2name = N'grp_nam';

