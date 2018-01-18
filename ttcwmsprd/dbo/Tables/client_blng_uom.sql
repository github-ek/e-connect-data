CREATE TABLE [dbo].[client_blng_uom] (
    [client_id]    NVARCHAR (32)   NOT NULL,
    [blng_uom_cod] NVARCHAR (4)    NOT NULL,
    [blng_uom_typ] NVARCHAR (1)    NOT NULL,
    [blng_uom_cmd] NVARCHAR (4000) NULL,
    CONSTRAINT [client_blng_uom_pk] PRIMARY KEY CLUSTERED ([blng_uom_cod] ASC, [client_id] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The client billing UOM table defines the billing UOM codes, the billing UOM type and possibly the command to use for a given Client', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'client_blng_uom';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Client Id', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'client_blng_uom', @level2type = N'COLUMN', @level2name = N'client_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Billing UOM Code', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'client_blng_uom', @level2type = N'COLUMN', @level2name = N'blng_uom_cod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Billing UOM Type', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'client_blng_uom', @level2type = N'COLUMN', @level2name = N'blng_uom_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Billing UOM charge command', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'client_blng_uom', @level2type = N'COLUMN', @level2name = N'blng_uom_cmd';

