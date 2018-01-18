CREATE TABLE [dbo].[ord_line] (
    [client_id]         NVARCHAR (32)   NOT NULL,
    [ordnum]            NVARCHAR (35)   NOT NULL,
    [ordlin]            NVARCHAR (10)   NOT NULL,
    [ordsln]            NVARCHAR (10)   NOT NULL,
    [wh_id]             NVARCHAR (32)   NOT NULL,
    [prt_client_id]     NVARCHAR (32)   NULL,
    [prtnum]            NVARCHAR (50)   NULL,
    [rule_nam]          NVARCHAR (20)   NULL,
    [supnum]            NVARCHAR (32)   NULL,
    [cooinc]            NVARCHAR (1)    NULL,
    [coolst]            NVARCHAR (24)   NULL,
    [dstare]            NVARCHAR (10)   NULL,
    [dstloc]            NVARCHAR (20)   NULL,
    [rsvpri]            NVARCHAR (1)    NOT NULL,
    [host_ordqty]       INT             NULL,
    [ordqty]            INT             NOT NULL,
    [rsvqty]            INT             NOT NULL,
    [pckqty]            INT             NOT NULL,
    [shpqty]            INT             NULL,
    [ovramt]            INT             NULL,
    [ovrcod]            NVARCHAR (4)    NULL,
    [marcod]            NVARCHAR (2)    NULL,
    [parflg]            INT             DEFAULT ((1)) NULL,
    [ovaflg]            INT             NULL,
    [ovpflg]            INT             NULL,
    [rpqflg]            INT             NULL,
    [splflg]            INT             DEFAULT ((1)) NULL,
    [stdflg]            INT             DEFAULT ((0)) NULL,
    [bckflg]            INT             DEFAULT ((1)) NULL,
    [prcpri]            NVARCHAR (1)    NOT NULL,
    [frtcod]            NVARCHAR (6)    NULL,
    [cargrp]            NVARCHAR (10)   NULL,
    [carcod]            NVARCHAR (10)   NULL,
    [srvlvl]            NVARCHAR (10)   NULL,
    [sddflg]            INT             NULL,
    [entdte]            DATETIME        NOT NULL,
    [sales_ordnum]      NVARCHAR (35)   NULL,
    [sales_ordlin]      NVARCHAR (10)   NULL,
    [cstprt]            NVARCHAR (30)   NULL,
    [manfid]            NVARCHAR (10)   NULL,
    [deptno]            NVARCHAR (10)   NULL,
    [accnum]            NVARCHAR (30)   NULL,
    [prjnum]            NVARCHAR (30)   NULL,
    [untcas]            INT             NULL,
    [untpak]            INT             NULL,
    [untpal]            INT             NULL,
    [unt_ins_val]       NUMERIC (19, 4) NULL,
    [rel_val]           NUMERIC (19, 4) NULL,
    [rel_val_unt_typ]   NVARCHAR (30)   NULL,
    [early_shpdte]      DATETIME        NULL,
    [late_shpdte]       DATETIME        NULL,
    [early_dlvdte]      DATETIME        NULL,
    [late_dlvdte]       DATETIME        NULL,
    [ordinv]            NVARCHAR (30)   NULL,
    [xdkflg]            INT             DEFAULT ((0)) NULL,
    [edtflg]            INT             NULL,
    [atoflg]            INT             NULL,
    [pckgr1]            NVARCHAR (20)   NULL,
    [pckgr2]            NVARCHAR (20)   NULL,
    [pckgr3]            NVARCHAR (20)   NULL,
    [pckgr4]            NVARCHAR (20)   NULL,
    [frsflg]            INT             NULL,
    [invsts_prg]        NVARCHAR (4)    NULL,
    [min_shelf_hrs]     INT             NULL,
    [non_alc_flg]       INT             DEFAULT ((0)) NULL,
    [tms_ord_stat]      NVARCHAR (1)    NULL,
    [tms_snt_flg]       INT             DEFAULT ((0)) NULL,
    [tms_dte_snt]       DATETIME        NULL,
    [unt_price]         NUMERIC (19, 4) NULL,
    [wave_set]          NVARCHAR (10)   NULL,
    [crncy_name]        NVARCHAR (20)   NULL,
    [equip_res_scp]     NVARCHAR (40)   NULL,
    [tot_pln_wgt]       NUMERIC (19, 4) NULL,
    [tot_pln_cube]      NUMERIC (19, 4) NULL,
    [tot_pln_misc_qty]  NUMERIC (19, 4) NULL,
    [tot_pln_pal_qty]   NUMERIC (19, 4) NULL,
    [tot_pln_cas_qty]   NUMERIC (19, 4) NULL,
    [tot_pln_misc2_qty] NUMERIC (19, 4) NULL,
    [appt_dte]          DATETIME        NULL,
    [tms_pln_sts]       NVARCHAR (40)   NULL,
    [crncy_code]        NVARCHAR (4)    NULL,
    [distro_id]         NVARCHAR (35)   NULL,
    [est_time]          INT             NULL,
    [sf_adr_id]         NVARCHAR (20)   NULL,
    [st_adr_id]         NVARCHAR (20)   NULL,
    [rt_adr_id]         NVARCHAR (20)   NULL,
    [moddte]            DATETIME        NULL,
    [mod_usr_id]        NVARCHAR (40)   NULL,
    [alc_search_path]   NVARCHAR (20)   NULL,
    [bto_comcod]        NVARCHAR (30)   NULL,
    [explicnum]         NVARCHAR (40)   NULL,
    [explicexpdte]      DATETIME        NULL,
    [explicexcpt]       NVARCHAR (40)   NULL,
    [implicnum]         NVARCHAR (40)   NULL,
    [implicexpdte]      DATETIME        NULL,
    [implicexcpt]       NVARCHAR (40)   NULL,
    [eccn]              NVARCHAR (40)   NULL,
    [sedflg]            INT             NULL,
    [cootyp]            NVARCHAR (40)   NULL,
    [coonum]            NVARCHAR (40)   NULL,
    [naftabegdte]       DATETIME        NULL,
    [naftaenddte]       DATETIME        NULL,
    [tradeagreetyp]     NVARCHAR (40)   NULL,
    [marksnumbers]      NVARCHAR (100)  NULL,
    [nafta_pref_crit]   NVARCHAR (1)    NULL,
    [nafta_producer]    NVARCHAR (3)    NULL,
    [sed_export_typ]    NVARCHAR (1)    NULL,
    [bto_dlv_seq]       NVARCHAR (30)   NULL,
    [bto_station]       NVARCHAR (30)   NULL,
    [bto_side]          NVARCHAR (30)   NULL,
    [bto_bay]           NVARCHAR (30)   NULL,
    [ftpcod]            NVARCHAR (30)   NULL,
    [abs_ordinv_win]    INT             NULL,
    [abs_ordinv_code]   NVARCHAR (4)    NULL,
    [export_typ]        NVARCHAR (40)   NULL,
    [paytrm]            NVARCHAR (30)   NULL,
    [super_rule_nam]    NVARCHAR (20)   NULL,
    [aut_gen_flg]       INT             NULL,
    [org_distro_id]     NVARCHAR (35)   NULL,
    [asset_typ]         NVARCHAR (30)   NULL,
    [load_attr1_cfg]    NVARCHAR (1)    NULL,
    [load_attr2_cfg]    NVARCHAR (1)    NULL,
    [load_attr3_cfg]    NVARCHAR (1)    NULL,
    [load_attr4_cfg]    NVARCHAR (1)    NULL,
    [load_attr5_cfg]    NVARCHAR (1)    NULL,
    [ordlin_chg_reacod] NVARCHAR (20)   NULL,
    [reacod_cmnt]       NVARCHAR (240)  NULL,
    [cancelled_flg]     INT             DEFAULT ((0)) NOT NULL,
    CONSTRAINT [ord_line_pk] PRIMARY KEY CLUSTERED ([ordnum] ASC, [ordlin] ASC, [ordsln] ASC, [wh_id] ASC, [client_id] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [ord_line_atoflg_ck] CHECK ([atoflg]=(0) OR [atoflg]=(1)),
    CONSTRAINT [ord_line_bckflg_ck] CHECK ([bckflg]=(0) OR [bckflg]=(1)),
    CONSTRAINT [ord_line_edtflg_ck] CHECK ([edtflg]=(0) OR [edtflg]=(1)),
    CONSTRAINT [ord_line_frsflg_ck] CHECK ([frsflg]=(0) OR [frsflg]=(1)),
    CONSTRAINT [ord_line_ovaflg_ck] CHECK ([ovaflg]=(0) OR [ovaflg]=(1)),
    CONSTRAINT [ord_line_ovpflg_ck] CHECK ([ovpflg]=(0) OR [ovpflg]=(1)),
    CONSTRAINT [ord_line_parflg_ck] CHECK ([parflg]=(0) OR [parflg]=(1)),
    CONSTRAINT [ord_line_rpqflg_ck] CHECK ([rpqflg]=(0) OR [rpqflg]=(1)),
    CONSTRAINT [ord_line_sddflg_ck] CHECK ([sddflg]=(0) OR [sddflg]=(1)),
    CONSTRAINT [ord_line_splflg_ck] CHECK ([splflg]=(0) OR [splflg]=(1)),
    CONSTRAINT [ord_line_stdflg_ck] CHECK ([stdflg]=(0) OR [stdflg]=(1)),
    CONSTRAINT [ord_line_xdkflg_ck] CHECK ([xdkflg]=(0) OR [xdkflg]=(1)),
    CONSTRAINT [ordlin_autgenflg_ck] CHECK ([aut_gen_flg]=(0) OR [aut_gen_flg]=(1)),
    CONSTRAINT [ordlin_cancelflgck] CHECK ([cancelled_flg]=(0) OR [cancelled_flg]=(1)),
    CONSTRAINT [ordlin_nonalcflgck] CHECK ([non_alc_flg]=(0) OR [non_alc_flg]=(1)),
    CONSTRAINT [ordlin_sedflg_ck] CHECK ([sedflg]=(0) OR [sedflg]=(1)),
    CONSTRAINT [ordlin_tmssntflgck] CHECK ([tms_snt_flg]=(0) OR [tms_snt_flg]=(1))
);


GO
CREATE NONCLUSTERED INDEX [ord_line_idx1]
    ON [dbo].[ord_line]([ordlin] ASC, [wh_id] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [ord_line_prt]
    ON [dbo].[ord_line]([prtnum] ASC, [wh_id] ASC, [prt_client_id] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [ord_line_wh_id]
    ON [dbo].[ord_line]([wh_id] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [ord_line_distro_id]
    ON [dbo].[ord_line]([distro_id] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [ord_line_wv_client]
    ON [dbo].[ord_line]([wave_set] ASC, [client_id] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [ord_line_carcod]
    ON [dbo].[ord_line]([carcod] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [ord_line_dstare]
    ON [dbo].[ord_line]([dstare] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [ord_line_export_typ]
    ON [dbo].[ord_line]([export_typ] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [ord_line_paytrm]
    ON [dbo].[ord_line]([paytrm] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [ord_line_srvlvl]
    ON [dbo].[ord_line]([srvlvl] ASC) WITH (FILLFACTOR = 90);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The order line table is used to plan and allocate inventory into shipments.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord_line';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Client ID - The client code that owns this order line.  In a non-3PL system, this value defaults to ''----''.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord_line', @level2type = N'COLUMN', @level2name = N'client_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Order Number - A number which identifies the order to the system.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord_line', @level2type = N'COLUMN', @level2name = N'ordnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Order Line Number - A number which identifies the order line within the order.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord_line', @level2type = N'COLUMN', @level2name = N'ordlin';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Order Sub-Line Number - A number which identifies the subline of the order line. Sublines are used to force the system to ship like quantities or complete quantities of all sublines within the order line, similarly to married codes.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord_line', @level2type = N'COLUMN', @level2name = N'ordsln';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warehouse ID - the warehouse in which the order is to be fulfilled', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord_line', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Item Client ID - The client code for the item that is ordered.  In a non-3PL system, this value defaults to ''----''.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord_line', @level2type = N'COLUMN', @level2name = N'prt_client_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Item Number - Identifier for the item, or SKU that is ordered.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord_line', @level2type = N'COLUMN', @level2name = N'prtnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'An allocation rule name linking the order line to the allocation rule table. The allocation rule specifies a set of attributes.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord_line', @level2type = N'COLUMN', @level2name = N'rule_nam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Supplier Number: The supplier that may be specifically requested to fulfill this order', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord_line', @level2type = N'COLUMN', @level2name = N'supnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Obsolete', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord_line', @level2type = N'COLUMN', @level2name = N'cooinc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Obsolete', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord_line', @level2type = N'COLUMN', @level2name = N'coolst';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Destination Area - Area code to which the inventory for this order line will be staged.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord_line', @level2type = N'COLUMN', @level2name = N'dstare';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Destination Location - Staging location to which the inventory for this order line will be staged.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord_line', @level2type = N'COLUMN', @level2name = N'dstloc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Reservation Priority - Code used to determine which order lines will receive inv. when there is not enough inv. in the whse to satisfy all order lines. This code is only used by the system when Reservation Processing is installed.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord_line', @level2type = N'COLUMN', @level2name = N'rsvpri';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Host Ordered Quantity - quantity required by the host system for this order line.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord_line', @level2type = N'COLUMN', @level2name = N'host_ordqty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Order Quantity - quantity required for this order line.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord_line', @level2type = N'COLUMN', @level2name = N'ordqty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Reservation Quantity - quantity that will be planned into a shipment for this order line.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord_line', @level2type = N'COLUMN', @level2name = N'rsvqty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Pick Quantity - quantity that will be planned into a shipment for this order line.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord_line', @level2type = N'COLUMN', @level2name = N'pckqty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Shipped Quantity - quantity that was shipped for this order line.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord_line', @level2type = N'COLUMN', @level2name = N'shpqty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Over-Allocation Amount - Total quantity that can be allocated when the over allocation code is Quantity, or percentage of inventory that can be allocated when the over allocation code is Percentage.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord_line', @level2type = N'COLUMN', @level2name = N'ovramt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Over-Allocation Code - Choice determines whether the system will over allocate by Quantity or percentage.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord_line', @level2type = N'COLUMN', @level2name = N'ovrcod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Married Code - Multiple order lines with the same married code value will be forced by the system to ship like quantities (if the partial flag is set) or complete quantities.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord_line', @level2type = N'COLUMN', @level2name = N'marcod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Allow Partial Shipment Flag - Determines whether or not the order line can ship short.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord_line', @level2type = N'COLUMN', @level2name = N'parflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Obsolete', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord_line', @level2type = N'COLUMN', @level2name = N'ovaflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Obsolete', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord_line', @level2type = N'COLUMN', @level2name = N'ovpflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Round Up Pick Quantity - Determines whether or not the system should round up the quantity allocated for this order line to a full case or a full pallet when allocated.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord_line', @level2type = N'COLUMN', @level2name = N'rpqflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Split Case Flag - Determines whether or not the system can allocate partial case quantities for this order line.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord_line', @level2type = N'COLUMN', @level2name = N'splflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Standard Case Flag - Determines whether or not the system can allocate non-standard (different from the standard footprint) case quantities for this order line.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord_line', @level2type = N'COLUMN', @level2name = N'stdflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Back Order Flag - Determines whether or not the system shall reapply any unshipped qty to this order line after a portion of it has been allocated and shipped. The order line could then be replanned and allocated for the remaining qty', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord_line', @level2type = N'COLUMN', @level2name = N'bckflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Processing Priority - When multiple order lines are waiting to be satisfied by cross docked inv., the system uses this value to determine which order lines will get the inv. Valid values are ''1'' - ''9'' with ''1'' being the highest priority.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord_line', @level2type = N'COLUMN', @level2name = N'prcpri';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Freight Code - Code used in shipping paperwork to determine who takes financial responsibility for the shipment during transport. Options include FOB Source and FOB DEstination.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord_line', @level2type = N'COLUMN', @level2name = N'frtcod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Carrier Group - Code that identifies the group of orders from which the user can select a carrier. If no carrier group is entered, the user can select from all listed carriers.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord_line', @level2type = N'COLUMN', @level2name = N'cargrp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Carrier Code - Code that identifies the carrier that will ship the order.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord_line', @level2type = N'COLUMN', @level2name = N'carcod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Service Level - Code that identifies the service level of the carrier that will be used to ship the order.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord_line', @level2type = N'COLUMN', @level2name = N'srvlvl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Saturday Delivery Flag - Flag that determines whether or not this order can be delivered on a Saturday.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord_line', @level2type = N'COLUMN', @level2name = N'sddflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Entered Date - date this order was entered into the host system.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord_line', @level2type = N'COLUMN', @level2name = N'entdte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Sales Order Number - Order number associated with this order on the host system.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord_line', @level2type = N'COLUMN', @level2name = N'sales_ordnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Sales Order Line Number - Order line number associated with this order line on the host system.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord_line', @level2type = N'COLUMN', @level2name = N'sales_ordlin';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Customer Item Number - Customer''s identifier for the item. This is the value that will be printed on standard shipping labels.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord_line', @level2type = N'COLUMN', @level2name = N'cstprt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Manufacturer''s ID - Used by the UCC128 processing to create a unique identifier for cartons picked for this order line.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord_line', @level2type = N'COLUMN', @level2name = N'manfid';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Department Number - customer''s department number.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord_line', @level2type = N'COLUMN', @level2name = N'deptno';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Account Number - customer''s account number.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord_line', @level2type = N'COLUMN', @level2name = N'accnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Project Number - customer''s project number.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord_line', @level2type = N'COLUMN', @level2name = N'prjnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Units per Case - Units per case value required for the ordered inventory. If no units per case value is entered, the system will attempt to find this inventory with any units per case for this order line.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord_line', @level2type = N'COLUMN', @level2name = N'untcas';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Units per Inner Pack - Units per inner pack value required for the ordered inventory. If no units per pack value is entered, the system will attempt to find this inventory with any units per pack value for this order line.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord_line', @level2type = N'COLUMN', @level2name = N'untpak';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Units per Pallet - Units per pallet value required for the ordered inventory. If no units per pallet value is entered, the system will attempt to find this inventory with any units per pallet for this order line.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord_line', @level2type = N'COLUMN', @level2name = N'untpal';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(TM only) The insurable value of each release value unit.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord_line', @level2type = N'COLUMN', @level2name = N'unt_ins_val';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(TM only) The value for a release value basis, this value can be in any currencies.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord_line', @level2type = N'COLUMN', @level2name = N'rel_val';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(TM only) The unit basis for the release value.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord_line', @level2type = N'COLUMN', @level2name = N'rel_val_unt_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Early Ship Date - First day of the shipment range. The shipment range defines the range of dates during which the shipment must be shipped.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord_line', @level2type = N'COLUMN', @level2name = N'early_shpdte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Late Ship Date - Last day of the shipment range. The shipment range defines the range of dates during which the shipment must be shipped.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord_line', @level2type = N'COLUMN', @level2name = N'late_shpdte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Early Delivery Date - First day of the delivery range. The delivery range defines the range of dates during which the shipment must be delivered.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord_line', @level2type = N'COLUMN', @level2name = N'early_dlvdte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Late Delivery Date - Last day of the delivery range. The delivery range defines the range of dates during which the shipment must be delivered.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord_line', @level2type = N'COLUMN', @level2name = N'late_dlvdte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Location Order By - This value determines how the system will determine which inventory in an area code to allocate for this order line. Examples of possible values include FEFO-ORDER-BY, FIFO-ORDER-BY', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord_line', @level2type = N'COLUMN', @level2name = N'ordinv';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Cross Dock Flag - Determines whether or not the system should wait for the inv. to satisfy this ordlin to be received and cross docked to the shipment staging location. If ordlin is flagged for cross docking, line will not be allocated.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord_line', @level2type = N'COLUMN', @level2name = N'xdkflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Edit Flag - Used by the Integrator system to Refresh order downloads.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord_line', @level2type = N'COLUMN', @level2name = N'edtflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Assemble to Order Flag - currently not used by the system.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord_line', @level2type = N'COLUMN', @level2name = N'atoflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Pick Group 1 - Code used to group orders together during automatic allocation.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord_line', @level2type = N'COLUMN', @level2name = N'pckgr1';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Pick Group 2 - Optional code that can be used for customized processes.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord_line', @level2type = N'COLUMN', @level2name = N'pckgr2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Pick Group 3 - Optional code that can be used for customized processes.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord_line', @level2type = N'COLUMN', @level2name = N'pckgr3';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Pick Group 4 - Optional code that can be used for customized processes.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord_line', @level2type = N'COLUMN', @level2name = N'pckgr4';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Freshness Process Flag - This flag is set if this order line requires freshness processing - that is, that the oldest product shipped is newer than the newest product previously shipped.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord_line', @level2type = N'COLUMN', @level2name = N'frsflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Status Progression - The identifier for a list of valid inventory statuses required when allocating this item for this order line.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord_line', @level2type = N'COLUMN', @level2name = N'invsts_prg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Minimum Shelf Hours - If set, only inventory with an expiration date that is at least this many hours away from expiring will be allocated for this order line.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord_line', @level2type = N'COLUMN', @level2name = N'min_shelf_hrs';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Non-Allocatable Order Line Flag - If set, this order line may be planned into a shipment but will not be allocated during the allocation process.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord_line', @level2type = N'COLUMN', @level2name = N'non_alc_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'TMS order status.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord_line', @level2type = N'COLUMN', @level2name = N'tms_ord_stat';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Sent to TMS flag.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord_line', @level2type = N'COLUMN', @level2name = N'tms_snt_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date Sent to TMS.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord_line', @level2type = N'COLUMN', @level2name = N'tms_dte_snt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Unit Price for the order line.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord_line', @level2type = N'COLUMN', @level2name = N'unt_price';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Wave_set is a unique number representing a wave.  All order lines with the same wave_set are in the same wave.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord_line', @level2type = N'COLUMN', @level2name = N'wave_set';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Currency name is a 3-character currency code.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord_line', @level2type = N'COLUMN', @level2name = N'crncy_name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Scope of equipment restriction, if it applies through out the network or only to origin/destination location of the order line.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord_line', @level2type = N'COLUMN', @level2name = N'equip_res_scp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(TMS Related) Holds the total weight of the pieces on the order line. This value is to be used only for transportation planning purposes. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord_line', @level2type = N'COLUMN', @level2name = N'tot_pln_wgt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(TMS Related) Holds the total cube/volume for the pieces on the order line. This value is to be used only for transporation planning purposes.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord_line', @level2type = N'COLUMN', @level2name = N'tot_pln_cube';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(TMS Related) Total miscellaneous quantity for the order line. This value is to be used only for transportation planning purposes.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord_line', @level2type = N'COLUMN', @level2name = N'tot_pln_misc_qty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(TMS Related) Total number of pallets. This value is to be used only for transportation planning purposes.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord_line', @level2type = N'COLUMN', @level2name = N'tot_pln_pal_qty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(TMS Related) Total number of cases. This value is to be used only for transportation planning purposes.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord_line', @level2type = N'COLUMN', @level2name = N'tot_pln_cas_qty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(TMS Related) Total miscellaneous quantity for the order line. This value is to be used only for transportation planning purposes.  ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord_line', @level2type = N'COLUMN', @level2name = N'tot_pln_misc2_qty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(TMS Related) Appointment Date.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord_line', @level2type = N'COLUMN', @level2name = N'appt_dte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Planning Status - valid values include Nor Ready, Ready to Autostage and Ready to Optimize.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord_line', @level2type = N'COLUMN', @level2name = N'tms_pln_sts';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Currency Code - the currency unit of currency sensitive data.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord_line', @level2type = N'COLUMN', @level2name = N'crncy_code';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Distribution Identifer - The distribution which generated this order line.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord_line', @level2type = N'COLUMN', @level2name = N'distro_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Estimated time to pick the inventory for this order line.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord_line', @level2type = N'COLUMN', @level2name = N'est_time';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Ship-from address id.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord_line', @level2type = N'COLUMN', @level2name = N'sf_adr_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Ship-to address id.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord_line', @level2type = N'COLUMN', @level2name = N'st_adr_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Route-to address id.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord_line', @level2type = N'COLUMN', @level2name = N'rt_adr_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date/time this record was last modified.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord_line', @level2type = N'COLUMN', @level2name = N'moddte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'ID of user that performed last modification.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord_line', @level2type = N'COLUMN', @level2name = N'mod_usr_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Allocation Search Path', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord_line', @level2type = N'COLUMN', @level2name = N'alc_search_path';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'BTO Commodity Code. Build to order provides commodity codes for items which represent a group of items that the item will be in.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord_line', @level2type = N'COLUMN', @level2name = N'bto_comcod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Export License Number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord_line', @level2type = N'COLUMN', @level2name = N'explicnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Export License Expiration Date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord_line', @level2type = N'COLUMN', @level2name = N'explicexpdte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Export License Exception', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord_line', @level2type = N'COLUMN', @level2name = N'explicexcpt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Import License Number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord_line', @level2type = N'COLUMN', @level2name = N'implicnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Import License Expiration Date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord_line', @level2type = N'COLUMN', @level2name = N'implicexpdte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Import License Exception', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord_line', @level2type = N'COLUMN', @level2name = N'implicexcpt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Export Commodity Control Number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord_line', @level2type = N'COLUMN', @level2name = N'eccn';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'SED Indicator - indicates whether the item should be listed on the SED', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord_line', @level2type = N'COLUMN', @level2name = N'sedflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Certificate of Origin Type - US or NAFTA', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord_line', @level2type = N'COLUMN', @level2name = N'cootyp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Certificate of Origin Number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord_line', @level2type = N'COLUMN', @level2name = N'coonum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'NAFTA Blanket Period Begin Date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord_line', @level2type = N'COLUMN', @level2name = N'naftabegdte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'NAFTA Blanket Period End Date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord_line', @level2type = N'COLUMN', @level2name = N'naftaenddte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Trade Agreement Type', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord_line', @level2type = N'COLUMN', @level2name = N'tradeagreetyp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Marks and Numbers', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord_line', @level2type = N'COLUMN', @level2name = N'marksnumbers';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'NAFTA Preference Criterion', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord_line', @level2type = N'COLUMN', @level2name = N'nafta_pref_crit';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Specifies if the shipper is the producer of the commodity on the NAFTA COO', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord_line', @level2type = N'COLUMN', @level2name = N'nafta_producer';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'SED Export Type (Domestic Exports, Foreign Exports, Foreign Military Sales', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord_line', @level2type = N'COLUMN', @level2name = N'sed_export_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Delivery Sequence. This is the delivery sequence sent to the WMS from the host. This is the sequence in which the product must be placed onto the tophat so that when it reaches the manufacturing facility the delivery is seamless.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord_line', @level2type = N'COLUMN', @level2name = N'bto_dlv_seq';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Station. This is information sent down on the order line indicating the production station that the item is being ordered for.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord_line', @level2type = N'COLUMN', @level2name = N'bto_station';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Side. This is the side of the station that the item should be delivered to.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord_line', @level2type = N'COLUMN', @level2name = N'bto_side';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Bay. This currently is not used in the USA. It was for European facilities.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord_line', @level2type = N'COLUMN', @level2name = N'bto_bay';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Footprint Code - Footprint code required for the ordered inventory. If no footprint code is entered, the system will attempt to find this inventory with any footprint code for this order line.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord_line', @level2type = N'COLUMN', @level2name = N'ftpcod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Used in conjunction with XXFO-ORDER-BY-ABSOLUTE as skip logic', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord_line', @level2type = N'COLUMN', @level2name = N'abs_ordinv_win';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Time interval for the Absolute Order Inventory Window', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord_line', @level2type = N'COLUMN', @level2name = N'abs_ordinv_code';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'International shipment documentation option required for manifesting international packages using some transnational carriers. The valid values are provided by the Parcel system for each carrier.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord_line', @level2type = N'COLUMN', @level2name = N'export_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Payment Terms - Conditions under which payment for the carrier in each order line will be received.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord_line', @level2type = N'COLUMN', @level2name = N'paytrm';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Super Rule Name - Used for storing the rule name when creating super shipments', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord_line', @level2type = N'COLUMN', @level2name = N'super_rule_nam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Auto Generated Flag', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord_line', @level2type = N'COLUMN', @level2name = N'aut_gen_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The orginnal distribution this stock order was created for.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord_line', @level2type = N'COLUMN', @level2name = N'org_distro_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Asset Type - This field groups assets based on common traits such as the dimensions, weight, manufacture, etc.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord_line', @level2type = N'COLUMN', @level2name = N'asset_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The first load attribute. A load attribute is a configurable field to indicate attributes of a load such as the load being wrapped.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord_line', @level2type = N'COLUMN', @level2name = N'load_attr1_cfg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The second load attribute. A load attribute is a configurable field to indicate attributes of a load such as the load being wrapped.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord_line', @level2type = N'COLUMN', @level2name = N'load_attr2_cfg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The third load attribute. A load attribute is a configurable field to indicate attributes of a load such as the load being wrapped.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord_line', @level2type = N'COLUMN', @level2name = N'load_attr3_cfg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The fourth load attribute. A load attribute is a configurable field to indicate attributes of a load such as the load being wrapped.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord_line', @level2type = N'COLUMN', @level2name = N'load_attr4_cfg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The fifth load attribute. A load attribute is a configurable field to indicate attributes of a load such as the load being wrapped.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord_line', @level2type = N'COLUMN', @level2name = N'load_attr5_cfg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Reason Code - uniquely identifies a reason why order line was changed. A corresponding description of the reason is stored in dscmst', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord_line', @level2type = N'COLUMN', @level2name = N'ordlin_chg_reacod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Reason Code Comment - provides comments for reacod ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord_line', @level2type = N'COLUMN', @level2name = N'reacod_cmnt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Cancelled- Indicates if the order line is cancelled or not', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord_line', @level2type = N'COLUMN', @level2name = N'cancelled_flg';

