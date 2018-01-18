CREATE TABLE [dbo].[trlr_plan_line] (
    [trlr_plan_id]      INT             NOT NULL,
    [trlr_plan_line_id] INT             NOT NULL,
    [packing_id]        NVARCHAR (16)   NULL,
    [pack_pos_num]      NUMERIC (19, 4) NULL,
    [seq_num]           NUMERIC (19, 4) NULL,
    [layer_num]         NUMERIC (19, 4) NULL,
    [pack_pos_typ]      NVARCHAR (1)    NULL,
    [material_num]      NVARCHAR (30)   NULL,
    [qty]               NUMERIC (19, 4) NULL,
    [basis_unit]        NVARCHAR (3)    NULL,
    [lgth]              NUMERIC (19, 4) NULL,
    [wid]               NUMERIC (19, 4) NULL,
    [hgt]               NUMERIC (19, 4) NULL,
    [dim_uom]           NVARCHAR (3)    NULL,
    [wgt]               NUMERIC (19, 4) NULL,
    [wgt_uom]           NVARCHAR (3)    NULL,
    [vol]               NUMERIC (19, 4) NULL,
    [vol_uom]           NVARCHAR (3)    NULL,
    [orientation]       NVARCHAR (1)    NULL,
    [delivery_num]      NVARCHAR (30)   NULL,
    [delivery_pos_num]  NVARCHAR (6)    NULL,
    [pack_id]           NVARCHAR (16)   NULL,
    [qty_factor]        NUMERIC (19, 4) NULL,
    [pallet_pos_pctl]   NVARCHAR (4)    NULL,
    [pallet_num_pctl]   NVARCHAR (4)    NULL,
    [pallet_id_pctl]    NVARCHAR (20)   NULL,
    [orig_cart_id]      NVARCHAR (18)   NULL,
    [alloc_num]         NVARCHAR (15)   NULL,
    [work_req_id]       NVARCHAR (5)    NULL,
    [picked_lpn]        NVARCHAR (30)   NULL,
    [sngl_prt_pal_flg]  INT             NULL,
    [ins_dt]            DATETIME        NULL,
    [last_upd_dt]       DATETIME        NULL,
    [ins_user_id]       NVARCHAR (40)   NULL,
    [last_upd_user_id]  NVARCHAR (40)   NULL,
    CONSTRAINT [trlr_plan_line_pk] PRIMARY KEY CLUSTERED ([trlr_plan_id] ASC, [trlr_plan_line_id] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [trplnl_sprtck] CHECK ([sngl_prt_pal_flg]=(0) OR [sngl_prt_pal_flg]=(1))
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The Trailer Plan Line table is used to store the Load Plan Detail.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'trlr_plan_line';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Trailer Plan Id - System generated identifier used to identify the Trailer Plan.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'trlr_plan_line', @level2type = N'COLUMN', @level2name = N'trlr_plan_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Trailer Plan Line Id - System generated identifier used to identify the Trailer Plan Line.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'trlr_plan_line', @level2type = N'COLUMN', @level2name = N'trlr_plan_line_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Unique Id for packaging position returned by PalletCtl.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'trlr_plan_line', @level2type = N'COLUMN', @level2name = N'packing_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Packaging Position Number returned by PalletCtl.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'trlr_plan_line', @level2type = N'COLUMN', @level2name = N'pack_pos_num';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Reversal of Stop sequence for loading FILO returned by PalletCtl.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'trlr_plan_line', @level2type = N'COLUMN', @level2name = N'seq_num';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Layer Number returned by PalletCtl.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'trlr_plan_line', @level2type = N'COLUMN', @level2name = N'layer_num';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Packaging Position Type (Container/Pallet/Carton) returned by PalletCtl.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'trlr_plan_line', @level2type = N'COLUMN', @level2name = N'pack_pos_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Stock Code returned by PalletCtl.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'trlr_plan_line', @level2type = N'COLUMN', @level2name = N'material_num';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Load Quantity returned by PalletCtl.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'trlr_plan_line', @level2type = N'COLUMN', @level2name = N'qty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Basis Unit returned by PalletCtl.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'trlr_plan_line', @level2type = N'COLUMN', @level2name = N'basis_unit';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Length of Packaging Position returned by PalletCtl.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'trlr_plan_line', @level2type = N'COLUMN', @level2name = N'lgth';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Width of Packaging Position returned by PalletCtl.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'trlr_plan_line', @level2type = N'COLUMN', @level2name = N'wid';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Height of Packaging Position returned by PalletCtl.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'trlr_plan_line', @level2type = N'COLUMN', @level2name = N'hgt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'UOM for Dimensions returned by PalletCtl.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'trlr_plan_line', @level2type = N'COLUMN', @level2name = N'dim_uom';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Weight of Packaging Positions returned by PalletCtl.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'trlr_plan_line', @level2type = N'COLUMN', @level2name = N'wgt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'UOM of Weight returned by PalletCtl.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'trlr_plan_line', @level2type = N'COLUMN', @level2name = N'wgt_uom';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Volume of Packaging Positions returned by PalletCtl.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'trlr_plan_line', @level2type = N'COLUMN', @level2name = N'vol';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'UOM of Volume returned by PalletCtl.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'trlr_plan_line', @level2type = N'COLUMN', @level2name = N'vol_uom';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Pallet Orientation (N=Narrow, W=Wide) returned by PalletCtl.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'trlr_plan_line', @level2type = N'COLUMN', @level2name = N'orientation';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Delivery Number returned by PalletCtl.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'trlr_plan_line', @level2type = N'COLUMN', @level2name = N'delivery_num';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Delivery Position Number returned by PalletCtl.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'trlr_plan_line', @level2type = N'COLUMN', @level2name = N'delivery_pos_num';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Packaging Header Id for this Position returned by PalletCtl.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'trlr_plan_line', @level2type = N'COLUMN', @level2name = N'pack_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Quantity Factor.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'trlr_plan_line', @level2type = N'COLUMN', @level2name = N'qty_factor';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Position of the Pallet returned by PalletCtl.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'trlr_plan_line', @level2type = N'COLUMN', @level2name = N'pallet_pos_pctl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Stack Level within Position of Pallet returned by PalletCtl.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'trlr_plan_line', @level2type = N'COLUMN', @level2name = N'pallet_num_pctl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Pallet Id returned by PalletCtl.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'trlr_plan_line', @level2type = N'COLUMN', @level2name = N'pallet_id_pctl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Original Carton Id returned by PalletCtl.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'trlr_plan_line', @level2type = N'COLUMN', @level2name = N'orig_cart_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Allocation Number from WMS returned by PalletCtl.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'trlr_plan_line', @level2type = N'COLUMN', @level2name = N'alloc_num';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Work Request Id in WMS.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'trlr_plan_line', @level2type = N'COLUMN', @level2name = N'work_req_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'LPN of the pick.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'trlr_plan_line', @level2type = N'COLUMN', @level2name = N'picked_lpn';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Single Item on a Pallet Flag.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'trlr_plan_line', @level2type = N'COLUMN', @level2name = N'sngl_prt_pal_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was inserted.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'trlr_plan_line', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was last updated.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'trlr_plan_line', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who created the row.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'trlr_plan_line', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'trlr_plan_line', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

