CREATE TABLE [dbo].[sl_dbversion] (
    [version] NVARCHAR (30) NULL
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table defines database version.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_dbversion';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The database version', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_dbversion', @level2type = N'COLUMN', @level2name = N'version';

