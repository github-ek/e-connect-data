CREATE TABLE [dbo].[ctry_mst] (
    [ctry_name]       NVARCHAR (60) NOT NULL,
    [iso_2_ctry_name] NVARCHAR (2)  NOT NULL,
    [iso_3_ctry_name] NVARCHAR (3)  NOT NULL,
    [iso_ctry_num]    NVARCHAR (3)  NOT NULL,
    [adr_fmt]         NVARCHAR (20) NOT NULL,
    [dom_ld_acc_cd]   NVARCHAR (5)  NULL,
    [intl_acc_cd]     NVARCHAR (5)  NULL,
    [ctry_phone_cd]   NVARCHAR (10) NOT NULL,
    [cs_ctry_name]    NVARCHAR (60) NULL,
    [zip_cod_len]     INT           NULL,
    [dty_ctry_typ]    NVARCHAR (10) NULL,
    [dty_ctry_cod]    NVARCHAR (2)  NULL,
    [grp_nam]         NVARCHAR (40) NULL,
    CONSTRAINT [ctry_mst_pk] PRIMARY KEY CLUSTERED ([ctry_name] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table is used to maintain the country information for Internationalization', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ctry_mst';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Country Name - name of the country', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ctry_mst', @level2type = N'COLUMN', @level2name = N'ctry_name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'2-digit International Standards Organization country name', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ctry_mst', @level2type = N'COLUMN', @level2name = N'iso_2_ctry_name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'3-digit International Standards Organization country name', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ctry_mst', @level2type = N'COLUMN', @level2name = N'iso_3_ctry_name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'International Standards Organization country number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ctry_mst', @level2type = N'COLUMN', @level2name = N'iso_ctry_num';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Formatting to use for addresses', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ctry_mst', @level2type = N'COLUMN', @level2name = N'adr_fmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Long distance access code when calling domestically', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ctry_mst', @level2type = N'COLUMN', @level2name = N'dom_ld_acc_cd';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Access code when calling internationally', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ctry_mst', @level2type = N'COLUMN', @level2name = N'intl_acc_cd';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Country phone code', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ctry_mst', @level2type = N'COLUMN', @level2name = N'ctry_phone_cd';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'ConnectShip country name - this is the country name that ConnectShip (TanData) expects for the country', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ctry_mst', @level2type = N'COLUMN', @level2name = N'cs_ctry_name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Zip code length - this is used to determine the length of the zip code that the parcel manifesting system can accept.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ctry_mst', @level2type = N'COLUMN', @level2name = N'zip_cod_len';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Duty Country Type - Indicates whether the country is part of the EU, UK or other. Values are EU, UK, or blank (does not belong to EU).', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ctry_mst', @level2type = N'COLUMN', @level2name = N'dty_ctry_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Duty Country Code - Country codes used for communication with Duty Management. Values determined by HM Revenue and Customs', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ctry_mst', @level2type = N'COLUMN', @level2name = N'dty_ctry_cod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Specifies which product group was responsible for loading this data', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ctry_mst', @level2type = N'COLUMN', @level2name = N'grp_nam';

