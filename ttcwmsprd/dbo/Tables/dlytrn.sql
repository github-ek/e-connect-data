CREATE TABLE [dbo].[dlytrn] (
    [dlytrn_id]        NVARCHAR (10)   NOT NULL,
    [trndte]           DATETIME        NULL,
    [oprcod]           NVARCHAR (9)    NULL,
    [actcod]           NVARCHAR (40)   NULL,
    [lodnum]           NVARCHAR (30)   NULL,
    [subnum]           NVARCHAR (30)   NULL,
    [dtlnum]           NVARCHAR (30)   NULL,
    [to_lodnum]        NVARCHAR (30)   NULL,
    [to_subnum]        NVARCHAR (30)   NULL,
    [to_dtlnum]        NVARCHAR (30)   NULL,
    [prtnum]           NVARCHAR (50)   NULL,
    [prt_client_id]    NVARCHAR (32)   NULL,
    [orgcod]           NVARCHAR (25)   NULL,
    [revlvl]           NVARCHAR (25)   NULL,
    [lotnum]           NVARCHAR (25)   NULL,
    [sup_lotnum]       NVARCHAR (25)   NULL,
    [supnum]           NVARCHAR (32)   NULL,
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
    [movref]           NVARCHAR (20)   NULL,
    [reacod]           NVARCHAR (20)   NULL,
    [trnqty]           INT             NULL,
    [catch_qty]        NUMERIC (19, 4) NULL,
    [traknm]           NVARCHAR (60)   NULL,
    [catch_unttyp]     NVARCHAR (30)   NULL,
    [fr_arecod]        NVARCHAR (10)   NULL,
    [frstol]           NVARCHAR (20)   NULL,
    [frinvs]           NVARCHAR (4)    NULL,
    [fr_age_pflnam]    NVARCHAR (30)   NULL,
    [to_arecod]        NVARCHAR (10)   NULL,
    [tostol]           NVARCHAR (20)   NULL,
    [toinvs]           NVARCHAR (4)    NULL,
    [to_age_pflnam]    NVARCHAR (30)   NULL,
    [trlr_num]         NVARCHAR (20)   NULL,
    [carcod]           NVARCHAR (10)   NULL,
    [ship_id]          NVARCHAR (30)   NULL,
    [client_id]        NVARCHAR (32)   NULL,
    [ordnum]           NVARCHAR (35)   NULL,
    [trndtl_id]        NVARCHAR (10)   NULL,
    [trndtl_table]     NVARCHAR (30)   NULL,
    [adj_ref1]         NVARCHAR (20)   NULL,
    [adj_ref2]         NVARCHAR (20)   NULL,
    [usr_id]           NVARCHAR (40)   NULL,
    [devcod]           NVARCHAR (20)   NULL,
    [arcdte]           DATETIME        NULL,
    [arc_src]          NVARCHAR (30)   NULL,
    [cmnt]             NVARCHAR (2000) NULL,
    [asset_typ]        NVARCHAR (30)   NULL,
    [asset_id]         NVARCHAR (30)   NULL,
    [asset_stat]       NVARCHAR (15)   NULL,
    [load_attr1_flg]   INT             DEFAULT ((0)) NOT NULL,
    [load_attr2_flg]   INT             DEFAULT ((0)) NOT NULL,
    [load_attr3_flg]   INT             DEFAULT ((0)) NOT NULL,
    [load_attr4_flg]   INT             DEFAULT ((0)) NOT NULL,
    [load_attr5_flg]   INT             DEFAULT ((0)) NOT NULL,
    [var_nam]          NVARCHAR (200)  NULL,
    [fr_value]         NVARCHAR (200)  NULL,
    [to_value]         NVARCHAR (200)  NULL,
    [wh_id]            NVARCHAR (32)   NULL,
    [uomcod]           NVARCHAR (2)    NULL,
    [ftpcod]           NVARCHAR (30)   NULL,
    [distro_excp_id]   NVARCHAR (35)   NULL,
    [excp_code]        NVARCHAR (200)  NULL,
    [expqty]           INT             NULL,
    [rptqty]           INT             NULL,
    [u_version]        INT             NULL,
    [ins_dt]           DATETIME        NULL,
    [last_upd_dt]      DATETIME        NULL,
    [ins_user_id]      NVARCHAR (40)   NULL,
    [last_upd_user_id] NVARCHAR (40)   NULL,
    [to_trlr_num]      NVARCHAR (20)   NULL,
    [to_carcod]        NVARCHAR (10)   NULL,
    [srvlvl]           NVARCHAR (10)   NULL,
    [to_srvlvl]        NVARCHAR (10)   NULL,
    [rowid]            INT             IDENTITY (1, 1) NOT NULL,
    CONSTRAINT [dlytrn_pk] PRIMARY KEY CLUSTERED ([dlytrn_id] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [dlytrn_lodatr1_ck] CHECK ([load_attr1_flg]=(0) OR [load_attr1_flg]=(1)),
    CONSTRAINT [dlytrn_lodatr2_ck] CHECK ([load_attr2_flg]=(0) OR [load_attr2_flg]=(1)),
    CONSTRAINT [dlytrn_lodatr3_ck] CHECK ([load_attr3_flg]=(0) OR [load_attr3_flg]=(1)),
    CONSTRAINT [dlytrn_lodatr4_ck] CHECK ([load_attr4_flg]=(0) OR [load_attr4_flg]=(1)),
    CONSTRAINT [dlytrn_lodatr5_ck] CHECK ([load_attr5_flg]=(0) OR [load_attr5_flg]=(1))
);


GO
CREATE NONCLUSTERED INDEX [dlytrn_idx1]
    ON [dbo].[dlytrn]([trndte] ASC, [oprcod] ASC, [lodnum] ASC, [subnum] ASC, [dtlnum] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [dlytrn_wh_id]
    ON [dbo].[dlytrn]([wh_id] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [dlytrn_to_value]
    ON [dbo].[dlytrn]([to_value] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [dlytrn_fr_value]
    ON [dbo].[dlytrn]([fr_value] ASC) WITH (FILLFACTOR = 90);


GO
CREATE UNIQUE NONCLUSTERED INDEX [dlytrn_rowid]
    ON [dbo].[dlytrn]([rowid] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [dlytrn_idx2]
    ON [dbo].[dlytrn]([wh_id] ASC, [trndte] ASC, [actcod] ASC, [fr_arecod] ASC, [frstol] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [dlytrn_act_lod_sub]
    ON [dbo].[dlytrn]([actcod] ASC, [lodnum] ASC, [subnum] ASC) WITH (FILLFACTOR = 90);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The dlytrn table is used to store activity that has occurred for various events in the sytem.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dlytrn';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Daily trnsaction ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dlytrn', @level2type = N'COLUMN', @level2name = N'dlytrn_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date and time the activity occurred. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dlytrn', @level2type = N'COLUMN', @level2name = N'trndte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The operation code of the transaction.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dlytrn', @level2type = N'COLUMN', @level2name = N'oprcod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The activity code of the transaction.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dlytrn', @level2type = N'COLUMN', @level2name = N'actcod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Uniquely identifies invlod record.  In many systems, this value is the same as the label on a pallet.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dlytrn', @level2type = N'COLUMN', @level2name = N'lodnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Uniquely identified invsub record.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dlytrn', @level2type = N'COLUMN', @level2name = N'subnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Uniquely identified invdtl record.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dlytrn', @level2type = N'COLUMN', @level2name = N'dtlnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Uniquely identifies destination invlod record.  In many systems, this value is the same as the label on a pallet.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dlytrn', @level2type = N'COLUMN', @level2name = N'to_lodnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Uniquely identified destination invsub record.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dlytrn', @level2type = N'COLUMN', @level2name = N'to_subnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Uniquely identified destination invdtl record.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dlytrn', @level2type = N'COLUMN', @level2name = N'to_dtlnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Also referred to as item number or SKU. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dlytrn', @level2type = N'COLUMN', @level2name = N'prtnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The client which owns the item number.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dlytrn', @level2type = N'COLUMN', @level2name = N'prt_client_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Origin Code of the inventory tracked by this detail. If this item is not origin code tracked, then this field will take on a default value of ''----''. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dlytrn', @level2type = N'COLUMN', @level2name = N'orgcod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Revision level of the inventory tracked by this detail.  If this item is not revision level tracked, then this field will take on a default value of ''----''.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dlytrn', @level2type = N'COLUMN', @level2name = N'revlvl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Lot number of the inventory tracked by this detail.  If this item is not lot number tracked, then this field will take on a default value of ''----''.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dlytrn', @level2type = N'COLUMN', @level2name = N'lotnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Lot number supplied by the supplier for tracking purposes. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dlytrn', @level2type = N'COLUMN', @level2name = N'sup_lotnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Supplier Number : The supplier number of the inventory tracked by this detail', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dlytrn', @level2type = N'COLUMN', @level2name = N'supnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 1 of the inventory tracked by this detail.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dlytrn', @level2type = N'COLUMN', @level2name = N'inv_attr_str1';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 2 of the inventory tracked by this detail.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dlytrn', @level2type = N'COLUMN', @level2name = N'inv_attr_str2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 3 of the inventory tracked by this detail.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dlytrn', @level2type = N'COLUMN', @level2name = N'inv_attr_str3';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 4 of the inventory tracked by this detail.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dlytrn', @level2type = N'COLUMN', @level2name = N'inv_attr_str4';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 5 of the inventory tracked by this detail.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dlytrn', @level2type = N'COLUMN', @level2name = N'inv_attr_str5';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 6 of the inventory tracked by this detail.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dlytrn', @level2type = N'COLUMN', @level2name = N'inv_attr_str6';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 7 of the inventory tracked by this detail.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dlytrn', @level2type = N'COLUMN', @level2name = N'inv_attr_str7';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 8 of the inventory tracked by this detail.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dlytrn', @level2type = N'COLUMN', @level2name = N'inv_attr_str8';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 9 of the inventory tracked by this detail.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dlytrn', @level2type = N'COLUMN', @level2name = N'inv_attr_str9';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 10 of the inventory tracked by this detail.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dlytrn', @level2type = N'COLUMN', @level2name = N'inv_attr_str10';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 11 of the inventory tracked by this detail.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dlytrn', @level2type = N'COLUMN', @level2name = N'inv_attr_str11';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 12 of the inventory tracked by this detail.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dlytrn', @level2type = N'COLUMN', @level2name = N'inv_attr_str12';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 13 of the inventory tracked by this detail.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dlytrn', @level2type = N'COLUMN', @level2name = N'inv_attr_str13';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 14 of the inventory tracked by this detail.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dlytrn', @level2type = N'COLUMN', @level2name = N'inv_attr_str14';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 15 of the inventory tracked by this detail.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dlytrn', @level2type = N'COLUMN', @level2name = N'inv_attr_str15';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 16 of the inventory tracked by this detail.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dlytrn', @level2type = N'COLUMN', @level2name = N'inv_attr_str16';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 17 of the inventory tracked by this detail.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dlytrn', @level2type = N'COLUMN', @level2name = N'inv_attr_str17';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 18 of the inventory tracked by this detail.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dlytrn', @level2type = N'COLUMN', @level2name = N'inv_attr_str18';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Number 1 of the inventory tracked by this detail.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dlytrn', @level2type = N'COLUMN', @level2name = N'inv_attr_int1';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Number 2 of the inventory tracked by this detail.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dlytrn', @level2type = N'COLUMN', @level2name = N'inv_attr_int2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Number 3 of the inventory tracked by this detail.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dlytrn', @level2type = N'COLUMN', @level2name = N'inv_attr_int3';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Number 4 of the inventory tracked by this detail.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dlytrn', @level2type = N'COLUMN', @level2name = N'inv_attr_int4';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Number 5 of the inventory tracked by this detail.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dlytrn', @level2type = N'COLUMN', @level2name = N'inv_attr_int5';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Decimal 1 of the inventory tracked by this detail.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dlytrn', @level2type = N'COLUMN', @level2name = N'inv_attr_flt1';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Decimal 2 of the inventory tracked by this detail.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dlytrn', @level2type = N'COLUMN', @level2name = N'inv_attr_flt2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Decimal 3 of the inventory tracked by this detail.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dlytrn', @level2type = N'COLUMN', @level2name = N'inv_attr_flt3';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Date 1 of the inventory tracked by this detail.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dlytrn', @level2type = N'COLUMN', @level2name = N'inv_attr_dte1';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Date 2 of the inventory tracked by this detail.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dlytrn', @level2type = N'COLUMN', @level2name = N'inv_attr_dte2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The move reference of the transaction.  This reference is used internally by the system to show what type of inventory move occurred.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dlytrn', @level2type = N'COLUMN', @level2name = N'movref';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The reason code assigned to the transaction.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dlytrn', @level2type = N'COLUMN', @level2name = N'reacod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The unit quantity affected by this transaction.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dlytrn', @level2type = N'COLUMN', @level2name = N'trnqty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The catch qty a user may enter per stocking unit of measure.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dlytrn', @level2type = N'COLUMN', @level2name = N'catch_qty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Tracking Number : The number which is generated by the parcel manifesting system and is used by parcel carriers to track the package.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dlytrn', @level2type = N'COLUMN', @level2name = N'traknm';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The metric that catch units are captured in.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dlytrn', @level2type = N'COLUMN', @level2name = N'catch_unttyp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The source area code of the transaction.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dlytrn', @level2type = N'COLUMN', @level2name = N'fr_arecod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The source location of the transaction.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dlytrn', @level2type = N'COLUMN', @level2name = N'frstol';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The original inventory status of the inventory affected by this transaction.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dlytrn', @level2type = N'COLUMN', @level2name = N'frinvs';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The original aging profile of the inventory affected by this transaction.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dlytrn', @level2type = N'COLUMN', @level2name = N'fr_age_pflnam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The destination area code of the transaction.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dlytrn', @level2type = N'COLUMN', @level2name = N'to_arecod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The destination location of the transaction.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dlytrn', @level2type = N'COLUMN', @level2name = N'tostol';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The final inventory status of the inventory affected by this transaction.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dlytrn', @level2type = N'COLUMN', @level2name = N'toinvs';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The final aging profile of the inventory affected by this transaction.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dlytrn', @level2type = N'COLUMN', @level2name = N'to_age_pflnam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The trailer number of the trailer.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dlytrn', @level2type = N'COLUMN', @level2name = N'trlr_num';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The carrier code of the trailer. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dlytrn', @level2type = N'COLUMN', @level2name = N'carcod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The shipment ID the order was on.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dlytrn', @level2type = N'COLUMN', @level2name = N'ship_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The client which owns the order. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dlytrn', @level2type = N'COLUMN', @level2name = N'client_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The order number the activity record is for. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dlytrn', @level2type = N'COLUMN', @level2name = N'ordnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A link to antoher transaction Id for another table to show detailed information about the transaction.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dlytrn', @level2type = N'COLUMN', @level2name = N'trndtl_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The table containing the detail information about the transaction.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dlytrn', @level2type = N'COLUMN', @level2name = N'trndtl_table';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Reference number for sending information to the host. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dlytrn', @level2type = N'COLUMN', @level2name = N'adj_ref1';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Reference number for sending information to the host. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dlytrn', @level2type = N'COLUMN', @level2name = N'adj_ref2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user the did the action that the activity is being captured for. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dlytrn', @level2type = N'COLUMN', @level2name = N'usr_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The device code that should be used when printing labels for this pick.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dlytrn', @level2type = N'COLUMN', @level2name = N'devcod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The archive date if this transaction was archived.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dlytrn', @level2type = N'COLUMN', @level2name = N'arcdte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The archival source of this table, if this table is created as an archiving table.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dlytrn', @level2type = N'COLUMN', @level2name = N'arc_src';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Comment - Comment used for supervisor approval of adjustments.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dlytrn', @level2type = N'COLUMN', @level2name = N'cmnt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Asset Type : Asset type of the asset', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dlytrn', @level2type = N'COLUMN', @level2name = N'asset_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Asset ID : Unique identifier for the asset.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dlytrn', @level2type = N'COLUMN', @level2name = N'asset_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Asset Status : Status of the asset.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dlytrn', @level2type = N'COLUMN', @level2name = N'asset_stat';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The first load attribute. A load attribute is a configurable flag field to indicate attributes of a load such as the load being wrapped.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dlytrn', @level2type = N'COLUMN', @level2name = N'load_attr1_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The second load attribute. A load attribute is a configurable flag field to indicate attributes of a load such as the load being wrapped.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dlytrn', @level2type = N'COLUMN', @level2name = N'load_attr2_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The third load attribute. A load attribute is a configurable flag field to indicate attributes of a load such as the load being wrapped.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dlytrn', @level2type = N'COLUMN', @level2name = N'load_attr3_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The fourth load attribute. A load attribute is a configurable flag field to indicate attributes of a load such as the load being wrapped.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dlytrn', @level2type = N'COLUMN', @level2name = N'load_attr4_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The fifth load attribute. A load attribute is a configurable flag field to indicate attributes of a load such as the load being wrapped.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dlytrn', @level2type = N'COLUMN', @level2name = N'load_attr5_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Variable Name - Name of the attribute that was changed.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dlytrn', @level2type = N'COLUMN', @level2name = N'var_nam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'From value - Original value of the attribute.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dlytrn', @level2type = N'COLUMN', @level2name = N'fr_value';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'To value - Changed value of the attribute.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dlytrn', @level2type = N'COLUMN', @level2name = N'to_value';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warehouse ID - the warehouse in which the building exists.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dlytrn', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Unit of measure used in the activity.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dlytrn', @level2type = N'COLUMN', @level2name = N'uomcod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Footprint code used in the activity.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dlytrn', @level2type = N'COLUMN', @level2name = N'ftpcod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Unique Id to identify the distribution exception.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dlytrn', @level2type = N'COLUMN', @level2name = N'distro_excp_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Exception Code for this distribution exception.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dlytrn', @level2type = N'COLUMN', @level2name = N'excp_code';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The quantity expected to be distributed.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dlytrn', @level2type = N'COLUMN', @level2name = N'expqty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The quantity actually distributed.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dlytrn', @level2type = N'COLUMN', @level2name = N'rptqty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The version number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dlytrn', @level2type = N'COLUMN', @level2name = N'u_version';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was inserted', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dlytrn', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was last updated', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dlytrn', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who created the row', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dlytrn', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dlytrn', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The final trailer number of the trailer affected by this transaction', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dlytrn', @level2type = N'COLUMN', @level2name = N'to_trlr_num';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The final carrier of the trailer affected by this transaction', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dlytrn', @level2type = N'COLUMN', @level2name = N'to_carcod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Service level of the record', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dlytrn', @level2type = N'COLUMN', @level2name = N'srvlvl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The final srvlvl of the shipment/carrier move affected by this transaction', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dlytrn', @level2type = N'COLUMN', @level2name = N'to_srvlvl';

