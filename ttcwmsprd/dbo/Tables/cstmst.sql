CREATE TABLE [dbo].[cstmst] (
    [client_id]            NVARCHAR (32)   NOT NULL,
    [cstnum]               NVARCHAR (20)   NOT NULL,
    [adr_id]               NVARCHAR (20)   NULL,
    [bckflg]               INT             NULL,
    [parflg]               INT             NULL,
    [carflg]               INT             NULL,
    [splflg]               INT             NULL,
    [stdflg]               INT             NULL,
    [shplbl]               NVARCHAR (20)   NULL,
    [shipby]               NVARCHAR (10)   NULL,
    [cargrp]               NVARCHAR (10)   NULL,
    [manfid]               NVARCHAR (10)   NULL,
    [deptno]               NVARCHAR (10)   NULL,
    [ordinv]               NVARCHAR (30)   NULL,
    [requir_tms_cod]       NVARCHAR (1)    NULL,
    [trk_shp_flg]          INT             DEFAULT ((0)) NULL,
    [pltbld_consby]        NVARCHAR (20)   NULL,
    [acct_chkdigit]        INT             NULL,
    [acct_num_len]         INT             NULL,
    [lod_tag_sngle_encode] NVARCHAR (40)   NULL,
    [lod_tag_mix_encode]   NVARCHAR (40)   NULL,
    [sub_tag_sngle_encode] NVARCHAR (40)   NULL,
    [sub_tag_mix_encode]   NVARCHAR (40)   NULL,
    [urn_format]           NVARCHAR (40)   NULL,
    [asn_sys]              NVARCHAR (30)   NULL,
    [tmpl_adr_id]          NVARCHAR (20)   NULL,
    [grp_nam]              NVARCHAR (40)   NULL,
    [early_dlv_thresh_flg] INT             NULL,
    [early_dlv_thresh]     INT             NULL,
    [late_dlv_thresh_flg]  INT             NULL,
    [late_dlv_thresh]      INT             NULL,
    [ord_split_flg]        INT             NULL,
    [line_split_flg]       INT             NULL,
    [ovr_shp_tol]          NUMERIC (19, 4) NULL,
    [ovr_shp_tol_pct]      INT             NULL,
    [und_shp_tol]          NUMERIC (19, 4) NULL,
    [und_shp_tol_pct]      INT             NULL,
    [transit_serv_id]      NVARCHAR (20)   NULL,
    [sf_ovr_flg]           INT             NULL,
    [und_shp_tol_cod]      NVARCHAR (40)   NULL,
    [ovr_shp_tol_cod]      NVARCHAR (40)   NULL,
    [shp_mod_rule_cod]     NVARCHAR (40)   NULL,
    [shp_meas_ovr_flg]     INT             NULL,
    [req_shp_wgt_flg]      INT             NULL,
    [req_shp_cube_flg]     INT             NULL,
    [req_shp_pal_flg]      INT             NULL,
    [req_shp_cas_flg]      INT             NULL,
    [req_shp_misc_flg]     INT             NULL,
    [req_shp_misc2_flg]    INT             NULL,
    [sngl_prt_pal_flg]     INT             DEFAULT ((0)) NOT NULL,
    [load_attr1_cfg]       NVARCHAR (1)    NULL,
    [load_attr2_cfg]       NVARCHAR (1)    NULL,
    [load_attr3_cfg]       NVARCHAR (1)    NULL,
    [load_attr4_cfg]       NVARCHAR (1)    NULL,
    [load_attr5_cfg]       NVARCHAR (1)    NULL,
    [mc_csttyp]            NVARCHAR (4)    NULL,
    [mc_invsts_prg]        NVARCHAR (4)    NULL,
    [mc_frscod]            NVARCHAR (1)    NULL,
    [mc_min_shelf_hrs]     INT             NULL,
    [mc_rsvpri]            NVARCHAR (1)    NULL,
    [store_typ]            NVARCHAR (40)   NULL,
    [store_grp]            NVARCHAR (40)   NULL,
    [concept_code]         NVARCHAR (30)   NULL,
    [alc_search_path]      NVARCHAR (20)   NULL,
    [abs_ordinv_win]       INT             NULL,
    [abs_ordinv_code]      NVARCHAR (4)    NULL,
    [bulk_pck_flg]         INT             DEFAULT ((1)) NOT NULL,
    CONSTRAINT [cstmst_pk] PRIMARY KEY CLUSTERED ([cstnum] ASC, [client_id] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [cstmst_bckflg_ck] CHECK ([bckflg]=(0) OR [bckflg]=(1)),
    CONSTRAINT [cstmst_bulkpckflgck] CHECK ([bulk_pck_flg]=(0) OR [bulk_pck_flg]=(1)),
    CONSTRAINT [cstmst_carflg_ck] CHECK ([carflg]=(0) OR [carflg]=(1)),
    CONSTRAINT [cstmst_edtfck] CHECK ([early_dlv_thresh_flg]=(0) OR [early_dlv_thresh_flg]=(1)),
    CONSTRAINT [cstmst_ldtfck] CHECK ([late_dlv_thresh_flg]=(0) OR [late_dlv_thresh_flg]=(1)),
    CONSTRAINT [cstmst_lsflgck] CHECK ([line_split_flg]=(0) OR [line_split_flg]=(1)),
    CONSTRAINT [cstmst_osflgck] CHECK ([ord_split_flg]=(0) OR [ord_split_flg]=(1)),
    CONSTRAINT [cstmst_parflg_ck] CHECK ([parflg]=(0) OR [parflg]=(1)),
    CONSTRAINT [cstmst_rscasck] CHECK ([req_shp_cas_flg]=(0) OR [req_shp_cas_flg]=(1)),
    CONSTRAINT [cstmst_rscubeck] CHECK ([req_shp_cube_flg]=(0) OR [req_shp_cube_flg]=(1)),
    CONSTRAINT [cstmst_rsmsc2ck] CHECK ([req_shp_misc2_flg]=(0) OR [req_shp_misc2_flg]=(1)),
    CONSTRAINT [cstmst_rsmscck] CHECK ([req_shp_misc_flg]=(0) OR [req_shp_misc_flg]=(1)),
    CONSTRAINT [cstmst_rspalck] CHECK ([req_shp_pal_flg]=(0) OR [req_shp_pal_flg]=(1)),
    CONSTRAINT [cstmst_rswgtck] CHECK ([req_shp_wgt_flg]=(0) OR [req_shp_wgt_flg]=(1)),
    CONSTRAINT [cstmst_sfoflgck] CHECK ([sf_ovr_flg]=(0) OR [sf_ovr_flg]=(1)),
    CONSTRAINT [cstmst_smovrck] CHECK ([shp_meas_ovr_flg]=(0) OR [shp_meas_ovr_flg]=(1)),
    CONSTRAINT [cstmst_spartpalck] CHECK ([sngl_prt_pal_flg]=(0) OR [sngl_prt_pal_flg]=(1)),
    CONSTRAINT [cstmst_splflg_ck] CHECK ([splflg]=(0) OR [splflg]=(1)),
    CONSTRAINT [cstmst_stdflg_ck] CHECK ([stdflg]=(0) OR [stdflg]=(1)),
    CONSTRAINT [cstmst_trkshpflgck] CHECK ([trk_shp_flg]=(0) OR [trk_shp_flg]=(1))
);


GO
CREATE NONCLUSTERED INDEX [cstmst_idx1]
    ON [dbo].[cstmst]([adr_id] ASC) WITH (FILLFACTOR = 90);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Client Id', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cstmst', @level2type = N'COLUMN', @level2name = N'client_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Customer Number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cstmst', @level2type = N'COLUMN', @level2name = N'cstnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Address Id.  Maps to the address master table.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cstmst', @level2type = N'COLUMN', @level2name = N'adr_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Back Order.  Does the customer allow back orders?', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cstmst', @level2type = N'COLUMN', @level2name = N'bckflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Partial.  Does the customer allow partials?', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cstmst', @level2type = N'COLUMN', @level2name = N'parflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Change Carrier', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cstmst', @level2type = N'COLUMN', @level2name = N'carflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Split', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cstmst', @level2type = N'COLUMN', @level2name = N'splflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Standard Case', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cstmst', @level2type = N'COLUMN', @level2name = N'stdflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Shipping Label for the customer', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cstmst', @level2type = N'COLUMN', @level2name = N'shplbl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Create Shipment By', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cstmst', @level2type = N'COLUMN', @level2name = N'shipby';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Carrier Group', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cstmst', @level2type = N'COLUMN', @level2name = N'cargrp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Manufacturer Id', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cstmst', @level2type = N'COLUMN', @level2name = N'manfid';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Department Number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cstmst', @level2type = N'COLUMN', @level2name = N'deptno';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Order Inventory', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cstmst', @level2type = N'COLUMN', @level2name = N'ordinv';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Require TMS', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cstmst', @level2type = N'COLUMN', @level2name = N'requir_tms_cod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicates to the WM that it should track shipments for this customer.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cstmst', @level2type = N'COLUMN', @level2name = N'trk_shp_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicates how Pallet Building Consolidation will occur (ORDER/SHIPMENT)', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cstmst', @level2type = N'COLUMN', @level2name = N'pltbld_consby';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Character to start parse of Account Number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cstmst', @level2type = N'COLUMN', @level2name = N'acct_chkdigit';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Length of the Account Number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cstmst', @level2type = N'COLUMN', @level2name = N'acct_num_len';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The tag encoding to use for a single item full pallet', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cstmst', @level2type = N'COLUMN', @level2name = N'lod_tag_sngle_encode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The tag encoding to user for a mixed or partial pallet', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cstmst', @level2type = N'COLUMN', @level2name = N'lod_tag_mix_encode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The tag encoding to use for a single item full carton', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cstmst', @level2type = N'COLUMN', @level2name = N'sub_tag_sngle_encode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The tag encoding to user for a mixed or partial carton', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cstmst', @level2type = N'COLUMN', @level2name = N'sub_tag_mix_encode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The URN format to be used when communicating with customer', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cstmst', @level2type = N'COLUMN', @level2name = N'urn_format';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'ASN System - Used to indicate which Integrator an ASN transaction will be sent to.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cstmst', @level2type = N'COLUMN', @level2name = N'asn_sys';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Template address relationship for defaulting data in the Request Facility Form. TM-use only', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cstmst', @level2type = N'COLUMN', @level2name = N'tmpl_adr_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Group Name', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cstmst', @level2type = N'COLUMN', @level2name = N'grp_nam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Enforce Early Delivery Rule', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cstmst', @level2type = N'COLUMN', @level2name = N'early_dlv_thresh_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Early Delivery Threashold.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cstmst', @level2type = N'COLUMN', @level2name = N'early_dlv_thresh';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Enforce Late Delivery Rule', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cstmst', @level2type = N'COLUMN', @level2name = N'late_dlv_thresh_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Late Delivery Threashold.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cstmst', @level2type = N'COLUMN', @level2name = N'late_dlv_thresh';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Allow Order Splitting?', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cstmst', @level2type = N'COLUMN', @level2name = N'ord_split_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Allow Order Line Splitting?', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cstmst', @level2type = N'COLUMN', @level2name = N'line_split_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Quantity Overship Limit.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cstmst', @level2type = N'COLUMN', @level2name = N'ovr_shp_tol';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Max Quantity Overship Percentage.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cstmst', @level2type = N'COLUMN', @level2name = N'ovr_shp_tol_pct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Quantity Undership Limit.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cstmst', @level2type = N'COLUMN', @level2name = N'und_shp_tol';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Max Quantity Undership Percentage.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cstmst', @level2type = N'COLUMN', @level2name = N'und_shp_tol_pct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Ship-date Validation Transit Service.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cstmst', @level2type = N'COLUMN', @level2name = N'transit_serv_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Allow Source Facility Overrides? ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cstmst', @level2type = N'COLUMN', @level2name = N'sf_ovr_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Undershipping Rule', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cstmst', @level2type = N'COLUMN', @level2name = N'und_shp_tol_cod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Overshipping Rule', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cstmst', @level2type = N'COLUMN', @level2name = N'ovr_shp_tol_cod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Shipment modification rule code', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cstmst', @level2type = N'COLUMN', @level2name = N'shp_mod_rule_cod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicates the system-default rule is overridden for this customer. ShipCTL use.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cstmst', @level2type = N'COLUMN', @level2name = N'shp_meas_ovr_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Entry of planned weight is required when a shipment is built by the customer.ShipCTL use.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cstmst', @level2type = N'COLUMN', @level2name = N'req_shp_wgt_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Entry of planned cube qty is required when a shipment is built by the customer.ShipCTL use.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cstmst', @level2type = N'COLUMN', @level2name = N'req_shp_cube_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Entry of planned pallet qty is required when a shipment is built by the customer.ShipCTL use.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cstmst', @level2type = N'COLUMN', @level2name = N'req_shp_pal_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Entry of planned case qty is required when a shipment is built by the customer.ShipCTL use.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cstmst', @level2type = N'COLUMN', @level2name = N'req_shp_cas_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Entry of planned misc qty is required when a shipment is built by the customer.ShipCTL use.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cstmst', @level2type = N'COLUMN', @level2name = N'req_shp_misc_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Entry of planned misc2 qty is required when a shipment is built by the customer.ShipCTL use.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cstmst', @level2type = N'COLUMN', @level2name = N'req_shp_misc2_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Single Item Pallet Flag - The flag which enforces PalletCtl to plan one item in one pallet, not to split across multiple pallets.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cstmst', @level2type = N'COLUMN', @level2name = N'sngl_prt_pal_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The first load attribute. A load attribute is a configurable field to indicate attributes of a load such as the load being wrapped.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cstmst', @level2type = N'COLUMN', @level2name = N'load_attr1_cfg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The second load attribute. A load attribute is a configurable field to indicate attributes of a load such as the load being wrapped.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cstmst', @level2type = N'COLUMN', @level2name = N'load_attr2_cfg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The third load attribute. A load attribute is a configurable field to indicate attributes of a load such as the load being wrapped.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cstmst', @level2type = N'COLUMN', @level2name = N'load_attr3_cfg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The fourth load attribute. A load attribute is a configurable field to indicate attributes of a load such as the load being wrapped.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cstmst', @level2type = N'COLUMN', @level2name = N'load_attr4_cfg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The fifth load attribute. A load attribute is a configurable field to indicate attributes of a load such as the load being wrapped.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cstmst', @level2type = N'COLUMN', @level2name = N'load_attr5_cfg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Customer Type.  If this is given, then customer requirements are taken from this customer type profile.  ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cstmst', @level2type = N'COLUMN', @level2name = N'mc_csttyp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Status Progression.  This is used as a default for this customer is such operations as allocation and work orders.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cstmst', @level2type = N'COLUMN', @level2name = N'mc_invsts_prg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Freshness Date Code.  Standard values are N or Y.  This baseically states whether or not this customer type requires freshness processing.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cstmst', @level2type = N'COLUMN', @level2name = N'mc_frscod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This states what the default miminum shelf life of the product should be for this customer.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cstmst', @level2type = N'COLUMN', @level2name = N'mc_min_shelf_hrs';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Reservation Priority', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cstmst', @level2type = N'COLUMN', @level2name = N'mc_rsvpri';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Store Type - User-definable code to group or list stores. Example: Chain store, retail store, department store, boutique', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cstmst', @level2type = N'COLUMN', @level2name = N'store_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Store Group - User-definable code to group or list stores. Example: Midwest, southeast, atlantic', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cstmst', @level2type = N'COLUMN', @level2name = N'store_grp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Concept Code - Concept code will keep track if the customer is a store', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cstmst', @level2type = N'COLUMN', @level2name = N'concept_code';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Allocation Search Path', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cstmst', @level2type = N'COLUMN', @level2name = N'alc_search_path';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Used in conjunction with XXFO-ORDER-BY-ABSOLUTE as skip logic', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cstmst', @level2type = N'COLUMN', @level2name = N'abs_ordinv_win';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Time interval for the Absolute Order Inventory Window', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cstmst', @level2type = N'COLUMN', @level2name = N'abs_ordinv_code';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Bulk Picking.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cstmst', @level2type = N'COLUMN', @level2name = N'bulk_pck_flg';

