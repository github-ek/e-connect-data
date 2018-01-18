CREATE TABLE [dbo].[xdkwrk] (
    [xdkref]           NVARCHAR (10) NOT NULL,
    [xdktyp]           NVARCHAR (1)  NOT NULL,
    [wh_id]            NVARCHAR (32) NOT NULL,
    [dstare]           NVARCHAR (10) NULL,
    [dstloc]           NVARCHAR (20) NULL,
    [prt_client_id]    NVARCHAR (32) NOT NULL,
    [prtnum]           NVARCHAR (50) NOT NULL,
    [invsts_prg]       NVARCHAR (4)  NOT NULL,
    [pckqty]           INT           NOT NULL,
    [xdkqty]           INT           NOT NULL,
    [alcqty]           INT           NOT NULL,
    [rule_nam]         NVARCHAR (20) NULL,
    [supnum]           NVARCHAR (32) NULL,
    [untcas]           INT           NULL,
    [untpak]           INT           NULL,
    [untpal]           INT           NULL,
    [ship_id]          NVARCHAR (30) NULL,
    [ship_line_id]     NVARCHAR (10) NULL,
    [client_id]        NVARCHAR (32) NULL,
    [ordnum]           NVARCHAR (35) NULL,
    [subsid]           NVARCHAR (4)  NULL,
    [ordlin]           NVARCHAR (10) NULL,
    [ordsln]           NVARCHAR (10) NULL,
    [rplref]           NVARCHAR (10) NULL,
    [schbat]           NVARCHAR (32) NULL,
    [stcust]           NVARCHAR (20) NULL,
    [splflg]           INT           NULL,
    [rpqflg]           INT           NULL,
    [adddte]           DATETIME      NULL,
    [wkonum]           NVARCHAR (20) NULL,
    [wkorev]           NVARCHAR (10) NULL,
    [wkolin]           NVARCHAR (10) NULL,
    [min_shelf_hrs]    INT           NULL,
    [pallet_id]        NVARCHAR (30) NULL,
    [pallet_pos]       NVARCHAR (8)  NULL,
    [pallet_load_seq]  INT           NULL,
    [pltctl_lodlvl]    NVARCHAR (1)  NULL,
    [u_version]        INT           NULL,
    [ins_dt]           DATETIME      NULL,
    [last_upd_dt]      DATETIME      NULL,
    [ins_user_id]      NVARCHAR (40) NULL,
    [last_upd_user_id] NVARCHAR (40) NULL,
    CONSTRAINT [xdkwrk_xdkref] PRIMARY KEY CLUSTERED ([xdkref] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [xdkwrk_rpqflg_ck] CHECK ([rpqflg]=(0) OR [rpqflg]=(1)),
    CONSTRAINT [xdkwrk_splflg_ck] CHECK ([splflg]=(0) OR [splflg]=(1))
);


GO
CREATE NONCLUSTERED INDEX [xdkwrk_part]
    ON [dbo].[xdkwrk]([prtnum] ASC, [wh_id] ASC, [prt_client_id] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [xdkwrk_replen]
    ON [dbo].[xdkwrk]([rplref] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [xdkwrk_ship_id]
    ON [dbo].[xdkwrk]([ship_id] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [xdkwrk_shp_lin_id]
    ON [dbo].[xdkwrk]([ship_line_id] ASC) WITH (FILLFACTOR = 90);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Crossdock table', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'xdkwrk';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Crossdock reference unique identifier (primary key)', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'xdkwrk', @level2type = N'COLUMN', @level2name = N'xdkref';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Crossdock type', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'xdkwrk', @level2type = N'COLUMN', @level2name = N'xdktyp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warehouse ID - the warehouse in which the inventory is to be received.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'xdkwrk', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Destination Area', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'xdkwrk', @level2type = N'COLUMN', @level2name = N'dstare';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Destination Location', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'xdkwrk', @level2type = N'COLUMN', @level2name = N'dstloc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'In non-3PL systems, this will be set to a default of ''----''.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'xdkwrk', @level2type = N'COLUMN', @level2name = N'prt_client_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The item number of the component inventory that is being consumed.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'xdkwrk', @level2type = N'COLUMN', @level2name = N'prtnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Status Progression name.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'xdkwrk', @level2type = N'COLUMN', @level2name = N'invsts_prg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Confirm pick quantity', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'xdkwrk', @level2type = N'COLUMN', @level2name = N'pckqty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Confirm crossdock quantity', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'xdkwrk', @level2type = N'COLUMN', @level2name = N'xdkqty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Confirm allocate quantity', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'xdkwrk', @level2type = N'COLUMN', @level2name = N'alcqty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'An allocation rule name linking to the alloc_rule table.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'xdkwrk', @level2type = N'COLUMN', @level2name = N'rule_nam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Supplier Number: Supplier number specific to the pick.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'xdkwrk', @level2type = N'COLUMN', @level2name = N'supnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Units per Case', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'xdkwrk', @level2type = N'COLUMN', @level2name = N'untcas';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Units per Pack', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'xdkwrk', @level2type = N'COLUMN', @level2name = N'untpak';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Unit of measure associated with untpal value.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'xdkwrk', @level2type = N'COLUMN', @level2name = N'untpal';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If pick is associated to an order, this is the shipment ID which requires this pick.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'xdkwrk', @level2type = N'COLUMN', @level2name = N'ship_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If pick is associated to an order, this will have the value of the shipment line ID that is satisfied by this pick.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'xdkwrk', @level2type = N'COLUMN', @level2name = N'ship_line_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If associated to an order, this is the order number which requires this pick.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'xdkwrk', @level2type = N'COLUMN', @level2name = N'ordnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Subs ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'xdkwrk', @level2type = N'COLUMN', @level2name = N'subsid';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If associated to an order, this is the order line which requires this pick.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'xdkwrk', @level2type = N'COLUMN', @level2name = N'ordlin';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If associated to an order, this is the order sub-line which requires this pick.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'xdkwrk', @level2type = N'COLUMN', @level2name = N'ordsln';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Replenishment reference', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'xdkwrk', @level2type = N'COLUMN', @level2name = N'rplref';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Schedule Batch Number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'xdkwrk', @level2type = N'COLUMN', @level2name = N'schbat';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Ship-To Customer - The customer to which this order will be ultimately be shipped.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'xdkwrk', @level2type = N'COLUMN', @level2name = N'stcust';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Split Case Flag - Determines whether or not the system can allocate partial case quantities for this order line.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'xdkwrk', @level2type = N'COLUMN', @level2name = N'splflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This flag indicates that allocation should attempt to round up the quantity requested to the next logical material handling unit in order to achieve a more efficient product move.  For example, if the quantity called for represents piece picks, then this flag will allow the system to consider rounding up to a case pick in order to make the movement more efficient.  The limits of over-allocation are still governed by the ovrcod and ovramt.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'xdkwrk', @level2type = N'COLUMN', @level2name = N'rpqflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date added.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'xdkwrk', @level2type = N'COLUMN', @level2name = N'adddte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If for a work order, this will indicate which work order number.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'xdkwrk', @level2type = N'COLUMN', @level2name = N'wkonum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Used if multiple copies of a standard work order are desired.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'xdkwrk', @level2type = N'COLUMN', @level2name = N'wkorev';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Work Order Line Number: Only applies if the inventory activity is for a work order consume or receipt', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'xdkwrk', @level2type = N'COLUMN', @level2name = N'wkolin';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Minimum Shelf Hours - If set, only inventory with an expiration date that is at least this many hours away from expiring will be allocated for this order line.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'xdkwrk', @level2type = N'COLUMN', @level2name = N'min_shelf_hrs';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Pallet identifier as sent from PalletCtl.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'xdkwrk', @level2type = N'COLUMN', @level2name = N'pallet_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Concatenated Pallet Position/Pallet Stack Number as sent from PalletCtl.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'xdkwrk', @level2type = N'COLUMN', @level2name = N'pallet_pos';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Represents where in the loading sequence order that the pallet should be loaded as sent from PalletCtl.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'xdkwrk', @level2type = N'COLUMN', @level2name = N'pallet_load_seq';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Denotes the lodlvl in which we sent the cross dock quantity over to PalletCtl.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'xdkwrk', @level2type = N'COLUMN', @level2name = N'pltctl_lodlvl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The version number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'xdkwrk', @level2type = N'COLUMN', @level2name = N'u_version';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was inserted', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'xdkwrk', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was last updated', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'xdkwrk', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who created the row', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'xdkwrk', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'xdkwrk', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

