CREATE TABLE [dbo].[rplwrk] (
    [rplref]           NVARCHAR (10)   NOT NULL,
    [wh_id]            NVARCHAR (32)   NOT NULL,
    [parref]           NVARCHAR (10)   NULL,
    [schbat]           NVARCHAR (32)   NULL,
    [ship_line_id]     NVARCHAR (10)   NULL,
    [dstare]           NVARCHAR (10)   NULL,
    [dstloc]           NVARCHAR (20)   NULL,
    [ship_id]          NVARCHAR (30)   NULL,
    [waybil]           NVARCHAR (20)   NULL,
    [stcust]           NVARCHAR (20)   NULL,
    [rtcust]           NVARCHAR (20)   NULL,
    [concod]           NVARCHAR (10)   NULL,
    [cmbcod]           NVARCHAR (10)   NULL,
    [rplcnt]           INT             NOT NULL,
    [pckqty]           INT             NOT NULL,
    [pck_catch_qty]    NUMERIC (19, 4) NULL,
    [alcqty]           INT             NOT NULL,
    [alc_catch_qty]    NUMERIC (19, 4) NULL,
    [untcas]           INT             NOT NULL,
    [untpak]           INT             NOT NULL,
    [rplsts]           NVARCHAR (1)    NOT NULL,
    [prtnum]           NVARCHAR (50)   NOT NULL,
    [prt_client_id]    NVARCHAR (32)   NOT NULL,
    [supnum]           NVARCHAR (32)   NULL,
    [rule_nam]         NVARCHAR (20)   NULL,
    [invsts]           NVARCHAR (4)    NULL,
    [invsts_prg]       NVARCHAR (4)    NOT NULL,
    [lodlvl]           NVARCHAR (1)    NULL,
    [pcksts]           NVARCHAR (1)    NOT NULL,
    [adddte]           DATETIME        NULL,
    [pckdte]           DATETIME        NULL,
    [alcdte]           DATETIME        NULL,
    [mod_usr_id]       NVARCHAR (40)   NULL,
    [rplmsg]           NVARCHAR (100)  NULL,
    [splflg]           INT             DEFAULT ((1)) NULL,
    [frsflg]           INT             NULL,
    [wkonum]           NVARCHAR (20)   NULL,
    [wkorev]           NVARCHAR (10)   NULL,
    [wkolin]           NVARCHAR (10)   NULL,
    [client_id]        NVARCHAR (32)   NULL,
    [ordnum]           NVARCHAR (35)   NULL,
    [ordlin]           NVARCHAR (10)   NULL,
    [ordsln]           NVARCHAR (10)   NULL,
    [min_shelf_hrs]    INT             NULL,
    [pallet_id]        NVARCHAR (30)   NULL,
    [pallet_pos]       NVARCHAR (8)    NULL,
    [pallet_load_seq]  INT             NULL,
    [pltctl_lodlvl]    NVARCHAR (1)    NULL,
    [list_id]          NVARCHAR (15)   NULL,
    [list_seqnum]      INT             NULL,
    [ftpcod]           NVARCHAR (30)   NULL,
    [pltctl_repln_flg] INT             DEFAULT ((1)) NULL,
    CONSTRAINT [rplwrk_pk] PRIMARY KEY CLUSTERED ([rplref] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [rplwrk_frsflg_ck] CHECK ([frsflg]=(0) OR [frsflg]=(1)),
    CONSTRAINT [rplwrk_pltctl_ck] CHECK ([pltctl_repln_flg]=(0) OR [pltctl_repln_flg]=(1)),
    CONSTRAINT [rplwrk_splflg_ck] CHECK ([splflg]=(0) OR [splflg]=(1))
);


GO
CREATE NONCLUSTERED INDEX [rplwrk_idx1]
    ON [dbo].[rplwrk]([parref] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [rplwrk_idx2]
    ON [dbo].[rplwrk]([ship_line_id] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [rplwrk_wh_id]
    ON [dbo].[rplwrk]([wh_id] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [rplwrk_wko]
    ON [dbo].[rplwrk]([wkonum] ASC, [wkorev] ASC, [wkolin] ASC, [wh_id] ASC, [client_id] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [rplwrk_schbat]
    ON [dbo].[rplwrk]([schbat] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [rplwrk_list_id]
    ON [dbo].[rplwrk]([list_id] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [rplwrk_ship_id]
    ON [dbo].[rplwrk]([ship_id] ASC) WITH (FILLFACTOR = 90);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table contains all emergency replenishment requests', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rplwrk';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The unique identifier', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rplwrk', @level2type = N'COLUMN', @level2name = N'rplref';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warehouse ID - the warehouse in which the inventory is to be received.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rplwrk', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This field is filled in if this replenishment is request is driven by a parent request', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rplwrk', @level2type = N'COLUMN', @level2name = N'parref';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The shipment ID is non-null if this replenishment is needed to satisfy a shipment.  All replenishments with a non-null ship_id should have a null parref', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rplwrk', @level2type = N'COLUMN', @level2name = N'ship_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The number of attempts made to satisfy this replenishment.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rplwrk', @level2type = N'COLUMN', @level2name = N'rplcnt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Valid status values are: I=issued, D=pending deposit, A=pending allocation, H=Failed to allocate 2nd hop location, E=expired, F=failed to allocate inventory, S=failed to allocate storage loc, W=waiting for WO to build, X=pending xdck', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rplwrk', @level2type = N'COLUMN', @level2name = N'rplsts';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Supplier Number: Supplier number specific to the pick.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rplwrk', @level2type = N'COLUMN', @level2name = N'supnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'An allocation rule name linking to the alloc_rule table.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rplwrk', @level2type = N'COLUMN', @level2name = N'rule_nam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Last attempted allocation date.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rplwrk', @level2type = N'COLUMN', @level2name = N'alcdte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The work order number (and correlated fields) is non-null if this replenishment is needed to satisfy a work order line', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rplwrk', @level2type = N'COLUMN', @level2name = N'wkonum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Pallet identifier as sent from PalletCtl.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rplwrk', @level2type = N'COLUMN', @level2name = N'pallet_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Concatenated Pallet Position/Pallet Stack Number as sent from PalletCtl.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rplwrk', @level2type = N'COLUMN', @level2name = N'pallet_pos';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Represents where in the loading sequence order that the pallet should be loaded as sent from PalletCtl.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rplwrk', @level2type = N'COLUMN', @level2name = N'pallet_load_seq';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Denotes the lodlvl in which we sent the replenishment quantity over to PalletCtl.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rplwrk', @level2type = N'COLUMN', @level2name = N'pltctl_lodlvl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'List ID- List_id the pick had been assigned to.It will be updated when reallocation of a cancelled pick belonging to a list creates shorts.It helps identify pick exceptions for list pick created for either Pallet Control or BTO.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rplwrk', @level2type = N'COLUMN', @level2name = N'list_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'List Sequence - The sequence the pick fell in the list.This field will be updated when reallocation of a cancelled pick which belongs to a list pick creates shorts.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rplwrk', @level2type = N'COLUMN', @level2name = N'list_seqnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Footprint specified on order line or work order detail for emergency replenishment, footprint from replenishment configuration for other replenishment.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rplwrk', @level2type = N'COLUMN', @level2name = N'ftpcod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Marks the rplwrk for replanning on a resend to palletctl.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rplwrk', @level2type = N'COLUMN', @level2name = N'pltctl_repln_flg';

