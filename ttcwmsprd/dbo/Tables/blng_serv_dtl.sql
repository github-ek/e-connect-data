CREATE TABLE [dbo].[blng_serv_dtl] (
    [client_id]     NVARCHAR (32) NOT NULL,
    [blng_serv_typ] NVARCHAR (20) NOT NULL,
    [blng_mthd_typ] NVARCHAR (1)  NULL,
    [hstacc]        NVARCHAR (30) NULL,
    CONSTRAINT [blng_serv_dtl_pk] PRIMARY KEY CLUSTERED ([blng_serv_typ] ASC, [client_id] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The billing service detail table defines the billing method and host account for a client and service type', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'blng_serv_dtl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Client Id', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'blng_serv_dtl', @level2type = N'COLUMN', @level2name = N'client_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Billing Service Type', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'blng_serv_dtl', @level2type = N'COLUMN', @level2name = N'blng_serv_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Billing Method Type', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'blng_serv_dtl', @level2type = N'COLUMN', @level2name = N'blng_mthd_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Host Billing Reference Code', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'blng_serv_dtl', @level2type = N'COLUMN', @level2name = N'hstacc';

