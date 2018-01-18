CREATE TABLE [dbo].[are_pck_flg] (
    [srcare]           NVARCHAR (10) NOT NULL,
    [lodlvl]           NVARCHAR (1)  NOT NULL,
    [wrktyp]           NVARCHAR (1)  NOT NULL,
    [wh_id]            NVARCHAR (32) NOT NULL,
    [lotflg]           INT           NULL,
    [sup_lot_flg]      INT           NULL,
    [revflg]           INT           NULL,
    [orgflg]           INT           NULL,
    [supflg]           INT           NULL,
    [dtlflg]           INT           NULL,
    [subflg]           INT           NULL,
    [lodflg]           INT           NULL,
    [prtflg]           INT           NULL,
    [locflg]           INT           NULL,
    [qtyflg]           INT           NULL,
    [catch_qty_flg]    INT           NULL,
    [mandte_flg]       INT           NULL,
    [expdte_flg]       INT           NULL,
    [attr_str1_flg]    INT           NULL,
    [attr_str2_flg]    INT           NULL,
    [attr_str3_flg]    INT           NULL,
    [attr_str4_flg]    INT           NULL,
    [attr_str5_flg]    INT           NULL,
    [attr_str6_flg]    INT           NULL,
    [attr_str7_flg]    INT           NULL,
    [attr_str8_flg]    INT           NULL,
    [attr_str9_flg]    INT           NULL,
    [attr_str10_flg]   INT           NULL,
    [attr_str11_flg]   INT           NULL,
    [attr_str12_flg]   INT           NULL,
    [attr_str13_flg]   INT           NULL,
    [attr_str14_flg]   INT           NULL,
    [attr_str15_flg]   INT           NULL,
    [attr_str16_flg]   INT           NULL,
    [attr_str17_flg]   INT           NULL,
    [attr_str18_flg]   INT           NULL,
    [attr_int1_flg]    INT           NULL,
    [attr_int2_flg]    INT           NULL,
    [attr_int3_flg]    INT           NULL,
    [attr_int4_flg]    INT           NULL,
    [attr_int5_flg]    INT           NULL,
    [attr_flt1_flg]    INT           NULL,
    [attr_flt2_flg]    INT           NULL,
    [attr_flt3_flg]    INT           NULL,
    [attr_dte1_flg]    INT           NULL,
    [attr_dte2_flg]    INT           NULL,
    [rttn_id_flg]      INT           NULL,
    [moddte]           DATETIME      NULL,
    [mod_usr_id]       NVARCHAR (40) NULL,
    [u_version]        INT           NULL,
    [ins_dt]           DATETIME      NULL,
    [last_upd_dt]      DATETIME      NULL,
    [ins_user_id]      NVARCHAR (40) NULL,
    [last_upd_user_id] NVARCHAR (40) NULL,
    CONSTRAINT [are_pck_flg_pk] PRIMARY KEY CLUSTERED ([srcare] ASC, [lodlvl] ASC, [wrktyp] ASC, [wh_id] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [arepckflg_ad1flck] CHECK ([attr_dte1_flg]=(0) OR [attr_dte1_flg]=(1)),
    CONSTRAINT [arepckflg_ad2flck] CHECK ([attr_dte2_flg]=(0) OR [attr_dte2_flg]=(1)),
    CONSTRAINT [arepckflg_af1flck] CHECK ([attr_flt1_flg]=(0) OR [attr_flt1_flg]=(1)),
    CONSTRAINT [arepckflg_af2flck] CHECK ([attr_flt2_flg]=(0) OR [attr_flt2_flg]=(1)),
    CONSTRAINT [arepckflg_af3flck] CHECK ([attr_flt3_flg]=(0) OR [attr_flt3_flg]=(1)),
    CONSTRAINT [arepckflg_ai1flck] CHECK ([attr_int1_flg]=(0) OR [attr_int1_flg]=(1)),
    CONSTRAINT [arepckflg_ai2flck] CHECK ([attr_int2_flg]=(0) OR [attr_int2_flg]=(1)),
    CONSTRAINT [arepckflg_ai3flck] CHECK ([attr_int3_flg]=(0) OR [attr_int3_flg]=(1)),
    CONSTRAINT [arepckflg_ai4flck] CHECK ([attr_int4_flg]=(0) OR [attr_int4_flg]=(1)),
    CONSTRAINT [arepckflg_ai5flck] CHECK ([attr_int5_flg]=(0) OR [attr_int5_flg]=(1)),
    CONSTRAINT [arepckflg_as10flck] CHECK ([attr_str10_flg]=(0) OR [attr_str10_flg]=(1)),
    CONSTRAINT [arepckflg_as11flck] CHECK ([attr_str11_flg]=(0) OR [attr_str11_flg]=(1)),
    CONSTRAINT [arepckflg_as12flck] CHECK ([attr_str12_flg]=(0) OR [attr_str12_flg]=(1)),
    CONSTRAINT [arepckflg_as13flck] CHECK ([attr_str13_flg]=(0) OR [attr_str13_flg]=(1)),
    CONSTRAINT [arepckflg_as14flck] CHECK ([attr_str14_flg]=(0) OR [attr_str14_flg]=(1)),
    CONSTRAINT [arepckflg_as15flck] CHECK ([attr_str15_flg]=(0) OR [attr_str15_flg]=(1)),
    CONSTRAINT [arepckflg_as16flck] CHECK ([attr_str16_flg]=(0) OR [attr_str16_flg]=(1)),
    CONSTRAINT [arepckflg_as17flck] CHECK ([attr_str17_flg]=(0) OR [attr_str17_flg]=(1)),
    CONSTRAINT [arepckflg_as18flck] CHECK ([attr_str18_flg]=(0) OR [attr_str18_flg]=(1)),
    CONSTRAINT [arepckflg_as1flck] CHECK ([attr_str1_flg]=(0) OR [attr_str1_flg]=(1)),
    CONSTRAINT [arepckflg_as2flck] CHECK ([attr_str2_flg]=(0) OR [attr_str2_flg]=(1)),
    CONSTRAINT [arepckflg_as3flck] CHECK ([attr_str3_flg]=(0) OR [attr_str3_flg]=(1)),
    CONSTRAINT [arepckflg_as4flck] CHECK ([attr_str4_flg]=(0) OR [attr_str4_flg]=(1)),
    CONSTRAINT [arepckflg_as5flck] CHECK ([attr_str5_flg]=(0) OR [attr_str5_flg]=(1)),
    CONSTRAINT [arepckflg_as6flck] CHECK ([attr_str6_flg]=(0) OR [attr_str6_flg]=(1)),
    CONSTRAINT [arepckflg_as7flck] CHECK ([attr_str7_flg]=(0) OR [attr_str7_flg]=(1)),
    CONSTRAINT [arepckflg_as8flck] CHECK ([attr_str8_flg]=(0) OR [attr_str8_flg]=(1)),
    CONSTRAINT [arepckflg_as9flck] CHECK ([attr_str9_flg]=(0) OR [attr_str9_flg]=(1)),
    CONSTRAINT [arepckflg_cqtflgck] CHECK ([catch_qty_flg]=(0) OR [catch_qty_flg]=(1)),
    CONSTRAINT [arepckflg_dtlflgck] CHECK ([dtlflg]=(0) OR [dtlflg]=(1)),
    CONSTRAINT [arepckflg_exdflgck] CHECK ([expdte_flg]=(0) OR [expdte_flg]=(1)),
    CONSTRAINT [arepckflg_locflgck] CHECK ([locflg]=(0) OR [locflg]=(1)),
    CONSTRAINT [arepckflg_lodflgck] CHECK ([lodflg]=(0) OR [lodflg]=(1)),
    CONSTRAINT [arepckflg_lotflgck] CHECK ([lotflg]=(0) OR [lotflg]=(1)),
    CONSTRAINT [arepckflg_mfdflgck] CHECK ([mandte_flg]=(0) OR [mandte_flg]=(1)),
    CONSTRAINT [arepckflg_orgflgck] CHECK ([orgflg]=(0) OR [orgflg]=(1)),
    CONSTRAINT [arepckflg_prtflgck] CHECK ([prtflg]=(0) OR [prtflg]=(1)),
    CONSTRAINT [arepckflg_qtyflgck] CHECK ([qtyflg]=(0) OR [qtyflg]=(1)),
    CONSTRAINT [arepckflg_revflgck] CHECK ([revflg]=(0) OR [revflg]=(1)),
    CONSTRAINT [arepckflg_rtnflgck] CHECK ([rttn_id_flg]=(0) OR [rttn_id_flg]=(1)),
    CONSTRAINT [arepckflg_subflgck] CHECK ([subflg]=(0) OR [subflg]=(1)),
    CONSTRAINT [arepckflg_supflgck] CHECK ([supflg]=(0) OR [supflg]=(1)),
    CONSTRAINT [arepckflg_suplotck] CHECK ([sup_lot_flg]=(0) OR [sup_lot_flg]=(1))
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The area Area Pick Flag table allowing the customer to set the pick verification flag by area.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'are_pck_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Source Area', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'are_pck_flg', @level2type = N'COLUMN', @level2name = N'srcare';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Load Level', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'are_pck_flg', @level2type = N'COLUMN', @level2name = N'lodlvl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Work Type', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'are_pck_flg', @level2type = N'COLUMN', @level2name = N'wrktyp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warehouse ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'are_pck_flg', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Lot Flag - Indicates whether user needs to confirm the lot number on pickup.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'are_pck_flg', @level2type = N'COLUMN', @level2name = N'lotflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Supplier Lot Flag - Indicates whether user needs to confirm the supplier lot number on pickup.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'are_pck_flg', @level2type = N'COLUMN', @level2name = N'sup_lot_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Revision Flag - Indicates whether the user needs to confirm the revision levl on pickup.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'are_pck_flg', @level2type = N'COLUMN', @level2name = N'revflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Origin Flag - Indicates whether the user needs to confirm the origin code on pickup.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'are_pck_flg', @level2type = N'COLUMN', @level2name = N'orgflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Supplier Flag - Indicates whether the user needs to confirm the supplier on pickup.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'are_pck_flg', @level2type = N'COLUMN', @level2name = N'supflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Detail Flag - Indicates whether the user needs to confirm the piece identifier on pickup.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'are_pck_flg', @level2type = N'COLUMN', @level2name = N'dtlflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Sub-load Flag - Indicates whether the user needs to confirm the case identifier on pickup.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'are_pck_flg', @level2type = N'COLUMN', @level2name = N'subflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Load Flag - Indicates whether the user needs to confirm the load number on pickup.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'are_pck_flg', @level2type = N'COLUMN', @level2name = N'lodflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Item Flag - Indicates whether the user needs to confirm the item number on pickup.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'are_pck_flg', @level2type = N'COLUMN', @level2name = N'prtflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Location Flag - Indicates whether the user needs to confirm the location on pickup.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'are_pck_flg', @level2type = N'COLUMN', @level2name = N'locflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Quantity Flag - Indicates whether the user needs to confirm the pick quantity on pickup.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'are_pck_flg', @level2type = N'COLUMN', @level2name = N'qtyflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Catch Quantity Flag - Indicates whether the user needs to confirm the catch quantity on pickup.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'are_pck_flg', @level2type = N'COLUMN', @level2name = N'catch_qty_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Manufactured Date Flag - Indicates whether the user needs to confirm the manufactured date on pickup.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'are_pck_flg', @level2type = N'COLUMN', @level2name = N'mandte_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Expiration Date Flag - Indicates whether the user needs to confirm the expiration date on pickup.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'are_pck_flg', @level2type = N'COLUMN', @level2name = N'expdte_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Confirm Inventory Attribute Text 1 Flag.Indicates whether user needs to confirm the Text Inventory Attribute1 on pickup.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'are_pck_flg', @level2type = N'COLUMN', @level2name = N'attr_str1_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Confirm Inventory Attribute Text 2 Flag.Indicates whether user needs to confirm the Text Inventory Attribute2 on pickup.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'are_pck_flg', @level2type = N'COLUMN', @level2name = N'attr_str2_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Confirm Inventory Attribute Text 3 Flag.Indicates whether user needs to confirm the Text Inventory Attribute3 on pickup.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'are_pck_flg', @level2type = N'COLUMN', @level2name = N'attr_str3_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Confirm Inventory Attribute Text 4 Flag.Indicates whether user needs to confirm the Text Inventory Attribute4 on pickup.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'are_pck_flg', @level2type = N'COLUMN', @level2name = N'attr_str4_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Confirm Inventory Attribute Text 5 Flag.Indicates whether user needs to confirm the Text Inventory Attribute5 on pickup.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'are_pck_flg', @level2type = N'COLUMN', @level2name = N'attr_str5_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Confirm Inventory Attribute Text 6 Flag.Indicates whether user needs to confirm the Text Inventory Attribute6 on pickup.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'are_pck_flg', @level2type = N'COLUMN', @level2name = N'attr_str6_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Confirm Inventory Attribute Text 7 Flag.Indicates whether user needs to confirm the Text Inventory Attribute7 on pickup.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'are_pck_flg', @level2type = N'COLUMN', @level2name = N'attr_str7_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Confirm Inventory Attribute Text 8 Flag.Indicates whether user needs to confirm the Text Inventory Attribute8 on pickup.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'are_pck_flg', @level2type = N'COLUMN', @level2name = N'attr_str8_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Confirm Inventory Attribute Text 9 Flag.Indicates whether user needs to confirm the Text Inventory Attribute9 on pickup.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'are_pck_flg', @level2type = N'COLUMN', @level2name = N'attr_str9_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Confirm Inventory Attribute Text 10 Flag.Indicates whether user needs to confirm the Text Inventory Attribute10 on pickup.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'are_pck_flg', @level2type = N'COLUMN', @level2name = N'attr_str10_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Confirm Inventory Attribute Text 11 Flag.Indicates whether user needs to confirm the Text Inventory Attribute11 on pickup.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'are_pck_flg', @level2type = N'COLUMN', @level2name = N'attr_str11_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Confirm Inventory Attribute Text 12 Flag.Indicates whether user needs to confirm the Text Inventory Attribute12 on pickup.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'are_pck_flg', @level2type = N'COLUMN', @level2name = N'attr_str12_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Confirm Inventory Attribute Text 13 Flag.Indicates whether user needs to confirm the Text Inventory Attribute13 on pickup.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'are_pck_flg', @level2type = N'COLUMN', @level2name = N'attr_str13_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Confirm Inventory Attribute Text 14 Flag.Indicates whether user needs to confirm the Text Inventory Attribute14 on pickup.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'are_pck_flg', @level2type = N'COLUMN', @level2name = N'attr_str14_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Confirm Inventory Attribute Text 15 Flag.Indicates whether user needs to confirm the Text Inventory Attribute15 on pickup.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'are_pck_flg', @level2type = N'COLUMN', @level2name = N'attr_str15_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Confirm Inventory Attribute Text 16 Flag.Indicates whether user needs to confirm the Text Inventory Attribute16 on pickup.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'are_pck_flg', @level2type = N'COLUMN', @level2name = N'attr_str16_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Confirm Inventory Attribute Text 17 Flag.Indicates whether user needs to confirm the Text Inventory Attribute17 on pickup.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'are_pck_flg', @level2type = N'COLUMN', @level2name = N'attr_str17_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Confirm Inventory Attribute Text 18 Flag.Indicates whether user needs to confirm the Text Inventory Attribute18 on pickup.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'are_pck_flg', @level2type = N'COLUMN', @level2name = N'attr_str18_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Confirm Inventory Attribute Number 1 Flag.Indicates whether user needs to confirm the Number Inventory Attribute1 on pickup.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'are_pck_flg', @level2type = N'COLUMN', @level2name = N'attr_int1_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Confirm Inventory Attribute Number 2 Flag.Indicates whether user needs to confirm the Number Inventory Attribute2 on pickup.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'are_pck_flg', @level2type = N'COLUMN', @level2name = N'attr_int2_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Confirm Inventory Attribute Number 3 Flag.Indicates whether user needs to confirm the Number Inventory Attribute3 on pickup.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'are_pck_flg', @level2type = N'COLUMN', @level2name = N'attr_int3_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Confirm Inventory Attribute Number 4 Flag.Indicates whether user needs to confirm the Number Inventory Attribute4 on pickup.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'are_pck_flg', @level2type = N'COLUMN', @level2name = N'attr_int4_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Confirm Inventory Attribute Number 5 Flag.Indicates whether user needs to confirm the Number Inventory Attribute5 on pickup.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'are_pck_flg', @level2type = N'COLUMN', @level2name = N'attr_int5_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Confirm Inventory Attribute Decimal 1 Flag.Indicates whether user needs to confirm the Decimal Inventory Attribute1 on pickup.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'are_pck_flg', @level2type = N'COLUMN', @level2name = N'attr_flt1_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Confirm Inventory Attribute Decimal 2 Flag.Indicates whether user needs to confirm the Decimal Inventory Attribute2 on pickup.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'are_pck_flg', @level2type = N'COLUMN', @level2name = N'attr_flt2_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Confirm Inventory Attribute Decimal 3 Flag.Indicates whether user needs to confirm the Decimal Inventory Attribute3 on pickup.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'are_pck_flg', @level2type = N'COLUMN', @level2name = N'attr_flt3_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Confirm Inventory Attribute Date 1 Flag.Indicates whether user needs to confirm the Date Inventory Attribute1 on pickup.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'are_pck_flg', @level2type = N'COLUMN', @level2name = N'attr_dte1_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Confirm Inventory Attribute Date 2 Flag.Indicates whether user needs to confirm the Date Inventory Attribute2 on pickup.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'are_pck_flg', @level2type = N'COLUMN', @level2name = N'attr_dte2_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Flag used to indicate whether or not pick verification is turned on for rotation id. ''1'' means yes and ''0'' means no.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'are_pck_flg', @level2type = N'COLUMN', @level2name = N'rttn_id_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Last Modification Date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'are_pck_flg', @level2type = N'COLUMN', @level2name = N'moddte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Last User to Modify', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'are_pck_flg', @level2type = N'COLUMN', @level2name = N'mod_usr_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The version number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'are_pck_flg', @level2type = N'COLUMN', @level2name = N'u_version';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was inserted', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'are_pck_flg', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was last updated', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'are_pck_flg', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who created the row', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'are_pck_flg', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'are_pck_flg', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

