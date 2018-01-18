CREATE TABLE [dbo].[shp_dst_loc] (
    [ship_id]     NVARCHAR (30) NOT NULL,
    [wh_id]       NVARCHAR (32) NOT NULL,
    [dstare]      NVARCHAR (10) NOT NULL,
    [srtseq]      INT           NOT NULL,
    [dstloc]      NVARCHAR (20) NULL,
    [src_bldg_id] NVARCHAR (10) NULL,
    [moddte]      DATETIME      NULL,
    [mod_usr_id]  NVARCHAR (40) NULL,
    CONSTRAINT [shp_dst_loc_pk] PRIMARY KEY CLUSTERED ([ship_id] ASC, [wh_id] ASC, [dstare] ASC, [srtseq] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table is used to keep track of shipment destination locations.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'shp_dst_loc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The ID of the shipment for the corresponding destination location.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'shp_dst_loc', @level2type = N'COLUMN', @level2name = N'ship_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The ID of the warehouse for the corresponding destination location.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'shp_dst_loc', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The destination area for a shipment.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'shp_dst_loc', @level2type = N'COLUMN', @level2name = N'dstare';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Sequence in which dstloc is assigned when the ship_id and src_bldg_id are the same and inventory is too large for one staging lane.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'shp_dst_loc', @level2type = N'COLUMN', @level2name = N'srtseq';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The destination location for a shipment.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'shp_dst_loc', @level2type = N'COLUMN', @level2name = N'dstloc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The ID of the building that is the source of the shipment.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'shp_dst_loc', @level2type = N'COLUMN', @level2name = N'src_bldg_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date of the last modification.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'shp_dst_loc', @level2type = N'COLUMN', @level2name = N'moddte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The ID of the user that the last modification was made by.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'shp_dst_loc', @level2type = N'COLUMN', @level2name = N'mod_usr_id';

