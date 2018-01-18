CREATE TABLE [dbo].[trlr_plan] (
    [trlr_plan_id]       INT             NOT NULL,
    [pallet_id_pctl]     NVARCHAR (20)   NOT NULL,
    [wh_id]              NVARCHAR (32)   NOT NULL,
    [trlr_id]            NVARCHAR (20)   NOT NULL,
    [car_move_id]        NVARCHAR (10)   NOT NULL,
    [veh_num]            NVARCHAR (10)   NULL,
    [act_load_flg]       INT             NULL,
    [pack_id]            NVARCHAR (16)   NULL,
    [pack_typ]           NVARCHAR (1)    NULL,
    [load_lgth]          NUMERIC (19, 4) NULL,
    [load_wid]           NUMERIC (19, 4) NULL,
    [load_hgt]           NUMERIC (19, 4) NULL,
    [load_dim_uom]       NVARCHAR (3)    NULL,
    [load_wgt]           NUMERIC (19, 4) NULL,
    [load_wgt_uom]       NVARCHAR (3)    NULL,
    [load_vol]           NUMERIC (19, 4) NULL,
    [load_vol_uom]       NVARCHAR (3)    NULL,
    [cont_type]          NVARCHAR (3)    NULL,
    [cont_id]            NVARCHAR (10)   NULL,
    [wgt_util]           NUMERIC (19, 4) NULL,
    [vol_util]           NUMERIC (19, 4) NULL,
    [mat_qty]            INT             NULL,
    [pick_qty]           INT             NULL,
    [sep_qty]            INT             NULL,
    [lay_qty]            INT             NULL,
    [lay_ptnl]           NUMERIC (19, 4) NULL,
    [pick_path]          NUMERIC (19, 4) NULL,
    [pick_path_uom]      NVARCHAR (3)    NULL,
    [pick_time]          NUMERIC (19, 4) NULL,
    [pick_time_uom]      NVARCHAR (3)    NULL,
    [front_axle_wgt]     NUMERIC (19, 4) NULL,
    [back_axle_wgt]      NUMERIC (19, 4) NULL,
    [axle_wgt_uom]       NVARCHAR (3)    NULL,
    [package_typ]        NVARCHAR (1)    NULL,
    [dg_flg]             INT             NULL,
    [vso_id]             NVARCHAR (4)    NULL,
    [open_floor_spots]   INT             NULL,
    [floor_spot_util1]   NUMERIC (19, 4) NULL,
    [floor_spot_util2]   NUMERIC (19, 4) NULL,
    [max_flr_spots]      INT             NULL,
    [max_flr_spots_calc] INT             NULL,
    [block_id]           INT             NULL,
    [pallet_pos_pctl]    NVARCHAR (4)    NULL,
    [pallet_num_pctl]    NVARCHAR (4)    NULL,
    [min_trlr_axle_pos]  NUMERIC (19, 4) NULL,
    [max_trlr_axle_pos]  NUMERIC (19, 4) NULL,
    [front_axle_pos]     NUMERIC (19, 4) NULL,
    [orientation_pctl]   NVARCHAR (1)    NULL,
    [pallet_class]       NVARCHAR (20)   NULL,
    [pallet_pos_ovr_flg] INT             NULL,
    [pallet_pos_ovr_cod] NVARCHAR (20)   NULL,
    [ins_dt]             DATETIME        NULL,
    [last_upd_dt]        DATETIME        NULL,
    [ins_user_id]        NVARCHAR (40)   NULL,
    [last_upd_user_id]   NVARCHAR (40)   NULL,
    CONSTRAINT [trlr_plan_pk] PRIMARY KEY CLUSTERED ([trlr_plan_id] ASC, [wh_id] ASC, [pallet_id_pctl] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [trpln_actloadck] CHECK ([act_load_flg]=(0) OR [act_load_flg]=(1)),
    CONSTRAINT [trpln_dgck] CHECK ([dg_flg]=(0) OR [dg_flg]=(1)),
    CONSTRAINT [trpln_plposck] CHECK ([pallet_pos_ovr_flg]=(0) OR [pallet_pos_ovr_flg]=(1))
);


GO
CREATE NONCLUSTERED INDEX [trlr_plan_trlrid]
    ON [dbo].[trlr_plan]([trlr_id] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [trlr_plan_carmov]
    ON [dbo].[trlr_plan]([car_move_id] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [trlr_plan_insdt]
    ON [dbo].[trlr_plan]([ins_dt] ASC) WITH (FILLFACTOR = 90);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The Trailer Plan table is used to store the header for the Trailer Load Plan when it is received from PalletCtl. This header will be used to retrieve the Load Plan for reporting or display purposes.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'trlr_plan';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Load Plan Id - System generated identifier used to identify the Load Plan received from PalletCtl.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'trlr_plan', @level2type = N'COLUMN', @level2name = N'trlr_plan_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Pallet Id returned by PalletCtl.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'trlr_plan', @level2type = N'COLUMN', @level2name = N'pallet_id_pctl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warehouse Identifier.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'trlr_plan', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Trailer Id - Identifier of the Trailer in the trlr table.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'trlr_plan', @level2type = N'COLUMN', @level2name = N'trlr_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Carrier Move Id - Identifier for the Carrier Move.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'trlr_plan', @level2type = N'COLUMN', @level2name = N'car_move_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Vehicle Number - Vehicle Number returned by PalletCtl.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'trlr_plan', @level2type = N'COLUMN', @level2name = N'veh_num';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Actual Load Flag - True if this is the how the trailer was actually loaded.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'trlr_plan', @level2type = N'COLUMN', @level2name = N'act_load_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Packaging Header Id returned by PalletCtl.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'trlr_plan', @level2type = N'COLUMN', @level2name = N'pack_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicator if header is root node which is returned by PalletCtl.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'trlr_plan', @level2type = N'COLUMN', @level2name = N'pack_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Calculated Load Length of Trailer/Container returned by PalletCtl.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'trlr_plan', @level2type = N'COLUMN', @level2name = N'load_lgth';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Calculated Load Width of Trailer/Container returned by PalletCtl.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'trlr_plan', @level2type = N'COLUMN', @level2name = N'load_wid';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Calculated Load Height of Trailer/Container returned by PalletCtl.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'trlr_plan', @level2type = N'COLUMN', @level2name = N'load_hgt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'UOM for Load Dimension returned by PalletCtl.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'trlr_plan', @level2type = N'COLUMN', @level2name = N'load_dim_uom';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Calculated Weight of Trailer/Container returned by PalletCtl.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'trlr_plan', @level2type = N'COLUMN', @level2name = N'load_wgt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Load Weight UOM returned by PalletCtl.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'trlr_plan', @level2type = N'COLUMN', @level2name = N'load_wgt_uom';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Calculated Total Volume of Orders returned by PalletCtl.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'trlr_plan', @level2type = N'COLUMN', @level2name = N'load_vol';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'UOM for Load Volume returned by PalletCtl.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'trlr_plan', @level2type = N'COLUMN', @level2name = N'load_vol_uom';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Container/trailer type returned by PalletCtl.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'trlr_plan', @level2type = N'COLUMN', @level2name = N'cont_type';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Unique Id of container/trailer returned by PalletCtl.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'trlr_plan', @level2type = N'COLUMN', @level2name = N'cont_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Percentage used of theoretical max payload for this container returned by PalletCtl.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'trlr_plan', @level2type = N'COLUMN', @level2name = N'wgt_util';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Percentage used of theoretical max cube for this container returned by PalletCtl.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'trlr_plan', @level2type = N'COLUMN', @level2name = N'vol_util';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Actual number of cases loaded/calculated per stack returned by PalletCtl.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'trlr_plan', @level2type = N'COLUMN', @level2name = N'mat_qty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Pick Quantity returned by PalletCtl.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'trlr_plan', @level2type = N'COLUMN', @level2name = N'pick_qty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Separation Quantity returned by PalletCtl.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'trlr_plan', @level2type = N'COLUMN', @level2name = N'sep_qty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Layer Quantity returned by PalletCtl.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'trlr_plan', @level2type = N'COLUMN', @level2name = N'lay_qty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Layer Potential returned by PalletCtl.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'trlr_plan', @level2type = N'COLUMN', @level2name = N'lay_ptnl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'path of picker returned by PalletCtl.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'trlr_plan', @level2type = N'COLUMN', @level2name = N'pick_path';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'UOM of Path of Picker returned by PalletCtl.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'trlr_plan', @level2type = N'COLUMN', @level2name = N'pick_path_uom';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Time of Picker returned by PalletCtl.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'trlr_plan', @level2type = N'COLUMN', @level2name = N'pick_time';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'UOM of Time of Picker returned by PalletCtl.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'trlr_plan', @level2type = N'COLUMN', @level2name = N'pick_time_uom';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Weight on Front Axle returned by PalletCtl.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'trlr_plan', @level2type = N'COLUMN', @level2name = N'front_axle_wgt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Weight on Back Axle returned by PalletCtl.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'trlr_plan', @level2type = N'COLUMN', @level2name = N'back_axle_wgt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'UOM of Axle Weight returned by PalletCtl.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'trlr_plan', @level2type = N'COLUMN', @level2name = N'axle_wgt_uom';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Package Type (blank=empty,F=Original Pallet,P=Mixed Pallet) returned by PalletCtl.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'trlr_plan', @level2type = N'COLUMN', @level2name = N'package_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Dangerous Goods Flag returned by PalletCtl.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'trlr_plan', @level2type = N'COLUMN', @level2name = N'dg_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Individual Package Id returned by PalletCtl.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'trlr_plan', @level2type = N'COLUMN', @level2name = N'vso_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Number of unused Floor Spots returned by PalletCtl.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'trlr_plan', @level2type = N'COLUMN', @level2name = N'open_floor_spots';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Percentage of Floor Spot Utilization returned by PalletCtl.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'trlr_plan', @level2type = N'COLUMN', @level2name = N'floor_spot_util1';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Floor Spot Utilization Calculation returned by PalletCtl.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'trlr_plan', @level2type = N'COLUMN', @level2name = N'floor_spot_util2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Maximum Floor Spots returned by PalletCtl.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'trlr_plan', @level2type = N'COLUMN', @level2name = N'max_flr_spots';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Maximum Floor Spots Calculated returned by PalletCtl.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'trlr_plan', @level2type = N'COLUMN', @level2name = N'max_flr_spots_calc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Block Id Inside Stow Plan returned by PalletCtl.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'trlr_plan', @level2type = N'COLUMN', @level2name = N'block_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Position of the Pallet returned by PalletCtl.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'trlr_plan', @level2type = N'COLUMN', @level2name = N'pallet_pos_pctl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Stack Level within Position of Pallet returned by PalletCtl.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'trlr_plan', @level2type = N'COLUMN', @level2name = N'pallet_num_pctl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Minimum Trailer Axle Position - The front most position (distance from the nose of trailer to center of the axles) that the trailer axle can be placed without an axle weight violation. This value is calculated and sent by PalletCtl.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'trlr_plan', @level2type = N'COLUMN', @level2name = N'min_trlr_axle_pos';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Maximum Trailer Axle Position - The rear most position (distance from nose of trailer to center of axles) that the trailer axle can be placed without an axle weight violation. This value is calculated and sent by PalletCtl.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'trlr_plan', @level2type = N'COLUMN', @level2name = N'max_trlr_axle_pos';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Front Axle Position - Distance from the nose of trailer to kingpin. This value is calculated and sent by PalletCtl.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'trlr_plan', @level2type = N'COLUMN', @level2name = N'front_axle_pos';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Pallet Orientation (N=Narrow, W=Wide) returned by PalletCtl.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'trlr_plan', @level2type = N'COLUMN', @level2name = N'orientation_pctl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Pallet Classification - Classification of pallet for relation, stackability weight and dimensions returned by PalletCtl.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'trlr_plan', @level2type = N'COLUMN', @level2name = N'pallet_class';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Pallet Position Override Flag - Flag to indicate the position planned by PalletCtl was overridden.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'trlr_plan', @level2type = N'COLUMN', @level2name = N'pallet_pos_ovr_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Pallet Position Override Code - Reason Code why planned position was overridden.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'trlr_plan', @level2type = N'COLUMN', @level2name = N'pallet_pos_ovr_cod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was inserted', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'trlr_plan', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was last updated', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'trlr_plan', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who created the row', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'trlr_plan', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'trlr_plan', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

