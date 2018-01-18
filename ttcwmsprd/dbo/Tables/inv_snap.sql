CREATE TABLE [dbo].[inv_snap] (
    [inv_snap_id]      NVARCHAR (10) NOT NULL,
    [prtnum]           NVARCHAR (50) NOT NULL,
    [prt_client_id]    NVARCHAR (32) NOT NULL,
    [gendte]           DATETIME      NOT NULL,
    [rcvqty]           INT           NOT NULL,
    [shpqty]           INT           NOT NULL,
    [adjqty]           INT           NOT NULL,
    [wko_cnsqty]       INT           NOT NULL,
    [wko_rcvqty]       INT           NOT NULL,
    [on_hand_qty]      INT           NOT NULL,
    [shippable_qty]    INT           NOT NULL,
    [ordered_qty]      INT           NOT NULL,
    [planned_qty]      INT           NOT NULL,
    [wko_ordered_qty]  INT           NOT NULL,
    [pnd_rcvqty]       INT           NOT NULL,
    [wh_id]            NVARCHAR (32) NOT NULL,
    [snap_gen_num]     NVARCHAR (10) NULL,
    [moddte]           DATETIME      NULL,
    [mod_usr_id]       NVARCHAR (40) NULL,
    [u_version]        INT           NULL,
    [ins_dt]           DATETIME      NULL,
    [last_upd_dt]      DATETIME      NULL,
    [ins_user_id]      NVARCHAR (40) NULL,
    [last_upd_user_id] NVARCHAR (40) NULL,
    [rowid]            INT           IDENTITY (1, 1) NOT NULL,
    CONSTRAINT [inv_snap_pk] PRIMARY KEY CLUSTERED ([inv_snap_id] ASC) WITH (FILLFACTOR = 90)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [inv_snap_rowid]
    ON [dbo].[inv_snap]([rowid] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [invsnap_snapgennum]
    ON [dbo].[inv_snap]([snap_gen_num] ASC) WITH (FILLFACTOR = 90);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The Inventory Snapshot table provides a snapshot of inventory activity at a given moment in time.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inv_snap';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Snap ID - PK value for this table.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inv_snap', @level2type = N'COLUMN', @level2name = N'inv_snap_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Item Number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inv_snap', @level2type = N'COLUMN', @level2name = N'prtnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Item Client ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inv_snap', @level2type = N'COLUMN', @level2name = N'prt_client_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Generation Date: Date and time the inventory snapshot was generated.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inv_snap', @level2type = N'COLUMN', @level2name = N'gendte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Received Quantity: Number of units received between the last time a snapshot was generated and the Generation Date.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inv_snap', @level2type = N'COLUMN', @level2name = N'rcvqty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Shipped Quantity: Number of units shipped between the last time a snapshot was generated and the Generation Date.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inv_snap', @level2type = N'COLUMN', @level2name = N'shpqty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'No of units adjusted between the last time a snapshot was generated and Generation Date. An adjustment includes adding, modifying or deleting inventory through invadjopr and cntaudopr, as well as inventory moved to WIP supply areas.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inv_snap', @level2type = N'COLUMN', @level2name = N'adjqty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Work Order Consumed Quantity: Number of units delivered to a work order processing location between the last time a snapshot was generated and the Generation Date.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inv_snap', @level2type = N'COLUMN', @level2name = N'wko_cnsqty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Number of units received through a WO between the last time a snapshot was generated and Generation Date. This includes inventory received from a WO either through production of a top level item or the return to stock of components.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inv_snap', @level2type = N'COLUMN', @level2name = N'wko_rcvqty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The results here will be dictated by a policy. It will either be: the qty of this item number/item client id within four-wall locations or  specified inventory status progression and is within four-wall locations.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inv_snap', @level2type = N'COLUMN', @level2name = N'on_hand_qty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Shippable Quantity: A subset of the On-Hand Inventory Quantity that only includes on-hand inventory with an inventory status that is shippable.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inv_snap', @level2type = N'COLUMN', @level2name = N'shippable_qty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Ordered Quantity: The quantity of the item required for outstanding order lines.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inv_snap', @level2type = N'COLUMN', @level2name = N'ordered_qty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Shipment Planned Quantity: The quantity of the item number/item client id that has already been assigned to a shipment that is not closed or cancelled.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inv_snap', @level2type = N'COLUMN', @level2name = N'planned_qty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The total qty of this item number/item client id that is expected, but has not yet been putaway and received into inventory. The results here will be dictated by a policy', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inv_snap', @level2type = N'COLUMN', @level2name = N'pnd_rcvqty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warehouse ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inv_snap', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Maps to snap_gen_num on the Inventory Activity table. This indicates that all rows in the Inventory Activity table with a snap_gen_num that matches this value were included in the rcvqty and shpqty sum totals for this snapshot.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inv_snap', @level2type = N'COLUMN', @level2name = N'snap_gen_num';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Last date this inventory snapshot was modified.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inv_snap', @level2type = N'COLUMN', @level2name = N'moddte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Last user to modify this inventory snapshot.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inv_snap', @level2type = N'COLUMN', @level2name = N'mod_usr_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The version number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inv_snap', @level2type = N'COLUMN', @level2name = N'u_version';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was inserted', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inv_snap', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was last updated', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inv_snap', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who created the row', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inv_snap', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inv_snap', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

