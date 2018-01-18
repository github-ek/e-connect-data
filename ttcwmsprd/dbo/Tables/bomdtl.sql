CREATE TABLE [dbo].[bomdtl] (
    [bomnum]           NVARCHAR (30)   NOT NULL,
    [client_id]        NVARCHAR (32)   NOT NULL,
    [bomlin]           NVARCHAR (10)   NOT NULL,
    [wh_id]            NVARCHAR (32)   NOT NULL,
    [prtnum]           NVARCHAR (50)   NOT NULL,
    [prt_client_id]    NVARCHAR (32)   NOT NULL,
    [rule_nam]         NVARCHAR (20)   NULL,
    [lotnum]           NVARCHAR (25)   NULL,
    [sup_lotnum]       NVARCHAR (25)   NULL,
    [revlvl]           NVARCHAR (25)   NULL,
    [orgcod]           NVARCHAR (25)   NULL,
    [supnum]           NVARCHAR (32)   NULL,
    [invsts_prg]       NVARCHAR (4)    NOT NULL,
    [untcas]           INT             NOT NULL,
    [untpak]           INT             NOT NULL,
    [skp_alc_flg]      INT             NOT NULL,
    [cnsqty]           NUMERIC (19, 4) NOT NULL,
    [cns_catch_qty]    NUMERIC (19, 4) NULL,
    [ovramt]           INT             NOT NULL,
    [ovrcod]           NVARCHAR (4)    NULL,
    [rpqflg]           INT             NOT NULL,
    [cns_tol_pct]      INT             NULL,
    [edtflg]           INT             NULL,
    [xdkflg]           INT             NULL,
    [allocate_catch]   INT             NULL,
    [ftpcod]           NVARCHAR (30)   NULL,
    [ordinv]           NVARCHAR (30)   NULL,
    [min_shelf_hrs]    INT             NULL,
    [exp_scp]          INT             NULL,
    [invsts]           NVARCHAR (4)    NULL,
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
    CONSTRAINT [bomdtl_pk] PRIMARY KEY CLUSTERED ([bomnum] ASC, [bomlin] ASC, [wh_id] ASC, [client_id] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [bomdtl_edtflg_ck] CHECK ([edtflg]=(0) OR [edtflg]=(1)),
    CONSTRAINT [bomdtl_rpqflg_ck] CHECK ([rpqflg]=(0) OR [rpqflg]=(1)),
    CONSTRAINT [bomdtl_skpalcflgck] CHECK ([skp_alc_flg]=(0) OR [skp_alc_flg]=(1)),
    CONSTRAINT [bomdtl_xdkflg_ck] CHECK ([xdkflg]=(0) OR [xdkflg]=(1))
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Represents components to be consumed when producing a particular finished good.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bomdtl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'In non-3PL systems, this will be set to a default of ''----''.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bomdtl', @level2type = N'COLUMN', @level2name = N'client_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The line number for the BOM - allows for multiple components to be defined for a BOM.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bomdtl', @level2type = N'COLUMN', @level2name = N'bomlin';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warehouse ID - the warehouse in which bills of materials is to be processed.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bomdtl', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The item number of the component to be consumed for this BOM line.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bomdtl', @level2type = N'COLUMN', @level2name = N'prtnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'In non-3PL systems, this will be set to a default of ''----''.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bomdtl', @level2type = N'COLUMN', @level2name = N'prt_client_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'An allocation rule name linking the work order detail to the allocation rule table. The allocation rule specifies a set of attributes.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bomdtl', @level2type = N'COLUMN', @level2name = N'rule_nam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Lot number of the item to be consumed.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bomdtl', @level2type = N'COLUMN', @level2name = N'lotnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Lot number supplied by the supplier for tracking purposes.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bomdtl', @level2type = N'COLUMN', @level2name = N'sup_lotnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Revision level of the item to be consumed.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bomdtl', @level2type = N'COLUMN', @level2name = N'revlvl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Origin code of the item to be consumed.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bomdtl', @level2type = N'COLUMN', @level2name = N'orgcod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Supplier Number: The Supplier number of the item to be consumed.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bomdtl', @level2type = N'COLUMN', @level2name = N'supnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Units per case of the component to be consumed.  If set to 0, there is no restriction.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bomdtl', @level2type = N'COLUMN', @level2name = N'untcas';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Units per pack of the component to be consumed.  If set to 0, there is no restriction.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bomdtl', @level2type = N'COLUMN', @level2name = N'untpak';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If set, specifies that the allocation process should skip this line for allocation. This is used to indicate that supplies, while must be tracked for costing purposes are not picked by this work but found in WIP Supply Area.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bomdtl', @level2type = N'COLUMN', @level2name = N'skp_alc_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This is the quantity of this component expected to be consumed when producing one top level item of the BOM.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bomdtl', @level2type = N'COLUMN', @level2name = N'cnsqty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This is the catch quantity of this component that is expected to be consumed when producing one unit quantity of the top level item specified on the BOM.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bomdtl', @level2type = N'COLUMN', @level2name = N'cns_catch_qty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Quantity or percentage that component is allowed to be over-allocated when allocating component inventory for this BOM.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bomdtl', @level2type = N'COLUMN', @level2name = N'ovramt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Determines what the amount in the ovramt field refers to - QTY is a component quantity, PRCT is a percentage.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bomdtl', @level2type = N'COLUMN', @level2name = N'ovrcod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This flag indicates that allocation should automatically round up pick qtys in order to get the next highest material handling unit of product.  The pick qty may be rounded up only within the bounds defined by the ovramt/ovrcod fields.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bomdtl', @level2type = N'COLUMN', @level2name = N'rpqflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The percentage by which the consumption may be over/under the expected consumption quantity.  For example, if we expect to consume 100, and the cns_tol_pct is 10, then we will accept consumption quantities of 90 or 110.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bomdtl', @level2type = N'COLUMN', @level2name = N'cns_tol_pct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Allocate by Catch Quantity Flag - True indicates that catch quantity is the significant quantity.  False of empty reverts to allocation by unit quantities.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bomdtl', @level2type = N'COLUMN', @level2name = N'allocate_catch';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Footprint Code C Footprint Code of the component to be consumed. If set to NULL, User can use any Footprint code for this component.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bomdtl', @level2type = N'COLUMN', @level2name = N'ftpcod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Location Order By - This value determines how the system will determine which inventory in an area code to allocate for this order line. Examples of possible values include FEFO-ORDER-BY, FIFO-ORDER-BY.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bomdtl', @level2type = N'COLUMN', @level2name = N'ordinv';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Minimum Shelf Life (Hours) - If set, only inventory with an expiration date that is at least this many hours away from expiring will be allocated for this order line.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bomdtl', @level2type = N'COLUMN', @level2name = N'min_shelf_hrs';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Expected Scrap is the percentage would be expected to be scrapped and not identified following disassembly for a specific component.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bomdtl', @level2type = N'COLUMN', @level2name = N'exp_scp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory status of component inventory to be generated.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bomdtl', @level2type = N'COLUMN', @level2name = N'invsts';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 1.This field can be enabled to track and use custom text data to be consumed.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bomdtl', @level2type = N'COLUMN', @level2name = N'inv_attr_str1';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 2.This field can be enabled to track and use custom text data to be consumed.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bomdtl', @level2type = N'COLUMN', @level2name = N'inv_attr_str2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 3.This field can be enabled to track and use custom text data data to be consumed.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bomdtl', @level2type = N'COLUMN', @level2name = N'inv_attr_str3';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 4.This field can be enabled to track and use custom text data data to be consumed.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bomdtl', @level2type = N'COLUMN', @level2name = N'inv_attr_str4';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 5.This field can be enabled to track and use custom text data data to be consumed.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bomdtl', @level2type = N'COLUMN', @level2name = N'inv_attr_str5';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 6.This field can be enabled to track and use custom text data data to be consumed.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bomdtl', @level2type = N'COLUMN', @level2name = N'inv_attr_str6';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 7.This field can be enabled to track and use custom text data data to be consumed.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bomdtl', @level2type = N'COLUMN', @level2name = N'inv_attr_str7';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 8.This field can be enabled to track and use custom text data data to be consumed.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bomdtl', @level2type = N'COLUMN', @level2name = N'inv_attr_str8';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 9.This field can be enabled to track and use custom text data data to be consumed.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bomdtl', @level2type = N'COLUMN', @level2name = N'inv_attr_str9';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 10.This field can be enabled to track and use custom text data data to be consumed.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bomdtl', @level2type = N'COLUMN', @level2name = N'inv_attr_str10';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 11.This field can be enabled to track and use custom text data data to be consumed.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bomdtl', @level2type = N'COLUMN', @level2name = N'inv_attr_str11';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 12.This field can be enabled to track and use custom text data data to be consumed.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bomdtl', @level2type = N'COLUMN', @level2name = N'inv_attr_str12';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 13.This field can be enabled to track and use custom text data data to be consumed.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bomdtl', @level2type = N'COLUMN', @level2name = N'inv_attr_str13';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 14.This field can be enabled to track and use custom text data data to be consumed.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bomdtl', @level2type = N'COLUMN', @level2name = N'inv_attr_str14';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 15.This field can be enabled to track and use custom text data data to be consumed.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bomdtl', @level2type = N'COLUMN', @level2name = N'inv_attr_str15';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 16.This field can be enabled to track and use custom text data data to be consumed.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bomdtl', @level2type = N'COLUMN', @level2name = N'inv_attr_str16';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 17.This field can be enabled to track and use custom text data data to be consumed.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bomdtl', @level2type = N'COLUMN', @level2name = N'inv_attr_str17';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 18.This field can be enabled to track and use custom text data data to be consumed.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bomdtl', @level2type = N'COLUMN', @level2name = N'inv_attr_str18';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Number 1.This field can be enabled to track and use custom number data data to be consumed.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bomdtl', @level2type = N'COLUMN', @level2name = N'inv_attr_int1';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Number 2.This field can be enabled to track and use custom number data data to be consumed.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bomdtl', @level2type = N'COLUMN', @level2name = N'inv_attr_int2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Number 3.This field can be enabled to track and use custom number data data to be consumed.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bomdtl', @level2type = N'COLUMN', @level2name = N'inv_attr_int3';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Number 4.This field can be enabled to track and use custom number data data to be consumed.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bomdtl', @level2type = N'COLUMN', @level2name = N'inv_attr_int4';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Number 5.This field can be enabled to track and use custom number data data to be consumed.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bomdtl', @level2type = N'COLUMN', @level2name = N'inv_attr_int5';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Decimal 1.This field can be enabled to track and use custom decimal data to be consumed.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bomdtl', @level2type = N'COLUMN', @level2name = N'inv_attr_flt1';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Decimal 2.This field can be enabled to track and use custom decimal data data to be consumed.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bomdtl', @level2type = N'COLUMN', @level2name = N'inv_attr_flt2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Decimal 3.This field can be enabled to track and use custom decimal data data to be consumed.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bomdtl', @level2type = N'COLUMN', @level2name = N'inv_attr_flt3';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Date 1.This field can be enabled to track and use custom date data data to be consumed.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bomdtl', @level2type = N'COLUMN', @level2name = N'inv_attr_dte1';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Date 2.This field can be enabled to track and use custom date data data to be consumed.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bomdtl', @level2type = N'COLUMN', @level2name = N'inv_attr_dte2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The version number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bomdtl', @level2type = N'COLUMN', @level2name = N'u_version';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was inserted', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bomdtl', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was last updated', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bomdtl', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who created the row', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bomdtl', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bomdtl', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

