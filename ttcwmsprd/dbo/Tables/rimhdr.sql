CREATE TABLE [dbo].[rimhdr] (
    [client_id] NVARCHAR (32) NOT NULL,
    [supnum]    NVARCHAR (32) NOT NULL,
    [invnum]    NVARCHAR (35) NOT NULL,
    [wh_id]     NVARCHAR (32) NOT NULL,
    [invtyp]    NVARCHAR (4)  NULL,
    [sadnum]    NVARCHAR (20) NULL,
    [waybil]    NVARCHAR (20) NULL,
    [invdte]    DATETIME      NULL,
    [adddte]    DATETIME      NULL,
    [orgref]    NVARCHAR (30) NULL,
    [rimsts]    NVARCHAR (40) NULL,
    [clsdte]    DATETIME      NULL,
    CONSTRAINT [rimhdr_pk] PRIMARY KEY CLUSTERED ([supnum] ASC, [invnum] ASC, [wh_id] ASC, [client_id] ASC) WITH (FILLFACTOR = 90)
);


GO
CREATE NONCLUSTERED INDEX [rimhdr_wh_id]
    ON [dbo].[rimhdr]([wh_id] ASC) WITH (FILLFACTOR = 90);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The receive invoice master header table is used to represent master invoices.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rimhdr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Client ID associated with the invoice.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rimhdr', @level2type = N'COLUMN', @level2name = N'client_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Supplier Number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rimhdr', @level2type = N'COLUMN', @level2name = N'supnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Invoice Number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rimhdr', @level2type = N'COLUMN', @level2name = N'invnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warehouse ID - the warehouse in which the inventory is to be received.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rimhdr', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Invoice Type', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rimhdr', @level2type = N'COLUMN', @level2name = N'invtyp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Not used for any standard system processing.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rimhdr', @level2type = N'COLUMN', @level2name = N'sadnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Not used for any standard system processing.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rimhdr', @level2type = N'COLUMN', @level2name = N'waybil';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Not used for any standard system processing.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rimhdr', @level2type = N'COLUMN', @level2name = N'invdte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Added Date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rimhdr', @level2type = N'COLUMN', @level2name = N'adddte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Not used for any standard system processing.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rimhdr', @level2type = N'COLUMN', @level2name = N'orgref';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The current status of the purchase orders. Some examples are Open, Suspended, or Closed. Closed purchase orders are the only status that are archived.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rimhdr', @level2type = N'COLUMN', @level2name = N'rimsts';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date/time that the purchase order was completed/closed.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rimhdr', @level2type = N'COLUMN', @level2name = N'clsdte';

