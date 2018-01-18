CREATE TABLE [dbo].[arc_cmphdr] (
    [cmpkey]           NVARCHAR (20)   NOT NULL,
    [adddte]           DATETIME        NOT NULL,
    [wh_id]            NVARCHAR (32)   NOT NULL,
    [client_id]        NVARCHAR (32)   NULL,
    [wkonum]           NVARCHAR (20)   NULL,
    [wkorev]           NVARCHAR (10)   NULL,
    [prtnum]           NVARCHAR (50)   NOT NULL,
    [prt_client_id]    NVARCHAR (32)   NOT NULL,
    [lotnum]           NVARCHAR (25)   NULL,
    [sup_lotnum]       NVARCHAR (25)   NULL,
    [revlvl]           NVARCHAR (25)   NULL,
    [orgcod]           NVARCHAR (25)   NULL,
    [subnum]           NVARCHAR (30)   NULL,
    [dtlnum]           NVARCHAR (30)   NULL,
    [invsts]           NVARCHAR (4)    NOT NULL,
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
    [prddte]           DATETIME        NOT NULL,
    [prdlin]           NVARCHAR (20)   NULL,
    [usr_id]           NVARCHAR (40)   NOT NULL,
    [untqty]           INT             NOT NULL,
    [sub_cmpflg]       INT             NULL,
    [u_version]        INT             NULL,
    [ins_dt]           DATETIME        NULL,
    [last_upd_dt]      DATETIME        NULL,
    [ins_user_id]      NVARCHAR (40)   NULL,
    [last_upd_user_id] NVARCHAR (40)   NULL,
    CONSTRAINT [arc_cmphdr_pk] PRIMARY KEY CLUSTERED ([cmpkey] ASC, [adddte] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [arccmphdr_s_c_f_ck] CHECK ([sub_cmpflg]=(0) OR [sub_cmpflg]=(1))
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Represents archived finished goods produced against a work order.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'arc_cmphdr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A system generated number used to track production information.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'arc_cmphdr', @level2type = N'COLUMN', @level2name = N'cmpkey';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warehouse ID - the warehouse in which archived components is to be processed.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'arc_cmphdr', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This is part of the foreign key to the Work Order Header (wkohdr) table.  These fields are nullable because we may receive the component tracking information from a host download, or it may be manually entered and not tied to a work order.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'arc_cmphdr', @level2type = N'COLUMN', @level2name = N'client_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This is part of the foreign key to the Work Order Header (wkohdr) table.  These fields are nullable because we may receive the component tracking information from a host download, or it may be manually entered and not tied to a work order.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'arc_cmphdr', @level2type = N'COLUMN', @level2name = N'wkonum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This is part of the foreign key to the Work Order Header (wkohdr) table.  These fields are nullable because we may receive the component tracking information from a host download, or it may be manually entered and not tied to a work order.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'arc_cmphdr', @level2type = N'COLUMN', @level2name = N'wkorev';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This is the item number of the finished goods inventory that was produced.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'arc_cmphdr', @level2type = N'COLUMN', @level2name = N'prtnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Client id of item number.  In non-3PL systems, this will be set to a default of ''----''.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'arc_cmphdr', @level2type = N'COLUMN', @level2name = N'prt_client_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If finished good is tracked by lot number, this field will be filled in with the lot number of the produced inventory.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'arc_cmphdr', @level2type = N'COLUMN', @level2name = N'lotnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Lot number supplied by the supplier for tracking purposes. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'arc_cmphdr', @level2type = N'COLUMN', @level2name = N'sup_lotnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If finished good is tracked by revision level, this field will be filled in with the revision level of the produced inventory.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'arc_cmphdr', @level2type = N'COLUMN', @level2name = N'revlvl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If finished good is tracked by origin code, this field will be filled in with the origin code of the produced inventory.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'arc_cmphdr', @level2type = N'COLUMN', @level2name = N'orgcod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If the finished good is serialized at a case or piece level, this field will contain the case label information.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'arc_cmphdr', @level2type = N'COLUMN', @level2name = N'subnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If the finished good is serialized at a piece level, then this field will be filled in with the piece serial number - additionally, the subnum will be filled in with the case serial number that this piece resides in.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'arc_cmphdr', @level2type = N'COLUMN', @level2name = N'dtlnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If finished good is tracked by Inventory Attribute Text 1, this field will be filled in with the Inventory Attribute Text 1 of the produced inventory.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'arc_cmphdr', @level2type = N'COLUMN', @level2name = N'inv_attr_str1';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If finished good is tracked by Inventory Attribute Text 2, this field will be filled in with the Inventory Attribute Text 2 of the produced inventory.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'arc_cmphdr', @level2type = N'COLUMN', @level2name = N'inv_attr_str2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If finished good is tracked by Inventory Attribute Text 3, this field will be filled in with the Inventory Attribute Text 3 of the produced inventory.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'arc_cmphdr', @level2type = N'COLUMN', @level2name = N'inv_attr_str3';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If finished good is tracked by Inventory Attribute Text 4, this field will be filled in with the Inventory Attribute Text 4 of the produced inventory.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'arc_cmphdr', @level2type = N'COLUMN', @level2name = N'inv_attr_str4';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If finished good is tracked by Inventory Attribute Text 5, this field will be filled in with the Inventory Attribute Text 5 of the produced inventory.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'arc_cmphdr', @level2type = N'COLUMN', @level2name = N'inv_attr_str5';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If finished good is tracked by Inventory Attribute Text 6, this field will be filled in with the Inventory Attribute Text 6 of the produced inventory.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'arc_cmphdr', @level2type = N'COLUMN', @level2name = N'inv_attr_str6';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If finished good is tracked by Inventory Attribute Text 7, this field will be filled in with the Inventory Attribute Text 7 of the produced inventory.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'arc_cmphdr', @level2type = N'COLUMN', @level2name = N'inv_attr_str7';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If finished good is tracked by Inventory Attribute Text 8, this field will be filled in with the Inventory Attribute Text 8 of the produced inventory.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'arc_cmphdr', @level2type = N'COLUMN', @level2name = N'inv_attr_str8';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If finished good is tracked by Inventory Attribute Text 9, this field will be filled in with the Inventory Attribute Text 9 of the produced inventory.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'arc_cmphdr', @level2type = N'COLUMN', @level2name = N'inv_attr_str9';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If finished good is tracked by Inventory Attribute Text 10, this field will be filled in with the Inventory Attribute Text 10 of the produced inventory.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'arc_cmphdr', @level2type = N'COLUMN', @level2name = N'inv_attr_str10';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If finished good is tracked by Inventory Attribute Text 11, this field will be filled in with the Inventory Attribute Text 11 of the produced inventory.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'arc_cmphdr', @level2type = N'COLUMN', @level2name = N'inv_attr_str11';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If finished good is tracked by Inventory Attribute Text 12, this field will be filled in with the Inventory Attribute Text 12 of the produced inventory.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'arc_cmphdr', @level2type = N'COLUMN', @level2name = N'inv_attr_str12';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If finished good is tracked by Inventory Attribute Text 13, this field will be filled in with the Inventory Attribute Text 13 of the produced inventory.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'arc_cmphdr', @level2type = N'COLUMN', @level2name = N'inv_attr_str13';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If finished good is tracked by Inventory Attribute Text 14, this field will be filled in with the Inventory Attribute Text 14 of the produced inventory.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'arc_cmphdr', @level2type = N'COLUMN', @level2name = N'inv_attr_str14';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If finished good is tracked by Inventory Attribute Text 15, this field will be filled in with the Inventory Attribute Text 15 of the produced inventory.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'arc_cmphdr', @level2type = N'COLUMN', @level2name = N'inv_attr_str15';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If finished good is tracked by Inventory Attribute Text 16, this field will be filled in with the Inventory Attribute Text 16 of the produced inventory.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'arc_cmphdr', @level2type = N'COLUMN', @level2name = N'inv_attr_str16';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If finished good is tracked by Inventory Attribute Text 17, this field will be filled in with the Inventory Attribute Text 17 of the produced inventory.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'arc_cmphdr', @level2type = N'COLUMN', @level2name = N'inv_attr_str17';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If finished good is tracked by Inventory Attribute Text 18, this field will be filled in with the Inventory Attribute Text 18 of the produced inventory.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'arc_cmphdr', @level2type = N'COLUMN', @level2name = N'inv_attr_str18';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If finished good is tracked by Inventory Attribute Number 1, this field will be filled in with the Inventory Attribute Number 1 of the produced inventory.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'arc_cmphdr', @level2type = N'COLUMN', @level2name = N'inv_attr_int1';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If finished good is tracked by Inventory Attribute Number 2, this field will be filled in with the Inventory Attribute Number 2 of the produced inventory.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'arc_cmphdr', @level2type = N'COLUMN', @level2name = N'inv_attr_int2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If finished good is tracked by Inventory Attribute Number 3, this field will be filled in with the Inventory Attribute Number 3 of the produced inventory.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'arc_cmphdr', @level2type = N'COLUMN', @level2name = N'inv_attr_int3';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If finished good is tracked by Inventory Attribute Number 4, this field will be filled in with the Inventory Attribute Number 4 of the produced inventory.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'arc_cmphdr', @level2type = N'COLUMN', @level2name = N'inv_attr_int4';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If finished good is tracked by Inventory Attribute Number 5, this field will be filled in with the Inventory Attribute Number 5 of the produced inventory.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'arc_cmphdr', @level2type = N'COLUMN', @level2name = N'inv_attr_int5';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If finished good is tracked by Inventory Attribute Decimal 1, this field will be filled in with the Inventory Attribute Decimal 1 of the produced inventory.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'arc_cmphdr', @level2type = N'COLUMN', @level2name = N'inv_attr_flt1';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If finished good is tracked by Inventory Attribute Decimal 2, this field will be filled in with the Inventory Attribute Decimal 2 of the produced inventory.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'arc_cmphdr', @level2type = N'COLUMN', @level2name = N'inv_attr_flt2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If finished good is tracked by Inventory Attribute Decimal 3, this field will be filled in with the Inventory Attribute Decimal 3 of the produced inventory.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'arc_cmphdr', @level2type = N'COLUMN', @level2name = N'inv_attr_flt3';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If finished good is tracked by Inventory Attribute Date 1, this field will be filled in with the Inventory Attribute Date 1 of the produced inventory.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'arc_cmphdr', @level2type = N'COLUMN', @level2name = N'inv_attr_dte1';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If finished good is tracked by Inventory Attribute Date 2, this field will be filled in with the Inventory Attribute Date 2 of the produced inventory.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'arc_cmphdr', @level2type = N'COLUMN', @level2name = N'inv_attr_dte2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date/time that product was produced.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'arc_cmphdr', @level2type = N'COLUMN', @level2name = N'prddte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Production Line. It indicates the place where finished good comes from. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'arc_cmphdr', @level2type = N'COLUMN', @level2name = N'prdlin';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User id of the user that produced the finished good.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'arc_cmphdr', @level2type = N'COLUMN', @level2name = N'usr_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Unit quantity of finished good produced.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'arc_cmphdr', @level2type = N'COLUMN', @level2name = N'untqty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This flag will be set if this component is ever later consumed and becomes a sub-component of another.  This is useful in optimizing queries looking for finished goods which contain a particular component.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'arc_cmphdr', @level2type = N'COLUMN', @level2name = N'sub_cmpflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The version number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'arc_cmphdr', @level2type = N'COLUMN', @level2name = N'u_version';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was inserted', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'arc_cmphdr', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was last updated', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'arc_cmphdr', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who created the row', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'arc_cmphdr', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'arc_cmphdr', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

