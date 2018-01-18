CREATE TABLE [dbo].[bomhdr] (
    [bomnum]           NVARCHAR (30)   NOT NULL,
    [client_id]        NVARCHAR (32)   NOT NULL,
    [wh_id]            NVARCHAR (32)   NOT NULL,
    [prtnum]           NVARCHAR (50)   NOT NULL,
    [prt_client_id]    NVARCHAR (32)   NOT NULL,
    [invsts]           NVARCHAR (4)    NOT NULL,
    [rule_nam]         NVARCHAR (20)   NULL,
    [lotnum]           NVARCHAR (25)   NULL,
    [sup_lotnum]       NVARCHAR (25)   NULL,
    [orgcod]           NVARCHAR (25)   NULL,
    [revlvl]           NVARCHAR (25)   NULL,
    [aut_gen_flg]      INT             NULL,
    [minqty]           INT             NULL,
    [min_catch_qty]    NUMERIC (19, 4) NULL,
    [bomcod]           NVARCHAR (4)    NULL,
    [untdte]           DATETIME        NULL,
    [cmp_trk_flg]      INT             NULL,
    [prd_tol_pct]      INT             NULL,
    [arcdte]           DATETIME        NULL,
    [arc_src]          NVARCHAR (30)   NULL,
    [moddte]           DATETIME        NULL,
    [mod_usr_id]       NVARCHAR (40)   NULL,
    [defflg]           INT             NULL,
    [edtflg]           INT             NULL,
    [excl_flg]         INT             DEFAULT ((0)) NOT NULL,
    [invsts_prg]       NVARCHAR (4)    NULL,
    [rpqflg]           INT             DEFAULT ((0)) NOT NULL,
    [xdkflg]           INT             NULL,
    [untcas]           INT             NOT NULL,
    [untpak]           INT             NOT NULL,
    [ftpcod]           NVARCHAR (30)   NULL,
    [ovrcod]           NVARCHAR (4)    NULL,
    [ovramt]           INT             NULL,
    [ordinv]           NVARCHAR (30)   NULL,
    [min_shelf_hrs]    INT             NULL,
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
    [u_version]        INT             NULL,
    [ins_dt]           DATETIME        NULL,
    [last_upd_dt]      DATETIME        NULL,
    [ins_user_id]      NVARCHAR (40)   NULL,
    [last_upd_user_id] NVARCHAR (40)   NULL,
    CONSTRAINT [bomhdr_pk] PRIMARY KEY CLUSTERED ([bomnum] ASC, [wh_id] ASC, [client_id] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [bomhdr_autgenflgck] CHECK ([aut_gen_flg]=(0) OR [aut_gen_flg]=(1)),
    CONSTRAINT [bomhdr_cmptrkflgck] CHECK ([cmp_trk_flg]=(0) OR [cmp_trk_flg]=(1)),
    CONSTRAINT [bomhdr_defflg_ck] CHECK ([defflg]=(0) OR [defflg]=(1)),
    CONSTRAINT [bomhdr_edtflg_ck] CHECK ([edtflg]=(0) OR [edtflg]=(1)),
    CONSTRAINT [bomhdr_excl_flg_ck] CHECK ([excl_flg]=(0) OR [excl_flg]=(1)),
    CONSTRAINT [bomhdr_rpqflg_ck] CHECK ([rpqflg]=(0) OR [rpqflg]=(1)),
    CONSTRAINT [bomhdr_xdkflg_ck] CHECK ([xdkflg]=(0) OR [xdkflg]=(1))
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Represents finished goods produced against a BOM recipe', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bomhdr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Client id of the BOM.  In non-3PL systems, this will be set to a default of ''----''.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bomhdr', @level2type = N'COLUMN', @level2name = N'client_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warehouse ID - the warehouse in which bills of materials is to be processed.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bomhdr', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This is the item number of the finished goods inventory that will be produced.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bomhdr', @level2type = N'COLUMN', @level2name = N'prtnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'In non-3PL systems, this will be set to a default of ''----''.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bomhdr', @level2type = N'COLUMN', @level2name = N'prt_client_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Status required for the top-level item/finished good that will be produced.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bomhdr', @level2type = N'COLUMN', @level2name = N'invsts';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'An allocation rule name linking the work order detail to the allocation rule table. The allocation rule specifies a set of attributes.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bomhdr', @level2type = N'COLUMN', @level2name = N'rule_nam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Lot Number required for the top-level item/finished good that will be produced.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bomhdr', @level2type = N'COLUMN', @level2name = N'lotnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Lot number supplied by the supplier for tracking purposes.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bomhdr', @level2type = N'COLUMN', @level2name = N'sup_lotnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Origin Code required for the top-level item/finished good that will be produced.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bomhdr', @level2type = N'COLUMN', @level2name = N'orgcod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Revision Level required for the top-level item/finished good the will be produced.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bomhdr', @level2type = N'COLUMN', @level2name = N'revlvl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Identifies this BOM as one that can be used to automatically create a WO for the top level item when a shipment line or another work order that requires this item is allocated and is unable to find the inventory in the facility.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bomhdr', @level2type = N'COLUMN', @level2name = N'aut_gen_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If the autogen_flg is set and this minqty is defined, and a shipment or order is allocated that requires a qty of this top level item that is less than this minqty, the system will create the WO for the minqty rather than req qty.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bomhdr', @level2type = N'COLUMN', @level2name = N'minqty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If the autogen_flg is set and this min_catch_qty is defined, and a shipment or order is allocated that requires a quantity of this top level item that is less than this min_catch_qty, the system will create a WO for the min_catch_qty.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bomhdr', @level2type = N'COLUMN', @level2name = N'min_catch_qty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This would be set to either Temporary/Good Until/Permanent.  See help for detailed information on these Bill of Material codes.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bomhdr', @level2type = N'COLUMN', @level2name = N'bomcod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If the bomcod is set to ''Good Until'', this is the date on which the BOM will be purged from the system.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bomhdr', @level2type = N'COLUMN', @level2name = N'untdte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Defines whether the system should track the attributes of the components when the finished item is identified.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bomhdr', @level2type = N'COLUMN', @level2name = N'cmp_trk_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This is the % of the total qty required for this WO that must be created, and can be created. Ex: a value of .90 would indicate that the sys will allow the users to create anywhere between 90% and 110% of the req. top level items.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bomhdr', @level2type = N'COLUMN', @level2name = N'prd_tol_pct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If system needs to auto-gen a WO for a item, but the attributes required for the item (invsts, lotnum, orgcod, revlvl) do not exactly match those on any bomhdr, the system will use the bomhdr for the item that has the Default flag set', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bomhdr', @level2type = N'COLUMN', @level2name = N'defflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Exclusively Occupy Production Line. When create a work order from this BOM, the same named flag on work order will be defaulted to this value. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bomhdr', @level2type = N'COLUMN', @level2name = N'excl_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory status progression of top level inventory that is being consumed', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bomhdr', @level2type = N'COLUMN', @level2name = N'invsts_prg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This flag indicates that allocation should attempt to round up the quantity requested to the next logical material handling unit in order to achieve a more efficient product moved', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bomhdr', @level2type = N'COLUMN', @level2name = N'rpqflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicates whether work order is a candidate for cross docking', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bomhdr', @level2type = N'COLUMN', @level2name = N'xdkflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Unit case quantity.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bomhdr', @level2type = N'COLUMN', @level2name = N'untcas';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Unit pack quantity.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bomhdr', @level2type = N'COLUMN', @level2name = N'untpak';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Footprint Code.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bomhdr', @level2type = N'COLUMN', @level2name = N'ftpcod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Specifies how to treat the value specified in ovramt.  Valid values are PRCT and QTY.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bomhdr', @level2type = N'COLUMN', @level2name = N'ovrcod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Depending on the ovrcod, this value either represents a percentage of the originally requested line quantity or a fixed quantity above the linqty.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bomhdr', @level2type = N'COLUMN', @level2name = N'ovramt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Location Order By - This value determines how the system will determine which inventory in an area code to allocate for this work order line. Examples of possible values include FEFO-ORDER-BY, FIFO-ORDER-BY.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bomhdr', @level2type = N'COLUMN', @level2name = N'ordinv';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Minimum Shelf Life (Hours) - If set, only inventory with an expiration date that is at least this many hours away from expiring will be allocated for this work order line.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bomhdr', @level2type = N'COLUMN', @level2name = N'min_shelf_hrs';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 1.This field can be enabled to track and use custom text data required for the top-level item/finished good that will be produced.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bomhdr', @level2type = N'COLUMN', @level2name = N'inv_attr_str1';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 2.This field can be enabled to track and use custom text data required for the top-level item/finished good that will be produced.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bomhdr', @level2type = N'COLUMN', @level2name = N'inv_attr_str2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 3.This field can be enabled to track and use custom text data required for the top-level item/finished good that will be produced.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bomhdr', @level2type = N'COLUMN', @level2name = N'inv_attr_str3';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 4.This field can be enabled to track and use custom text data required for the top-level item/finished good that will be produced.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bomhdr', @level2type = N'COLUMN', @level2name = N'inv_attr_str4';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 5.This field can be enabled to track and use custom text data required for the top-level item/finished good that will be produced.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bomhdr', @level2type = N'COLUMN', @level2name = N'inv_attr_str5';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 6.This field can be enabled to track and use custom text data required for the top-level item/finished good that will be produced.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bomhdr', @level2type = N'COLUMN', @level2name = N'inv_attr_str6';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 7.This field can be enabled to track and use custom text data required for the top-level item/finished good that will be produced.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bomhdr', @level2type = N'COLUMN', @level2name = N'inv_attr_str7';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 8.This field can be enabled to track and use custom text data required for the top-level item/finished good that will be produced.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bomhdr', @level2type = N'COLUMN', @level2name = N'inv_attr_str8';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 9.This field can be enabled to track and use custom text data required for the top-level item/finished good that will be produced.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bomhdr', @level2type = N'COLUMN', @level2name = N'inv_attr_str9';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 10.This field can be enabled to track and use custom text data required for the top-level item/finished good that will be produced.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bomhdr', @level2type = N'COLUMN', @level2name = N'inv_attr_str10';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 11.This field can be enabled to track and use custom text data required for the top-level item/finished good that will be produced.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bomhdr', @level2type = N'COLUMN', @level2name = N'inv_attr_str11';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 12.This field can be enabled to track and use custom text data required for the top-level item/finished good that will be produced.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bomhdr', @level2type = N'COLUMN', @level2name = N'inv_attr_str12';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 13.This field can be enabled to track and use custom text data required for the top-level item/finished good that will be produced.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bomhdr', @level2type = N'COLUMN', @level2name = N'inv_attr_str13';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 14.This field can be enabled to track and use custom text data required for the top-level item/finished good that will be produced.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bomhdr', @level2type = N'COLUMN', @level2name = N'inv_attr_str14';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 15.This field can be enabled to track and use custom text data required for the top-level item/finished good that will be produced.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bomhdr', @level2type = N'COLUMN', @level2name = N'inv_attr_str15';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 16.This field can be enabled to track and use custom text data required for the top-level item/finished good that will be produced.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bomhdr', @level2type = N'COLUMN', @level2name = N'inv_attr_str16';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 17.This field can be enabled to track and use custom text data required for the top-level item/finished good that will be produced.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bomhdr', @level2type = N'COLUMN', @level2name = N'inv_attr_str17';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 18.This field can be enabled to track and use custom text data required for the top-level item/finished good that will be produced.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bomhdr', @level2type = N'COLUMN', @level2name = N'inv_attr_str18';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Number 1.This field can be enabled to track and use custom number data required for the top-level item/finished good that will be produced.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bomhdr', @level2type = N'COLUMN', @level2name = N'inv_attr_int1';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Number 2.This field can be enabled to track and use custom number data required for the top-level item/finished good that will be produced.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bomhdr', @level2type = N'COLUMN', @level2name = N'inv_attr_int2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Number 3.This field can be enabled to track and use custom number data required for the top-level item/finished good that will be produced.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bomhdr', @level2type = N'COLUMN', @level2name = N'inv_attr_int3';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Number 4.This field can be enabled to track and use custom number data required for the top-level item/finished good that will be produced.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bomhdr', @level2type = N'COLUMN', @level2name = N'inv_attr_int4';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Number 5.This field can be enabled to track and use custom number data required for the top-level item/finished good that will be produced.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bomhdr', @level2type = N'COLUMN', @level2name = N'inv_attr_int5';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Decimal 1.This field can be enabled to track and use custom decimal data required for the top-level item/finished good that will be produced.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bomhdr', @level2type = N'COLUMN', @level2name = N'inv_attr_flt1';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Decimal 2.This field can be enabled to track and use custom decimal data required for the top-level item/finished good that will be produced.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bomhdr', @level2type = N'COLUMN', @level2name = N'inv_attr_flt2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Decimal 3.This field can be enabled to track and use custom decimal data required for the top-level item/finished good that will be produced.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bomhdr', @level2type = N'COLUMN', @level2name = N'inv_attr_flt3';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Date 1.This field can be enabled to track and use custom date data required for the top-level item/finished good that will be produced.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bomhdr', @level2type = N'COLUMN', @level2name = N'inv_attr_dte1';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Date 2.This field can be enabled to track and use custom date data required for the top-level item/finished good that will be produced.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bomhdr', @level2type = N'COLUMN', @level2name = N'inv_attr_dte2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The version number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bomhdr', @level2type = N'COLUMN', @level2name = N'u_version';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was inserted', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bomhdr', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row as was last updated', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bomhdr', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who created the row', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bomhdr', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bomhdr', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

