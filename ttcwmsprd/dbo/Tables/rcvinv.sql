CREATE TABLE [dbo].[rcvinv] (
    [trknum]     NVARCHAR (20)  NOT NULL,
    [client_id]  NVARCHAR (32)  NOT NULL,
    [supnum]     NVARCHAR (32)  NOT NULL,
    [invnum]     NVARCHAR (35)  NOT NULL,
    [wh_id]      NVARCHAR (32)  NOT NULL,
    [invtyp]     NVARCHAR (4)   NULL,
    [sadnum]     NVARCHAR (20)  NULL,
    [waybil]     NVARCHAR (20)  NULL,
    [invdte]     DATETIME       NULL,
    [orgref]     NVARCHAR (30)  NULL,
    [src_host]   NVARCHAR (100) NULL,
    [ship_id]    NVARCHAR (30)  NULL,
    [ret_ref1]   NVARCHAR (20)  NULL,
    [ret_ref2]   NVARCHAR (20)  NULL,
    [ret_ref3]   NVARCHAR (20)  NULL,
    [doc_num]    NVARCHAR (20)  NULL,
    [track_num]  NVARCHAR (20)  NULL,
    [moddte]     DATETIME       NULL,
    [mod_usr_id] NVARCHAR (40)  NULL,
    [po_num]     NVARCHAR (35)  NULL,
    CONSTRAINT [rcvinv_pk] PRIMARY KEY CLUSTERED ([trknum] ASC, [supnum] ASC, [invnum] ASC, [wh_id] ASC, [client_id] ASC) WITH (FILLFACTOR = 90)
);


GO
CREATE NONCLUSTERED INDEX [rcvinv_idx1]
    ON [dbo].[rcvinv]([supnum] ASC, [client_id] ASC, [invnum] ASC, [wh_id] ASC) WITH (FILLFACTOR = 90);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The receive invoice table is used to represent receiving invoices which are associated to an active receipt (truck) on the system.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rcvinv';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Truck Number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rcvinv', @level2type = N'COLUMN', @level2name = N'trknum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Client ID associated with the invoice.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rcvinv', @level2type = N'COLUMN', @level2name = N'client_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Supplier Number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rcvinv', @level2type = N'COLUMN', @level2name = N'supnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Invoice Number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rcvinv', @level2type = N'COLUMN', @level2name = N'invnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warehouse ID - the warehouse in which the inventory is to be received.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rcvinv', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Invoice Type', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rcvinv', @level2type = N'COLUMN', @level2name = N'invtyp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Not used for any standard system processing.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rcvinv', @level2type = N'COLUMN', @level2name = N'sadnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Not used for any standard system processing.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rcvinv', @level2type = N'COLUMN', @level2name = N'waybil';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Not used for any standard system processing.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rcvinv', @level2type = N'COLUMN', @level2name = N'invdte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Not used for any standard system processing.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rcvinv', @level2type = N'COLUMN', @level2name = N'orgref';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Source Host - specifies the host address of the site where the inventory orignated.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rcvinv', @level2type = N'COLUMN', @level2name = N'src_host';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Shipment ID - specifies the shipment ID which this inventory was attached from the source site.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rcvinv', @level2type = N'COLUMN', @level2name = N'ship_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Return reference 1', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rcvinv', @level2type = N'COLUMN', @level2name = N'ret_ref1';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Return reference 2', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rcvinv', @level2type = N'COLUMN', @level2name = N'ret_ref2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Return reference 3', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rcvinv', @level2type = N'COLUMN', @level2name = N'ret_ref3';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Bill of Lading number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rcvinv', @level2type = N'COLUMN', @level2name = N'doc_num';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Bill of lading pro number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rcvinv', @level2type = N'COLUMN', @level2name = N'track_num';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Datetime Stamp of last change to row.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rcvinv', @level2type = N'COLUMN', @level2name = N'moddte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'ID of user that performed last modification.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rcvinv', @level2type = N'COLUMN', @level2name = N'mod_usr_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Purchase Order Number.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rcvinv', @level2type = N'COLUMN', @level2name = N'po_num';

