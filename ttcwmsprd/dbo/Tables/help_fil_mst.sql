CREATE TABLE [dbo].[help_fil_mst] (
    [help_fil_id] NVARCHAR (20) NOT NULL,
    [locale_id]   NVARCHAR (20) NOT NULL,
    [help_fil]    NVARCHAR (64) NOT NULL,
    [grp_nam]     NVARCHAR (40) NULL,
    CONSTRAINT [help_fil_mst_pk] PRIMARY KEY CLUSTERED ([help_fil_id] ASC, [locale_id] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Part of the unique identifier.  This table lists available help files.  By using locale id, different help files can be used for different languages.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'help_fil_mst';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Part of the unique identifier.  This specifies which help file to use for a specific locale', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'help_fil_mst', @level2type = N'COLUMN', @level2name = N'locale_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'File name of the compiled help file.  This file should be locaed in the directory specified in the LES registry entry.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'help_fil_mst', @level2type = N'COLUMN', @level2name = N'help_fil';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Specifies which product group was responsible for loading this data row.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'help_fil_mst', @level2type = N'COLUMN', @level2name = N'grp_nam';

