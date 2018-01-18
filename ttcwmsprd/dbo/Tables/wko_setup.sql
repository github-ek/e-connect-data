CREATE TABLE [dbo].[wko_setup] (
    [wkonum]         NVARCHAR (20)   NOT NULL,
    [client_id]      NVARCHAR (32)   NOT NULL,
    [wkorev]         NVARCHAR (10)   NOT NULL,
    [wkolin]         NVARCHAR (10)   NOT NULL,
    [wh_id]          NVARCHAR (32)   NOT NULL,
    [prtnum]         NVARCHAR (50)   NOT NULL,
    [prt_client_id]  NVARCHAR (32)   NOT NULL,
    [seqnum]         INT             NOT NULL,
    [supnum]         NVARCHAR (32)   NULL,
    [lotnum]         NVARCHAR (25)   NULL,
    [sup_lotnum]     NVARCHAR (25)   NULL,
    [revlvl]         NVARCHAR (25)   NULL,
    [orgcod]         NVARCHAR (25)   NULL,
    [invsts]         NVARCHAR (4)    NULL,
    [untqty]         NUMERIC (19, 4) NULL,
    [inv_attr_str1]  NVARCHAR (100)  NULL,
    [inv_attr_str2]  NVARCHAR (100)  NULL,
    [inv_attr_str3]  NVARCHAR (100)  NULL,
    [inv_attr_str4]  NVARCHAR (100)  NULL,
    [inv_attr_str5]  NVARCHAR (100)  NULL,
    [inv_attr_str6]  NVARCHAR (100)  NULL,
    [inv_attr_str7]  NVARCHAR (100)  NULL,
    [inv_attr_str8]  NVARCHAR (100)  NULL,
    [inv_attr_str9]  NVARCHAR (100)  NULL,
    [inv_attr_str10] NVARCHAR (100)  NULL,
    [inv_attr_str11] NVARCHAR (100)  NULL,
    [inv_attr_str12] NVARCHAR (100)  NULL,
    [inv_attr_str13] NVARCHAR (100)  NULL,
    [inv_attr_str14] NVARCHAR (100)  NULL,
    [inv_attr_str15] NVARCHAR (100)  NULL,
    [inv_attr_str16] NVARCHAR (100)  NULL,
    [inv_attr_str17] NVARCHAR (100)  NULL,
    [inv_attr_str18] NVARCHAR (100)  NULL,
    [inv_attr_int1]  INT             NULL,
    [inv_attr_int2]  INT             NULL,
    [inv_attr_int3]  INT             NULL,
    [inv_attr_int4]  INT             NULL,
    [inv_attr_int5]  INT             NULL,
    [inv_attr_flt1]  NUMERIC (19, 4) NULL,
    [inv_attr_flt2]  NUMERIC (19, 4) NULL,
    [inv_attr_flt3]  NUMERIC (19, 4) NULL,
    [inv_attr_dte1]  DATETIME        NULL,
    [inv_attr_dte2]  DATETIME        NULL,
    [mod_usr_id]     NVARCHAR (40)   NULL,
    [moddte]         DATETIME        NULL,
    CONSTRAINT [wko_setup_pk] PRIMARY KEY CLUSTERED ([wkonum] ASC, [wkorev] ASC, [wkolin] ASC, [prtnum] ASC, [wh_id] ASC, [prt_client_id] ASC, [client_id] ASC, [seqnum] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Holds constant values for information that must be captured at the time of identification of a top level item.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wko_setup';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warehouse ID - the warehouse in which the work order is to be processed.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wko_setup', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This is the item number of the component being used. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wko_setup', @level2type = N'COLUMN', @level2name = N'prtnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Client id of item number.  In non-3PL systems, this will be set to a default of ''----'' ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wko_setup', @level2type = N'COLUMN', @level2name = N'prt_client_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Sequence Number: This number is used to ensure wko_setup primary keys are unique.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wko_setup', @level2type = N'COLUMN', @level2name = N'seqnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Supplier Number : Supplier number specific to the component.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wko_setup', @level2type = N'COLUMN', @level2name = N'supnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If component item is tracked by lot number, this field will be filled in with the lot number used to produce the finished item. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wko_setup', @level2type = N'COLUMN', @level2name = N'lotnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Lot number supplied by the supplier for tracking purposes.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wko_setup', @level2type = N'COLUMN', @level2name = N'sup_lotnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If component good is tracked by revision level, this field will be filled in with the revision level used to produce the finished item. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wko_setup', @level2type = N'COLUMN', @level2name = N'revlvl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If the component good is tracked by origin code, this field will be filled in with the origin code used to produce the finished item. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wko_setup', @level2type = N'COLUMN', @level2name = N'orgcod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Shows the inventory status to use when consuming this item into the finished item. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wko_setup', @level2type = N'COLUMN', @level2name = N'invsts';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Unit quantity of component item to create 1 of the top level item. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wko_setup', @level2type = N'COLUMN', @level2name = N'untqty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If component item is tracked by Inventory Attribute Text 1, this field will be filled in with the text value for Inventory Attribute Text 1 used to produce the finished item.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wko_setup', @level2type = N'COLUMN', @level2name = N'inv_attr_str1';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If component item is tracked by Inventory Attribute Text 2, this field will be filled in with the text value for Inventory Attribute Text 2 used to produce the finished item.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wko_setup', @level2type = N'COLUMN', @level2name = N'inv_attr_str2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If component item is tracked by Inventory Attribute Text 3, this field will be filled in with the text value for Inventory Attribute Text 3 used to produce the finished item.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wko_setup', @level2type = N'COLUMN', @level2name = N'inv_attr_str3';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If component item is tracked by Inventory Attribute Text 4, this field will be filled in with the text value for Inventory Attribute Text 4 used to produce the finished item.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wko_setup', @level2type = N'COLUMN', @level2name = N'inv_attr_str4';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If component item is tracked by Inventory Attribute Text 5, this field will be filled in with the text value for Inventory Attribute Text 5 used to produce the finished item.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wko_setup', @level2type = N'COLUMN', @level2name = N'inv_attr_str5';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If component item is tracked by Inventory Attribute Text 6, this field will be filled in with the text value for Inventory Attribute Text 6 used to produce the finished item.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wko_setup', @level2type = N'COLUMN', @level2name = N'inv_attr_str6';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If component item is tracked by Inventory Attribute Text 7, this field will be filled in with the text value for Inventory Attribute Text 7 used to produce the finished item.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wko_setup', @level2type = N'COLUMN', @level2name = N'inv_attr_str7';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If component item is tracked by Inventory Attribute Text 8, this field will be filled in with the text value for Inventory Attribute Text 8 used to produce the finished item.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wko_setup', @level2type = N'COLUMN', @level2name = N'inv_attr_str8';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If component item is tracked by Inventory Attribute Text 9, this field will be filled in with the text value for Inventory Attribute Text 9 used to produce the finished item.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wko_setup', @level2type = N'COLUMN', @level2name = N'inv_attr_str9';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If component item is tracked by Inventory Attribute Text 10, this field will be filled in with the text value for Inventory Attribute Text 10 used to produce the finished item.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wko_setup', @level2type = N'COLUMN', @level2name = N'inv_attr_str10';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If component item is tracked by Inventory Attribute Text 11, this field will be filled in with the text value for Inventory Attribute Text 11 used to produce the finished item.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wko_setup', @level2type = N'COLUMN', @level2name = N'inv_attr_str11';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If component item is tracked by Inventory Attribute Text 12, this field will be filled in with the text value for Inventory Attribute Text 12 used to produce the finished item.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wko_setup', @level2type = N'COLUMN', @level2name = N'inv_attr_str12';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If component item is tracked by Inventory Attribute Text 13, this field will be filled in with the text value for Inventory Attribute Text 13 used to produce the finished item.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wko_setup', @level2type = N'COLUMN', @level2name = N'inv_attr_str13';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If component item is tracked by Inventory Attribute Text 14, this field will be filled in with the text value for Inventory Attribute Text 14 used to produce the finished item.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wko_setup', @level2type = N'COLUMN', @level2name = N'inv_attr_str14';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If component item is tracked by Inventory Attribute Text 15, this field will be filled in with the text value for Inventory Attribute Text 15 used to produce the finished item.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wko_setup', @level2type = N'COLUMN', @level2name = N'inv_attr_str15';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If component item is tracked by Inventory Attribute Text 16, this field will be filled in with the text value for Inventory Attribute Text 16 used to produce the finished item.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wko_setup', @level2type = N'COLUMN', @level2name = N'inv_attr_str16';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If component item is tracked by Inventory Attribute Text 17, this field will be filled in with the text value for Inventory Attribute Text 17 used to produce the finished item.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wko_setup', @level2type = N'COLUMN', @level2name = N'inv_attr_str17';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If component item is tracked by Inventory Attribute Text 18, this field will be filled in with the text value for Inventory Attribute Text 18 used to produce the finished item.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wko_setup', @level2type = N'COLUMN', @level2name = N'inv_attr_str18';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If component item is tracked by Inventory Attribute Number 1, this field will be filled in with the numeric value for Inventory Attribute Number 1 used to produce the finished item.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wko_setup', @level2type = N'COLUMN', @level2name = N'inv_attr_int1';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If component item is tracked by Inventory Attribute Number 2, this field will be filled in with the numeric value for Inventory Attribute Number 2 used to produce the finished item.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wko_setup', @level2type = N'COLUMN', @level2name = N'inv_attr_int2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If component item is tracked by Inventory Attribute Number 3, this field will be filled in with the numeric value for Inventory Attribute Number 3 used to produce the finished item.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wko_setup', @level2type = N'COLUMN', @level2name = N'inv_attr_int3';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If component item is tracked by Inventory Attribute Number 4, this field will be filled in with the numeric value for Inventory Attribute Number 4 used to produce the finished item.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wko_setup', @level2type = N'COLUMN', @level2name = N'inv_attr_int4';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If component item is tracked by Inventory Attribute Number 5, this field will be filled in with the numeric value for Inventory Attribute Number 5 used to produce the finished item.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wko_setup', @level2type = N'COLUMN', @level2name = N'inv_attr_int5';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If component item is tracked by Inventory Attribute Decimal 1, this field will be filled in with the decimal value for Inventory Attribute Decimal 1 used to produce the finished item.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wko_setup', @level2type = N'COLUMN', @level2name = N'inv_attr_flt1';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If component item is tracked by Inventory Attribute Decimal 2, this field will be filled in with the decimal value for Inventory Attribute Decimal 2 used to produce the finished item.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wko_setup', @level2type = N'COLUMN', @level2name = N'inv_attr_flt2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If component item is tracked by Inventory Attribute Decimal 3, this field will be filled in with the decimal value for Inventory Attribute Decimal 3 used to produce the finished item.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wko_setup', @level2type = N'COLUMN', @level2name = N'inv_attr_flt3';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If component item is tracked by Inventory Attribute Date 1, this field will be filled in with the date value for Inventory Attribute Date 1 used to produce the finished item.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wko_setup', @level2type = N'COLUMN', @level2name = N'inv_attr_dte1';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If component item is tracked by Inventory Attribute Date 2, this field will be filled in with the date value for Inventory Attribute Date 2 used to produce the finished item.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wko_setup', @level2type = N'COLUMN', @level2name = N'inv_attr_dte2';

