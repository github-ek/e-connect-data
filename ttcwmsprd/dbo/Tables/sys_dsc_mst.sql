CREATE TABLE [dbo].[sys_dsc_mst] (
    [colnam]    NVARCHAR (100)  NOT NULL,
    [colval]    NVARCHAR (200)  NOT NULL,
    [locale_id] NVARCHAR (20)   NOT NULL,
    [cust_lvl]  INT             NOT NULL,
    [mls_text]  NVARCHAR (2000) NOT NULL,
    [short_dsc] NVARCHAR (20)   NULL,
    [grp_nam]   NVARCHAR (40)   NULL,
    CONSTRAINT [sys_dsc_mst_pk] PRIMARY KEY CLUSTERED ([colnam] ASC, [colval] ASC, [locale_id] ASC, [cust_lvl] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table contains descriptions for system required data items.  It links descriptions to values of data by the column name.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sys_dsc_mst';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Part of the unique identifier.  Indicates the column or variable name for this description.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sys_dsc_mst', @level2type = N'COLUMN', @level2name = N'colnam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Part of the unique identifier.  The value of the data in the colnam column that this description matches', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sys_dsc_mst', @level2type = N'COLUMN', @level2name = N'colval';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Part of the unique indentifier.  This allows different descriptions for differet locales', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sys_dsc_mst', @level2type = N'COLUMN', @level2name = N'locale_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Allows different customization levels for customer and project teams.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sys_dsc_mst', @level2type = N'COLUMN', @level2name = N'cust_lvl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This is the verbose description for this data item', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sys_dsc_mst', @level2type = N'COLUMN', @level2name = N'mls_text';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Specifies which product group was responsible for loading this data row.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sys_dsc_mst', @level2type = N'COLUMN', @level2name = N'grp_nam';

