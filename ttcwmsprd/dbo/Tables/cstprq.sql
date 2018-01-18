CREATE TABLE [dbo].[cstprq] (
    [client_id]            NVARCHAR (32)   NOT NULL,
    [cstnum]               NVARCHAR (20)   NOT NULL,
    [prtnum]               NVARCHAR (50)   NOT NULL,
    [prt_client_id]        NVARCHAR (32)   NOT NULL,
    [manfid]               NVARCHAR (10)   NULL,
    [deptno]               NVARCHAR (10)   NULL,
    [cstprt]               NVARCHAR (30)   NULL,
    [untcas]               INT             NOT NULL,
    [untpak]               INT             NOT NULL,
    [untpal]               INT             NOT NULL,
    [pal_thresh_pct]       INT             NULL,
    [tag_flg]              INT             NULL,
    [mc_min_shelf_hrs]     INT             NULL,
    [mc_frscod]            NVARCHAR (1)    NULL,
    [early_dlv_thresh]     INT             NULL,
    [late_dlv_thresh]      INT             NULL,
    [line_split_flg]       INT             NULL,
    [ovr_shp_tol]          NUMERIC (19, 4) NULL,
    [ovr_shp_tol_pct]      INT             NULL,
    [und_shp_tol]          NUMERIC (19, 4) NULL,
    [und_shp_tol_pct]      INT             NULL,
    [sf_ovr_flg]           INT             NULL,
    [early_dlv_thresh_flg] INT             NULL,
    [late_dlv_thresh_flg]  INT             NULL,
    [und_shp_tol_cod]      NVARCHAR (40)   NULL,
    [ovr_shp_tol_cod]      NVARCHAR (40)   NULL,
    [abs_ordinv_win]       INT             NULL,
    [abs_ordinv_code]      NVARCHAR (4)    NULL,
    [u_version]            INT             NULL,
    [ins_dt]               DATETIME        NULL,
    [last_upd_dt]          DATETIME        NULL,
    [ins_user_id]          NVARCHAR (40)   NULL,
    [last_upd_user_id]     NVARCHAR (40)   NULL,
    CONSTRAINT [cstprq_pk] PRIMARY KEY CLUSTERED ([cstnum] ASC, [prtnum] ASC, [prt_client_id] ASC, [client_id] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [cstprq_edtfck] CHECK ([early_dlv_thresh_flg]=(0) OR [early_dlv_thresh_flg]=(1)),
    CONSTRAINT [cstprq_ldtfck] CHECK ([late_dlv_thresh_flg]=(0) OR [late_dlv_thresh_flg]=(1)),
    CONSTRAINT [cstprq_lsflgck] CHECK ([line_split_flg]=(0) OR [line_split_flg]=(1)),
    CONSTRAINT [cstprq_sfoflgck] CHECK ([sf_ovr_flg]=(0) OR [sf_ovr_flg]=(1)),
    CONSTRAINT [cstprq_tag_flg_ck] CHECK ([tag_flg]=(0) OR [tag_flg]=(1))
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The customer Item Requirement table is used to represent required Item for customer in the system. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cstprq';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Client Id ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cstprq', @level2type = N'COLUMN', @level2name = N'client_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Customer Number ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cstprq', @level2type = N'COLUMN', @level2name = N'cstnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Item Number ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cstprq', @level2type = N'COLUMN', @level2name = N'prtnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Item Client ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cstprq', @level2type = N'COLUMN', @level2name = N'prt_client_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Manufacturer ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cstprq', @level2type = N'COLUMN', @level2name = N'manfid';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Department Number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cstprq', @level2type = N'COLUMN', @level2name = N'deptno';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Customer Item Number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cstprq', @level2type = N'COLUMN', @level2name = N'cstprt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Unit Per Case', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cstprq', @level2type = N'COLUMN', @level2name = N'untcas';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Unit Per Pack', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cstprq', @level2type = N'COLUMN', @level2name = N'untpak';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Unit Per Pallet', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cstprq', @level2type = N'COLUMN', @level2name = N'untpal';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Pallet Threshold Percentage', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cstprq', @level2type = N'COLUMN', @level2name = N'pal_thresh_pct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Tag Required Flag - Indicates whether this item should be tagged to the customer', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cstprq', @level2type = N'COLUMN', @level2name = N'tag_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This states what the default miminum shelf life of the product should be for this customer.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cstprq', @level2type = N'COLUMN', @level2name = N'mc_min_shelf_hrs';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Freshness Date Code.  Standard values are N or Y.  This basically states whether or not this customer type requires freshness processing.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cstprq', @level2type = N'COLUMN', @level2name = N'mc_frscod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Early Delivery Threashold.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cstprq', @level2type = N'COLUMN', @level2name = N'early_dlv_thresh';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Late Delivery Threashold.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cstprq', @level2type = N'COLUMN', @level2name = N'late_dlv_thresh';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Allow Order Line Splitting?', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cstprq', @level2type = N'COLUMN', @level2name = N'line_split_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Quantity Overship Limit.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cstprq', @level2type = N'COLUMN', @level2name = N'ovr_shp_tol';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Max Quantity Overship Percentage.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cstprq', @level2type = N'COLUMN', @level2name = N'ovr_shp_tol_pct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Quantity Undership Limit.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cstprq', @level2type = N'COLUMN', @level2name = N'und_shp_tol';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Max Quantity Undership Percentage.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cstprq', @level2type = N'COLUMN', @level2name = N'und_shp_tol_pct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Allow Source Facility Overrides?', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cstprq', @level2type = N'COLUMN', @level2name = N'sf_ovr_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Enforce Early Delivery Rule', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cstprq', @level2type = N'COLUMN', @level2name = N'early_dlv_thresh_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Enforce Late Delivery Rule', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cstprq', @level2type = N'COLUMN', @level2name = N'late_dlv_thresh_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Undershipping Rule', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cstprq', @level2type = N'COLUMN', @level2name = N'und_shp_tol_cod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Overshipping Rule', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cstprq', @level2type = N'COLUMN', @level2name = N'ovr_shp_tol_cod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Used in conjunction with XXFO-ORDER-BY-ABSOLUTE as skip logic', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cstprq', @level2type = N'COLUMN', @level2name = N'abs_ordinv_win';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Time interval for the Absolute Order Inventory Window', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cstprq', @level2type = N'COLUMN', @level2name = N'abs_ordinv_code';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The version number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cstprq', @level2type = N'COLUMN', @level2name = N'u_version';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was inserted', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cstprq', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was last updated', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cstprq', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who created the row', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cstprq', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cstprq', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

