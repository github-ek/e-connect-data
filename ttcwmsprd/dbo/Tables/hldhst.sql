CREATE TABLE [dbo].[hldhst] (
    [hldhst_id]         NVARCHAR (10)   NOT NULL,
    [hlddte]            DATETIME        NOT NULL,
    [acttyp]            NVARCHAR (4)    NOT NULL,
    [hldpfx]            NVARCHAR (32)   NOT NULL,
    [hldnum]            NVARCHAR (10)   NOT NULL,
    [hldtyp]            NVARCHAR (4)    NULL,
    [wh_id]             NVARCHAR (32)   NOT NULL,
    [hld_usr_id]        NVARCHAR (40)   NOT NULL,
    [prtnum]            NVARCHAR (50)   NOT NULL,
    [prt_client_id]     NVARCHAR (32)   NOT NULL,
    [lotnum]            NVARCHAR (25)   NULL,
    [sup_lotnum]        NVARCHAR (25)   NULL,
    [revlvl]            NVARCHAR (25)   NULL,
    [orgcod]            NVARCHAR (25)   NULL,
    [supnum]            NVARCHAR (32)   NULL,
    [fr_invsts]         NVARCHAR (4)    NOT NULL,
    [to_invsts]         NVARCHAR (4)    NOT NULL,
    [lodnum]            NVARCHAR (30)   NOT NULL,
    [subnum]            NVARCHAR (30)   NOT NULL,
    [dtlnum]            NVARCHAR (30)   NOT NULL,
    [loducc]            NVARCHAR (20)   NULL,
    [subucc]            NVARCHAR (20)   NULL,
    [reacod]            NVARCHAR (20)   NULL,
    [untqty]            INT             NOT NULL,
    [cstms_cnsgnmnt_id] NVARCHAR (18)   NULL,
    [rttn_id]           NVARCHAR (10)   NULL,
    [cstms_bond_flg]    INT             DEFAULT ((0)) NOT NULL,
    [dty_stmp_flg]      INT             DEFAULT ((0)) NOT NULL,
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
    CONSTRAINT [hldhst_pk] PRIMARY KEY CLUSTERED ([hldhst_id] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [hldhst_cstbndflgck] CHECK ([cstms_bond_flg]=(0) OR [cstms_bond_flg]=(1)),
    CONSTRAINT [hldhst_exdtystp_ck] CHECK ([dty_stmp_flg]=(0) OR [dty_stmp_flg]=(1))
);


GO
CREATE NONCLUSTERED INDEX [hldhst_hlddte]
    ON [dbo].[hldhst]([hlddte] ASC) WITH (FILLFACTOR = 90);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The hold history table keeps an auditting trail of all hold activity on pieces of inventory.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'hldhst';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Hold History ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'hldhst', @level2type = N'COLUMN', @level2name = N'hldhst_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Hold Date.  Date activity took place.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'hldhst', @level2type = N'COLUMN', @level2name = N'hlddte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Type of activity.  Valid values are (A)pply and (R)elease.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'hldhst', @level2type = N'COLUMN', @level2name = N'acttyp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Hold Prefix.  Denotes origin of the hold.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'hldhst', @level2type = N'COLUMN', @level2name = N'hldpfx';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Hold Number.  Hold involved in the activity.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'hldhst', @level2type = N'COLUMN', @level2name = N'hldnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Hold Type. A user defined code retrieved from code master.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'hldhst', @level2type = N'COLUMN', @level2name = N'hldtyp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warehouse ID. Warehouse that owns the hold.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'hldhst', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Hold User ID.  User who performed the action.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'hldhst', @level2type = N'COLUMN', @level2name = N'hld_usr_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Item Number.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'hldhst', @level2type = N'COLUMN', @level2name = N'prtnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Item Client ID.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'hldhst', @level2type = N'COLUMN', @level2name = N'prt_client_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Lot Number.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'hldhst', @level2type = N'COLUMN', @level2name = N'lotnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Lot number supplied by the supplier for tracking purposes. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'hldhst', @level2type = N'COLUMN', @level2name = N'sup_lotnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Revision Level.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'hldhst', @level2type = N'COLUMN', @level2name = N'revlvl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Origin Code.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'hldhst', @level2type = N'COLUMN', @level2name = N'orgcod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Supplier Number specific to the inventory.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'hldhst', @level2type = N'COLUMN', @level2name = N'supnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'From Inventory Status.  Status before action', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'hldhst', @level2type = N'COLUMN', @level2name = N'fr_invsts';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'To Inventory Status.  Resulting inventory status of action.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'hldhst', @level2type = N'COLUMN', @level2name = N'to_invsts';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Load Number.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'hldhst', @level2type = N'COLUMN', @level2name = N'lodnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Subload Number.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'hldhst', @level2type = N'COLUMN', @level2name = N'subnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Detail Number.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'hldhst', @level2type = N'COLUMN', @level2name = N'dtlnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Load UCC Code Number.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'hldhst', @level2type = N'COLUMN', @level2name = N'loducc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Subload UCC Code Number.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'hldhst', @level2type = N'COLUMN', @level2name = N'subucc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Reason Code.  Reason', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'hldhst', @level2type = N'COLUMN', @level2name = N'reacod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Unit Quantity.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'hldhst', @level2type = N'COLUMN', @level2name = N'untqty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Customs Consignment ID - Customs Consignment ID uniquely identify a consignment of bonded inventory on a per receipt basis.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'hldhst', @level2type = N'COLUMN', @level2name = N'cstms_cnsgnmnt_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Rotation ID used for tracking bonded inventory.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'hldhst', @level2type = N'COLUMN', @level2name = N'rttn_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Under Bond. Flag used to indicate whether or not the inventory is bonded. ''1'' means under bond and ''0'' means not under bond.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'hldhst', @level2type = N'COLUMN', @level2name = N'cstms_bond_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Excise Duty Stamp. Flag used to indicate whether or not the inventory has a duty stamp applied. ''1'' means yes and ''0'' means no.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'hldhst', @level2type = N'COLUMN', @level2name = N'dty_stmp_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 1.This field can be enabled to track and use custom text data during standard inventory-related operations.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'hldhst', @level2type = N'COLUMN', @level2name = N'inv_attr_str1';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 2.This field can be enabled to track and use custom text data during standard inventory-related operations.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'hldhst', @level2type = N'COLUMN', @level2name = N'inv_attr_str2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 3.This field can be enabled to track and use custom text data during standard inventory-related operations.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'hldhst', @level2type = N'COLUMN', @level2name = N'inv_attr_str3';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 4.This field can be enabled to track and use custom text data during standard inventory-related operations.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'hldhst', @level2type = N'COLUMN', @level2name = N'inv_attr_str4';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 5.This field can be enabled to track and use custom text data during standard inventory-related operations.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'hldhst', @level2type = N'COLUMN', @level2name = N'inv_attr_str5';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 6.This field can be enabled to track and use custom text data during standard inventory-related operations.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'hldhst', @level2type = N'COLUMN', @level2name = N'inv_attr_str6';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 7.This field can be enabled to track and use custom text data during standard inventory-related operations.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'hldhst', @level2type = N'COLUMN', @level2name = N'inv_attr_str7';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 8.This field can be enabled to track and use custom text data during standard inventory-related operations.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'hldhst', @level2type = N'COLUMN', @level2name = N'inv_attr_str8';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 9.This field can be enabled to track and use custom text data during standard inventory-related operations.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'hldhst', @level2type = N'COLUMN', @level2name = N'inv_attr_str9';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 10.This field can be enabled to track and use custom text data during standard inventory-related operations.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'hldhst', @level2type = N'COLUMN', @level2name = N'inv_attr_str10';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 11.This field can be enabled to track and use custom text data during standard inventory-related operations.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'hldhst', @level2type = N'COLUMN', @level2name = N'inv_attr_str11';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 12.This field can be enabled to track and use custom text data during standard inventory-related operations.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'hldhst', @level2type = N'COLUMN', @level2name = N'inv_attr_str12';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 13.This field can be enabled to track and use custom text data during standard inventory-related operations.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'hldhst', @level2type = N'COLUMN', @level2name = N'inv_attr_str13';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 14.This field can be enabled to track and use custom text data during standard inventory-related operations.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'hldhst', @level2type = N'COLUMN', @level2name = N'inv_attr_str14';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 15.This field can be enabled to track and use custom text data during standard inventory-related operations.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'hldhst', @level2type = N'COLUMN', @level2name = N'inv_attr_str15';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 16.This field can be enabled to track and use custom text data during standard inventory-related operations.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'hldhst', @level2type = N'COLUMN', @level2name = N'inv_attr_str16';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 17.This field can be enabled to track and use custom text data during standard inventory-related operations.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'hldhst', @level2type = N'COLUMN', @level2name = N'inv_attr_str17';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 18.This field can be enabled to track and use custom text data during standard inventory-related operations.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'hldhst', @level2type = N'COLUMN', @level2name = N'inv_attr_str18';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Number 1.This field can be enabled to track and use custom number data during standard inventory-related operations.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'hldhst', @level2type = N'COLUMN', @level2name = N'inv_attr_int1';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Number 2.This field can be enabled to track and use custom number data during standard inventory-related operations.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'hldhst', @level2type = N'COLUMN', @level2name = N'inv_attr_int2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Number 3.This field can be enabled to track and use custom number data during standard inventory-related operations.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'hldhst', @level2type = N'COLUMN', @level2name = N'inv_attr_int3';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Number 4.This field can be enabled to track and use custom number data during standard inventory-related operations.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'hldhst', @level2type = N'COLUMN', @level2name = N'inv_attr_int4';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Number 5.This field can be enabled to track and use custom number data during standard inventory-related operations.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'hldhst', @level2type = N'COLUMN', @level2name = N'inv_attr_int5';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Decimal 1.This field can be enabled to track and use custom decimal data during standard inventory-related operations.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'hldhst', @level2type = N'COLUMN', @level2name = N'inv_attr_flt1';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Decimal 2.This field can be enabled to track and use custom decimal data during standard inventory-related operations.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'hldhst', @level2type = N'COLUMN', @level2name = N'inv_attr_flt2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Decimal 3.This field can be enabled to track and use custom decimal data during standard inventory-related operations.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'hldhst', @level2type = N'COLUMN', @level2name = N'inv_attr_flt3';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Date 1.This field can be enabled to track and use custom date data during standard inventory-related operations.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'hldhst', @level2type = N'COLUMN', @level2name = N'inv_attr_dte1';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Date 2.This field can be enabled to track and use custom date data during standard inventory-related operations.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'hldhst', @level2type = N'COLUMN', @level2name = N'inv_attr_dte2';

