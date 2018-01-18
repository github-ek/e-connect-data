CREATE TABLE [dbo].[cty_psz] (
    [ctry_name]   NVARCHAR (60)   NOT NULL,
    [adrstc]      NVARCHAR (40)   NOT NULL,
    [adrcty]      NVARCHAR (70)   NOT NULL,
    [adrpsz]      NVARCHAR (20)   NOT NULL,
    [latitude]    NVARCHAR (40)   NULL,
    [longitude]   NVARCHAR (40)   NULL,
    [cust_lvl]    INT             NOT NULL,
    [invalid_flg] INT             NOT NULL,
    [invalid_dte] DATETIME        NULL,
    [gmt_offset]  NUMERIC (19, 4) NULL,
    [dst_flg]     INT             NULL,
    [grp_nam]     NVARCHAR (40)   NULL,
    CONSTRAINT [cty_psz_pk] PRIMARY KEY CLUSTERED ([ctry_name] ASC, [adrstc] ASC, [adrcty] ASC, [adrpsz] ASC, [cust_lvl] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [cty_psz_dstflgck] CHECK ([dst_flg]=(0) OR [dst_flg]=(1)),
    CONSTRAINT [cty_psz_invldflgck] CHECK ([invalid_flg]=(0) OR [invalid_flg]=(1))
);


GO
CREATE NONCLUSTERED INDEX [cty_psz_idx1]
    ON [dbo].[cty_psz]([adrpsz] ASC, [adrcty] ASC, [adrstc] ASC, [ctry_name] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [cty_psz_idx2]
    ON [dbo].[cty_psz]([adrcty] ASC, [adrstc] ASC, [ctry_name] ASC, [invalid_flg] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [cty_psz_idx3]
    ON [dbo].[cty_psz]([latitude] ASC, [longitude] ASC, [invalid_flg] ASC) WITH (FILLFACTOR = 90);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table contains all city/state postal code information.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cty_psz';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Part of the unique identifier.  This defines what country this state belongs to.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cty_psz', @level2type = N'COLUMN', @level2name = N'ctry_name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Part of the unique identifier. This is the code of the state.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cty_psz', @level2type = N'COLUMN', @level2name = N'adrstc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Part of the unique identfier. This is the name of the city.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cty_psz', @level2type = N'COLUMN', @level2name = N'adrcty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Part of the unique identifier. This is the city/state postal code.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cty_psz', @level2type = N'COLUMN', @level2name = N'adrpsz';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This is the city/state postal code latitude.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cty_psz', @level2type = N'COLUMN', @level2name = N'latitude';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This is the city/state postal code longitude.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cty_psz', @level2type = N'COLUMN', @level2name = N'longitude';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Customization level.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cty_psz', @level2type = N'COLUMN', @level2name = N'cust_lvl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Is this city Postal Code combination Valid.  A combination is invalid if it is not the latest system geo-data load.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cty_psz', @level2type = N'COLUMN', @level2name = N'invalid_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date on which this City Postal Code was first deemed to be invalid.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cty_psz', @level2type = N'COLUMN', @level2name = N'invalid_dte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Time zone offset from GMT', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cty_psz', @level2type = N'COLUMN', @level2name = N'gmt_offset';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Flag indicating if daylight savings is recognized.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cty_psz', @level2type = N'COLUMN', @level2name = N'dst_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Specifies which product group was responsible for loading this data row.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cty_psz', @level2type = N'COLUMN', @level2name = N'grp_nam';

