CREATE TABLE [dbo].[asset_loc_cap] (
    [wh_id]            NVARCHAR (32) NOT NULL,
    [stoloc]           NVARCHAR (20) NOT NULL,
    [asset_typ]        NVARCHAR (30) NOT NULL,
    [client_id]        NVARCHAR (32) NOT NULL,
    [man_id]           NVARCHAR (20) NOT NULL,
    [model]            NVARCHAR (20) NOT NULL,
    [locmin]           INT           NOT NULL,
    [ins_dt]           DATETIME      NULL,
    [last_upd_dt]      DATETIME      NULL,
    [ins_user_id]      NVARCHAR (40) NULL,
    [last_upd_user_id] NVARCHAR (40) NULL,
    CONSTRAINT [asset_loc_cap_pk] PRIMARY KEY CLUSTERED ([wh_id] ASC, [stoloc] ASC, [client_id] ASC, [asset_typ] ASC, [man_id] ASC, [model] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The asset location capacity table, stores location minimum value to keep track of the lowest level of assets that can exist in a location.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'asset_loc_cap';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warehouse ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'asset_loc_cap', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Storage Location - Location with the capacity configuration.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'asset_loc_cap', @level2type = N'COLUMN', @level2name = N'stoloc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Asset Type', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'asset_loc_cap', @level2type = N'COLUMN', @level2name = N'asset_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Client ID - Asset client identifier.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'asset_loc_cap', @level2type = N'COLUMN', @level2name = N'client_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Manufacture ID - Identifies where the asset is manufactured. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'asset_loc_cap', @level2type = N'COLUMN', @level2name = N'man_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Model Number - Identifies the model number for the asset.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'asset_loc_cap', @level2type = N'COLUMN', @level2name = N'model';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Location Minimum - Minimum number of assets at the location.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'asset_loc_cap', @level2type = N'COLUMN', @level2name = N'locmin';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was inserted', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'asset_loc_cap', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was last updated', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'asset_loc_cap', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who created the row', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'asset_loc_cap', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'asset_loc_cap', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

