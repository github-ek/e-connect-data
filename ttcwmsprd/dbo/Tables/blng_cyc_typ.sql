CREATE TABLE [dbo].[blng_cyc_typ] (
    [blng_cyc_typ] NVARCHAR (3) NOT NULL,
    [num_dtl]      INT          NOT NULL,
    [dtl_typ]      NVARCHAR (1) NOT NULL,
    CONSTRAINT [blng_cyc_typ_pk] PRIMARY KEY CLUSTERED ([blng_cyc_typ] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The billing cycle type table defines the recurrence pattern used when creating a billing schedule.  Current entries are Monthly, Semi-Monthly, and Weekly.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'blng_cyc_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Billing cycle Type', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'blng_cyc_typ', @level2type = N'COLUMN', @level2name = N'blng_cyc_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Number of Details', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'blng_cyc_typ', @level2type = N'COLUMN', @level2name = N'num_dtl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Detail Type', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'blng_cyc_typ', @level2type = N'COLUMN', @level2name = N'dtl_typ';

