CREATE TABLE [dbo].[sto_area_hdr] (
    [sto_area_id]       NVARCHAR (20)  NOT NULL,
    [wh_id]             NVARCHAR (32)  NOT NULL,
    [bldg_id]           NVARCHAR (10)  NOT NULL,
    [srtseq]            INT            NOT NULL,
    [dstare]            NVARCHAR (10)  NOT NULL,
    [strategy]          NVARCHAR (150) NOT NULL,
    [min_lvl]           INT            DEFAULT ((0)) NULL,
    [max_lvl]           INT            DEFAULT ((0)) NULL,
    [max_lod_per_aisle] INT            NULL,
    [ins_dt]            DATETIME       NULL,
    [last_upd_dt]       DATETIME       NULL,
    [ins_user_id]       NVARCHAR (40)  NULL,
    [last_upd_user_id]  NVARCHAR (40)  NULL,
    CONSTRAINT [sto_area_hdr_pk] PRIMARY KEY CLUSTERED ([sto_area_id] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The table is used to store the area preferences header for storage of the inventory on putaway.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sto_area_hdr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Storage Area Header ID -Unique Id to identify the storage rule.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sto_area_hdr', @level2type = N'COLUMN', @level2name = N'sto_area_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warehouse ID. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sto_area_hdr', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Building ID -Indicates the Building ID for the preferred storage area.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sto_area_hdr', @level2type = N'COLUMN', @level2name = N'bldg_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Sort Sequence -This indicates the priority of the preferred area on putaway.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sto_area_hdr', @level2type = N'COLUMN', @level2name = N'srtseq';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Destination Area -This indicates the Destination area for putaway.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sto_area_hdr', @level2type = N'COLUMN', @level2name = N'dstare';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Strategy -The strategy used for finding the destination area/location.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sto_area_hdr', @level2type = N'COLUMN', @level2name = N'strategy';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Minumum Level -Minumum Level of inventory in the area.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sto_area_hdr', @level2type = N'COLUMN', @level2name = N'min_lvl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Maximum Level -Maximum Level of inventory in the.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sto_area_hdr', @level2type = N'COLUMN', @level2name = N'max_lvl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Maximum Loads Per Aisle -Maximum Loads Per Aisle of inventory for the area.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sto_area_hdr', @level2type = N'COLUMN', @level2name = N'max_lod_per_aisle';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was inserted.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sto_area_hdr', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was last updated.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sto_area_hdr', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who created the row.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sto_area_hdr', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sto_area_hdr', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

