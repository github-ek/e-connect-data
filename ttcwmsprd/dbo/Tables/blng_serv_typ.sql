CREATE TABLE [dbo].[blng_serv_typ] (
    [blng_serv_typ] NVARCHAR (20) NOT NULL,
    [blng_chrg_typ] NVARCHAR (1)  NULL,
    CONSTRAINT [blng_serv_typ_pk] PRIMARY KEY CLUSTERED ([blng_serv_typ] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The billing service type table defines the charge type for a given service type', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'blng_serv_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Billing Service Type', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'blng_serv_typ', @level2type = N'COLUMN', @level2name = N'blng_serv_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Billing Charge Type', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'blng_serv_typ', @level2type = N'COLUMN', @level2name = N'blng_chrg_typ';

