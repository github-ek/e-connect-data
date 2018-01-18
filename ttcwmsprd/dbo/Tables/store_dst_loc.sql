CREATE TABLE [dbo].[store_dst_loc] (
    [store_id]         NVARCHAR (35) NOT NULL,
    [wh_id]            NVARCHAR (32) NOT NULL,
    [srtseq]           INT           NOT NULL,
    [dstare]           NVARCHAR (10) NOT NULL,
    [dstloc]           NVARCHAR (20) NULL,
    [src_bldg_id]      NVARCHAR (10) NULL,
    [u_version]        INT           NULL,
    [ins_dt]           DATETIME      NULL,
    [last_upd_dt]      DATETIME      NULL,
    [ins_user_id]      NVARCHAR (40) NULL,
    [last_upd_user_id] NVARCHAR (40) NULL,
    CONSTRAINT [store_dst_loc_pk] PRIMARY KEY CLUSTERED ([store_id] ASC, [wh_id] ASC, [srtseq] ASC, [dstare] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table defines the store''s default staging destination areas/locations. If no default staging areas/locations are defined for a store, the system uses default staging areas based on system configuration', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'store_dst_loc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Store Identifier - Store a distribution will be sent to', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'store_dst_loc', @level2type = N'COLUMN', @level2name = N'store_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warehouse Identifier - Warehouse this store is configured for', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'store_dst_loc', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Sort Sequence - When multiple areas/locations are configured for a store, this determines the order to attempt to allocate a destination location', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'store_dst_loc', @level2type = N'COLUMN', @level2name = N'srtseq';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Destination Area', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'store_dst_loc', @level2type = N'COLUMN', @level2name = N'dstare';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Destination Location', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'store_dst_loc', @level2type = N'COLUMN', @level2name = N'dstloc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Source Building ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'store_dst_loc', @level2type = N'COLUMN', @level2name = N'src_bldg_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Version number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'store_dst_loc', @level2type = N'COLUMN', @level2name = N'u_version';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date the row was inserted', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'store_dst_loc', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date the row was last updated', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'store_dst_loc', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User ID of the person who created the row', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'store_dst_loc', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User ID of the person who updated the row most recently', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'store_dst_loc', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

