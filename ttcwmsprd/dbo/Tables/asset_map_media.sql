CREATE TABLE [dbo].[asset_map_media] (
    [asset_media_id]   NVARCHAR (32)  NOT NULL,
    [media_typ]        NVARCHAR (32)  NULL,
    [media_loc]        NVARCHAR (128) NULL,
    [ins_dt]           DATETIME       NULL,
    [last_upd_dt]      DATETIME       NULL,
    [ins_user_id]      NVARCHAR (40)  NULL,
    [last_upd_user_id] NVARCHAR (40)  NULL,
    CONSTRAINT [asset_map_media_pk] PRIMARY KEY CLUSTERED ([asset_media_id] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Stores the media details for asset maps', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'asset_map_media';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Asset Media ID - Unique identifier for the media.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'asset_map_media', @level2type = N'COLUMN', @level2name = N'asset_media_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Media Type - Type of the media can be png,jpg..etc', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'asset_map_media', @level2type = N'COLUMN', @level2name = N'media_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Media Location - Location of the media associated with the map. This points to ..waffle/addons/wmd/images/<imagename>', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'asset_map_media', @level2type = N'COLUMN', @level2name = N'media_loc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was inserted', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'asset_map_media', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was last updated', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'asset_map_media', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who created the row', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'asset_map_media', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'asset_map_media', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

