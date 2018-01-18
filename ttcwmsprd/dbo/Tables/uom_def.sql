CREATE TABLE [dbo].[uom_def] (
    [mu_sys] NVARCHAR (1)  NOT NULL,
    [mu]     NVARCHAR (30) NOT NULL,
    [mu_cat] NVARCHAR (10) NOT NULL,
    CONSTRAINT [uom_def_pk] PRIMARY KEY CLUSTERED ([mu_sys] ASC, [mu_cat] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table holds default measurement units for various unit types based on the locale.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'uom_def';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Measurement unit system. Links to uom_locale_id column in locale_mst table. This column is part of the unique identifier.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'uom_def', @level2type = N'COLUMN', @level2name = N'mu_sys';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default unit. Links to mu column in mu_mst table.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'uom_def', @level2type = N'COLUMN', @level2name = N'mu';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Defines what type of measurment the unit represents: weight, length, area, distance, temperature or volume. This column is part of the unique identifier.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'uom_def', @level2type = N'COLUMN', @level2name = N'mu_cat';

