CREATE TABLE [dbo].[dda_field_map] (
    [dda_id]       NVARCHAR (40) NOT NULL,
    [cust_lvl]     INT           NOT NULL,
    [var_nam]      NVARCHAR (40) NOT NULL,
    [link_var_nam] NVARCHAR (40) NOT NULL,
    [map_var_nam]  NVARCHAR (40) NOT NULL,
    [grp_nam]      NVARCHAR (40) NULL,
    CONSTRAINT [dda_field_map_pk] PRIMARY KEY CLUSTERED ([dda_id] ASC, [cust_lvl] ASC, [var_nam] ASC, [link_var_nam] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Specifies which product group was responsible for loading this data row.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dda_field_map', @level2type = N'COLUMN', @level2name = N'grp_nam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The variable name to use instead of the child_var_nam when passed in the where clause to the link service', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dda_field_map', @level2type = N'COLUMN', @level2name = N'map_var_nam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The variable name that is normally passed in the where clause to the link service', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dda_field_map', @level2type = N'COLUMN', @level2name = N'link_var_nam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The variable name from the parent DDA that is the drill down point into the link service.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dda_field_map', @level2type = N'COLUMN', @level2name = N'var_nam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Allows different customization levels for customer and project teams.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dda_field_map', @level2type = N'COLUMN', @level2name = N'cust_lvl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The DDA id of the link service that the mapped field is associated with.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dda_field_map', @level2type = N'COLUMN', @level2name = N'dda_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table holds the data for mapped link fields in the where clause when executing link services', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dda_field_map';

