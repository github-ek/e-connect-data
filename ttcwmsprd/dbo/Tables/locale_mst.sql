CREATE TABLE [dbo].[locale_mst] (
    [locale_id]           NVARCHAR (20) NOT NULL,
    [ctry_name]           NVARCHAR (60) NOT NULL,
    [ora_lang]            NVARCHAR (30) NULL,
    [ora_terr]            NVARCHAR (30) NULL,
    [ora_nls_sort]        NVARCHAR (30) NULL,
    [win_cli_lcid]        INT           NULL,
    [win_srv_lcid]        INT           NULL,
    [unix_srv_locale_nam] NVARCHAR (50) NULL,
    [rf_locale_nam]       NVARCHAR (50) NULL,
    [mu_sys]              NVARCHAR (1)  NOT NULL,
    [voc_lang_cod]        NVARCHAR (10) NULL,
    [grp_nam]             NVARCHAR (40) NULL,
    [ena_flg]             INT           DEFAULT ((0)) NULL,
    CONSTRAINT [locale_mst_pk] PRIMARY KEY CLUSTERED ([locale_id] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table locale information. This helps provide internationalization features.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'locale_mst';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Part of the unique identifier.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'locale_mst', @level2type = N'COLUMN', @level2name = N'locale_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Used for showing the name of the country that a locale represents.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'locale_mst', @level2type = N'COLUMN', @level2name = N'ctry_name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Used to setup Oracle databases for language support.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'locale_mst', @level2type = N'COLUMN', @level2name = N'ora_lang';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Used to setup the Oracle database territory.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'locale_mst', @level2type = N'COLUMN', @level2name = N'ora_terr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Used to setup the Oracle database sorting method.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'locale_mst', @level2type = N'COLUMN', @level2name = N'ora_nls_sort';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Defines the locale identifier windows uses to represent this locale on the client computers.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'locale_mst', @level2type = N'COLUMN', @level2name = N'win_cli_lcid';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Defines the locale identifier windows uses to represent this locale on the server computers.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'locale_mst', @level2type = N'COLUMN', @level2name = N'win_srv_lcid';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Defines the name of the locale on Unix servers.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'locale_mst', @level2type = N'COLUMN', @level2name = N'unix_srv_locale_nam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Defines the Measurement unit system to use for this locale.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'locale_mst', @level2type = N'COLUMN', @level2name = N'mu_sys';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Specifies language code.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'locale_mst', @level2type = N'COLUMN', @level2name = N'voc_lang_cod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Specifies which product group was responsible for loading this data row.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'locale_mst', @level2type = N'COLUMN', @level2name = N'grp_nam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Flag that indicates whether the locale is enabled or not.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'locale_mst', @level2type = N'COLUMN', @level2name = N'ena_flg';

