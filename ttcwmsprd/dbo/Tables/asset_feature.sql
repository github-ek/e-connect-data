CREATE TABLE [dbo].[asset_feature] (
    [feature_id]       NVARCHAR (32) NOT NULL,
    [ins_dt]           DATETIME      NULL,
    [last_upd_dt]      DATETIME      NULL,
    [ins_user_id]      NVARCHAR (40) NULL,
    [last_upd_user_id] NVARCHAR (40) NULL,
    CONSTRAINT [asset_feature_pk] PRIMARY KEY CLUSTERED ([feature_id] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The asset_feature table is used to define feature identifiers for an asset Ex: Fuel, Temperature, etc.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'asset_feature';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Defines a Feature of an asset.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'asset_feature', @level2type = N'COLUMN', @level2name = N'feature_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inserted Date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'asset_feature', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Last Updated Date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'asset_feature', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inserted User ID ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'asset_feature', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Last Updated User ID ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'asset_feature', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

