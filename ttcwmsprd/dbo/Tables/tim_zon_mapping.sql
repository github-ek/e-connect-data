CREATE TABLE [dbo].[tim_zon_mapping] (
    [java_id]  NVARCHAR (255) NOT NULL,
    [win32_id] NVARCHAR (255) NOT NULL,
    [ena_flg]  INT            NULL,
    CONSTRAINT [tim_zon_mapping_pk] PRIMARY KEY CLUSTERED ([java_id] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [tim_zon_enaflg_ck] CHECK ([ena_flg]=(0) OR [ena_flg]=(1))
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table provides a map between Java''s Time Zone scheme and the one used by Windows.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tim_zon_mapping';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The ID returned from Java.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tim_zon_mapping', @level2type = N'COLUMN', @level2name = N'java_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The ID returned from Windows.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tim_zon_mapping', @level2type = N'COLUMN', @level2name = N'win32_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Allows the time zone to be disabled for a system.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tim_zon_mapping', @level2type = N'COLUMN', @level2name = N'ena_flg';

