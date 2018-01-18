CREATE TABLE [dbo].[pckwrk_hdr] (
    [wrkref]           NVARCHAR (12)   NOT NULL,
    [wrktyp]           NVARCHAR (1)    NOT NULL,
    [schbat]           NVARCHAR (32)   NULL,
    [srcloc]           NVARCHAR (20)   NOT NULL,
    [srcare]           NVARCHAR (10)   NOT NULL,
    [client_id]        NVARCHAR (32)   NULL,
    [wh_id]            NVARCHAR (32)   NOT NULL,
    [lblbat]           NVARCHAR (6)    NULL,
    [lblseq]           NVARCHAR (50)   NULL,
    [devcod]           NVARCHAR (20)   NULL,
    [pckqty]           INT             NOT NULL,
    [pck_catch_qty]    NUMERIC (19, 4) NULL,
    [appqty]           INT             NOT NULL,
    [app_catch_qty]    NUMERIC (19, 4) NULL,
    [pcksts]           NVARCHAR (1)    NOT NULL,
    [prtnum]           NVARCHAR (50)   NOT NULL,
    [prt_client_id]    NVARCHAR (32)   NOT NULL,
    [orgcod]           NVARCHAR (25)   NULL,
    [revlvl]           NVARCHAR (25)   NULL,
    [lotnum]           NVARCHAR (25)   NULL,
    [asset_slot]       NVARCHAR (10)   NULL,
    [sup_lotnum]       NVARCHAR (25)   NULL,
    [invsts]           NVARCHAR (4)    NULL,
    [invsts_prg]       NVARCHAR (4)    NULL,
    [lodlvl]           NVARCHAR (1)    NOT NULL,
    [loducc]           NVARCHAR (20)   NULL,
    [lodtag]           NVARCHAR (40)   NULL,
    [lodnum]           NVARCHAR (30)   NULL,
    [untcas]           INT             NOT NULL,
    [untpak]           INT             NOT NULL,
    [ftpcod]           NVARCHAR (30)   NULL,
    [ctncod]           NVARCHAR (4)    NULL,
    [ctnnum]           NVARCHAR (30)   NULL,
    [ctnseg]           NVARCHAR (10)   NULL,
    [pos_id]           NVARCHAR (10)   NULL,
    [visflg]           INT             NULL,
    [splflg]           INT             DEFAULT ((1)) NULL,
    [locflg]           INT             NULL,
    [lodflg]           INT             NULL,
    [subflg]           INT             NULL,
    [dtlflg]           INT             NULL,
    [prtflg]           INT             NULL,
    [orgflg]           INT             NULL,
    [revflg]           INT             NULL,
    [lotflg]           INT             NULL,
    [sup_lot_flg]      INT             NULL,
    [qtyflg]           INT             NULL,
    [catch_qty_flg]    INT             NULL,
    [adddte]           DATETIME        NULL,
    [pckdte]           DATETIME        NULL,
    [cmpdte]           DATETIME        NULL,
    [refloc]           NVARCHAR (20)   NULL,
    [ackdevcod]        NVARCHAR (20)   NULL,
    [pipflg]           INT             NULL,
    [frsflg]           INT             NULL,
    [clst_seq]         INT             NULL,
    [min_shelf_hrs]    INT             NULL,
    [prtdte]           DATETIME        NULL,
    [list_grp_id]      NVARCHAR (15)   NULL,
    [list_id]          NVARCHAR (15)   NULL,
    [list_seqnum]      INT             NULL,
    [lm_goal_seconds]  INT             NULL,
    [lm_assign_num]    NVARCHAR (15)   NULL,
    [lm_assign_seqnum] INT             NULL,
    [skip_cnt]         INT             NULL,
    [pallet_pos]       NVARCHAR (8)    NULL,
    [pallet_id]        NVARCHAR (30)   NULL,
    [pallet_load_seq]  INT             NULL,
    [rttn_id]          NVARCHAR (10)   NULL,
    [rttn_id_flg]      INT             DEFAULT ((0)) NULL,
    [unassign_flg]     INT             DEFAULT ((0)) NULL,
    [asset_typ]        NVARCHAR (30)   NULL,
    [supnum]           NVARCHAR (32)   NULL,
    [supflg]           INT             DEFAULT ((0)) NULL,
    [unique_pallet_id] NVARCHAR (30)   NULL,
    [palctlsts]        NVARCHAR (4)    NULL,
    [start_pal_flg]    INT             DEFAULT ((0)) NOT NULL,
    [list_conf_flg]    INT             DEFAULT ((0)) NOT NULL,
    [pck_uom]          NVARCHAR (2)    NULL,
    [assign_grp]       NVARCHAR (15)   NULL,
    [lock_flg]         INT             DEFAULT ((0)) NOT NULL,
    [abs_ordinv_dte]   DATETIME        NULL,
    [thresh_pck_flg]   INT             DEFAULT ((0)) NULL,
    [pck_to_id]        NVARCHAR (30)   NULL,
    [last_pck_usr_id]  NVARCHAR (40)   NULL,
    [sp_hand_flg]      INT             DEFAULT ((0)) NOT NULL,
    [rule_nam]         NVARCHAR (20)   NULL,
    [mandte]           DATETIME        NULL,
    [expire_dte]       DATETIME        NULL,
    [mandte_flg]       INT             DEFAULT ((0)) NULL,
    [expire_dte_flg]   INT             DEFAULT ((0)) NULL,
    [palctl_split_flg] INT             DEFAULT ((0)) NOT NULL,
    [lstpck_flg]       INT             DEFAULT ((0)) NOT NULL,
    [attr_str1_flg]    INT             NULL,
    [attr_str2_flg]    INT             NULL,
    [attr_str3_flg]    INT             NULL,
    [attr_str4_flg]    INT             NULL,
    [attr_str5_flg]    INT             NULL,
    [attr_str6_flg]    INT             NULL,
    [attr_str7_flg]    INT             NULL,
    [attr_str8_flg]    INT             NULL,
    [attr_str9_flg]    INT             NULL,
    [attr_str10_flg]   INT             NULL,
    [attr_str11_flg]   INT             NULL,
    [attr_str12_flg]   INT             NULL,
    [attr_str13_flg]   INT             NULL,
    [attr_str14_flg]   INT             NULL,
    [attr_str15_flg]   INT             NULL,
    [attr_str16_flg]   INT             NULL,
    [attr_str17_flg]   INT             NULL,
    [attr_str18_flg]   INT             NULL,
    [attr_int1_flg]    INT             NULL,
    [attr_int2_flg]    INT             NULL,
    [attr_int3_flg]    INT             NULL,
    [attr_int4_flg]    INT             NULL,
    [attr_int5_flg]    INT             NULL,
    [attr_flt1_flg]    INT             NULL,
    [attr_flt2_flg]    INT             NULL,
    [attr_flt3_flg]    INT             NULL,
    [attr_dte1_flg]    INT             NULL,
    [attr_dte2_flg]    INT             NULL,
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
    [wcs_pck_grp]      NVARCHAR (12)   NULL,
    [wcs_reported_dt]  DATETIME        NULL,
    [wcs_can_pcksts]   NVARCHAR (1)    NULL,
    [wcs_can_req_dt]   DATETIME        NULL,
    [ins_dt]           DATETIME        NULL,
    [last_upd_dt]      DATETIME        NULL,
    [ins_user_id]      NVARCHAR (40)   NULL,
    [last_upd_user_id] NVARCHAR (40)   NULL,
    [rowid]            INT             IDENTITY (1, 1) NOT NULL,
    CONSTRAINT [pckwrk_hdr_pk] PRIMARY KEY CLUSTERED ([wrkref] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [pckwrk_hdr_ad1flgck] CHECK ([attr_dte1_flg]=(0) OR [attr_dte1_flg]=(1)),
    CONSTRAINT [pckwrk_hdr_ad2flgck] CHECK ([attr_dte2_flg]=(0) OR [attr_dte2_flg]=(1)),
    CONSTRAINT [pckwrk_hdr_af1flgck] CHECK ([attr_flt1_flg]=(0) OR [attr_flt1_flg]=(1)),
    CONSTRAINT [pckwrk_hdr_af2flgck] CHECK ([attr_flt2_flg]=(0) OR [attr_flt2_flg]=(1)),
    CONSTRAINT [pckwrk_hdr_af3flgck] CHECK ([attr_flt3_flg]=(0) OR [attr_flt3_flg]=(1)),
    CONSTRAINT [pckwrk_hdr_ai1flgck] CHECK ([attr_int1_flg]=(0) OR [attr_int1_flg]=(1)),
    CONSTRAINT [pckwrk_hdr_ai2flgck] CHECK ([attr_int2_flg]=(0) OR [attr_int2_flg]=(1)),
    CONSTRAINT [pckwrk_hdr_ai3flgck] CHECK ([attr_int3_flg]=(0) OR [attr_int3_flg]=(1)),
    CONSTRAINT [pckwrk_hdr_ai4flgck] CHECK ([attr_int4_flg]=(0) OR [attr_int4_flg]=(1)),
    CONSTRAINT [pckwrk_hdr_ai5flgck] CHECK ([attr_int5_flg]=(0) OR [attr_int5_flg]=(1)),
    CONSTRAINT [pckwrk_hdr_as10flgck] CHECK ([attr_str10_flg]=(0) OR [attr_str10_flg]=(1)),
    CONSTRAINT [pckwrk_hdr_as11flgck] CHECK ([attr_str11_flg]=(0) OR [attr_str11_flg]=(1)),
    CONSTRAINT [pckwrk_hdr_as12flgck] CHECK ([attr_str12_flg]=(0) OR [attr_str12_flg]=(1)),
    CONSTRAINT [pckwrk_hdr_as13flgck] CHECK ([attr_str13_flg]=(0) OR [attr_str13_flg]=(1)),
    CONSTRAINT [pckwrk_hdr_as14flgck] CHECK ([attr_str14_flg]=(0) OR [attr_str14_flg]=(1)),
    CONSTRAINT [pckwrk_hdr_as15flgck] CHECK ([attr_str15_flg]=(0) OR [attr_str15_flg]=(1)),
    CONSTRAINT [pckwrk_hdr_as16flgck] CHECK ([attr_str16_flg]=(0) OR [attr_str16_flg]=(1)),
    CONSTRAINT [pckwrk_hdr_as17flgck] CHECK ([attr_str17_flg]=(0) OR [attr_str17_flg]=(1)),
    CONSTRAINT [pckwrk_hdr_as18flgck] CHECK ([attr_str18_flg]=(0) OR [attr_str18_flg]=(1)),
    CONSTRAINT [pckwrk_hdr_as1flgck] CHECK ([attr_str1_flg]=(0) OR [attr_str1_flg]=(1)),
    CONSTRAINT [pckwrk_hdr_as2flgck] CHECK ([attr_str2_flg]=(0) OR [attr_str2_flg]=(1)),
    CONSTRAINT [pckwrk_hdr_as3flgck] CHECK ([attr_str3_flg]=(0) OR [attr_str3_flg]=(1)),
    CONSTRAINT [pckwrk_hdr_as4flgck] CHECK ([attr_str4_flg]=(0) OR [attr_str4_flg]=(1)),
    CONSTRAINT [pckwrk_hdr_as5flgck] CHECK ([attr_str5_flg]=(0) OR [attr_str5_flg]=(1)),
    CONSTRAINT [pckwrk_hdr_as6flgck] CHECK ([attr_str6_flg]=(0) OR [attr_str6_flg]=(1)),
    CONSTRAINT [pckwrk_hdr_as7flgck] CHECK ([attr_str7_flg]=(0) OR [attr_str7_flg]=(1)),
    CONSTRAINT [pckwrk_hdr_as8flgck] CHECK ([attr_str8_flg]=(0) OR [attr_str8_flg]=(1)),
    CONSTRAINT [pckwrk_hdr_as9flgck] CHECK ([attr_str9_flg]=(0) OR [attr_str9_flg]=(1)),
    CONSTRAINT [pckwrk_hdr_cqty_flg_ck] CHECK ([catch_qty_flg]=(0) OR [catch_qty_flg]=(1)),
    CONSTRAINT [pckwrk_hdr_dtlflg_ck] CHECK ([dtlflg]=(0) OR [dtlflg]=(1)),
    CONSTRAINT [pckwrk_hdr_expdteflgck] CHECK ([expire_dte_flg]=(0) OR [expire_dte_flg]=(1)),
    CONSTRAINT [pckwrk_hdr_frsflg_ck] CHECK ([frsflg]=(0) OR [frsflg]=(1)),
    CONSTRAINT [pckwrk_hdr_list_cfg_ck] CHECK ([list_conf_flg]=(0) OR [list_conf_flg]=(1)),
    CONSTRAINT [pckwrk_hdr_locflg_ck] CHECK ([locflg]=(0) OR [locflg]=(1)),
    CONSTRAINT [pckwrk_hdr_lockflg_ck] CHECK ([lock_flg]=(0) OR [lock_flg]=(1)),
    CONSTRAINT [pckwrk_hdr_lodflg_ck] CHECK ([lodflg]=(0) OR [lodflg]=(1)),
    CONSTRAINT [pckwrk_hdr_lotflg_ck] CHECK ([lotflg]=(0) OR [lotflg]=(1)),
    CONSTRAINT [pckwrk_hdr_lstpcck] CHECK ([lstpck_flg]=(0) OR [lstpck_flg]=(1)),
    CONSTRAINT [pckwrk_hdr_mandteflgck] CHECK ([mandte_flg]=(0) OR [mandte_flg]=(1)),
    CONSTRAINT [pckwrk_hdr_orgflg_ck] CHECK ([orgflg]=(0) OR [orgflg]=(1)),
    CONSTRAINT [pckwrk_hdr_pipflg_ck] CHECK ([pipflg]=(0) OR [pipflg]=(1)),
    CONSTRAINT [pckwrk_hdr_prtflg_ck] CHECK ([prtflg]=(0) OR [prtflg]=(1)),
    CONSTRAINT [pckwrk_hdr_qtyflg_ck] CHECK ([qtyflg]=(0) OR [qtyflg]=(1)),
    CONSTRAINT [pckwrk_hdr_revflg_ck] CHECK ([revflg]=(0) OR [revflg]=(1)),
    CONSTRAINT [pckwrk_hdr_rttnidflgck] CHECK ([rttn_id_flg]=(0) OR [rttn_id_flg]=(1)),
    CONSTRAINT [pckwrk_hdr_sphand_ck] CHECK ([sp_hand_flg]=(0) OR [sp_hand_flg]=(1)),
    CONSTRAINT [pckwrk_hdr_splflg_ck] CHECK ([splflg]=(0) OR [splflg]=(1)),
    CONSTRAINT [pckwrk_hdr_split_flg_ck] CHECK ([palctl_split_flg]=(0) OR [palctl_split_flg]=(1)),
    CONSTRAINT [pckwrk_hdr_startpal_ck] CHECK ([start_pal_flg]=(0) OR [start_pal_flg]=(1)),
    CONSTRAINT [pckwrk_hdr_subflg_ck] CHECK ([subflg]=(0) OR [subflg]=(1)),
    CONSTRAINT [pckwrk_hdr_sup_lot_flg_ck] CHECK ([sup_lot_flg]=(0) OR [sup_lot_flg]=(1)),
    CONSTRAINT [pckwrk_hdr_supflg_ck] CHECK ([supflg]=(0) OR [supflg]=(1)),
    CONSTRAINT [pckwrk_hdr_thresh_pck_flg_ck] CHECK ([thresh_pck_flg]=(0) OR [thresh_pck_flg]=(1)),
    CONSTRAINT [pckwrk_hdr_unasgnflgck] CHECK ([unassign_flg]=(0) OR [unassign_flg]=(1)),
    CONSTRAINT [pckwrk_hdr_visflg_ck] CHECK ([visflg]=(0) OR [visflg]=(1))
);


GO
CREATE NONCLUSTERED INDEX [pckwrk_hdr_ackdevcod]
    ON [dbo].[pckwrk_hdr]([ackdevcod] ASC, [wh_id] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [pckwrk_hdr_assign_grp]
    ON [dbo].[pckwrk_hdr]([assign_grp] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [pckwrk_hdr_idx1]
    ON [dbo].[pckwrk_hdr]([srcloc] ASC, [wh_id] ASC, [prtnum] ASC, [pcksts] ASC, [prt_client_id] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [pckwrk_hdr_idx4]
    ON [dbo].[pckwrk_hdr]([ctnnum] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [pckwrk_hdr_idx6]
    ON [dbo].[pckwrk_hdr]([lblbat] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [pckwrk_hdr_idx7]
    ON [dbo].[pckwrk_hdr]([schbat] ASC, [pcksts] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [pckwrk_hdr_idx9]
    ON [dbo].[pckwrk_hdr]([lblbat] ASC, [srcloc] ASC, [wh_id] ASC, [appqty] ASC, [pckqty] ASC, [wrkref] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [pckwrk_hdr_idx12]
    ON [dbo].[pckwrk_hdr]([list_id] ASC, [wh_id] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [pckwrk_hdr_idx13]
    ON [dbo].[pckwrk_hdr]([lodlvl] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [pckwrk_hdr_idx15]
    ON [dbo].[pckwrk_hdr]([pallet_pos] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [pckwrk_hdr_idx16]
    ON [dbo].[pckwrk_hdr]([schbat] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [pckwrk_hdr_idx19]
    ON [dbo].[pckwrk_hdr]([wrktyp] ASC, [wh_id] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [pckwrk_hdr_list_id]
    ON [dbo].[pckwrk_hdr]([list_id] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [pckwrk_hdr_lodtag]
    ON [dbo].[pckwrk_hdr]([lodtag] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [pckwrk_hdr_loducc]
    ON [dbo].[pckwrk_hdr]([loducc] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [pckwrk_hdr_lst_uid]
    ON [dbo].[pckwrk_hdr]([last_pck_usr_id] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [pckwrk_hdr_pallet_id]
    ON [dbo].[pckwrk_hdr]([pallet_id] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [pckwrk_hdr_pcksts]
    ON [dbo].[pckwrk_hdr]([pcksts] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [pckwrk_hdr_prtnumcltid]
    ON [dbo].[pckwrk_hdr]([prtnum] ASC, [prt_client_id] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [pckwrk_hdr_lodnum]
    ON [dbo].[pckwrk_hdr]([lodnum] ASC) WITH (FILLFACTOR = 90);


GO
CREATE UNIQUE NONCLUSTERED INDEX [pckwrk_hdr_rowid]
    ON [dbo].[pckwrk_hdr]([rowid] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [pckwrk_hdr_wrktyppckst]
    ON [dbo].[pckwrk_hdr]([wrktyp] ASC, [pcksts] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [pckwrk_hdr_lst_id_wh_id_lblseq]
    ON [dbo].[pckwrk_hdr]([list_id] ASC, [wh_id] ASC, [lblseq] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [pckwrk_hdr_idx20]
    ON [dbo].[pckwrk_hdr]([pallet_id] ASC, [wh_id] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [pckwrk_hdr_list_grp_id]
    ON [dbo].[pckwrk_hdr]([list_grp_id] ASC) WITH (FILLFACTOR = 90);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table is created to replace original pckwrk with another new table pckwrk_dtl.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This uniquely identifies the record.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'wrkref';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Work type', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'wrktyp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Schedule batch. This uniquely identifies the record and represents a group of picks.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'schbat';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The source location for beginning the work.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'srcloc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Source Area - Area code to which the inventory for this order line will be picked.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'srcare';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Client ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'client_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warehouse ID - the warehouse in which the inventory is to be received.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Pick works grouped in the same label batch will all share the same lblbat value.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'lblbat';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Sequence used to order label printing.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'lblseq';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The device code that should be used when printing labels for this pick.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'devcod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The amount of product to pick.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'pckqty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The catch quantity to pick.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'pck_catch_qty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The amount of product applied against this pick.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'appqty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The catch quantity already applied.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'app_catch_qty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Pick Status', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'pcksts';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Item Number - Identifier for the item, or SKU that is ordered.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'prtnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Client id of item number.  In non-3PL systems, this will be set to a default of ''----''.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'prt_client_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If this pick requires a specific origin code, this value will be filled in.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'orgcod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If this pick requires a specific revision level, this value will be filled in.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'revlvl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If this pick requires a specific lot number, this value will be filled in.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'lotnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Slot Number - The slot number assigned during list pick generation based on pick list rule.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'asset_slot';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If this pick requires a specific supplier lot number, this value will be filled in.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'sup_lotnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Status', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'invsts';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Status Progression', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'invsts_prg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The type of pick: L = Pallet pick, S = case pick, D = piece pick', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'lodlvl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Load UCC code number.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'loducc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Load Tag - used to define the RFID tag value for pallet pick', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'lodtag';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This field is not currently utilized by standard processing.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'lodnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Units per case', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'untcas';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Units per pack', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'untpak';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This is footprint code associate with the item.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'ftpcod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The code for the carton being used.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'ctncod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Carton Number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'ctnnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Carton Segment', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'ctnseg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Position ID to track position of the List/Carton in the group of Lists.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'pos_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This field is not used by standard system processing.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'visflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Split Case Flag - Determines whether or not the system can allocate partial case quantities.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'splflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Confirm location on pickup.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'locflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Confirm load number on pickup.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'lodflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Confirm case identifier on pickup.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'subflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Confirm piece identifier on pickup.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'dtlflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Confirm item number on pickup.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'prtflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Confirm origin code on pickup.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'orgflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Confirm revision level on pickup.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'revflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Confirm lot number on pickup.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'lotflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Confirm supplier lot number on pickup.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'sup_lot_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Confirm pick quantity on pickup.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'qtyflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Confirm catch quantity on pickup.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'catch_qty_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Added date - Date/time when pick work was added.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'adddte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date/time that pick was confirmed.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'pckdte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Completed date - Date/time when pick work was completed.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'cmpdte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The source location identifier that will be displayed to the RF operator. This may not be the same as the srcloc value.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'refloc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Used during cluster picking to tag which pick works will be processed by a device.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'ackdevcod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicates if the pick is a pre-inventory pick where the pick work exists before the inventory is delivered to the location.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'pipflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Freshness Process Flag - This flag is set if this order line requires freshness processing - that is, that the oldest product shipped is newer than the newest product previously shipped.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'frsflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Cluster Sequence - Indicates in what order a carton will be filled in a bulk cluster pick', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'clst_seq';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Minimum Shelf Hours - If set, only inventory with an expiration date that is at least this many hours away from expiring will be allocated for this order line.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'min_shelf_hrs';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date pick was printed', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'prtdte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'List Group ID - The List Group Id assigned by scanning several list_id''s', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'list_grp_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'List ID- Identifies the list_id to which the pick had been assigned.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'list_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'List Sequence - The sequence the pick fell in the list.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'list_seqnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Labor Estimate (Seconds)', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'lm_goal_seconds';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Labor Assignment Number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'lm_assign_num';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Labor Assignment Sequence Number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'lm_assign_seqnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The number of times this pick has been skipped.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'skip_cnt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Concatenated Pallet Position/Pallet Number as sent from PalletCtl.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'pallet_pos';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Pallet identifier as sent from PalletCtl.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'pallet_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Sequence in which the pallet is to be loaded onto the truck.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'pallet_load_seq';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Rotation ID used for tracking bonded inventory.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'rttn_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Rotation ID verification flag - used to indicate whether or not pick verification is turned on for rotation id. ''1'' means yes and ''0'' means no.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'rttn_id_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'When Un-Assign Flag is checked, the pick has been un-assigned.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'unassign_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Asset Type - Asset Type to be picked. But system will NOT force user to Pick the particular Asset type on the table.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'asset_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Supplier Number: Supplier number specific to the pick.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'supnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Supplier Flag: Confirm supplier number on pickup.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'supflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Pallet ID that uniquely identifies the pallet to the PalletCtl system', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'unique_pallet_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'PalletCtl status. DONE(PalletCtl finished),WPPP(Waiting PalletCtl,pcksts=P),WPPH(Waiting PalletCtl,pcksts=H),WSTP(Waiting Shorts,pcksts=P),WSTH(Waiting Shorts,pcksts=H),WXDP(Waiting XDCK,pcksts=P),WXDH(Waiting XDCK,pcksts=H)', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'palctlsts';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Used with PalletCTL to indicate this pick is a starter pallet.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'start_pal_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Mark records which need to have the inventory moved from a temporary load to the main pick to load. After the pick is confirmed, the flag will be unset.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'list_conf_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'UOM set according to pckqty when created in allocating inventory. Represents at which UOM level shoud user pick the inventory.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'pck_uom';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Assignment group number used to group together a set of picks.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'assign_grp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This flag indicates whether work should be created in LOCK or PEND status.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'lock_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Picking validation - used to store the absolute date for inventory at time of allocation, Date is Julian.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'abs_ordinv_dte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Setting this flag makes the pckwrk record a threshold pick.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'thresh_pck_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This indicates the asset to which the list will be picked to. If it is a serialized asset, then this will hold the asset id or serial number of the asset id. In case of non serialized asset, this will hold the scanned load number.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'pck_to_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The Last Picker columns is updated when a user picks a work reference. This column will contain the user''s id. Since, multiple user can pick a work reference the column will always contain the last user to pick it.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'last_pck_usr_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicates if the pick is for special handling.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'sp_hand_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This will be an unique rule name which will have to exists in alloc_rule table. Allocation logic will get the inventory attributes from alloc_rule table.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'rule_nam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This will be used to hold the allocated inventory''s man_dte.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'mandte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This will be used to hold the allocated inventory''s expire_dte.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'expire_dte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This will be used to determine whether or not to prompt the user to verify the man_dte while picking.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'mandte_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This will be used to determine whether or not to prompt the user to verify the expire_dte while picking.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'expire_dte_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This will be used to denote that the pick has been split by pallet control. When a replan is sent to pallet control for a pick whose palctl_split_flg is TRUE the status will be 3.  Any other picks that are on that UID will also have status 3.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'palctl_split_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Flag to signify if list picking is enabled for this pick work.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'lstpck_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Confirm Inventory Attribute Text 1 Flag.Indicates whether user needs to confirm the Text Inventory Attribute1 on pickup.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'attr_str1_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Confirm Inventory Attribute Text 2 Flag.Indicates whether user needs to confirm the Text Inventory Attribute2 on pickup.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'attr_str2_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Confirm Inventory Attribute Text 3 Flag.Indicates whether user needs to confirm the Text Inventory Attribute3 on pickup.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'attr_str3_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Confirm Inventory Attribute Text 4 Flag.Indicates whether user needs to confirm the Text Inventory Attribute4 on pickup.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'attr_str4_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Confirm Inventory Attribute Text 5 Flag.Indicates whether user needs to confirm the Text Inventory Attribute5 on pickup.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'attr_str5_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Confirm Inventory Attribute Text 6 Flag.Indicates whether user needs to confirm the Text Inventory Attribute6 on pickup.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'attr_str6_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Confirm Inventory Attribute Text 7 Flag.Indicates whether user needs to confirm the Text Inventory Attribute7 on pickup.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'attr_str7_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Confirm Inventory Attribute Text 8 Flag.Indicates whether user needs to confirm the Text Inventory Attribute8 on pickup.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'attr_str8_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Confirm Inventory Attribute Text 9 Flag.Indicates whether user needs to confirm the Text Inventory Attribute9 on pickup.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'attr_str9_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Confirm Inventory Attribute Text 10 Flag.Indicates whether user needs to confirm the Text Inventory Attribute10 on pickup.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'attr_str10_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Confirm Inventory Attribute Text 11 Flag.Indicates whether user needs to confirm the Text Inventory Attribute11 on pickup.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'attr_str11_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Confirm Inventory Attribute Text 12 Flag.Indicates whether user needs to confirm the Text Inventory Attribute12 on pickup.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'attr_str12_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Confirm Inventory Attribute Text 13 Flag.Indicates whether user needs to confirm the Text Inventory Attribute13 on pickup.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'attr_str13_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Confirm Inventory Attribute Text 14 Flag.Indicates whether user needs to confirm the Text Inventory Attribute14 on pickup.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'attr_str14_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Confirm Inventory Attribute Text 15 Flag.Indicates whether user needs to confirm the Text Inventory Attribute15 on pickup.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'attr_str15_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Confirm Inventory Attribute Text 16 Flag.Indicates whether user needs to confirm the Text Inventory Attribute16 on pickup.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'attr_str16_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Confirm Inventory Attribute Text 17 Flag.Indicates whether user needs to confirm the Text Inventory Attribute17 on pickup.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'attr_str17_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Confirm Inventory Attribute Text 18 Flag.Indicates whether user needs to confirm the Text Inventory Attribute18 on pickup.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'attr_str18_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Confirm Inventory Attribute Number 1 Flag.Indicates whether user needs to confirm the Number Inventory Attribute1 on pickup.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'attr_int1_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Confirm Inventory Attribute Number 2 Flag.Indicates whether user needs to confirm the Number Inventory Attribute2 on pickup.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'attr_int2_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Confirm Inventory Attribute Number 3 Flag.Indicates whether user needs to confirm the Number Inventory Attribute3 on pickup.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'attr_int3_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Confirm Inventory Attribute Number 4 Flag.Indicates whether user needs to confirm the Number Inventory Attribute4 on pickup.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'attr_int4_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Confirm Inventory Attribute Number 5 Flag.Indicates whether user needs to confirm the Number Inventory Attribute5 on pickup.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'attr_int5_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Confirm Inventory Attribute Decimal 1 Flag.Indicates whether user needs to confirm the Decimal Inventory Attribute1 on pickup.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'attr_flt1_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Confirm Inventory Attribute Decimal 2 Flag.Indicates whether user needs to confirm the Decimal Inventory Attribute2 on pickup.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'attr_flt2_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Confirm Inventory Attribute Decimal 3 Flag.Indicates whether user needs to confirm the Decimal Inventory Attribute3 on pickup.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'attr_flt3_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Confirm Inventory Attribute Date 1 Flag.Indicates whether user needs to confirm the Date Inventory Attribute1 on pickup.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'attr_dte1_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Confirm Inventory Attribute Date 2 Flag.Indicates whether user needs to confirm the Date Inventory Attribute2 on pickup.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'attr_dte2_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 1. Confirm Inventory Attribute Text 1 for the pickup.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'inv_attr_str1';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 2. Confirm Inventory Attribute Text 2 for the pickup.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'inv_attr_str2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 3. Confirm Inventory Attribute Text 3 for the pickup.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'inv_attr_str3';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 4. Confirm Inventory Attribute Text 4 for the pickup.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'inv_attr_str4';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 5. Confirm Inventory Attribute Text 5 for the pickup.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'inv_attr_str5';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 6. Confirm Inventory Attribute Text 6 for the pickup.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'inv_attr_str6';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 7. Confirm Inventory Attribute Text 7 for the pickup.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'inv_attr_str7';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 8. Confirm Inventory Attribute Text 8 for the pickup.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'inv_attr_str8';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 9. Confirm Inventory Attribute Text 9 for the pickup.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'inv_attr_str9';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 10. Confirm Inventory Attribute Text 10 for the pickup.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'inv_attr_str10';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 11. Confirm Inventory Attribute Text 11 for the pickup.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'inv_attr_str11';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 12. Confirm Inventory Attribute Text 12 for the pickup.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'inv_attr_str12';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 13. Confirm Inventory Attribute Text 13 for the pickup.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'inv_attr_str13';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 14. Confirm Inventory Attribute Text 14 for the pickup.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'inv_attr_str14';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 15. Confirm Inventory Attribute Text 15 for the pickup.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'inv_attr_str15';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 16. Confirm Inventory Attribute Text 16 for the pickup.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'inv_attr_str16';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 17. Confirm Inventory Attribute Text 17 for the pickup.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'inv_attr_str17';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 18. Confirm Inventory Attribute Text 18 for the pickup.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'inv_attr_str18';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Number 1. Confirm Inventory Attribute Number 1 for the pickup.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'inv_attr_int1';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Number 2. Confirm Inventory Attribute Number 2 for the pickup.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'inv_attr_int2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Number 3. Confirm Inventory Attribute Number 3 for the pickup.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'inv_attr_int3';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Number 4. Confirm Inventory Attribute Number 4 for the pickup.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'inv_attr_int4';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Number 5. Confirm Inventory Attribute Number 5 for the pickup.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'inv_attr_int5';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Decimal 1 . Confirm Inventory Attribute Decimal 1 for the pickup.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'inv_attr_flt1';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Decimal 2 . Confirm Inventory Attribute Decimal 2 for the pickup.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'inv_attr_flt2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Decimal 3 . Confirm Inventory Attribute Decimal 3 for the pickup.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'inv_attr_flt3';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Date 1 . Confirm Inventory Attribute Date 1 for the pickup.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'inv_attr_dte1';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Date 2 . Confirm Inventory Attribute Date 2 for the pickup.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'inv_attr_dte2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'pick group determined by command ''log pick request''.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'wcs_pck_grp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'timestamp of when ''log pick request'' was successfully completed.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'wcs_reported_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'pick status when ''process cancel pick'' was called.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'wcs_can_pcksts';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'timestamp of when ''process cancel pick'' was called.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'wcs_can_req_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date the row was inserted.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date the row was last updated.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User id of the person who created the row.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Row ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckwrk_hdr', @level2type = N'COLUMN', @level2name = N'rowid';

