CREATE TABLE [dbo].[canpck] (
    [cangrp]          NVARCHAR (10)   NOT NULL,
    [wrkref]          NVARCHAR (12)   NOT NULL,
    [wrkref_dtl]      NVARCHAR (15)   NOT NULL,
    [wrktyp]          NVARCHAR (1)    NOT NULL,
    [schbat]          NVARCHAR (32)   NULL,
    [srcloc]          NVARCHAR (20)   NOT NULL,
    [dstloc]          NVARCHAR (20)   NULL,
    [srcare]          NVARCHAR (10)   NOT NULL,
    [wh_id]           NVARCHAR (32)   NOT NULL,
    [dstare]          NVARCHAR (10)   NULL,
    [ship_line_id]    NVARCHAR (10)   NULL,
    [ship_id]         NVARCHAR (30)   NULL,
    [client_id]       NVARCHAR (32)   NULL,
    [ordnum]          NVARCHAR (35)   NULL,
    [ordlin]          NVARCHAR (10)   NULL,
    [ordsln]          NVARCHAR (10)   NULL,
    [concod]          NVARCHAR (10)   NOT NULL,
    [cmbcod]          NVARCHAR (10)   NOT NULL,
    [lblbat]          NVARCHAR (6)    NULL,
    [lblseq]          NVARCHAR (50)   NULL,
    [devcod]          NVARCHAR (20)   NULL,
    [pckqty]          INT             NOT NULL,
    [pck_catch_qty]   NUMERIC (19, 4) NULL,
    [appqty]          INT             NOT NULL,
    [app_catch_qty]   NUMERIC (19, 4) NULL,
    [pcksts]          NVARCHAR (1)    NOT NULL,
    [prtnum]          NVARCHAR (50)   NOT NULL,
    [prt_client_id]   NVARCHAR (32)   NOT NULL,
    [supnum]          NVARCHAR (32)   NULL,
    [rule_nam]        NVARCHAR (20)   NULL,
    [invsts]          NVARCHAR (4)    NULL,
    [invsts_prg]      NVARCHAR (4)    NULL,
    [lodlvl]          NVARCHAR (1)    NOT NULL,
    [lodnum]          NVARCHAR (30)   NULL,
    [subnum]          NVARCHAR (30)   NULL,
    [dtlnum]          NVARCHAR (30)   NULL,
    [untcas]          INT             NOT NULL,
    [untpak]          INT             NOT NULL,
    [ftpcod]          NVARCHAR (30)   NULL,
    [ctncod]          NVARCHAR (4)    NULL,
    [ctnnum]          NVARCHAR (30)   NULL,
    [ctnseg]          NVARCHAR (10)   NULL,
    [loducc]          NVARCHAR (20)   NULL,
    [subucc]          NVARCHAR (20)   NULL,
    [visflg]          INT             NULL,
    [splflg]          INT             NULL,
    [locflg]          INT             NULL,
    [lodflg]          INT             NULL,
    [subflg]          INT             NULL,
    [dtlflg]          INT             NULL,
    [prtflg]          INT             NULL,
    [orgflg]          INT             NULL,
    [revflg]          INT             NULL,
    [supflg]          INT             DEFAULT ((0)) NULL,
    [lotflg]          INT             NULL,
    [qtyflg]          INT             NULL,
    [catch_qty_flg]   INT             NULL,
    [frsflg]          INT             NULL,
    [adddte]          DATETIME        NULL,
    [pckdte]          DATETIME        NULL,
    [cmpdte]          DATETIME        NULL,
    [candte]          DATETIME        NULL,
    [can_usr_id]      NVARCHAR (40)   NULL,
    [cancod]          NVARCHAR (40)   NULL,
    [remqty]          INT             NULL,
    [wkonum]          NVARCHAR (20)   NULL,
    [wkorev]          NVARCHAR (10)   NULL,
    [wkolin]          NVARCHAR (10)   NULL,
    [min_shelf_hrs]   INT             NULL,
    [pipflg]          INT             NULL,
    [list_id]         NVARCHAR (15)   NULL,
    [list_seqnum]     INT             NULL,
    [lm_goal_seconds] INT             NULL,
    [asset_typ]       NVARCHAR (30)   NULL,
    [unassign_flg]    INT             NULL,
    [pallet_id]       NVARCHAR (30)   NULL,
    [pallet_pos]      NVARCHAR (8)    NULL,
    [pallet_load_seq] INT             NULL,
    [pck_uom]         NVARCHAR (2)    NULL,
    [wcs_can_pcksts]  NVARCHAR (1)    NULL,
    [wcs_can_req_dt]  DATETIME        NULL,
    [wcs_can_conf_dt] DATETIME        NULL,
    CONSTRAINT [canpck_pk] PRIMARY KEY CLUSTERED ([cangrp] ASC, [wrkref] ASC, [wrkref_dtl] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [canpck_cqty_flg_ck] CHECK ([catch_qty_flg]=(0) OR [catch_qty_flg]=(1)),
    CONSTRAINT [canpck_dtlflg_ck] CHECK ([dtlflg]=(0) OR [dtlflg]=(1)),
    CONSTRAINT [canpck_frsflg_ck] CHECK ([frsflg]=(0) OR [frsflg]=(1)),
    CONSTRAINT [canpck_locflg_ck] CHECK ([locflg]=(0) OR [locflg]=(1)),
    CONSTRAINT [canpck_lodflg_ck] CHECK ([lodflg]=(0) OR [lodflg]=(1)),
    CONSTRAINT [canpck_lotflg_ck] CHECK ([lotflg]=(0) OR [lotflg]=(1)),
    CONSTRAINT [canpck_orgflg_ck] CHECK ([orgflg]=(0) OR [orgflg]=(1)),
    CONSTRAINT [canpck_pipflg_ck] CHECK ([pipflg]=(0) OR [pipflg]=(1)),
    CONSTRAINT [canpck_prtflg_ck] CHECK ([prtflg]=(0) OR [prtflg]=(1)),
    CONSTRAINT [canpck_qtyflg_ck] CHECK ([qtyflg]=(0) OR [qtyflg]=(1)),
    CONSTRAINT [canpck_revflg_ck] CHECK ([revflg]=(0) OR [revflg]=(1)),
    CONSTRAINT [canpck_splflg_ck] CHECK ([splflg]=(0) OR [splflg]=(1)),
    CONSTRAINT [canpck_subflg_ck] CHECK ([subflg]=(0) OR [subflg]=(1)),
    CONSTRAINT [canpck_supflg_ck] CHECK ([supflg]=(0) OR [supflg]=(1)),
    CONSTRAINT [canpck_unasgnflgck] CHECK ([unassign_flg]=(0) OR [unassign_flg]=(1)),
    CONSTRAINT [canpck_visflg_ck] CHECK ([visflg]=(0) OR [visflg]=(1))
);


GO
CREATE NONCLUSTERED INDEX [canpck_work_order]
    ON [dbo].[canpck]([wkonum] ASC, [wkorev] ASC, [wh_id] ASC, [client_id] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [canpck_ship_id]
    ON [dbo].[canpck]([ship_id] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [canpck_wh_id]
    ON [dbo].[canpck]([wh_id] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [canpck_cmbcod]
    ON [dbo].[canpck]([cmbcod] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [canpck_idx1]
    ON [dbo].[canpck]([wrkref] ASC, [list_id] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [canpck_pcksts]
    ON [dbo].[canpck]([pcksts] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [canpck_idx2]
    ON [dbo].[canpck]([list_id] ASC, [schbat] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [canpck_subnum_ctnnum_idx]
    ON [dbo].[canpck]([subnum] ASC, [ctnnum] ASC) WITH (FILLFACTOR = 90);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The cancelled pick table is used to track picks that have been cancelled. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'canpck';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Identifies group of picks cancelled at one time.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'canpck', @level2type = N'COLUMN', @level2name = N'cangrp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Original work reference for cancelled pick.  Together with the cancellation group, this uniquely identifies the record.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'canpck', @level2type = N'COLUMN', @level2name = N'wrkref';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Original work reference detail for cancelled pick.  Together with the cancellation group, this uniquely identifies the record.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'canpck', @level2type = N'COLUMN', @level2name = N'wrkref_dtl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warehouse ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'canpck', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If pick is associated to an order, this will have the value of the shipment line ID that is satisfied by this pick.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'canpck', @level2type = N'COLUMN', @level2name = N'ship_line_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If pick is associated to an order, this is the shipment ID which requires this pick.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'canpck', @level2type = N'COLUMN', @level2name = N'ship_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If associated to an order, this is the order number which requires this pick.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'canpck', @level2type = N'COLUMN', @level2name = N'ordnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If associated to an order, this is the order line which requires this pick.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'canpck', @level2type = N'COLUMN', @level2name = N'ordlin';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If associated to an order, this is the order sub-line which requires this pick.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'canpck', @level2type = N'COLUMN', @level2name = N'ordsln';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Multiple picks may be tied together via a single combination code.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'canpck', @level2type = N'COLUMN', @level2name = N'cmbcod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Pick works grouped in the same label batch will all share the same lblbat value.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'canpck', @level2type = N'COLUMN', @level2name = N'lblbat';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Sequence used to order label printing.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'canpck', @level2type = N'COLUMN', @level2name = N'lblseq';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The device code that should be used when printing labels for this pick.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'canpck', @level2type = N'COLUMN', @level2name = N'devcod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The amount of product to pick.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'canpck', @level2type = N'COLUMN', @level2name = N'pckqty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The catch quantity to pick.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'canpck', @level2type = N'COLUMN', @level2name = N'pck_catch_qty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The amount of product applied against this pick.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'canpck', @level2type = N'COLUMN', @level2name = N'appqty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The catch quantity applied to this pick.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'canpck', @level2type = N'COLUMN', @level2name = N'app_catch_qty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Supplier Number: The Supplier number specific to pick.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'canpck', @level2type = N'COLUMN', @level2name = N'supnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'An allocation rule name linking to the alloc_rule table.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'canpck', @level2type = N'COLUMN', @level2name = N'rule_nam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The type of pick: L = Pallet pick, S = case pick, D = piece pick', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'canpck', @level2type = N'COLUMN', @level2name = N'lodlvl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This field is not currently utilized by standard processing.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'canpck', @level2type = N'COLUMN', @level2name = N'lodnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'For a cartonized kit, this field will indicate the label that will be applied to the completed kit.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'canpck', @level2type = N'COLUMN', @level2name = N'subnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This field is not currently utilized by standard processing.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'canpck', @level2type = N'COLUMN', @level2name = N'dtlnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This field is not used by standard system processing.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'canpck', @level2type = N'COLUMN', @level2name = N'visflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Confirm location on pickup.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'canpck', @level2type = N'COLUMN', @level2name = N'locflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Confirm load number on pickup.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'canpck', @level2type = N'COLUMN', @level2name = N'lodflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Confirm case identifier on pickup.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'canpck', @level2type = N'COLUMN', @level2name = N'subflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Confirm piece identifier on pickup.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'canpck', @level2type = N'COLUMN', @level2name = N'dtlflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Confirm item number on pickup.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'canpck', @level2type = N'COLUMN', @level2name = N'prtflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Confirm origin code on pickup.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'canpck', @level2type = N'COLUMN', @level2name = N'orgflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Confirm revision level on pickup.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'canpck', @level2type = N'COLUMN', @level2name = N'revflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Confirm Supplier number on pickup.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'canpck', @level2type = N'COLUMN', @level2name = N'supflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Confirm lot number on pickup.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'canpck', @level2type = N'COLUMN', @level2name = N'lotflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Confirm pick quantity on pickup.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'canpck', @level2type = N'COLUMN', @level2name = N'qtyflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Confirm catch quantity on pickup.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'canpck', @level2type = N'COLUMN', @level2name = N'catch_qty_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date/time that pick was confirmed.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'canpck', @level2type = N'COLUMN', @level2name = N'pckdte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Cancel code that was used to cancel the pick.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'canpck', @level2type = N'COLUMN', @level2name = N'cancod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The difference between the pckqty and the appqty at the time the pick was cancelled.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'canpck', @level2type = N'COLUMN', @level2name = N'remqty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If for a work order, this will indicate which work order number.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'canpck', @level2type = N'COLUMN', @level2name = N'wkonum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicates if the pick is a pre-inventory pick where the pick work exists before the inventory is delivered to the location.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'canpck', @level2type = N'COLUMN', @level2name = N'pipflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'List ID- Identifies the list_id to which the pick had been assigned.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'canpck', @level2type = N'COLUMN', @level2name = N'list_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'List Sequence - The sequence the pick fell in the list.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'canpck', @level2type = N'COLUMN', @level2name = N'list_seqnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Labor Estimate (Seconds)', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'canpck', @level2type = N'COLUMN', @level2name = N'lm_goal_seconds';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Asset Type - Asset type associated with this pick. But system will NOT force user to Pick the particular Asset type on the table.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'canpck', @level2type = N'COLUMN', @level2name = N'asset_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'When Un-Assign Flag is checked, the pick has been un-assigned.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'canpck', @level2type = N'COLUMN', @level2name = N'unassign_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Pallet identifier as sent from PalletCtl.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'canpck', @level2type = N'COLUMN', @level2name = N'pallet_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Concatenated Pallet Position/Pallet Stack Number as sent from PalletCtl.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'canpck', @level2type = N'COLUMN', @level2name = N'pallet_pos';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Represents where in the loading sequence order that the pallet should be loaded as sent from PalletCtl.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'canpck', @level2type = N'COLUMN', @level2name = N'pallet_load_seq';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'UOM set according to pckqty when created in allocating inventory. Represents at which UOM level shoud user pick the inventory.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'canpck', @level2type = N'COLUMN', @level2name = N'pck_uom';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'pick status when ''process cancel pick'' was called.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'canpck', @level2type = N'COLUMN', @level2name = N'wcs_can_pcksts';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'timestamp of when ''process cancel pick'' was called.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'canpck', @level2type = N'COLUMN', @level2name = N'wcs_can_req_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'timestamp of when ''process cancel pick'' was confirmed.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'canpck', @level2type = N'COLUMN', @level2name = N'wcs_can_conf_dt';

