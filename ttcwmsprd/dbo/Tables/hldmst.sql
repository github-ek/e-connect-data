CREATE TABLE [dbo].[hldmst] (
    [hldpfx]            NVARCHAR (32)   NOT NULL,
    [hldnum]            NVARCHAR (10)   NOT NULL,
    [wh_id]             NVARCHAR (32)   NOT NULL,
    [hldtyp]            NVARCHAR (4)    NULL,
    [enaflg]            INT             NULL,
    [alcflg]            INT             NULL,
    [shpflg]            INT             NULL,
    [future_flg]        INT             NULL,
    [prtnum]            NVARCHAR (50)   NULL,
    [client_id]         NVARCHAR (32)   NULL,
    [prtfam]            NVARCHAR (10)   NULL,
    [lotnum]            NVARCHAR (25)   NULL,
    [sup_lotnum]        NVARCHAR (25)   NULL,
    [revlvl]            NVARCHAR (25)   NULL,
    [orgcod]            NVARCHAR (25)   NULL,
    [beg_mandte]        DATETIME        NULL,
    [end_mandte]        DATETIME        NULL,
    [invsts]            NVARCHAR (4)    NULL,
    [trknum]            NVARCHAR (20)   NULL,
    [supnum]            NVARCHAR (32)   NULL,
    [invnum]            NVARCHAR (35)   NULL,
    [wkonum]            NVARCHAR (20)   NULL,
    [wkorev]            NVARCHAR (10)   NULL,
    [stoloc]            NVARCHAR (20)   NULL,
    [arecod]            NVARCHAR (10)   NULL,
    [reacod]            NVARCHAR (20)   NULL,
    [invsts_chg_flg]    INT             DEFAULT ((1)) NOT NULL,
    [credte]            DATETIME        NULL,
    [cre_usr_id]        NVARCHAR (40)   NULL,
    [moddte]            DATETIME        NULL,
    [mod_usr_id]        NVARCHAR (40)   NULL,
    [cstms_cnsgnmnt_id] NVARCHAR (18)   NULL,
    [rttn_id]           NVARCHAR (10)   NULL,
    [cstms_bond_flg]    INT             NULL,
    [dty_stmp_flg]      INT             NULL,
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
    CONSTRAINT [hldmst_pk] PRIMARY KEY CLUSTERED ([hldpfx] ASC, [hldnum] ASC, [wh_id] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [hldmst_alcflg_ck] CHECK ([alcflg]=(0) OR [alcflg]=(1)),
    CONSTRAINT [hldmst_enaflg_ck] CHECK ([enaflg]=(0) OR [enaflg]=(1)),
    CONSTRAINT [hldmst_futureflgck] CHECK ([future_flg]=(0) OR [future_flg]=(1)),
    CONSTRAINT [hldmst_invstschgck] CHECK ([invsts_chg_flg]=(0) OR [invsts_chg_flg]=(1)),
    CONSTRAINT [hldmst_shpflg_ck] CHECK ([shpflg]=(0) OR [shpflg]=(1))
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The hold master is the table that defines the holds which can be applied to inventory.  The hold master is tied to the invdtl by the table invhld.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'hldmst';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Hold Prefix.  A prefix which denotes the origin of the hold number.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'hldmst', @level2type = N'COLUMN', @level2name = N'hldpfx';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Hold Number.  A unique user defined or system generated code which uniquely identifies each individual hold master.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'hldmst', @level2type = N'COLUMN', @level2name = N'hldnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warehouse ID. Warehouse that owns the hold.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'hldmst', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Hold Type.  Used to categorize different hold masters.  Purely for display purposes. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'hldmst', @level2type = N'COLUMN', @level2name = N'hldtyp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Enable Flag.  If this hold master is enabled, then it is available to be applied to inventory.  If it is disabled, then it is free to be purged.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'hldmst', @level2type = N'COLUMN', @level2name = N'enaflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Allow Allocation Flag.  Can we allocate against this hold?', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'hldmst', @level2type = N'COLUMN', @level2name = N'alcflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Allow Shipping Flag.  Can we ship inventory against this hold?', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'hldmst', @level2type = N'COLUMN', @level2name = N'shpflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Future flag.  Should this hold be applied to future inducted inventory?', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'hldmst', @level2type = N'COLUMN', @level2name = N'future_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Item Number.  Used when specifying product criteria for future holds.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'hldmst', @level2type = N'COLUMN', @level2name = N'prtnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Client ID. Used when specifying product criteria for future holds.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'hldmst', @level2type = N'COLUMN', @level2name = N'client_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Item Family. Used when specifying product criteria for future holds.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'hldmst', @level2type = N'COLUMN', @level2name = N'prtfam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Lot Number. Used when specifying product criteria for future holds.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'hldmst', @level2type = N'COLUMN', @level2name = N'lotnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Lot number supplied by the supplier for tracking purposes. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'hldmst', @level2type = N'COLUMN', @level2name = N'sup_lotnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Revision Level.  Used when specifying product criteria for future holds.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'hldmst', @level2type = N'COLUMN', @level2name = N'revlvl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Origin Code.  Used when specifying product criteria for future holds.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'hldmst', @level2type = N'COLUMN', @level2name = N'orgcod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Beginning Manufacturing Date. Used when specifying product criteria for future holds.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'hldmst', @level2type = N'COLUMN', @level2name = N'beg_mandte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Ending Manufacturing Date.  Used when specifying product criteria for future holds.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'hldmst', @level2type = N'COLUMN', @level2name = N'end_mandte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Status.  Used when specifying product criteria for future holds.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'hldmst', @level2type = N'COLUMN', @level2name = N'invsts';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Truck Number.  Used when specifying product criteria for future holds.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'hldmst', @level2type = N'COLUMN', @level2name = N'trknum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Supplier Number.  Used when specifying product criteria for future holds.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'hldmst', @level2type = N'COLUMN', @level2name = N'supnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Invoice Number.  Used when specifying product criteria for future holds.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'hldmst', @level2type = N'COLUMN', @level2name = N'invnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Work Order Number.  Used when specifying product criteria for future holds.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'hldmst', @level2type = N'COLUMN', @level2name = N'wkonum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Work Order Revision.  Used when specifying product criteria for future holds.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'hldmst', @level2type = N'COLUMN', @level2name = N'wkorev';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Storage Location.  Used when specifying product criteria for future holds.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'hldmst', @level2type = N'COLUMN', @level2name = N'stoloc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Area Code.  Used when specifying product criteria for future holds.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'hldmst', @level2type = N'COLUMN', @level2name = N'arecod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Reason Code.  Used when specifying product criteria for future holds.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'hldmst', @level2type = N'COLUMN', @level2name = N'reacod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Allow Inventory Status Change.  This flag indicates that when putting an inventory to hold or releasing a hold, if user can change the inventory status. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'hldmst', @level2type = N'COLUMN', @level2name = N'invsts_chg_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Create Date.  When was this hold master created?', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'hldmst', @level2type = N'COLUMN', @level2name = N'credte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Create User ID.  Who created this hold master?', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'hldmst', @level2type = N'COLUMN', @level2name = N'cre_usr_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Modify Date.  When was this hold master last modified?', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'hldmst', @level2type = N'COLUMN', @level2name = N'moddte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Modify User ID.  What user last modified this hold master?', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'hldmst', @level2type = N'COLUMN', @level2name = N'mod_usr_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Customs Consignment ID. Used when specifying product criteria for future holds.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'hldmst', @level2type = N'COLUMN', @level2name = N'cstms_cnsgnmnt_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Rotation ID.Used when specifying product criteria for future holds.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'hldmst', @level2type = N'COLUMN', @level2name = N'rttn_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Under Bond. Flag used when specifying product criteria for future holds. ''1'' for under bond inventory and ''0'' non-bond inventory. A value of NULL indicates any inventory.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'hldmst', @level2type = N'COLUMN', @level2name = N'cstms_bond_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Excise Duty Stamp. Flag used when specifying product criteria for future holds. ''1'' for Excise Duty Stamp inventory and ''0'' for Non-Excise Duty Stamp inventory. A value of NULL indicates any inventory.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'hldmst', @level2type = N'COLUMN', @level2name = N'dty_stmp_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 1.This field can be used when specifying product criteria for future holds.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'hldmst', @level2type = N'COLUMN', @level2name = N'inv_attr_str1';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 2.This field can be used when specifying product criteria for future holds.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'hldmst', @level2type = N'COLUMN', @level2name = N'inv_attr_str2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 3.This field can be used when specifying product criteria for future holds.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'hldmst', @level2type = N'COLUMN', @level2name = N'inv_attr_str3';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 4.This field can be used when specifying product criteria for future holds.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'hldmst', @level2type = N'COLUMN', @level2name = N'inv_attr_str4';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 5.This field can be used when specifying product criteria for future holds.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'hldmst', @level2type = N'COLUMN', @level2name = N'inv_attr_str5';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 6.This field can be used when specifying product criteria for future holds.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'hldmst', @level2type = N'COLUMN', @level2name = N'inv_attr_str6';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 7.This field can be used when specifying product criteria for future holds.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'hldmst', @level2type = N'COLUMN', @level2name = N'inv_attr_str7';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 8.This field can be used when specifying product criteria for future holds.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'hldmst', @level2type = N'COLUMN', @level2name = N'inv_attr_str8';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 9.This field can be used when specifying product criteria for future holds.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'hldmst', @level2type = N'COLUMN', @level2name = N'inv_attr_str9';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 10.This field can be used when specifying product criteria for future holds.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'hldmst', @level2type = N'COLUMN', @level2name = N'inv_attr_str10';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 11.This field can be used when specifying product criteria for future holds.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'hldmst', @level2type = N'COLUMN', @level2name = N'inv_attr_str11';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 12.This field can be used when specifying product criteria for future holds.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'hldmst', @level2type = N'COLUMN', @level2name = N'inv_attr_str12';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 13.This field can be used when specifying product criteria for future holds.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'hldmst', @level2type = N'COLUMN', @level2name = N'inv_attr_str13';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 14.This field can be used when specifying product criteria for future holds.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'hldmst', @level2type = N'COLUMN', @level2name = N'inv_attr_str14';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 15.This field can be used when specifying product criteria for future holds.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'hldmst', @level2type = N'COLUMN', @level2name = N'inv_attr_str15';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 16.This field can be used when specifying product criteria for future holds.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'hldmst', @level2type = N'COLUMN', @level2name = N'inv_attr_str16';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 17.This field can be used when specifying product criteria for future holds.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'hldmst', @level2type = N'COLUMN', @level2name = N'inv_attr_str17';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 18.This field can be used when specifying product criteria for future holds.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'hldmst', @level2type = N'COLUMN', @level2name = N'inv_attr_str18';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Number 1.This field can be used when specifying product criteria for future holds.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'hldmst', @level2type = N'COLUMN', @level2name = N'inv_attr_int1';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Number 2.This field can be used when specifying product criteria for future holds.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'hldmst', @level2type = N'COLUMN', @level2name = N'inv_attr_int2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Number 3.This field can be used when specifying product criteria for future holds.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'hldmst', @level2type = N'COLUMN', @level2name = N'inv_attr_int3';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Number 4.This field can be used when specifying product criteria for future holds.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'hldmst', @level2type = N'COLUMN', @level2name = N'inv_attr_int4';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Number 5.This field can be used when specifying product criteria for future holds.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'hldmst', @level2type = N'COLUMN', @level2name = N'inv_attr_int5';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Decimal 1.This field can be used when specifying product criteria for future holds.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'hldmst', @level2type = N'COLUMN', @level2name = N'inv_attr_flt1';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Decimal 2.This field can be used when specifying product criteria for future holds.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'hldmst', @level2type = N'COLUMN', @level2name = N'inv_attr_flt2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Decimal 3.This field can be used when specifying product criteria for future holds.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'hldmst', @level2type = N'COLUMN', @level2name = N'inv_attr_flt3';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Date 1.This field can be used when specifying product criteria for future holds.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'hldmst', @level2type = N'COLUMN', @level2name = N'inv_attr_dte1';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Date 2.This field can be used when specifying product criteria for future holds.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'hldmst', @level2type = N'COLUMN', @level2name = N'inv_attr_dte2';

