CREATE TABLE [dbo].[csttyp_pfl] (
    [csttyp]               NVARCHAR (4)    NOT NULL,
    [frscod]               NVARCHAR (1)    NULL,
    [min_shelf_hrs]        INT             NULL,
    [invsts_prg]           NVARCHAR (4)    NULL,
    [shplbl]               NVARCHAR (20)   NULL,
    [shipby]               NVARCHAR (10)   NULL,
    [cargrp]               NVARCHAR (10)   NULL,
    [manfid]               NVARCHAR (10)   NULL,
    [deptno]               NVARCHAR (10)   NULL,
    [ordinv]               NVARCHAR (30)   NULL,
    [rsvpri]               NVARCHAR (1)    NULL,
    [requir_tms_cod]       NVARCHAR (1)    NULL,
    [pltbld_consby]        NVARCHAR (20)   NULL,
    [lod_tag_sngle_encode] NVARCHAR (40)   NULL,
    [lod_tag_mix_encode]   NVARCHAR (40)   NULL,
    [sub_tag_sngle_encode] NVARCHAR (40)   NULL,
    [sub_tag_mix_encode]   NVARCHAR (40)   NULL,
    [urn_format]           NVARCHAR (40)   NULL,
    [grp_nam]              NVARCHAR (40)   NULL,
    [early_dlv_thresh]     INT             NULL,
    [late_dlv_thresh]      INT             NULL,
    [ord_split_flg]        INT             NULL,
    [line_split_flg]       INT             NULL,
    [ovr_shp_tol]          NUMERIC (19, 4) NULL,
    [ovr_shp_tol_pct]      INT             NULL,
    [und_shp_tol]          NUMERIC (19, 4) NULL,
    [und_shp_tol_pct]      INT             NULL,
    [transit_serv_id]      NVARCHAR (20)   NULL,
    [sf_ovr_flg]           INT             NULL,
    [early_dlv_thresh_flg] INT             NULL,
    [load_attr1_cfg]       NVARCHAR (1)    NULL,
    [load_attr2_cfg]       NVARCHAR (1)    NULL,
    [load_attr3_cfg]       NVARCHAR (1)    NULL,
    [load_attr4_cfg]       NVARCHAR (1)    NULL,
    [load_attr5_cfg]       NVARCHAR (1)    NULL,
    [late_dlv_thresh_flg]  INT             NULL,
    [und_shp_tol_cod]      NVARCHAR (40)   NULL,
    [ovr_shp_tol_cod]      NVARCHAR (40)   NULL,
    [shp_mod_rule_cod]     NVARCHAR (40)   NULL,
    [u_version]            INT             NULL,
    [ins_dt]               DATETIME        NULL,
    [last_upd_dt]          DATETIME        NULL,
    [ins_user_id]          NVARCHAR (40)   NULL,
    [last_upd_user_id]     NVARCHAR (40)   NULL,
    [alc_search_path]      NVARCHAR (20)   NULL,
    [abs_ordinv_win]       INT             NULL,
    [abs_ordinv_code]      NVARCHAR (4)    NULL,
    [bulk_pck_flg]         INT             DEFAULT ((1)) NOT NULL,
    CONSTRAINT [csttyp_pfl_pk] PRIMARY KEY CLUSTERED ([csttyp] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [csttyp_pfl_bulkpckflgck] CHECK ([bulk_pck_flg]=(0) OR [bulk_pck_flg]=(1)),
    CONSTRAINT [ctp_edtfck] CHECK ([early_dlv_thresh_flg]=(0) OR [early_dlv_thresh_flg]=(1)),
    CONSTRAINT [ctp_ldtfck] CHECK ([late_dlv_thresh_flg]=(0) OR [late_dlv_thresh_flg]=(1)),
    CONSTRAINT [ctp_lsflgck] CHECK ([line_split_flg]=(0) OR [line_split_flg]=(1)),
    CONSTRAINT [ctp_osflgck] CHECK ([ord_split_flg]=(0) OR [ord_split_flg]=(1)),
    CONSTRAINT [ctp_sfoflgck] CHECK ([sf_ovr_flg]=(0) OR [sf_ovr_flg]=(1))
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Customer Type Profiles. Allows the system to set requirements for a group of customers.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'csttyp_pfl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Freshness Date Code.  Does this customer require freshness processing?  Standard values are Y and N.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'csttyp_pfl', @level2type = N'COLUMN', @level2name = N'frscod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Minimum Shelf Life in hours.  Specifies the default minimum shelf life required for product for this customer type.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'csttyp_pfl', @level2type = N'COLUMN', @level2name = N'min_shelf_hrs';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Status Progression name.  Specifies the default inventory status progression for this customer type during such actions as allocation and work orders.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'csttyp_pfl', @level2type = N'COLUMN', @level2name = N'invsts_prg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Shipment Label.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'csttyp_pfl', @level2type = N'COLUMN', @level2name = N'shplbl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Ship By.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'csttyp_pfl', @level2type = N'COLUMN', @level2name = N'shipby';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Carrier Group.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'csttyp_pfl', @level2type = N'COLUMN', @level2name = N'cargrp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Manifest ID.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'csttyp_pfl', @level2type = N'COLUMN', @level2name = N'manfid';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Department Number.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'csttyp_pfl', @level2type = N'COLUMN', @level2name = N'deptno';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Order Inventory.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'csttyp_pfl', @level2type = N'COLUMN', @level2name = N'ordinv';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Reservation Priority', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'csttyp_pfl', @level2type = N'COLUMN', @level2name = N'rsvpri';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Required TMS', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'csttyp_pfl', @level2type = N'COLUMN', @level2name = N'requir_tms_cod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicates how pallet building is consolidated for this customer profile.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'csttyp_pfl', @level2type = N'COLUMN', @level2name = N'pltbld_consby';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The tag encoding to use for a single item full pallet', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'csttyp_pfl', @level2type = N'COLUMN', @level2name = N'lod_tag_sngle_encode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The tag encoding to user for a mixed or partial pallet', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'csttyp_pfl', @level2type = N'COLUMN', @level2name = N'lod_tag_mix_encode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The tag encoding to use for a single item full carton', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'csttyp_pfl', @level2type = N'COLUMN', @level2name = N'sub_tag_sngle_encode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The tag encoding to user for a mixed or partial carton', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'csttyp_pfl', @level2type = N'COLUMN', @level2name = N'sub_tag_mix_encode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The URN format to be used when communicating with customer', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'csttyp_pfl', @level2type = N'COLUMN', @level2name = N'urn_format';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Group Name.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'csttyp_pfl', @level2type = N'COLUMN', @level2name = N'grp_nam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Early Delivery Threashold.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'csttyp_pfl', @level2type = N'COLUMN', @level2name = N'early_dlv_thresh';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Late Delivery Threashold.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'csttyp_pfl', @level2type = N'COLUMN', @level2name = N'late_dlv_thresh';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Allow Order Splitting?', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'csttyp_pfl', @level2type = N'COLUMN', @level2name = N'ord_split_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Allow Order Line Splitting?', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'csttyp_pfl', @level2type = N'COLUMN', @level2name = N'line_split_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Quantity Overship Limit.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'csttyp_pfl', @level2type = N'COLUMN', @level2name = N'ovr_shp_tol';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Max Quantity Overship Percentage.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'csttyp_pfl', @level2type = N'COLUMN', @level2name = N'ovr_shp_tol_pct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Quantity Undership Limit.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'csttyp_pfl', @level2type = N'COLUMN', @level2name = N'und_shp_tol';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Max Quantity Undership Percentage.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'csttyp_pfl', @level2type = N'COLUMN', @level2name = N'und_shp_tol_pct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Ship-date Validation Transit Service.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'csttyp_pfl', @level2type = N'COLUMN', @level2name = N'transit_serv_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Allow Source Facility Overrides? ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'csttyp_pfl', @level2type = N'COLUMN', @level2name = N'sf_ovr_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Enforce Early Delivery Rule', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'csttyp_pfl', @level2type = N'COLUMN', @level2name = N'early_dlv_thresh_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The first load attribute. A load attribute is a configurable field to indicate attributes of a load such as the load being wrapped.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'csttyp_pfl', @level2type = N'COLUMN', @level2name = N'load_attr1_cfg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The second load attribute. A load attribute is a configurable field to indicate attributes of a load such as the load being wrapped.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'csttyp_pfl', @level2type = N'COLUMN', @level2name = N'load_attr2_cfg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The third load attribute. A load attribute is a configurable field to indicate attributes of a load such as the load being wrapped.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'csttyp_pfl', @level2type = N'COLUMN', @level2name = N'load_attr3_cfg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The fourth load attribute. A load attribute is a configurable field to indicate attributes of a load such as the load being wrapped.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'csttyp_pfl', @level2type = N'COLUMN', @level2name = N'load_attr4_cfg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The fifth load attribute. A load attribute is a configurable field to indicate attributes of a load such as the load being wrapped.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'csttyp_pfl', @level2type = N'COLUMN', @level2name = N'load_attr5_cfg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Enforce Late Delivery Rule', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'csttyp_pfl', @level2type = N'COLUMN', @level2name = N'late_dlv_thresh_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Undershipping Rule', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'csttyp_pfl', @level2type = N'COLUMN', @level2name = N'und_shp_tol_cod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Overshipping Rule', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'csttyp_pfl', @level2type = N'COLUMN', @level2name = N'ovr_shp_tol_cod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Shipment modification rule code', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'csttyp_pfl', @level2type = N'COLUMN', @level2name = N'shp_mod_rule_cod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The version number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'csttyp_pfl', @level2type = N'COLUMN', @level2name = N'u_version';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was inserted', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'csttyp_pfl', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was last updated', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'csttyp_pfl', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who created the row', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'csttyp_pfl', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'csttyp_pfl', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Allocation Search Path', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'csttyp_pfl', @level2type = N'COLUMN', @level2name = N'alc_search_path';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Used in conjunction with XXFO-ORDER-BY-ABSOLUTE as skip logic', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'csttyp_pfl', @level2type = N'COLUMN', @level2name = N'abs_ordinv_win';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Time interval for the Absolute Order Inventory Window', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'csttyp_pfl', @level2type = N'COLUMN', @level2name = N'abs_ordinv_code';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Bulk Picking. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'csttyp_pfl', @level2type = N'COLUMN', @level2name = N'bulk_pck_flg';

