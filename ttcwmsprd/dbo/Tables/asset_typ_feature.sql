CREATE TABLE [dbo].[asset_typ_feature] (
    [wh_id]            NVARCHAR (32)   NOT NULL,
    [asset_typ]        NVARCHAR (30)   NOT NULL,
    [feature_id]       NVARCHAR (32)   NOT NULL,
    [min_val]          NUMERIC (19, 4) NULL,
    [max_val]          NUMERIC (19, 4) NULL,
    [ins_dt]           DATETIME        NULL,
    [last_upd_dt]      DATETIME        NULL,
    [ins_user_id]      NVARCHAR (40)   NULL,
    [last_upd_user_id] NVARCHAR (40)   NULL,
    CONSTRAINT [assettypfeat_pk] PRIMARY KEY CLUSTERED ([wh_id] ASC, [asset_typ] ASC, [feature_id] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This is a child table to ASSET_TYP that will define the features assigned to an asset type and will allow a low and high threshold to be defined.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'asset_typ_feature';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warehouse ID.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'asset_typ_feature', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This field groups assets based on common traits such as the dimensions, weight, manufacture, etc.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'asset_typ_feature', @level2type = N'COLUMN', @level2name = N'asset_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Defines a feature of an asset type. Eg:- Temperature, Fuel, etc.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'asset_typ_feature', @level2type = N'COLUMN', @level2name = N'feature_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Minimum Value - The lower threshold value allowed for the feature.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'asset_typ_feature', @level2type = N'COLUMN', @level2name = N'min_val';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Maximum Value - The upper threshold value allowed for the feature.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'asset_typ_feature', @level2type = N'COLUMN', @level2name = N'max_val';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was inserted.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'asset_typ_feature', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was last updated.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'asset_typ_feature', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who created the row.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'asset_typ_feature', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'asset_typ_feature', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

