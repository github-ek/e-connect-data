CREATE TABLE [dbo].[pckwrk_dtl] (
    [wrkref_dtl]       NVARCHAR (15)   NOT NULL,
    [wrkref]           NVARCHAR (12)   NOT NULL,
    [cmbcod]           NVARCHAR (10)   NOT NULL,
    [wh_id]            NVARCHAR (32)   NOT NULL,
    [client_id]        NVARCHAR (32)   NULL,
    [dstloc]           NVARCHAR (20)   NULL,
    [dstare]           NVARCHAR (10)   NULL,
    [ship_line_id]     NVARCHAR (10)   NULL,
    [ship_id]          NVARCHAR (30)   NULL,
    [ordnum]           NVARCHAR (35)   NULL,
    [ordlin]           NVARCHAR (10)   NULL,
    [ordsln]           NVARCHAR (10)   NULL,
    [stcust]           NVARCHAR (20)   NULL,
    [rtcust]           NVARCHAR (20)   NULL,
    [concod]           NVARCHAR (10)   NOT NULL,
    [pckqty]           INT             NOT NULL,
    [pck_catch_qty]    NUMERIC (19, 4) NULL,
    [appqty]           INT             NOT NULL,
    [app_catch_qty]    NUMERIC (19, 4) NULL,
    [lodlvl]           NVARCHAR (1)    NOT NULL,
    [ship_ctncod]      NVARCHAR (4)    NULL,
    [ship_ctnnum]      NVARCHAR (30)   NULL,
    [wkonum]           NVARCHAR (20)   NULL,
    [wkorev]           NVARCHAR (10)   NULL,
    [wkolin]           NVARCHAR (10)   NULL,
    [subnum]           NVARCHAR (30)   NULL,
    [dtlnum]           NVARCHAR (30)   NULL,
    [subucc]           NVARCHAR (20)   NULL,
    [subtag]           NVARCHAR (40)   NULL,
    [cur_cas]          INT             NULL,
    [tot_cas_cnt]      INT             NULL,
    [prtdte]           DATETIME        NULL,
    [bto_seqnum]       NVARCHAR (20)   NULL,
    [slot]             NVARCHAR (10)   NULL,
    [bto_dlv_seq]      NVARCHAR (30)   NULL,
    [lm_goal_seconds]  INT             NULL,
    [lm_assign_num]    NVARCHAR (15)   NULL,
    [lm_assign_seqnum] INT             NULL,
    [pm_err_cod]       INT             NULL,
    [pm_err_desc]      NVARCHAR (2000) NULL,
    [ctnerr_flg]       INT             DEFAULT ((0)) NOT NULL,
    [ins_dt]           DATETIME        NULL,
    [last_upd_dt]      DATETIME        NULL,
    [ins_user_id]      NVARCHAR (40)   NULL,
    [last_upd_user_id] NVARCHAR (40)   NULL,
    [rowid]            INT             IDENTITY (1, 1) NOT NULL,
    CONSTRAINT [pckwrk_dtl_pk] PRIMARY KEY CLUSTERED ([wrkref_dtl] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [pckwrk_dtl_ctnerrflgck] CHECK ([ctnerr_flg]=(0) OR [ctnerr_flg]=(1))
);


GO
CREATE NONCLUSTERED INDEX [pckwrk_dtl_idx2]
    ON [dbo].[pckwrk_dtl]([cmbcod] ASC, [pckqty] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [pckwrk_dtl_idx3]
    ON [dbo].[pckwrk_dtl]([ship_line_id] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [pckwrk_dtl_idx5]
    ON [dbo].[pckwrk_dtl]([subnum] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [pckwrk_dtl_idx14]
    ON [dbo].[pckwrk_dtl]([ordnum] ASC, [client_id] ASC, [wh_id] ASC, [ordlin] ASC, [ordsln] ASC, [ship_id] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [pckwrk_dtl_idx17]
    ON [dbo].[pckwrk_dtl]([ship_id] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [pckwrk_dtl_idx18]
    ON [dbo].[pckwrk_dtl]([ship_id] ASC, [lodlvl] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [pckwrk_dtl_ord_cli_wh]
    ON [dbo].[pckwrk_dtl]([ordnum] ASC, [client_id] ASC, [wh_id] ASC) WITH (FILLFACTOR = 90);


GO
CREATE UNIQUE NONCLUSTERED INDEX [pckwrk_dtl_rowid]
    ON [dbo].[pckwrk_dtl]([rowid] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [pckwrk_dtl_ship_id]
    ON [dbo].[pckwrk_dtl]([ship_id] ASC, [cmbcod] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [pckwrk_dtl_subtag]
    ON [dbo].[pckwrk_dtl]([subtag] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [pckwrk_dtl_subucc]
    ON [dbo].[pckwrk_dtl]([subucc] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [pckwrk_dtl_wrkref]
    ON [dbo].[pckwrk_dtl]([wrkref] ASC) WITH (FILLFACTOR = 90);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table is added to support one pick for multiple shipment lines. The shipment and deposit related information are moved from the original pckwrk table to this new table.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_dtl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This uniquely identifies a single record on the pick work detail table. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_dtl', @level2type = N'COLUMN', @level2name = N'wrkref_dtl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This uniquely parent identifies of record. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_dtl', @level2type = N'COLUMN', @level2name = N'wrkref';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Multiple picks may be tied together via a single combination code.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_dtl', @level2type = N'COLUMN', @level2name = N'cmbcod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warehouse ID - the warehouse in which the inventory is to be received.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_dtl', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Client ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_dtl', @level2type = N'COLUMN', @level2name = N'client_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The destination location for depositing the inventory, trailer or whatever entity the work is designed to accomplish.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_dtl', @level2type = N'COLUMN', @level2name = N'dstloc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Destination Area - Area code to which the inventory for this order line will be staged.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_dtl', @level2type = N'COLUMN', @level2name = N'dstare';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If pick is associated to an order, this will have the value of the shipment line ID that is satisfied by this pick.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_dtl', @level2type = N'COLUMN', @level2name = N'ship_line_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If pick is associated to an order, this is the shipment ID which requires this pick.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_dtl', @level2type = N'COLUMN', @level2name = N'ship_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If associated to an order, this is the order number which requires this pick.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_dtl', @level2type = N'COLUMN', @level2name = N'ordnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If associated to an order, this is the order line which requires this pick.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_dtl', @level2type = N'COLUMN', @level2name = N'ordlin';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If associated to an order, this is the order sub-line which requires this pick.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_dtl', @level2type = N'COLUMN', @level2name = N'ordsln';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Ship-To Customer - The customer to which this order will be ultimately be shipped.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_dtl', @level2type = N'COLUMN', @level2name = N'stcust';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Route-To Customer - The customer to which this order will be shipped.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_dtl', @level2type = N'COLUMN', @level2name = N'rtcust';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Consolidation Code', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_dtl', @level2type = N'COLUMN', @level2name = N'concod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The amount of product to pick.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_dtl', @level2type = N'COLUMN', @level2name = N'pckqty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The catch quantity to pick.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_dtl', @level2type = N'COLUMN', @level2name = N'pck_catch_qty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The amount of product applied against this pick.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_dtl', @level2type = N'COLUMN', @level2name = N'appqty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The catch quantity already applied.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_dtl', @level2type = N'COLUMN', @level2name = N'app_catch_qty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The type of pick: L = Pallet pick, S = case pick, D = piece pick', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_dtl', @level2type = N'COLUMN', @level2name = N'lodlvl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Shipping Carton Code', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_dtl', @level2type = N'COLUMN', @level2name = N'ship_ctncod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Shipping Carton Number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_dtl', @level2type = N'COLUMN', @level2name = N'ship_ctnnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If for a work order, this will indicate which work order number.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_dtl', @level2type = N'COLUMN', @level2name = N'wkonum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Work Order Revision', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_dtl', @level2type = N'COLUMN', @level2name = N'wkorev';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Work Order Line', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_dtl', @level2type = N'COLUMN', @level2name = N'wkolin';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'For a cartonized kit, this field will indicate the label that will be applied to the completed kit.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_dtl', @level2type = N'COLUMN', @level2name = N'subnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This field is not currently utilized by standard processing.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_dtl', @level2type = N'COLUMN', @level2name = N'dtlnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Subload UCC code number.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_dtl', @level2type = N'COLUMN', @level2name = N'subucc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Sub-Load Tag - used to define the RFID tag value for case pick', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_dtl', @level2type = N'COLUMN', @level2name = N'subtag';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Current case number to use in 1-of labeling', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_dtl', @level2type = N'COLUMN', @level2name = N'cur_cas';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Total case count for use in 1-of labeling', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_dtl', @level2type = N'COLUMN', @level2name = N'tot_cas_cnt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date pick was printed', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_dtl', @level2type = N'COLUMN', @level2name = N'prtdte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This field represents the sequence that the line will be picked as determined by the Build to Order system.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_dtl', @level2type = N'COLUMN', @level2name = N'bto_seqnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'When using BTO, the user is directed to place the inventory for this order line into this slot. The slot is determined by the Build to Order system.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_dtl', @level2type = N'COLUMN', @level2name = N'slot';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The delivery sequence will be used for sorting the list and comes from the order line.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_dtl', @level2type = N'COLUMN', @level2name = N'bto_dlv_seq';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Labor Estimate (Seconds)', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_dtl', @level2type = N'COLUMN', @level2name = N'lm_goal_seconds';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Labor Assignment Number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_dtl', @level2type = N'COLUMN', @level2name = N'lm_assign_num';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Labor Assignment Sequence Number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_dtl', @level2type = N'COLUMN', @level2name = N'lm_assign_seqnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Contains the error code if pre-manifesting was performed for the pick and failed.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_dtl', @level2type = N'COLUMN', @level2name = N'pm_err_cod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Contains the error description if pre-manifesting was performed for the pick and failed.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_dtl', @level2type = N'COLUMN', @level2name = N'pm_err_desc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Cartonization Error Flag - specifies whether the picks are failed to cartonize or not. Picks that fail to cartonize will have error flag as true.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_dtl', @level2type = N'COLUMN', @level2name = N'ctnerr_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date the row was inserted.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_dtl', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date the row was last updated.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_dtl', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User id of the person who created the row.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_dtl', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_dtl', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

