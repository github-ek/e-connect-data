CREATE TABLE [dbo].[wh_asset_cat] (
    [asset_cat]        NVARCHAR (30) NOT NULL,
    [wh_id]            NVARCHAR (32) NOT NULL,
    [ena_flg]          INT           NOT NULL,
    [ins_dt]           DATETIME      NULL,
    [last_upd_dt]      DATETIME      NULL,
    [ins_user_id]      NVARCHAR (40) NULL,
    [last_upd_user_id] NVARCHAR (40) NULL,
    CONSTRAINT [wh_asset_cat_pk] PRIMARY KEY CLUSTERED ([asset_cat] ASC, [wh_id] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [wh_assetcat_enaflg] CHECK ([ena_flg]=(0) OR [ena_flg]=(1))
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The warehouse asset category table serves the purpose of enabling/disabling certain asset cateogry for a warehouse.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wh_asset_cat';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Category Value - Used by the system to identify which table the asset is defined in. Possible values are INVENTORY and TRAILER.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wh_asset_cat', @level2type = N'COLUMN', @level2name = N'asset_cat';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warehouse ID - This allows having a category enabled/disabled in a specific warehouse.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wh_asset_cat', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Enable Flag - If true, the warehouse has the asset tracking belonging to the category enabled.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wh_asset_cat', @level2type = N'COLUMN', @level2name = N'ena_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was inserted', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wh_asset_cat', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was last updated', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wh_asset_cat', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who created the row', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wh_asset_cat', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wh_asset_cat', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

