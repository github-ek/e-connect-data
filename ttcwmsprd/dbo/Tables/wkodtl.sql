CREATE TABLE [dbo].[wkodtl] (
    [wkonum]           NVARCHAR (20)   NOT NULL,
    [client_id]        NVARCHAR (32)   NOT NULL,
    [wkorev]           NVARCHAR (10)   NOT NULL,
    [wkolin]           NVARCHAR (10)   NOT NULL,
    [seqnum]           INT             NOT NULL,
    [wh_id]            NVARCHAR (32)   NOT NULL,
    [linsts]           NVARCHAR (1)    NOT NULL,
    [prtnum]           NVARCHAR (50)   NOT NULL,
    [prt_client_id]    NVARCHAR (32)   NOT NULL,
    [invsts]           NVARCHAR (4)    NULL,
    [dlv_invsts]       NVARCHAR (4)    NULL,
    [invsts_prg]       NVARCHAR (4)    NULL,
    [rule_nam]         NVARCHAR (20)   NULL,
    [lotnum]           NVARCHAR (25)   NULL,
    [sup_lotnum]       NVARCHAR (25)   NULL,
    [revlvl]           NVARCHAR (25)   NULL,
    [supnum]           NVARCHAR (32)   NULL,
    [orgcod]           NVARCHAR (25)   NULL,
    [untpak]           INT             NOT NULL,
    [untcas]           INT             NOT NULL,
    [linqty]           INT             NOT NULL,
    [lin_catch_qty]    NUMERIC (19, 4) NULL,
    [pckqty]           INT             NOT NULL,
    [pck_catch_qty]    NUMERIC (19, 4) NULL,
    [disass_qty]       INT             NULL,
    [disass_catch_qty] NUMERIC (19, 4) NULL,
    [inpqty]           INT             NOT NULL,
    [oviqty]           INT             NOT NULL,
    [rpqflg]           INT             NULL,
    [ovrcod]           NVARCHAR (4)    NULL,
    [ovramt]           INT             NULL,
    [bom_cnsqty]       NUMERIC (19, 4) NOT NULL,
    [tot_dlvqty]       INT             NOT NULL,
    [tot_cnsqty]       NUMERIC (19, 4) NOT NULL,
    [cns_catch_qty]    NUMERIC (19, 4) NULL,
    [rpt_cnsqty]       NUMERIC (19, 4) NOT NULL,
    [rpt_wpsqty]       NUMERIC (19, 4) NOT NULL,
    [rpt_rtsqty]       NUMERIC (19, 4) NOT NULL,
    [rpt_scpqty]       NUMERIC (19, 4) NOT NULL,
    [cns_tol_pct]      INT             NULL,
    [inskey]           NVARCHAR (30)   NULL,
    [xdkflg]           INT             NULL,
    [sub_wkonum]       NVARCHAR (20)   NULL,
    [sub_wkorev]       NVARCHAR (10)   NULL,
    [mandte]           DATETIME        NULL,
    [expire_dte]       DATETIME        NULL,
    [moddte]           DATETIME        NULL,
    [mod_usr_id]       NVARCHAR (40)   NULL,
    [edtflg]           INT             NULL,
    [allocate_catch]   INT             NULL,
    [prcloc]           NVARCHAR (20)   NULL,
    [old_prcloc]       NVARCHAR (20)   NULL,
    [lms_seqnum]       INT             NULL,
    [lms_cur_linqty]   INT             NULL,
    [ftpcod]           NVARCHAR (30)   NULL,
    [ordinv]           NVARCHAR (30)   NULL,
    [min_shelf_hrs]    INT             NULL,
    [exp_scp]          INT             NULL,
    [inv_attr_str1]    NVARCHAR (100)  NULL,
    [inv_attr_str2]    NVARCHAR (100)  NULL,
    [inv_attr_str3]    NVARCHAR (100)  NULL,
    [inv_attr_str4]    NVARCHAR (100)  NULL,
    [inv_attr_str5]    NVARCHAR (100)  NULL,
    [inv_attr_str6]    NVARCHAR (100)  NULL,
    [inv_attr_str7]    NVARCHAR (100)  NULL,
    [inv_attr_str8]    NVARCHAR (100)  NULL,
    [inv_attr_str9]    NVARCHAR (100)  NULL,
    [inv_attr_str10]   NVARCHAR (100)  NULL,
    [inv_attr_str11]   NVARCHAR (100)  NULL,
    [inv_attr_str12]   NVARCHAR (100)  NULL,
    [inv_attr_str13]   NVARCHAR (100)  NULL,
    [inv_attr_str14]   NVARCHAR (100)  NULL,
    [inv_attr_str15]   NVARCHAR (100)  NULL,
    [inv_attr_str16]   NVARCHAR (100)  NULL,
    [inv_attr_str17]   NVARCHAR (100)  NULL,
    [inv_attr_str18]   NVARCHAR (100)  NULL,
    [inv_attr_int1]    INT             NULL,
    [inv_attr_int2]    INT             NULL,
    [inv_attr_int3]    INT             NULL,
    [inv_attr_int4]    INT             NULL,
    [inv_attr_int5]    INT             NULL,
    [inv_attr_flt1]    NUMERIC (19, 4) NULL,
    [inv_attr_flt2]    NUMERIC (19, 4) NULL,
    [inv_attr_flt3]    NUMERIC (19, 4) NULL,
    [inv_attr_dte1]    DATETIME        NULL,
    [inv_attr_dte2]    DATETIME        NULL,
    CONSTRAINT [wkodtl_pk] PRIMARY KEY CLUSTERED ([wkonum] ASC, [wkorev] ASC, [wkolin] ASC, [seqnum] ASC, [wh_id] ASC, [client_id] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [wkodtl_edtflg_ck] CHECK ([edtflg]=(0) OR [edtflg]=(1)),
    CONSTRAINT [wkodtl_rpqflg_ck] CHECK ([rpqflg]=(0) OR [rpqflg]=(1)),
    CONSTRAINT [wkodtl_xdkflg_ck] CHECK ([xdkflg]=(0) OR [xdkflg]=(1))
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Represents work order components which are used to produce top-level finished good item.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkodtl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A number which identifies the work order to the system.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkodtl', @level2type = N'COLUMN', @level2name = N'wkonum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The client code that owns this work order.  In a non-3PL system, this value defaults to ''----''.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkodtl', @level2type = N'COLUMN', @level2name = N'client_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Used if multiple copies of a standard work order are desired.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkodtl', @level2type = N'COLUMN', @level2name = N'wkorev';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This is used to make the line unique in the event that mixed attribute comp are delvd.  This fld works much the same as the rcvlin table in that seqnum = 0 will represent the orig wkodtl lin, seqnum > 0 will represent act inv delvd to WO', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkodtl', @level2type = N'COLUMN', @level2name = N'seqnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warehouse ID - the warehouse in which the work order is to be processed.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkodtl', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Possible values: Pending, Inprocess, Complete, Waiting for Work Order', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkodtl', @level2type = N'COLUMN', @level2name = N'linsts';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The item number of the component inventory that is being consumed.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkodtl', @level2type = N'COLUMN', @level2name = N'prtnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'In non-3PL systems, this will be set to a default of ''----''.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkodtl', @level2type = N'COLUMN', @level2name = N'prt_client_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory status of component inventory that is being consumed.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkodtl', @level2type = N'COLUMN', @level2name = N'invsts';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This field will indicate what status the inventory was delivered to the production line with.  This will be used to catch inventory status changes of component inventory while in assembly.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkodtl', @level2type = N'COLUMN', @level2name = N'dlv_invsts';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory status progression of component inventory that is being consumed.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkodtl', @level2type = N'COLUMN', @level2name = N'invsts_prg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'An allocation rule name linking the work order detail to the allocation rule table. The allocation rule specifies a set of attributes.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkodtl', @level2type = N'COLUMN', @level2name = N'rule_nam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'For seqnum = 0 records, this will indicate the requested lot number for the component inventory.  For seqnum > 0, the lot number will reflect the delivered component inventory.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkodtl', @level2type = N'COLUMN', @level2name = N'lotnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Lot number supplied by the supplier for tracking purposes.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkodtl', @level2type = N'COLUMN', @level2name = N'sup_lotnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'For seqnum = 0 records, this will indicate the requested revision level for the component inventory.  For seqnum > 0, the revision level will reflect the delivered component inventory.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkodtl', @level2type = N'COLUMN', @level2name = N'revlvl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Supplier Number: The Supplier number of the item to be consumed. For seqnum = 0 records, this will indicate the requested supplier number for the component inventory.  For seqnum > 0, the supplier number will reflect the delivered component inventory.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkodtl', @level2type = N'COLUMN', @level2name = N'supnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'For seqnum = 0 records, this will indicate the requested origin code for the component inventory.  For seqnum > 0, the origin code will reflect the delivered component inventory.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkodtl', @level2type = N'COLUMN', @level2name = N'orgcod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'For seqnum = 0 records, this will indicate the requested untpak for the component inventory.  For seqnum > 0, the untpak will reflect the delivered component inventory.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkodtl', @level2type = N'COLUMN', @level2name = N'untpak';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'For seqnum = 0 records, this will indicate the requested untcas for the component inventory.  For seqnum > 0, the untcas will reflect the delivered component inventory.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkodtl', @level2type = N'COLUMN', @level2name = N'untcas';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This represents the requested quantity to be delivered to the production line.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkodtl', @level2type = N'COLUMN', @level2name = N'linqty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This represents the requested catch quantity to be delivered to the production line.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkodtl', @level2type = N'COLUMN', @level2name = N'lin_catch_qty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This represents the quantity that is yet to be allocated against this work order.  As allocations succeed, this quantity will drive to zero.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkodtl', @level2type = N'COLUMN', @level2name = N'pckqty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This represents the catch quantity that is yet to be allocated against this work order.  As allocations succeed, this quantity will go to zero.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkodtl', @level2type = N'COLUMN', @level2name = N'pck_catch_qty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Disassembled Quantity is used to track the quantity of the component that has been disassembled from the finished good.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkodtl', @level2type = N'COLUMN', @level2name = N'disass_qty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Disassembled Catch Quantity is used to track the quantity of the component that has been disassembled from the finished good.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkodtl', @level2type = N'COLUMN', @level2name = N'disass_catch_qty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This represents the amount of quantity allocated against the work order line.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkodtl', @level2type = N'COLUMN', @level2name = N'inpqty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This represents any over allocation which may have resulted due to rounding up during allocation cycle.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkodtl', @level2type = N'COLUMN', @level2name = N'oviqty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This flag indicates that allocation should attempt to round up the quantity requested to the next logical material handling unit in order to achieve a more efficient product move.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkodtl', @level2type = N'COLUMN', @level2name = N'rpqflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Specifies how to treat the value specified in ovramt.  Valid values are PRCT and QTY.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkodtl', @level2type = N'COLUMN', @level2name = N'ovrcod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Depending on the ovrcod, this value either represents a percentage of the originally requested line quantity or a fixed quantity above the linqty.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkodtl', @level2type = N'COLUMN', @level2name = N'ovramt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This can come from the BOM definition.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkodtl', @level2type = N'COLUMN', @level2name = N'bom_cnsqty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Total quantity of components delivered against this line.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkodtl', @level2type = N'COLUMN', @level2name = N'tot_dlvqty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Total quantity of components which the system has tracked to be consumed against this line', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkodtl', @level2type = N'COLUMN', @level2name = N'tot_cnsqty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Total catch quantity of components which the system has tracked to be consumed against this line', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkodtl', @level2type = N'COLUMN', @level2name = N'cns_catch_qty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Reported quantity of component consumed.  This may differ from system tracking if user intervenes.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkodtl', @level2type = N'COLUMN', @level2name = N'rpt_cnsqty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Reported quantity of component moved to WIP supply area.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkodtl', @level2type = N'COLUMN', @level2name = N'rpt_wpsqty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Reported quantity of component which was returned to stock.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkodtl', @level2type = N'COLUMN', @level2name = N'rpt_rtsqty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This will indicate how much tolerance sys. will have for ovr/undr consumption of components compared to what sys. thought will be consumed. If value is 10 and expected consumption were 100, consume values betn 90 and 110 is fine.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkodtl', @level2type = N'COLUMN', @level2name = N'cns_tol_pct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicates whether line is a candidate for cross docking.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkodtl', @level2type = N'COLUMN', @level2name = N'xdkflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicates the work order number of the work order that this line is waiting on.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkodtl', @level2type = N'COLUMN', @level2name = N'sub_wkonum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicates the work order revision of the work order that this line is waiting on.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkodtl', @level2type = N'COLUMN', @level2name = N'sub_wkorev';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date/time this record was last modified.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkodtl', @level2type = N'COLUMN', @level2name = N'moddte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'ID of user that performed last modification.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkodtl', @level2type = N'COLUMN', @level2name = N'mod_usr_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Allocate by Catch Quantity Flag - True indicates that catch quantity is the significant quantity.  False of empty reverts to allocation by unit quantities.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkodtl', @level2type = N'COLUMN', @level2name = N'allocate_catch';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Production Station where this component will be processed.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkodtl', @level2type = N'COLUMN', @level2name = N'prcloc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The old production station to which the work order line was assigned before the last work order movement.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkodtl', @level2type = N'COLUMN', @level2name = N'old_prcloc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'LMS Sequence Number, starting from 1.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkodtl', @level2type = N'COLUMN', @level2name = N'lms_seqnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'LMS current Work Order line assignment quantity. It is rpt_conqty when work order is split last time.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkodtl', @level2type = N'COLUMN', @level2name = N'lms_cur_linqty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Footprint Code - For seqnum = 0 records, this will indicate the requested ftpcod for the component inventory. For seqnum > 0, the ftpcod will reflect the delivered component inventory.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkodtl', @level2type = N'COLUMN', @level2name = N'ftpcod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Location Order By - This value determines how the system will determine which inventory in an area code to allocate for this work order line. Examples of possible values include FEFO-ORDER-BY, FIFO-ORDER-BY.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkodtl', @level2type = N'COLUMN', @level2name = N'ordinv';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Minimum Shelf Life (Hours) - If set, only inventory with an expiration date that is at least this many hours away from expiring will be allocated for this work order line.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkodtl', @level2type = N'COLUMN', @level2name = N'min_shelf_hrs';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Expected Scrap is the percentage would be expected to be scrapped and not identified following disassembly for a specific component.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkodtl', @level2type = N'COLUMN', @level2name = N'exp_scp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This will indicate the requested Inventory Attribute Text 1 for the component inventory when seqnum = 0 and for the delivered component inventory when seqnum > 0.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkodtl', @level2type = N'COLUMN', @level2name = N'inv_attr_str1';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This will indicate the requested Inventory Attribute Text 2 for the component inventory when seqnum = 0 and for the delivered component inventory when seqnum > 0.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkodtl', @level2type = N'COLUMN', @level2name = N'inv_attr_str2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This will indicate the requested Inventory Attribute Text 3 for the component inventory when seqnum = 0 and for the delivered component inventory when seqnum > 0.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkodtl', @level2type = N'COLUMN', @level2name = N'inv_attr_str3';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This will indicate the requested Inventory Attribute Text 4 for the component inventory when seqnum = 0 and for the delivered component inventory when seqnum > 0.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkodtl', @level2type = N'COLUMN', @level2name = N'inv_attr_str4';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This will indicate the requested Inventory Attribute Text 5 for the component inventory when seqnum = 0 and for the delivered component inventory when seqnum > 0.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkodtl', @level2type = N'COLUMN', @level2name = N'inv_attr_str5';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This will indicate the requested Inventory Attribute Text 6 for the component inventory when seqnum = 0 and for the delivered component inventory when seqnum > 0.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkodtl', @level2type = N'COLUMN', @level2name = N'inv_attr_str6';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This will indicate the requested Inventory Attribute Text 7 for the component inventory when seqnum = 0 and for the delivered component inventory when seqnum > 0.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkodtl', @level2type = N'COLUMN', @level2name = N'inv_attr_str7';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This will indicate the requested Inventory Attribute Text 8 for the component inventory when seqnum = 0 and for the delivered component inventory when seqnum > 0.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkodtl', @level2type = N'COLUMN', @level2name = N'inv_attr_str8';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This will indicate the requested Inventory Attribute Text 9 for the component inventory when seqnum = 0 and for the delivered component inventory when seqnum > 0.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkodtl', @level2type = N'COLUMN', @level2name = N'inv_attr_str9';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This will indicate the requested Inventory Attribute Text 10 for the component inventory when seqnum = 0 and for the delivered component inventory when seqnum > 0.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkodtl', @level2type = N'COLUMN', @level2name = N'inv_attr_str10';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This will indicate the requested Inventory Attribute Text 11 for the component inventory when seqnum = 0 and for the delivered component inventory when seqnum > 0.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkodtl', @level2type = N'COLUMN', @level2name = N'inv_attr_str11';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This will indicate the requested Inventory Attribute Text 12 for the component inventory when seqnum = 0 and for the delivered component inventory when seqnum > 0.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkodtl', @level2type = N'COLUMN', @level2name = N'inv_attr_str12';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This will indicate the requested Inventory Attribute Text 13 for the component inventory when seqnum = 0 and for the delivered component inventory when seqnum > 0.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkodtl', @level2type = N'COLUMN', @level2name = N'inv_attr_str13';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This will indicate the requested Inventory Attribute Text 14 for the component inventory when seqnum = 0 and for the delivered component inventory when seqnum > 0.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkodtl', @level2type = N'COLUMN', @level2name = N'inv_attr_str14';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This will indicate the requested Inventory Attribute Text 15 for the component inventory when seqnum = 0 and for the delivered component inventory when seqnum > 0.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkodtl', @level2type = N'COLUMN', @level2name = N'inv_attr_str15';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This will indicate the requested Inventory Attribute Text 16 for the component inventory when seqnum = 0 and for the delivered component inventory when seqnum > 0.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkodtl', @level2type = N'COLUMN', @level2name = N'inv_attr_str16';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This will indicate the requested Inventory Attribute Text 17 for the component inventory when seqnum = 0 and for the delivered component inventory when seqnum > 0.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkodtl', @level2type = N'COLUMN', @level2name = N'inv_attr_str17';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This will indicate the requested Inventory Attribute Text 18 for the component inventory when seqnum = 0 and for the delivered component inventory when seqnum > 0.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkodtl', @level2type = N'COLUMN', @level2name = N'inv_attr_str18';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This will indicate the requested Inventory Attribute Number 1 for the component inventory when seqnum = 0 and for the delivered component inventory when seqnum > 0.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkodtl', @level2type = N'COLUMN', @level2name = N'inv_attr_int1';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This will indicate the requested Inventory Attribute Number 2 for the component inventory when seqnum = 0 and for the delivered component inventory when seqnum > 0.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkodtl', @level2type = N'COLUMN', @level2name = N'inv_attr_int2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This will indicate the requested Inventory Attribute Number 3 for the component inventory when seqnum = 0 and for the delivered component inventory when seqnum > 0.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkodtl', @level2type = N'COLUMN', @level2name = N'inv_attr_int3';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This will indicate the requested Inventory Attribute Number 4 for the component inventory when seqnum = 0 and for the delivered component inventory when seqnum > 0.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkodtl', @level2type = N'COLUMN', @level2name = N'inv_attr_int4';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This will indicate the requested Inventory Attribute Number 5 for the component inventory when seqnum = 0 and for the delivered component inventory when seqnum > 0.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkodtl', @level2type = N'COLUMN', @level2name = N'inv_attr_int5';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This will indicate the requested Inventory Attribute Decimal 1 for the component inventory when seqnum = 0 and for the delivered component inventory when seqnum > 0.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkodtl', @level2type = N'COLUMN', @level2name = N'inv_attr_flt1';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This will indicate the requested Inventory Attribute Decimal 2 for the component inventory when seqnum = 0 and for the delivered component inventory when seqnum > 0.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkodtl', @level2type = N'COLUMN', @level2name = N'inv_attr_flt2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This will indicate the requested Inventory Attribute Decimal 3 for the component inventory when seqnum = 0 and for the delivered component inventory when seqnum > 0.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkodtl', @level2type = N'COLUMN', @level2name = N'inv_attr_flt3';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This will indicate the requested Inventory Attribute Date 1 for the component inventory when seqnum = 0 and for the delivered component inventory when seqnum > 0.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkodtl', @level2type = N'COLUMN', @level2name = N'inv_attr_dte1';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This will indicate the requested Inventory Attribute Date 2 for the component inventory when seqnum = 0 and for the delivered component inventory when seqnum > 0.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkodtl', @level2type = N'COLUMN', @level2name = N'inv_attr_dte2';

