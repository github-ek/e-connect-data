CREATE TABLE [dbo].[asset_mapmst] (
    [map]              NVARCHAR (32) NOT NULL,
    [wh_id]            NVARCHAR (32) NOT NULL,
    [dsp_type]         NVARCHAR (32) NULL,
    [dsp_target]       NVARCHAR (32) NULL,
    [dsp_width]        INT           NULL,
    [dsp_height]       INT           NULL,
    [dsp_top]          INT           NULL,
    [dsp_left]         INT           NULL,
    [top_lvl]          INT           DEFAULT ((0)) NULL,
    [ins_dt]           DATETIME      NULL,
    [last_upd_dt]      DATETIME      NULL,
    [ins_user_id]      NVARCHAR (40) NULL,
    [last_upd_user_id] NVARCHAR (40) NULL,
    CONSTRAINT [asset_mapmst_pk] PRIMARY KEY CLUSTERED ([map] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [mapmst_toplvlck] CHECK ([top_lvl]=(0) OR [top_lvl]=(1))
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This is the master table for maps to store Asset map attributes.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'asset_mapmst';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Map identifier - Unique identifier for a MAP.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'asset_mapmst', @level2type = N'COLUMN', @level2name = N'map';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warehouse ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'asset_mapmst', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Display Type - Defines how this map object will be rendered. Valid values are BLOCK, BORDER, MEDIA.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'asset_mapmst', @level2type = N'COLUMN', @level2name = N'dsp_type';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Display Target - This field maps to the media_id in asset_mediamst and defines the media that will be rendered for this map.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'asset_mapmst', @level2type = N'COLUMN', @level2name = N'dsp_target';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Display Width - Map display width in pixels.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'asset_mapmst', @level2type = N'COLUMN', @level2name = N'dsp_width';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Display height - Map display height in pixels.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'asset_mapmst', @level2type = N'COLUMN', @level2name = N'dsp_height';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Display top - Relative top position of the media on the top level map.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'asset_mapmst', @level2type = N'COLUMN', @level2name = N'dsp_top';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Display left - Relative left position of the media on the top level map.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'asset_mapmst', @level2type = N'COLUMN', @level2name = N'dsp_left';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Top Level - Defines a top level map for the facility - ex.,blue print of the facility. All the detail maps will be rendered on this map.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'asset_mapmst', @level2type = N'COLUMN', @level2name = N'top_lvl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was inserted', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'asset_mapmst', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was last updated', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'asset_mapmst', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who created the row', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'asset_mapmst', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'asset_mapmst', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

