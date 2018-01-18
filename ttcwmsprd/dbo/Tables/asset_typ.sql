CREATE TABLE [dbo].[asset_typ] (
    [asset_typ]         NVARCHAR (30)   NOT NULL,
    [asset_cat]         NVARCHAR (40)   NOT NULL,
    [asset_len]         NUMERIC (19, 4) NULL,
    [asset_wid]         NUMERIC (19, 4) NULL,
    [asset_hgt]         NUMERIC (19, 4) NULL,
    [asset_wgt]         NUMERIC (19, 4) NULL,
    [max_wgt]           NUMERIC (19, 4) NULL,
    [max_vol]           NUMERIC (19, 4) NULL,
    [ser_flg]           INT             NOT NULL,
    [temp_flg]          INT             NOT NULL,
    [container_flg]     INT             NOT NULL,
    [max_start_pal]     INT             NULL,
    [lst_pck_asset_flg] INT             DEFAULT ((0)) NOT NULL,
    [max_ord]           INT             NULL,
    [max_ordlin]        INT             NULL,
    [max_wko]           INT             NULL,
    [max_wkolin]        INT             NULL,
    [max_ctn]           INT             NULL,
    [ins_dt]            DATETIME        NULL,
    [last_upd_dt]       DATETIME        NULL,
    [ins_user_id]       NVARCHAR (40)   NULL,
    [last_upd_user_id]  NVARCHAR (40)   NULL,
    [load_tracked_flg]  INT             DEFAULT ((0)) NOT NULL,
    CONSTRAINT [asset_typ_pk] PRIMARY KEY CLUSTERED ([asset_typ] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [asset_typ_ser_flg] CHECK ([ser_flg]=(0) OR [ser_flg]=(1)),
    CONSTRAINT [asset_typ_temp_flg] CHECK ([temp_flg]=(0) OR [temp_flg]=(1)),
    CONSTRAINT [assettyp_cont_flg] CHECK ([container_flg]=(0) OR [container_flg]=(1)),
    CONSTRAINT [assettyp_load_tracked_flg] CHECK ([load_tracked_flg]=(0) OR [load_tracked_flg]=(1)),
    CONSTRAINT [lst_pckast_flg_ck] CHECK ([lst_pck_asset_flg]=(0) OR [lst_pck_asset_flg]=(1))
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The asset type is the table that is used to maintain asset types. Asset type groups assets based on common traits such as the dimensions, weight, manufacture, etc.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'asset_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Asset Type - This field groups assets based on common traits such as the dimensions, weight, manufacture, etc.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'asset_typ', @level2type = N'COLUMN', @level2name = N'asset_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Category Value - Used by the system to identify which table the asset is defined. Possible values are INVENTORY and TRAILER.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'asset_typ', @level2type = N'COLUMN', @level2name = N'asset_cat';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Asset Length.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'asset_typ', @level2type = N'COLUMN', @level2name = N'asset_len';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Asset Width.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'asset_typ', @level2type = N'COLUMN', @level2name = N'asset_wid';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Asset Height.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'asset_typ', @level2type = N'COLUMN', @level2name = N'asset_hgt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Asset Tare Weight.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'asset_typ', @level2type = N'COLUMN', @level2name = N'asset_wgt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Maximum weight of product that can be accommodated by the asset.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'asset_typ', @level2type = N'COLUMN', @level2name = N'max_wgt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Maximum cubic volume that can be accommodated by the asset.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'asset_typ', @level2type = N'COLUMN', @level2name = N'max_vol';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Serialized Flag - A value of 1 indicates the asset type is serialized.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'asset_typ', @level2type = N'COLUMN', @level2name = N'ser_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Temporary Flag - A value of 1 indicates the asset can be purged automatically by the system at known event (ex. dispatching a non-fleet trailer, shipping an asset that we only care to track within the four walls, etc.).', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'asset_typ', @level2type = N'COLUMN', @level2name = N'temp_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Container Flag, this flag will specify if an asset is an container asset.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'asset_typ', @level2type = N'COLUMN', @level2name = N'container_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Maximum number of starter pallets per trailer.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'asset_typ', @level2type = N'COLUMN', @level2name = N'max_start_pal';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicates whether this asset can be used for List picking', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'asset_typ', @level2type = N'COLUMN', @level2name = N'lst_pck_asset_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Maximum number of orders that can go into this asset. If NULL, then any number of orders can go into this asset.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'asset_typ', @level2type = N'COLUMN', @level2name = N'max_ord';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Maximum number of order lines that can go into this asset. If NULL, then any number of order lines can go into this asset.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'asset_typ', @level2type = N'COLUMN', @level2name = N'max_ordlin';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Maximum number of internal orders that can go into this asset. If NULL, then any number of work orders can go into this asset.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'asset_typ', @level2type = N'COLUMN', @level2name = N'max_wko';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Maximum number of work order lines that can go into this asset. If NULL, then any number of work order lines can go into this asset.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'asset_typ', @level2type = N'COLUMN', @level2name = N'max_wkolin';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was inserted', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'asset_typ', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was last updated', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'asset_typ', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who created the row', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'asset_typ', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'asset_typ', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Load Tracked Flg, this flag will specify if an asset is load tracked.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'asset_typ', @level2type = N'COLUMN', @level2name = N'load_tracked_flg';

