CREATE TABLE [dbo].[inv_intransit] (
    [lodnum]            NVARCHAR (30)   NOT NULL,
    [subnum]            NVARCHAR (30)   NOT NULL,
    [dtlnum]            NVARCHAR (30)   NOT NULL,
    [wh_id]             NVARCHAR (32)   NOT NULL,
    [prtnum]            NVARCHAR (50)   NOT NULL,
    [prt_client_id]     NVARCHAR (32)   NOT NULL,
    [lotnum]            NVARCHAR (25)   NOT NULL,
    [sup_lotnum]        NVARCHAR (25)   NULL,
    [revlvl]            NVARCHAR (25)   NOT NULL,
    [orgcod]            NVARCHAR (25)   NOT NULL,
    [inv_attr_str1]     NVARCHAR (100)  NULL,
    [inv_attr_str2]     NVARCHAR (100)  NULL,
    [inv_attr_str3]     NVARCHAR (100)  NULL,
    [inv_attr_str4]     NVARCHAR (100)  NULL,
    [inv_attr_str5]     NVARCHAR (100)  NULL,
    [inv_attr_str6]     NVARCHAR (100)  NULL,
    [inv_attr_str7]     NVARCHAR (100)  NULL,
    [inv_attr_str8]     NVARCHAR (100)  NULL,
    [inv_attr_str9]     NVARCHAR (100)  NULL,
    [inv_attr_str10]    NVARCHAR (100)  NULL,
    [inv_attr_str11]    NVARCHAR (100)  NULL,
    [inv_attr_str12]    NVARCHAR (100)  NULL,
    [inv_attr_str13]    NVARCHAR (100)  NULL,
    [inv_attr_str14]    NVARCHAR (100)  NULL,
    [inv_attr_str15]    NVARCHAR (100)  NULL,
    [inv_attr_str16]    NVARCHAR (100)  NULL,
    [inv_attr_str17]    NVARCHAR (100)  NULL,
    [inv_attr_str18]    NVARCHAR (100)  NULL,
    [inv_attr_int1]     INT             NULL,
    [inv_attr_int2]     INT             NULL,
    [inv_attr_int3]     INT             NULL,
    [inv_attr_int4]     INT             NULL,
    [inv_attr_int5]     INT             NULL,
    [inv_attr_flt1]     NUMERIC (19, 4) NULL,
    [inv_attr_flt2]     NUMERIC (19, 4) NULL,
    [inv_attr_flt3]     NUMERIC (19, 4) NULL,
    [inv_attr_dte1]     DATETIME        NULL,
    [inv_attr_dte2]     DATETIME        NULL,
    [supnum]            NVARCHAR (32)   NULL,
    [cnsg_flg]          INT             NULL,
    [invsts]            NVARCHAR (4)    NOT NULL,
    [age_pflnam]        NVARCHAR (30)   NULL,
    [fifdte]            DATETIME        NOT NULL,
    [mandte]            DATETIME        NULL,
    [expire_dte]        DATETIME        NULL,
    [untcas]            INT             NOT NULL,
    [untpak]            INT             NOT NULL,
    [ftpcod]            NVARCHAR (30)   NULL,
    [rcvkey]            NVARCHAR (15)   NULL,
    [ship_line_id]      NVARCHAR (10)   NULL,
    [cmpkey]            NVARCHAR (20)   NULL,
    [untqty]            INT             NOT NULL,
    [catch_qty]         NUMERIC (19, 4) NULL,
    [ship_id]           NVARCHAR (30)   NULL,
    [stop_id]           NVARCHAR (10)   NULL,
    [car_move_id]       NVARCHAR (10)   NULL,
    [trlr_id]           NVARCHAR (20)   NULL,
    [processed_flg]     INT             DEFAULT ((0)) NULL,
    [hld_flg]           INT             DEFAULT ((0)) NOT NULL,
    [cstms_cnsgnmnt_id] NVARCHAR (18)   NULL,
    [rttn_id]           NVARCHAR (10)   NULL,
    [cstms_bond_flg]    INT             DEFAULT ((0)) NULL,
    [dty_stmp_flg]      INT             DEFAULT ((0)) NULL,
    [moddte]            DATETIME        NULL,
    [mod_usr_id]        NVARCHAR (40)   NULL,
    [u_version]         INT             NULL,
    [ins_dt]            DATETIME        NULL,
    [last_upd_dt]       DATETIME        NULL,
    [ins_user_id]       NVARCHAR (40)   NULL,
    [last_upd_user_id]  NVARCHAR (40)   NULL,
    CONSTRAINT [inv_intransit_pk] PRIMARY KEY CLUSTERED ([lodnum] ASC, [subnum] ASC, [dtlnum] ASC, [wh_id] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [inv_intranstedsfck] CHECK ([dty_stmp_flg]=(0) OR [dty_stmp_flg]=(1)),
    CONSTRAINT [inv_intrnst_cngflg] CHECK ([cnsg_flg]=(0) OR [cnsg_flg]=(1)),
    CONSTRAINT [inv_intrnst_hldflg] CHECK ([hld_flg]=(0) OR [hld_flg]=(1)),
    CONSTRAINT [inv_intrnst_prcflg] CHECK ([processed_flg]=(0) OR [processed_flg]=(1)),
    CONSTRAINT [inv_intrnstcbflgck] CHECK ([cstms_bond_flg]=(0) OR [cstms_bond_flg]=(1))
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The inventory intransit table is used to represent inventory that has left the facility, but has not yet been processed as an ASN at the dest. site.  It is primarily used at dispatch time for shipments that are sent to customers.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inv_intransit';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Identifies which load this detail is attached to.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inv_intransit', @level2type = N'COLUMN', @level2name = N'lodnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Identifies which subload this detail is attached to.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inv_intransit', @level2type = N'COLUMN', @level2name = N'subnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Identifies the inventory detail.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inv_intransit', @level2type = N'COLUMN', @level2name = N'dtlnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warehouse ID.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inv_intransit', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Item number of the inventory tracked by this detail.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inv_intransit', @level2type = N'COLUMN', @level2name = N'prtnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Client ownership for item number.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inv_intransit', @level2type = N'COLUMN', @level2name = N'prt_client_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Lot number of the inventory tracked by this detail.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inv_intransit', @level2type = N'COLUMN', @level2name = N'lotnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Lot number supplied by the supplier for tracking purposes.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inv_intransit', @level2type = N'COLUMN', @level2name = N'sup_lotnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Revision level of the inventory tracked by this detail.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inv_intransit', @level2type = N'COLUMN', @level2name = N'revlvl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Origin Code of the inventory tracked by this detail.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inv_intransit', @level2type = N'COLUMN', @level2name = N'orgcod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 1 of the inventory tracked by this detail.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inv_intransit', @level2type = N'COLUMN', @level2name = N'inv_attr_str1';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 2 of the inventory tracked by this detail.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inv_intransit', @level2type = N'COLUMN', @level2name = N'inv_attr_str2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 3 of the inventory tracked by this detail.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inv_intransit', @level2type = N'COLUMN', @level2name = N'inv_attr_str3';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 4 of the inventory tracked by this detail.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inv_intransit', @level2type = N'COLUMN', @level2name = N'inv_attr_str4';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 5 of the inventory tracked by this detail.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inv_intransit', @level2type = N'COLUMN', @level2name = N'inv_attr_str5';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 6 of the inventory tracked by this detail.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inv_intransit', @level2type = N'COLUMN', @level2name = N'inv_attr_str6';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 7 of the inventory tracked by this detail.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inv_intransit', @level2type = N'COLUMN', @level2name = N'inv_attr_str7';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 8 of the inventory tracked by this detail.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inv_intransit', @level2type = N'COLUMN', @level2name = N'inv_attr_str8';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 9 of the inventory tracked by this detail.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inv_intransit', @level2type = N'COLUMN', @level2name = N'inv_attr_str9';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 10 of the inventory tracked by this detail.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inv_intransit', @level2type = N'COLUMN', @level2name = N'inv_attr_str10';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 11 of the inventory tracked by this detail.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inv_intransit', @level2type = N'COLUMN', @level2name = N'inv_attr_str11';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 12 of the inventory tracked by this detail.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inv_intransit', @level2type = N'COLUMN', @level2name = N'inv_attr_str12';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 13 of the inventory tracked by this detail.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inv_intransit', @level2type = N'COLUMN', @level2name = N'inv_attr_str13';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 14 of the inventory tracked by this detail.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inv_intransit', @level2type = N'COLUMN', @level2name = N'inv_attr_str14';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 15 of the inventory tracked by this detail.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inv_intransit', @level2type = N'COLUMN', @level2name = N'inv_attr_str15';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 16 of the inventory tracked by this detail.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inv_intransit', @level2type = N'COLUMN', @level2name = N'inv_attr_str16';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 17 of the inventory tracked by this detail.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inv_intransit', @level2type = N'COLUMN', @level2name = N'inv_attr_str17';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 18 of the inventory tracked by this detail.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inv_intransit', @level2type = N'COLUMN', @level2name = N'inv_attr_str18';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Number 1 of the inventory tracked by this detail.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inv_intransit', @level2type = N'COLUMN', @level2name = N'inv_attr_int1';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Number 2 of the inventory tracked by this detail.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inv_intransit', @level2type = N'COLUMN', @level2name = N'inv_attr_int2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Number 3 of the inventory tracked by this detail.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inv_intransit', @level2type = N'COLUMN', @level2name = N'inv_attr_int3';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Number 4 of the inventory tracked by this detail.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inv_intransit', @level2type = N'COLUMN', @level2name = N'inv_attr_int4';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Number 5 of the inventory tracked by this detail.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inv_intransit', @level2type = N'COLUMN', @level2name = N'inv_attr_int5';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Decimal 1 of the inventory tracked by this detail.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inv_intransit', @level2type = N'COLUMN', @level2name = N'inv_attr_flt1';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Decimal 2 of the inventory tracked by this detail.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inv_intransit', @level2type = N'COLUMN', @level2name = N'inv_attr_flt2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Decimal 3 of the inventory tracked by this detail.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inv_intransit', @level2type = N'COLUMN', @level2name = N'inv_attr_flt3';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Date 1 of the inventory tracked by this detail.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inv_intransit', @level2type = N'COLUMN', @level2name = N'inv_attr_dte1';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Date 2 of the inventory tracked by this detail.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inv_intransit', @level2type = N'COLUMN', @level2name = N'inv_attr_dte2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Supplier Number of the Inventory tracked by this detail.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inv_intransit', @level2type = N'COLUMN', @level2name = N'supnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Consigned Flag: The status indicates ownership of the inventory (1=ownership is with the supplier, 0=ownership is not with supplier)', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inv_intransit', @level2type = N'COLUMN', @level2name = N'cnsg_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory status of the inventory tracked by this detail.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inv_intransit', @level2type = N'COLUMN', @level2name = N'invsts';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Aging profile for this inventory.  This only applies to items that are date controlled.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inv_intransit', @level2type = N'COLUMN', @level2name = N'age_pflnam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date to be used for FIFO calculations with this inventory.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inv_intransit', @level2type = N'COLUMN', @level2name = N'fifdte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date this product was manufactured.  It is calculated by calling the command ''get manufacturing date''.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inv_intransit', @level2type = N'COLUMN', @level2name = N'mandte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date this product will expire.  This is only used for date controlled product and is calculated based on the product''s aging profile.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inv_intransit', @level2type = N'COLUMN', @level2name = N'expire_dte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The number of units in a case of the inventory tracked by this detail.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inv_intransit', @level2type = N'COLUMN', @level2name = N'untcas';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The number of units in an inner pack carton of the inventory tracked by this detail.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inv_intransit', @level2type = N'COLUMN', @level2name = N'untpak';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The footprint code of the inventory tracked by this invdtl.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inv_intransit', @level2type = N'COLUMN', @level2name = N'ftpcod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If this detail was received, then the receive key will be filled in indicating which rcvlin this detail was received against.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inv_intransit', @level2type = N'COLUMN', @level2name = N'rcvkey';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If this detail was picked for a shipment, then the ship_line_id field will be filled in mapping it to the particular shipment line which this detail satisfied.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inv_intransit', @level2type = N'COLUMN', @level2name = N'ship_line_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If this detail was produced as a result of production, this field will be filled in to provide a mapping in to the cmphdr table which will indicate which work order this detail was produced against.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inv_intransit', @level2type = N'COLUMN', @level2name = N'cmpkey';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The amount of inventory (in stock keeping units) this detail tracks.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inv_intransit', @level2type = N'COLUMN', @level2name = N'untqty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Catch Quantity', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inv_intransit', @level2type = N'COLUMN', @level2name = N'catch_qty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If this detail was picked for a shipment, then the ship_id field will be filled in mapping it to the particular shipment which this detail satisfied.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inv_intransit', @level2type = N'COLUMN', @level2name = N'ship_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If this detail was picked for a shipment, then the stop_id field will be filled in mapping it to the particular stop which this detail was attached to.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inv_intransit', @level2type = N'COLUMN', @level2name = N'stop_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If this detail was picked for a shipment, then the car_move_id field will be filled in mapping it to the particular carrier move which this detail was attached to.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inv_intransit', @level2type = N'COLUMN', @level2name = N'car_move_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If this detail was picked for a shipment, then the trlr_id field will be filled in mapping it to the particular trailer which this detail was attached to.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inv_intransit', @level2type = N'COLUMN', @level2name = N'trlr_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This indicates whether this row has been processed.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inv_intransit', @level2type = N'COLUMN', @level2name = N'processed_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This flag indicates that the inventory is put on hold if it has a value of 1.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inv_intransit', @level2type = N'COLUMN', @level2name = N'hld_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Customs Consignment ID uniquely identify a consignment of bonded inventory on a per receipt basis.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inv_intransit', @level2type = N'COLUMN', @level2name = N'cstms_cnsgnmnt_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Rotation ID used for tracking bonded inventory.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inv_intransit', @level2type = N'COLUMN', @level2name = N'rttn_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Under Bond.  Flag used to indicate whether or not the inventory is bonded. ''1'' means under bond and ''0'' means not under bond.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inv_intransit', @level2type = N'COLUMN', @level2name = N'cstms_bond_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Excise Duty Stamp. Flag used to indicate whether or not the inventory has a duty stamp applied. ''1'' means yes and ''0'' means no.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inv_intransit', @level2type = N'COLUMN', @level2name = N'dty_stmp_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Last Modification Date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inv_intransit', @level2type = N'COLUMN', @level2name = N'moddte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Last user to modify this record.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inv_intransit', @level2type = N'COLUMN', @level2name = N'mod_usr_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The version number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inv_intransit', @level2type = N'COLUMN', @level2name = N'u_version';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was inserted', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inv_intransit', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was last updated', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inv_intransit', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who created the row', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inv_intransit', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inv_intransit', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

