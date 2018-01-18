CREATE TABLE [dbo].[mu_mst] (
    [mu]             NVARCHAR (30)    NOT NULL,
    [mu_cat]         NVARCHAR (10)    NOT NULL,
    [mu_sys]         NVARCHAR (1)     NOT NULL,
    [cf_numerator]   NUMERIC (28, 10) NOT NULL,
    [cf_denominator] NUMERIC (28, 10) NOT NULL,
    [dsp_precision]  INT              DEFAULT ((3)) NOT NULL,
    [ena_flg]        INT              DEFAULT ((0)) NOT NULL,
    [host_uom_cod]   NVARCHAR (20)    NULL,
    [grp_nam]        NVARCHAR (40)    NULL,
    CONSTRAINT [mu_mst_pk] PRIMARY KEY CLUSTERED ([mu] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [mu_mst_cf_denom_ck] CHECK ([cf_denominator]>(0.0)),
    CONSTRAINT [mu_mst_cf_numer_ck] CHECK ([cf_numerator]>(0.0))
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table hold measurement unit information. This helps provide internationalization features for lengths, volumes and weights.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'mu_mst';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Part of the unique identifier.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'mu_mst', @level2type = N'COLUMN', @level2name = N'mu';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Defines what type of measurment the unit represents: weight, length or volume.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'mu_mst', @level2type = N'COLUMN', @level2name = N'mu_cat';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The measurement standards system this measurement uses.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'mu_mst', @level2type = N'COLUMN', @level2name = N'mu_sys';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Value is multiplied by this to convert to standard measurement system', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'mu_mst', @level2type = N'COLUMN', @level2name = N'cf_numerator';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Value is divided by this to convert to standard measurement system', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'mu_mst', @level2type = N'COLUMN', @level2name = N'cf_denominator';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Value is used for precision of this unit type', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'mu_mst', @level2type = N'COLUMN', @level2name = N'dsp_precision';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Flag that indicates if unit is enabled on the system and visible', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'mu_mst', @level2type = N'COLUMN', @level2name = N'ena_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Measurement unit code used by the host', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'mu_mst', @level2type = N'COLUMN', @level2name = N'host_uom_cod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Specifies which product group was responsible for loading this data row.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'mu_mst', @level2type = N'COLUMN', @level2name = N'grp_nam';

