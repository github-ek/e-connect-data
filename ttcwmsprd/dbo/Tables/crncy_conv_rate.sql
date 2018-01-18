CREATE TABLE [dbo].[crncy_conv_rate] (
    [src_crncy_code] NVARCHAR (4)     NOT NULL,
    [dst_crncy_code] NVARCHAR (4)     NOT NULL,
    [effectivedate]  DATETIME         NOT NULL,
    [conv_rate]      NUMERIC (28, 10) NOT NULL,
    CONSTRAINT [crncy_conv_rate_pk] PRIMARY KEY CLUSTERED ([src_crncy_code] ASC, [dst_crncy_code] ASC, [effectivedate] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [conv_rate_cr_ck] CHECK ([conv_rate]>(0.0))
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Contains information about the exchange rate as of an effective date.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'crncy_conv_rate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Source Currency''s ISO Code', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'crncy_conv_rate', @level2type = N'COLUMN', @level2name = N'src_crncy_code';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Target Currency''s ISO Code', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'crncy_conv_rate', @level2type = N'COLUMN', @level2name = N'dst_crncy_code';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Effective date of exchange rate.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'crncy_conv_rate', @level2type = N'COLUMN', @level2name = N'effectivedate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Rate to be applied to monetary amount expressed in the default currency to adjust it to this currency.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'crncy_conv_rate', @level2type = N'COLUMN', @level2name = N'conv_rate';

