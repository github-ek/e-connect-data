CREATE TABLE [dbo].[ship_asset] (
    [ship_asset_tran_id] NVARCHAR (50) NOT NULL,
    [asset_id]           NVARCHAR (30) NULL,
    [ship_id]            NVARCHAR (30) NULL,
    [asset_typ]          NVARCHAR (30) NOT NULL,
    [adr_id]             NVARCHAR (20) NOT NULL,
    [src_adr_id]         NVARCHAR (20) NULL,
    [shpqty]             INT           NULL,
    [client_id]          NVARCHAR (32) NULL,
    [asset_stat]         NVARCHAR (15) NOT NULL,
    [ins_dt]             DATETIME      NULL,
    [last_upd_dt]        DATETIME      NULL,
    [ins_user_id]        NVARCHAR (40) NULL,
    [last_upd_user_id]   NVARCHAR (40) NULL,
    CONSTRAINT [ship_asset_pk] PRIMARY KEY CLUSTERED ([ship_asset_tran_id] ASC) WITH (FILLFACTOR = 90)
);


GO
CREATE NONCLUSTERED INDEX [ship_asset_ship_id]
    ON [dbo].[ship_asset]([ship_id] ASC) WITH (FILLFACTOR = 90);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The shipped asset is The table which will be used to track all the empty assets that will be shipped from the warehouse.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ship_asset';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A unique identifier for the shipped asset.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ship_asset', @level2type = N'COLUMN', @level2name = N'ship_asset_tran_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Serialized asset unique identifier.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ship_asset', @level2type = N'COLUMN', @level2name = N'asset_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Shipment Id - The shipment with which the asset went.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ship_asset', @level2type = N'COLUMN', @level2name = N'ship_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Asset Type - This field groups assets based on common traits such as the dimensions, weight, manufacturer etc.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ship_asset', @level2type = N'COLUMN', @level2name = N'asset_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Address Id - The customer''s address where the asset is being shipped.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ship_asset', @level2type = N'COLUMN', @level2name = N'adr_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Source Address Id - The owner of the asset.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ship_asset', @level2type = N'COLUMN', @level2name = N'src_adr_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Shipped Quantity - The quantity of asset shipped.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ship_asset', @level2type = N'COLUMN', @level2name = N'shpqty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Unique asset client identifier.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ship_asset', @level2type = N'COLUMN', @level2name = N'client_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Asset Status - Used for reporting purpose  .', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ship_asset', @level2type = N'COLUMN', @level2name = N'asset_stat';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was inserted.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ship_asset', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was last updated.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ship_asset', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who created the row.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ship_asset', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ship_asset', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

