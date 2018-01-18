CREATE TABLE [dbo].[asset_mapdtl] (
    [map_dtl_id]       NVARCHAR (32) NOT NULL,
    [map]              NVARCHAR (32) NULL,
    [dsp_type]         NVARCHAR (32) NULL,
    [dsp_target]       NVARCHAR (32) NULL,
    [dsp_width]        INT           NULL,
    [dsp_height]       INT           NULL,
    [dsp_top]          INT           NULL,
    [dsp_left]         INT           NULL,
    [target_typ]       NVARCHAR (32) NULL,
    [target_obj]       NVARCHAR (32) NULL,
    [draw_seq]         INT           NULL,
    [ins_dt]           DATETIME      NULL,
    [last_upd_dt]      DATETIME      NULL,
    [ins_user_id]      NVARCHAR (40) NULL,
    [last_upd_user_id] NVARCHAR (40) NULL,
    CONSTRAINT [asset_mapdtl_pk] PRIMARY KEY CLUSTERED ([map_dtl_id] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table contains data to put an object on a map. Map details have attributes that determine how to render them, attributes on which map to render them on, and attributes that describe what a map detail represents.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'asset_mapdtl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Map Detail ID - unique identifier for map detail.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'asset_mapdtl', @level2type = N'COLUMN', @level2name = N'map_dtl_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Map - Map is the parent map that this detail belongs to.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'asset_mapdtl', @level2type = N'COLUMN', @level2name = N'map';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Display Type - Defines how this map object will be rendered. Valid values are BLOCK, BORDER, MEDIA.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'asset_mapdtl', @level2type = N'COLUMN', @level2name = N'dsp_type';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Display Target - This field maps to the media_id in asset_mediamst and defines the media that will be rendered for this map.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'asset_mapdtl', @level2type = N'COLUMN', @level2name = N'dsp_target';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Display Width - Map display width in pixels.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'asset_mapdtl', @level2type = N'COLUMN', @level2name = N'dsp_width';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Display height - Map display height in pixels.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'asset_mapdtl', @level2type = N'COLUMN', @level2name = N'dsp_height';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Display top - Relative top position of the media on the top level map.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'asset_mapdtl', @level2type = N'COLUMN', @level2name = N'dsp_top';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Display left - Relative left position of the media on the top level map.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'asset_mapdtl', @level2type = N'COLUMN', @level2name = N'dsp_left';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Target Type - Defines the type of the object represented by this detail. Valid values are Map, Area and Location.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'asset_mapdtl', @level2type = N'COLUMN', @level2name = N'target_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Target Object - Defines what this details represents.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'asset_mapdtl', @level2type = N'COLUMN', @level2name = N'target_obj';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Draw Sequence - Defines the sequence in which the details will be rendered on a map.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'asset_mapdtl', @level2type = N'COLUMN', @level2name = N'draw_seq';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was inserted', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'asset_mapdtl', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was last updated', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'asset_mapdtl', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who created the row', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'asset_mapdtl', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'asset_mapdtl', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

