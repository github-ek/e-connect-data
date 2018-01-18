CREATE TABLE [dbo].[pckmov] (
    [cmbcod] NVARCHAR (10) NOT NULL,
    [seqnum] INT           NOT NULL,
    [wh_id]  NVARCHAR (32) NULL,
    [arecod] NVARCHAR (10) NOT NULL,
    [stoloc] NVARCHAR (20) NULL,
    [rescod] NVARCHAR (50) NULL,
    [arrqty] INT           NOT NULL,
    [prcqty] INT           NOT NULL,
    [rowid]  INT           IDENTITY (1, 1) NOT NULL,
    CONSTRAINT [pckmov_pk] PRIMARY KEY CLUSTERED ([cmbcod] ASC, [seqnum] ASC) WITH (FILLFACTOR = 90)
);


GO
CREATE NONCLUSTERED INDEX [pckmov_idx1]
    ON [dbo].[pckmov]([stoloc] ASC, [wh_id] ASC) WITH (FILLFACTOR = 90);


GO
CREATE UNIQUE NONCLUSTERED INDEX [pckmov_rowid]
    ON [dbo].[pckmov]([rowid] ASC) WITH (FILLFACTOR = 90);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The Pick Move table tracks the paths of the picks of allocated inventory in the warehouse.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckmov';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Combo Code - Multiple picks may be tied together via a single combination code. It ties pckwrk_hdr/pckwrk_dtl tables to pckmov.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckmov', @level2type = N'COLUMN', @level2name = N'cmbcod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Sequence Number - the order of the pick movement.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckmov', @level2type = N'COLUMN', @level2name = N'seqnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warehouse ID - the warehouse ID where the inventory will be moved to.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckmov', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Area Code - Defines the area from where inventory will be moved to.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckmov', @level2type = N'COLUMN', @level2name = N'arecod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Destination Location - the destination location where the inventory will be moved to.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckmov', @level2type = N'COLUMN', @level2name = N'stoloc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Resource Code - Can be either the ship id or carrier code', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckmov', @level2type = N'COLUMN', @level2name = N'rescod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Arrived Quantity - The total quantity to be picked.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckmov', @level2type = N'COLUMN', @level2name = N'arrqty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Processing Quantity - The quantity being processed as part of the pick.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckmov', @level2type = N'COLUMN', @level2name = N'prcqty';

