CREATE TABLE [dbo].[fiscal_cal_config] (
    [fiscal_year]  INT      NOT NULL,
    [fiscal_month] INT      NOT NULL,
    [fiscal_week]  INT      NOT NULL,
    [start_dt]     DATETIME NOT NULL,
    [end_dt]       DATETIME NOT NULL,
    CONSTRAINT [FISCAL_CAL_CFG_PK] PRIMARY KEY CLUSTERED ([fiscal_year] ASC, [fiscal_month] ASC, [fiscal_week] ASC, [start_dt] ASC, [end_dt] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Fiscal Year.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'fiscal_cal_config', @level2type = N'COLUMN', @level2name = N'fiscal_year';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Fiscal Month', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'fiscal_cal_config', @level2type = N'COLUMN', @level2name = N'fiscal_month';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Fiscal Week', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'fiscal_cal_config', @level2type = N'COLUMN', @level2name = N'fiscal_week';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Start Date of week', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'fiscal_cal_config', @level2type = N'COLUMN', @level2name = N'start_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'End Date of week', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'fiscal_cal_config', @level2type = N'COLUMN', @level2name = N'end_dt';

