CREATE TABLE [dbo].[wcs_disc_snap] (
    [snapshot_id]       INT             NOT NULL,
    [wcs_id]            NVARCHAR (30)   NOT NULL,
    [wh_id]             NVARCHAR (32)   NOT NULL,
    [tran_id]           NVARCHAR (50)   NOT NULL,
    [tran_dt]           DATETIME        NOT NULL,
    [lodnum]            NVARCHAR (30)   NOT NULL,
    [stoloc]            NVARCHAR (20)   NOT NULL,
    [prmflg]            INT             NULL,
    [unkflg]            INT             NULL,
    [mvlflg]            INT             NULL,
    [loducc]            NVARCHAR (20)   NULL,
    [uccdte]            DATETIME        NULL,
    [palpos]            NVARCHAR (20)   NULL,
    [asset_typ]         NVARCHAR (30)   NULL,
    [avg_unt_catch_qty] NUMERIC (19, 4) NULL,
    [lodtag]            NVARCHAR (40)   NULL,
    [lod_tagsts]        NVARCHAR (40)   NULL,
    [lodhgt]            NUMERIC (19, 4) NULL,
    [bundled_flg]       INT             NULL,
    [distro_palopn_flg] INT             NULL,
    [load_attr1_flg]    INT             NULL,
    [load_attr2_flg]    INT             NULL,
    [load_attr3_flg]    INT             NULL,
    [load_attr4_flg]    INT             NULL,
    [load_attr5_flg]    INT             NULL,
    [subnum]            NVARCHAR (30)   NULL,
    [subwgt]            NUMERIC (19, 4) NULL,
    [phyflg]            INT             NULL,
    [mvsflg]            INT             NULL,
    [ctnflg]            INT             NULL,
    [idmflg]            INT             NULL,
    [distro_ctnopn_flg] INT             NULL,
    [subref]            NVARCHAR (12)   NULL,
    [tagdev]            NVARCHAR (20)   NULL,
    [subucc]            NVARCHAR (20)   NULL,
    [subuccdte]         DATETIME        NULL,
    [subtag]            NVARCHAR (40)   NULL,
    [sub_tagsts]        NVARCHAR (40)   NULL,
    [sub_asset_typ]     NVARCHAR (30)   NULL,
    [dtlnum]            NVARCHAR (30)   NULL,
    [phdflg]            INT             NULL,
    [prtnum]            NVARCHAR (50)   NULL,
    [prt_client_id]     NVARCHAR (32)   NULL,
    [orgcod]            NVARCHAR (25)   NULL,
    [revlvl]            NVARCHAR (25)   NULL,
    [lotnum]            NVARCHAR (25)   NULL,
    [sup_lotnum]        NVARCHAR (25)   NULL,
    [invsts]            NVARCHAR (4)    NULL,
    [supnum]            NVARCHAR (32)   NULL,
    [cnsg_flg]          INT             NULL,
    [age_pflnam]        NVARCHAR (30)   NULL,
    [fifdte]            DATETIME        NULL,
    [mandte]            DATETIME        NULL,
    [expire_dte]        DATETIME        NULL,
    [untqty]            INT             NULL,
    [untcas]            INT             NULL,
    [untpak]            INT             NULL,
    [ftpcod]            NVARCHAR (30)   NULL,
    [rcvkey]            NVARCHAR (15)   NULL,
    [ship_line_id]      NVARCHAR (10)   NULL,
    [wrkref]            NVARCHAR (12)   NULL,
    [wrkref_dtl]        NVARCHAR (15)   NULL,
    [adddte]            DATETIME        DEFAULT (getdate()) NULL,
    [rcvdte]            DATETIME        NULL,
    [lstmov]            DATETIME        NULL,
    [lstdte]            DATETIME        NULL,
    [lstcod]            NVARCHAR (20)   NULL,
    [lst_usr_id]        NVARCHAR (40)   NULL,
    [cmpkey]            NVARCHAR (20)   NULL,
    [alcflg]            INT             NULL,
    [catch_qty]         NUMERIC (19, 4) NULL,
    [lst_arecod]        NVARCHAR (10)   NULL,
    [bill_through_dte]  DATETIME        NULL,
    [condcod]           NVARCHAR (1)    NULL,
    [distro_id]         NVARCHAR (35)   NULL,
    [distro_flg]        INT             NULL,
    [hld_flg]           INT             NULL,
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
    [cstms_cnsgnmnt_id] NVARCHAR (18)   NULL,
    [rttn_id]           NVARCHAR (10)   NULL,
    [cstms_bond_flg]    INT             NULL,
    [dty_stmp_flg]      INT             NULL,
    [asnflg]            INT             NULL,
    [u_version]         INT             NULL,
    [ins_dt]            DATETIME        NULL,
    [last_upd_dt]       DATETIME        NULL,
    [ins_user_id]       NVARCHAR (40)   NULL,
    [last_upd_user_id]  NVARCHAR (40)   NULL,
    CONSTRAINT [wcs_disc_snap_pk] PRIMARY KEY CLUSTERED ([snapshot_id] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Stores inventory records that were sent from WCS in a file and loaded by the Integrator transaction. This table basically represents our flat inventory structure and it is roughly equal to inventory_view on the WMS end.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_disc_snap';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Snapshot ID. Surrogate key that has no business meaning in the table, but rather, it serves as the identity column of the table.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_disc_snap', @level2type = N'COLUMN', @level2name = N'snapshot_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warehouse Control System (WCS) Identifier', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_disc_snap', @level2type = N'COLUMN', @level2name = N'wcs_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warehouse ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_disc_snap', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Transaction ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_disc_snap', @level2type = N'COLUMN', @level2name = N'tran_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Transaction Date and Time', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_disc_snap', @level2type = N'COLUMN', @level2name = N'tran_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Uniquely identifies invlod record.  In many systems, this value is the same as the label on a pallet.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_disc_snap', @level2type = N'COLUMN', @level2name = N'lodnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicates the storage location for this pallet.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_disc_snap', @level2type = N'COLUMN', @level2name = N'stoloc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Set if this is a ''permanent'' subload.  Permanent subloads are used throughout the system when it is necessary to provide a container to attach details to.  Additionally, in systems utilizing totes, they are represented as ''perm subloads''', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_disc_snap', @level2type = N'COLUMN', @level2name = N'prmflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This will be set to 1 if this invsub record represents a physical case in the system.  In this case, the subnum will be set to the external labeling on the physical case.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_disc_snap', @level2type = N'COLUMN', @level2name = N'unkflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This is used to indicate if this subload entry may be moved.  In the case where permanent subloads are used to provide places to attach inventory, it is seldom desired that those permanent subs be allowed to move.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_disc_snap', @level2type = N'COLUMN', @level2name = N'mvlflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If UCC128 processing is installed and this load receives a UCC128 shipping label, then this field will be filled in with the value of that label.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_disc_snap', @level2type = N'COLUMN', @level2name = N'loducc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date/time the UCC128 shipping label was applied.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_disc_snap', @level2type = N'COLUMN', @level2name = N'uccdte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicates what position the load''s pallet occupies.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_disc_snap', @level2type = N'COLUMN', @level2name = N'palpos';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Asset Type - Identifies the asset type for this load', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_disc_snap', @level2type = N'COLUMN', @level2name = N'asset_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Catch Quantity.  Used by the Average Catch Quantity functionality to store an average catch value for a load''s units.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_disc_snap', @level2type = N'COLUMN', @level2name = N'avg_unt_catch_qty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The RFID tag associated to pallet', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_disc_snap', @level2type = N'COLUMN', @level2name = N'lodtag';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Pallet RFID Tag Status', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_disc_snap', @level2type = N'COLUMN', @level2name = N'lod_tagsts';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The Load Height.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_disc_snap', @level2type = N'COLUMN', @level2name = N'lodhgt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Bundled Flag - Indicate if the load was created by bundling multiple cases for parcel manifesting.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_disc_snap', @level2type = N'COLUMN', @level2name = N'bundled_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Distribution Pallet Open Flag - Indicate whether the shipping pallet is open or not.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_disc_snap', @level2type = N'COLUMN', @level2name = N'distro_palopn_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The first load attribute. A load attribute is a configurable flag field to indicate attributes of a load such as the load being wrapped.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_disc_snap', @level2type = N'COLUMN', @level2name = N'load_attr1_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The second load attribute. A load attribute is a configurable flag field to indicate attributes of a load such as the load being wrapped.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_disc_snap', @level2type = N'COLUMN', @level2name = N'load_attr2_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The third load attribute. A load attribute is a configurable flag field to indicate attributes of a load such as the load being wrapped.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_disc_snap', @level2type = N'COLUMN', @level2name = N'load_attr3_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The fourth load attribute. A load attribute is a configurable flag field to indicate attributes of a load such as the load being wrapped.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_disc_snap', @level2type = N'COLUMN', @level2name = N'load_attr4_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The fifth load attribute. A load attribute is a configurable flag field to indicate attributes of a load such as the load being wrapped.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_disc_snap', @level2type = N'COLUMN', @level2name = N'load_attr5_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Identifies which inventory sub (invsub) record this detail is attached to.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_disc_snap', @level2type = N'COLUMN', @level2name = N'subnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'In systems where scales are available, this field may be used to store the physical weight of the case that this invsub entry represents.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_disc_snap', @level2type = N'COLUMN', @level2name = N'subwgt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This will be set to 1 if this invsub record represents a physical case in the system.  In this case, the subnum will be set to the external labeling on the physical case.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_disc_snap', @level2type = N'COLUMN', @level2name = N'phyflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This is used to indicate if this subload entry may be moved.  In the case where permanent subloads are used to provide places to attach inventory, it is seldom desired that those permanent subs be allowed to move.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_disc_snap', @level2type = N'COLUMN', @level2name = N'mvsflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This will be set if this sub was created as a result of a cartonization or overpack operation.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_disc_snap', @level2type = N'COLUMN', @level2name = N'ctnflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This flag will be set if details are not allowed to move out from under this subload.  When serialized product is tracked in a facility, it is sometimes desired to disable details from moving out of a serialized, physical case.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_disc_snap', @level2type = N'COLUMN', @level2name = N'idmflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The flag to show whether the put to store Carton is open or not.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_disc_snap', @level2type = N'COLUMN', @level2name = N'distro_ctnopn_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If this subload represents a cartonized or overpacked case,  and the case was picked against a work reference, the wrkref field will map back to the pckwrk_hdr/pckwrk_dtl tables  to indicate which KIT pick this subload was picked against.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_disc_snap', @level2type = N'COLUMN', @level2name = N'subref';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Used so that RF can tag cases for later operations.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_disc_snap', @level2type = N'COLUMN', @level2name = N'tagdev';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If UCC128 processing is installed and this case receives a UCC128 shipping label, then this field will be filled in with the value of that label.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_disc_snap', @level2type = N'COLUMN', @level2name = N'subucc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date/time the UCC128 shipping label was applied.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_disc_snap', @level2type = N'COLUMN', @level2name = N'subuccdte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The RFID tag associated to carton', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_disc_snap', @level2type = N'COLUMN', @level2name = N'subtag';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Carton RFID Tag Status', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_disc_snap', @level2type = N'COLUMN', @level2name = N'sub_tagsts';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Asset Type - Identifies the asset type for this sub', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_disc_snap', @level2type = N'COLUMN', @level2name = N'sub_asset_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Detail Number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_disc_snap', @level2type = N'COLUMN', @level2name = N'dtlnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This flag is set to 1 in the event that this invdtl maps to a physical piece.  In that case, the dtlnum represents the labeled piece.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_disc_snap', @level2type = N'COLUMN', @level2name = N'phdflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Item number of the inventory tracked by this detail.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_disc_snap', @level2type = N'COLUMN', @level2name = N'prtnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Client ownership for item number.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_disc_snap', @level2type = N'COLUMN', @level2name = N'prt_client_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Origin Code of the inventory tracked by this detail. If this item is not origin code tracked, then this field will take on a default value of ''----''.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_disc_snap', @level2type = N'COLUMN', @level2name = N'orgcod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Revision level of the inventory tracked by this detail.  If this item is not revision level tracked, then this field will take on a default value of ''----''.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_disc_snap', @level2type = N'COLUMN', @level2name = N'revlvl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Lot number of the inventory tracked by this detail.  If this item is not lot number tracked, then this field will take on a default value of ''----''.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_disc_snap', @level2type = N'COLUMN', @level2name = N'lotnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Lot number supplied by the supplier for tracking purposes.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_disc_snap', @level2type = N'COLUMN', @level2name = N'sup_lotnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory status of the inventory tracked by this detail.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_disc_snap', @level2type = N'COLUMN', @level2name = N'invsts';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Supplier Number of the Inventory tracked by this detail.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_disc_snap', @level2type = N'COLUMN', @level2name = N'supnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Consigned Flag: The status indicates ownership of the inventory (1=ownership is with the supplier, 0=ownership is not with supplier)', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_disc_snap', @level2type = N'COLUMN', @level2name = N'cnsg_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Aging profile for this inventory.  This only applies to items that are date controlled.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_disc_snap', @level2type = N'COLUMN', @level2name = N'age_pflnam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date to be used for FIFO calculations with this inventory.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_disc_snap', @level2type = N'COLUMN', @level2name = N'fifdte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date this product was manufactured.  It is calculated by calling the command ''get manufacturing date''.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_disc_snap', @level2type = N'COLUMN', @level2name = N'mandte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date this product will expire.  This is only used for date controlled product and is calculated based on the product''s aging profile.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_disc_snap', @level2type = N'COLUMN', @level2name = N'expire_dte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The amount of inventory (in stock keeping units) this detail tracks.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_disc_snap', @level2type = N'COLUMN', @level2name = N'untqty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The number of units in a case of the inventory tracked by this detail.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_disc_snap', @level2type = N'COLUMN', @level2name = N'untcas';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The number of units in an inner pack carton of the inventory tracked by this detail.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_disc_snap', @level2type = N'COLUMN', @level2name = N'untpak';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The footprint code of the inventory tracked by this invdtl.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_disc_snap', @level2type = N'COLUMN', @level2name = N'ftpcod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If this detail was received, then the receive key will be filled in indicating which rcvlin this detail was received against.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_disc_snap', @level2type = N'COLUMN', @level2name = N'rcvkey';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If this detail was picked for a shipment, then the ship_line_id field will be filled in mapping it to the particular shipment line which this detail satisfied.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_disc_snap', @level2type = N'COLUMN', @level2name = N'ship_line_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If this detail was picked for a shipment or a work order, the wrkref field will be filled in which provides a mapping into the pckwrk_hdr/pckwrk_dtl tables for the pick which this detail satisfied.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_disc_snap', @level2type = N'COLUMN', @level2name = N'wrkref';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Pick Work Detail ID - The unique identifier of the pick work detail record.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_disc_snap', @level2type = N'COLUMN', @level2name = N'wrkref_dtl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date this detail was added to the system.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_disc_snap', @level2type = N'COLUMN', @level2name = N'adddte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This indicates the date and time that the detail was received.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_disc_snap', @level2type = N'COLUMN', @level2name = N'rcvdte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Last date/time detail was moved.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_disc_snap', @level2type = N'COLUMN', @level2name = N'lstmov';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Last date/time activity occurred for this detail.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_disc_snap', @level2type = N'COLUMN', @level2name = N'lstdte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Last activity code on this detail.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_disc_snap', @level2type = N'COLUMN', @level2name = N'lstcod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Last user which performed an activity on this detail.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_disc_snap', @level2type = N'COLUMN', @level2name = N'lst_usr_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If this detail was produced as a result of production, this field will be filled in to provide a mapping in to the cmphdr table which will indicate which work order this detail was produced against.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_disc_snap', @level2type = N'COLUMN', @level2name = N'cmpkey';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Allow Allocation Flag.  Is this detail allowed for use in allocation?', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_disc_snap', @level2type = N'COLUMN', @level2name = N'alcflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Catch Quantity', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_disc_snap', @level2type = N'COLUMN', @level2name = N'catch_qty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Last Area Code. Displays the last area code of the inventory. Moves to the RF device will NOT be updated with the rdt device as the last area code.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_disc_snap', @level2type = N'COLUMN', @level2name = N'lst_arecod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Refers to the ending date of the anniversary storage period.  This is usually one day less than the sum of the received date and the billing period length.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_disc_snap', @level2type = N'COLUMN', @level2name = N'bill_through_dte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The condition code of inventory returned to the warehouse.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_disc_snap', @level2type = N'COLUMN', @level2name = N'condcod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Distribution Identifer - the distribution inventory reserved for', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_disc_snap', @level2type = N'COLUMN', @level2name = N'distro_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicates if the inventory is candidate for distribution.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_disc_snap', @level2type = N'COLUMN', @level2name = N'distro_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This flag indicates that the inventory is put on hold if it has a value of 1 .', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_disc_snap', @level2type = N'COLUMN', @level2name = N'hld_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 1.This field can be enabled to track and use custom text data during standard inventory-related operations.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_disc_snap', @level2type = N'COLUMN', @level2name = N'inv_attr_str1';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 2.This field can be enabled to track and use custom text data during standard inventory-related operations.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_disc_snap', @level2type = N'COLUMN', @level2name = N'inv_attr_str2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 3.This field can be enabled to track and use custom text data during standard inventory-related operations.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_disc_snap', @level2type = N'COLUMN', @level2name = N'inv_attr_str3';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 4.This field can be enabled to track and use custom text data during standard inventory-related operations.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_disc_snap', @level2type = N'COLUMN', @level2name = N'inv_attr_str4';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 5.This field can be enabled to track and use custom text data during standard inventory-related operations.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_disc_snap', @level2type = N'COLUMN', @level2name = N'inv_attr_str5';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 6.This field can be enabled to track and use custom text data during standard inventory-related operations.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_disc_snap', @level2type = N'COLUMN', @level2name = N'inv_attr_str6';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 7.This field can be enabled to track and use custom text data during standard inventory-related operations.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_disc_snap', @level2type = N'COLUMN', @level2name = N'inv_attr_str7';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 8.This field can be enabled to track and use custom text data during standard inventory-related operations.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_disc_snap', @level2type = N'COLUMN', @level2name = N'inv_attr_str8';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 9.This field can be enabled to track and use custom text data during standard inventory-related operations.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_disc_snap', @level2type = N'COLUMN', @level2name = N'inv_attr_str9';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 10.This field can be enabled to track and use custom text data during standard inventory-related operations.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_disc_snap', @level2type = N'COLUMN', @level2name = N'inv_attr_str10';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 11.This field can be enabled to track and use custom text data during standard inventory-related operations.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_disc_snap', @level2type = N'COLUMN', @level2name = N'inv_attr_str11';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 12.This field can be enabled to track and use custom text data during standard inventory-related operations.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_disc_snap', @level2type = N'COLUMN', @level2name = N'inv_attr_str12';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 13.This field can be enabled to track and use custom text data during standard inventory-related operations.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_disc_snap', @level2type = N'COLUMN', @level2name = N'inv_attr_str13';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 14.This field can be enabled to track and use custom text data during standard inventory-related operations.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_disc_snap', @level2type = N'COLUMN', @level2name = N'inv_attr_str14';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 15.This field can be enabled to track and use custom text data during standard inventory-related operations.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_disc_snap', @level2type = N'COLUMN', @level2name = N'inv_attr_str15';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 16.This field can be enabled to track and use custom text data during standard inventory-related operations.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_disc_snap', @level2type = N'COLUMN', @level2name = N'inv_attr_str16';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 17.This field can be enabled to track and use custom text data during standard inventory-related operations.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_disc_snap', @level2type = N'COLUMN', @level2name = N'inv_attr_str17';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 18.This field can be enabled to track and use custom text data during standard inventory-related operations.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_disc_snap', @level2type = N'COLUMN', @level2name = N'inv_attr_str18';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Number 1.This field can be enabled to track and use custom number data during standard inventory-related operations.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_disc_snap', @level2type = N'COLUMN', @level2name = N'inv_attr_int1';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Number 2.This field can be enabled to track and use custom number data during standard inventory-related operations.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_disc_snap', @level2type = N'COLUMN', @level2name = N'inv_attr_int2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Number 3.This field can be enabled to track and use custom number data during standard inventory-related operations.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_disc_snap', @level2type = N'COLUMN', @level2name = N'inv_attr_int3';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Number 4.This field can be enabled to track and use custom number data during standard inventory-related operations.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_disc_snap', @level2type = N'COLUMN', @level2name = N'inv_attr_int4';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Number 5.This field can be enabled to track and use custom number data during standard inventory-related operations.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_disc_snap', @level2type = N'COLUMN', @level2name = N'inv_attr_int5';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Decimal 1.This field can be enabled to track and use custom decimal data during standard inventory-related operations.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_disc_snap', @level2type = N'COLUMN', @level2name = N'inv_attr_flt1';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Decimal 2.This field can be enabled to track and use custom decimal data during standard inventory-related operations.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_disc_snap', @level2type = N'COLUMN', @level2name = N'inv_attr_flt2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Decimal 3.This field can be enabled to track and use custom decimal data during standard inventory-related operations.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_disc_snap', @level2type = N'COLUMN', @level2name = N'inv_attr_flt3';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Date 1.This field can be enabled to track and use custom date data during standard inventory-related operations.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_disc_snap', @level2type = N'COLUMN', @level2name = N'inv_attr_dte1';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Date 2.This field can be enabled to track and use custom date data during standard inventory-related operations.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_disc_snap', @level2type = N'COLUMN', @level2name = N'inv_attr_dte2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Customs Consignment ID uniquely identify a consignment of bonded inventory on a per receipt basis.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_disc_snap', @level2type = N'COLUMN', @level2name = N'cstms_cnsgnmnt_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Rotation ID used for tracking bonded inventory.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_disc_snap', @level2type = N'COLUMN', @level2name = N'rttn_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Flag used to indicate whether or not the inventory is bonded. ''1'' means under bond and ''0'' means not under bond.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_disc_snap', @level2type = N'COLUMN', @level2name = N'cstms_bond_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Flag used to indicate whether or not the inventory has a duty stamp applied. ''1'' means yes and ''0'' means no.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_disc_snap', @level2type = N'COLUMN', @level2name = N'dty_stmp_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This flag is set to 1 when inventory is downloaded from the HOST as an ASN', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_disc_snap', @level2type = N'COLUMN', @level2name = N'asnflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The version number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_disc_snap', @level2type = N'COLUMN', @level2name = N'u_version';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was inserted', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_disc_snap', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was last updated', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_disc_snap', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who created the row', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_disc_snap', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_disc_snap', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

