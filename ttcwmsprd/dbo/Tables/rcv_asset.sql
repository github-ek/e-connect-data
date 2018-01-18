CREATE TABLE [dbo].[rcv_asset] (
    [rcv_asset_key]    NVARCHAR (15) NOT NULL,
    [wh_id]            NVARCHAR (32) NOT NULL,
    [trknum]           NVARCHAR (20) NOT NULL,
    [client_id]        NVARCHAR (32) NOT NULL,
    [supnum]           NVARCHAR (32) NOT NULL,
    [invnum]           NVARCHAR (35) NOT NULL,
    [asset_typ]        NVARCHAR (30) NOT NULL,
    [asset_id]         NVARCHAR (30) NULL,
    [asset_tag]        NVARCHAR (40) NULL,
    [ser_num]          NVARCHAR (40) NULL,
    [asset_stat]       NVARCHAR (15) NOT NULL,
    [expqty]           INT           NULL,
    [idnqty]           INT           NULL,
    [rcvqty]           INT           NULL,
    [purch_dte]        DATETIME      NULL,
    [warranty_dte]     DATETIME      NULL,
    [man_id]           NVARCHAR (20) NULL,
    [model]            NVARCHAR (20) NULL,
    [ins_dt]           DATETIME      NULL,
    [last_upd_dt]      DATETIME      NULL,
    [ins_user_id]      NVARCHAR (40) NULL,
    [last_upd_user_id] NVARCHAR (40) NULL,
    CONSTRAINT [rcv_asset_pk] PRIMARY KEY CLUSTERED ([rcv_asset_key] ASC) WITH (FILLFACTOR = 90)
);


GO
CREATE NONCLUSTERED INDEX [rcvast_asset_tag]
    ON [dbo].[rcv_asset]([asset_tag] ASC) WITH (FILLFACTOR = 90);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table is used to store details of assets received for a truck and details of the expected assets on an Inbound transaction.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rcv_asset';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Unique generated identifier.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rcv_asset', @level2type = N'COLUMN', @level2name = N'rcv_asset_key';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warehouse ID - the warehouse in which the asset is to be received.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rcv_asset', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Truck Number.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rcv_asset', @level2type = N'COLUMN', @level2name = N'trknum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Asset client identifier.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rcv_asset', @level2type = N'COLUMN', @level2name = N'client_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Supplier Number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rcv_asset', @level2type = N'COLUMN', @level2name = N'supnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Invoice Number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rcv_asset', @level2type = N'COLUMN', @level2name = N'invnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Asset Type - This field groups assets based on common traits such as the dimensions, weight, manufacture, etc.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rcv_asset', @level2type = N'COLUMN', @level2name = N'asset_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Serialized asset Identifier - Required only for Serialized assets.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rcv_asset', @level2type = N'COLUMN', @level2name = N'asset_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Asset Tag - Typically a unique RFID identifier but can also be used as a Barcode unique identifier.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rcv_asset', @level2type = N'COLUMN', @level2name = N'asset_tag';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Serial Number - Serial number of the asset - Required only for Serialized assets.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rcv_asset', @level2type = N'COLUMN', @level2name = N'ser_num';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Asset Status - Used for reporting purpose. Typical possible values are ACT (active) and INACT (inactive).', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rcv_asset', @level2type = N'COLUMN', @level2name = N'asset_stat';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Expected quantity - Expected asset qty.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rcv_asset', @level2type = N'COLUMN', @level2name = N'expqty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Identified Quantity - Assets identified in the system.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rcv_asset', @level2type = N'COLUMN', @level2name = N'idnqty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Received Quantity - Number of non-serialized assets which are received for a truck.This will be set to 1 for serialized assets.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rcv_asset', @level2type = N'COLUMN', @level2name = N'rcvqty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date and time at which an asset was purchased - Required only for Serialized assets.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rcv_asset', @level2type = N'COLUMN', @level2name = N'purch_dte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date and time at which the warranty for an asset expires - Required only for Serialized assets.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rcv_asset', @level2type = N'COLUMN', @level2name = N'warranty_dte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Manufacture ID - Identifies where the asset is manufactured - Required only for Serialized assets.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rcv_asset', @level2type = N'COLUMN', @level2name = N'man_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Model Number - Identifies the model numbers for the asset - Required only for Serialized assets.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rcv_asset', @level2type = N'COLUMN', @level2name = N'model';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was inserted', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rcv_asset', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was last updated', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rcv_asset', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who created the row', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rcv_asset', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rcv_asset', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

