CREATE TABLE [dbo].[fiscal_cal] (
    [request_dt]     DATETIME NOT NULL,
    [fiscal_week]    INT      NOT NULL,
    [fiscal_month]   INT      NOT NULL,
    [fiscal_quarter] INT      NOT NULL,
    [fiscal_year]    INT      NOT NULL,
    CONSTRAINT [fiscal_cal_pk] PRIMARY KEY CLUSTERED ([request_dt] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Fiscal Calender date.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'fiscal_cal', @level2type = N'COLUMN', @level2name = N'request_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'week that the request_dt date falls in (1 to 5)', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'fiscal_cal', @level2type = N'COLUMN', @level2name = N'fiscal_week';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Period/Month that the request_dt date falls in (1 - 12)', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'fiscal_cal', @level2type = N'COLUMN', @level2name = N'fiscal_month';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Quarter that the request_dt falls in', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'fiscal_cal', @level2type = N'COLUMN', @level2name = N'fiscal_quarter';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Year that the request_dt date falls in', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'fiscal_cal', @level2type = N'COLUMN', @level2name = N'fiscal_year';

