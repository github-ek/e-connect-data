CREATE TABLE [dbo].[dscmst] (
    [colnam]    NVARCHAR (100)  NOT NULL,
    [colval]    NVARCHAR (200)  NOT NULL,
    [locale_id] NVARCHAR (20)   NOT NULL,
    [lngdsc]    NVARCHAR (2000) NOT NULL,
    [short_dsc] NVARCHAR (20)   NULL,
    [grp_nam]   NVARCHAR (40)   NULL,
    CONSTRAINT [dscmst_pk] PRIMARY KEY CLUSTERED ([colnam] ASC, [colval] ASC, [locale_id] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table contains descriptions for key data items.  It links descriptions to values of data by the column name.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dscmst';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Part of the unique identifier.  Indicates the column or variable name for this description.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dscmst', @level2type = N'COLUMN', @level2name = N'colnam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Part of the unique identifier.  The value of the data in the colnam column that this description matches', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dscmst', @level2type = N'COLUMN', @level2name = N'colval';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Part of the unique indentifier.  This allows different descriptions for differet locales', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dscmst', @level2type = N'COLUMN', @level2name = N'locale_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This is the most verbose description for this data item', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dscmst', @level2type = N'COLUMN', @level2name = N'lngdsc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Shorter or abbreviated description for a data item', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dscmst', @level2type = N'COLUMN', @level2name = N'short_dsc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Specifies which product group was responsible for loading this data row.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dscmst', @level2type = N'COLUMN', @level2name = N'grp_nam';

