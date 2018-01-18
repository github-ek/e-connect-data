CREATE TABLE [dbo].[pck_bldg_seq] (
    [wh_id]       NVARCHAR (32) NOT NULL,
    [dst_bldg_id] NVARCHAR (10) NOT NULL,
    [src_bldg_id] NVARCHAR (10) NOT NULL,
    [srtseq]      INT           NOT NULL,
    CONSTRAINT [pck_bldg_seq_pk] PRIMARY KEY CLUSTERED ([dst_bldg_id] ASC, [src_bldg_id] ASC, [wh_id] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table is used to indicate how buildings should be sequenced relative to one another when picking inventory. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pck_bldg_seq';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warehouse ID.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pck_bldg_seq', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This field indicates which building we are ultimately attempting to get product to.  For example, if we are shipping out of building A, then building A would be our destination building ID. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pck_bldg_seq', @level2type = N'COLUMN', @level2name = N'dst_bldg_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This field indicates the building to attempt to pull product from.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pck_bldg_seq', @level2type = N'COLUMN', @level2name = N'src_bldg_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Used to indicate the order in which to attempt building rollovers.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pck_bldg_seq', @level2type = N'COLUMN', @level2name = N'srtseq';

