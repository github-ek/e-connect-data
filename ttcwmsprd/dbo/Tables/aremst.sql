CREATE TABLE [dbo].[aremst] (
    [arecod]             NVARCHAR (10)   NOT NULL,
    [wh_id]              NVARCHAR (32)   NOT NULL,
    [bldg_id]            NVARCHAR (10)   NOT NULL,
    [sigflg]             INT             NULL,
    [pckcod]             NVARCHAR (1)    NULL,
    [conflg]             INT             NULL,
    [loccod]             NVARCHAR (1)    NULL,
    [fifflg]             INT             NULL,
    [lodflg]             INT             NULL,
    [subflg]             INT             NULL,
    [dtlflg]             INT             NULL,
    [praflg]             INT             NULL,
    [expflg]             INT             NULL,
    [rcv_dck_flg]        INT             NULL,
    [adjflg]             INT             NULL,
    [stgflg]             INT             NULL,
    [shpflg]             INT             NULL,
    [wipflg]             INT             NULL,
    [fwiflg]             INT             NULL,
    [cntflg]             INT             NULL,
    [lpncntflg]          INT             NULL,
    [lpncnt_area_lodlvl] NVARCHAR (1)    NULL,
    [xdaflg]             INT             DEFAULT ((0)) NULL,
    [icnflg]             INT             NULL,
    [prd_stgflg]         INT             DEFAULT ((0)) NOT NULL,
    [wip_supflg]         INT             NULL,
    [wip_expflg]         INT             NULL,
    [pdflg]              INT             NULL,
    [shp_dck_flg]        INT             NULL,
    [yrdflg]             INT             NULL,
    [rnwl_sto_flg]       INT             NULL,
    [cnzcod]             NVARCHAR (4)    NOT NULL,
    [cnzamt]             NUMERIC (19, 4) NULL,
    [def_rplcfg_invsts]  NVARCHAR (4)    NULL,
    [def_rplcfg_pctflg]  INT             NULL,
    [def_rplcfg_maxunt]  INT             NULL,
    [def_rplcfg_minunt]  INT             NULL,
    [stoare_flg]         INT             NOT NULL,
    [ctngrp]             NVARCHAR (10)   NULL,
    [rdtflg]             INT             NULL,
    [autclr_prcare]      INT             NULL,
    [rcv_stgflg]         INT             NULL,
    [prod_flg]           INT             NULL,
    [put_to_sto_flg]     INT             DEFAULT ((0)) NOT NULL,
    [pck_to_sto_flg]     INT             DEFAULT ((0)) NOT NULL,
    [recalc_putaway]     INT             NULL,
    [lost_loc]           NVARCHAR (20)   NULL,
    [lbl_on_split]       INT             NULL,
    [split_trn]          INT             NULL,
    [con_pal_flg]        INT             DEFAULT ((0)) NULL,
    [share_loc_flg]      INT             DEFAULT ((0)) NULL,
    [pck_steal_flg]      INT             DEFAULT ((1)) NULL,
    [pck_exp_are]        NVARCHAR (10)   NULL,
    [pck_dpst_are]       NVARCHAR (10)   NULL,
    [sto_trlr_flg]       INT             DEFAULT ((0)) NULL,
    [bto_kit_dep_flg]    INT             DEFAULT ((0)) NOT NULL,
    [shp_stg_ovrd_flg]   INT             DEFAULT ((0)) NOT NULL,
    [ftl_flg]            INT             DEFAULT ((0)) NOT NULL,
    [prox_put_cod]       NVARCHAR (5)    NULL,
    [start_pal_flg]      INT             DEFAULT ((0)) NOT NULL,
    [dyn_slot_flg]       INT             DEFAULT ((0)) NOT NULL,
    [dispatch_flg]       INT             DEFAULT ((0)) NOT NULL,
    [dstr_flg]           INT             DEFAULT ((0)) NOT NULL,
    [dstr_pck_pal_flg]   INT             DEFAULT ((0)) NOT NULL,
    [dstr_pck_ctn_flg]   INT             DEFAULT ((0)) NOT NULL,
    [dstr_sug_pal_flg]   INT             DEFAULT ((0)) NOT NULL,
    [dstr_sug_ctn_flg]   INT             DEFAULT ((0)) NOT NULL,
    [dstr_excp_loc]      NVARCHAR (20)   NULL,
    [mix_shprcv_flg]     INT             DEFAULT ((0)) NOT NULL,
    [cap_fill_flg]       INT             NULL,
    [set_locsts_flg]     INT             DEFAULT ((0)) NOT NULL,
    [set_maxqvl_flg]     INT             DEFAULT ((0)) NOT NULL,
    [ovrpck_rpl_flg]     INT             DEFAULT ((0)) NOT NULL,
    [clr_dstloc_flg]     INT             DEFAULT ((0)) NOT NULL,
    [rcvwo_non_fwiflg]   INT             DEFAULT ((0)) NOT NULL,
    [atecod]             NVARCHAR (1)    DEFAULT (N'D') NOT NULL,
    [err_loc_invsts_flg] INT             DEFAULT ((0)) NOT NULL,
    [moddte]             DATETIME        NULL,
    [mod_usr_id]         NVARCHAR (40)   NULL,
    [u_version]          INT             NULL,
    [ins_dt]             DATETIME        NULL,
    [last_upd_dt]        DATETIME        NULL,
    [ins_user_id]        NVARCHAR (40)   NULL,
    [last_upd_user_id]   NVARCHAR (40)   NULL,
    [max_mhu_deposit]    NVARCHAR (2)    NULL,
    [def_rcv_invsts]     NVARCHAR (4)    NULL,
    CONSTRAINT [aremst_pk] PRIMARY KEY CLUSTERED ([arecod] ASC, [wh_id] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [aremst_adjflg_ck] CHECK ([adjflg]=(0) OR [adjflg]=(1)),
    CONSTRAINT [aremst_aut_prc_ck] CHECK ([autclr_prcare]=(0) OR [autclr_prcare]=(1)),
    CONSTRAINT [aremst_btokit_ck] CHECK ([bto_kit_dep_flg]=(0) OR [bto_kit_dep_flg]=(1)),
    CONSTRAINT [aremst_capflg_ck] CHECK ([cap_fill_flg]=(0) OR [cap_fill_flg]=(1)),
    CONSTRAINT [aremst_clrdstloc] CHECK ([clr_dstloc_flg]=(0) OR [clr_dstloc_flg]=(1)),
    CONSTRAINT [aremst_cntflg_ck] CHECK ([cntflg]=(0) OR [cntflg]=(1)),
    CONSTRAINT [aremst_conflg_ck] CHECK ([conflg]=(0) OR [conflg]=(1)),
    CONSTRAINT [aremst_conpalflgck] CHECK ([con_pal_flg]=(0) OR [con_pal_flg]=(1)),
    CONSTRAINT [aremst_d_r_c_p_f_c] CHECK ([def_rplcfg_pctflg]=(0) OR [def_rplcfg_pctflg]=(1)),
    CONSTRAINT [aremst_dspareflgck] CHECK ([dispatch_flg]=(0) OR [dispatch_flg]=(1)),
    CONSTRAINT [aremst_dstrareflg_ck] CHECK ([dstr_flg]=(0) OR [dstr_flg]=(1)),
    CONSTRAINT [aremst_dstrpckctnflg_ck] CHECK ([dstr_pck_ctn_flg]=(0) OR [dstr_pck_ctn_flg]=(1)),
    CONSTRAINT [aremst_dstrpckpalflg_ck] CHECK ([dstr_pck_pal_flg]=(0) OR [dstr_pck_pal_flg]=(1)),
    CONSTRAINT [aremst_dstrsugctnflg_ck] CHECK ([dstr_sug_ctn_flg]=(0) OR [dstr_sug_ctn_flg]=(1)),
    CONSTRAINT [aremst_dstrsugpalflg_ck] CHECK ([dstr_sug_pal_flg]=(0) OR [dstr_sug_pal_flg]=(1)),
    CONSTRAINT [aremst_dtlflg_ck] CHECK ([dtlflg]=(0) OR [dtlflg]=(1)),
    CONSTRAINT [aremst_dyn_slot_ck] CHECK ([dyn_slot_flg]=(0) OR [dyn_slot_flg]=(1)),
    CONSTRAINT [aremst_err_loc_invsts_flg] CHECK ([err_loc_invsts_flg]=(0) OR [err_loc_invsts_flg]=(1)),
    CONSTRAINT [aremst_expflg_ck] CHECK ([expflg]=(0) OR [expflg]=(1)),
    CONSTRAINT [aremst_fifflg_ck] CHECK ([fifflg]=(0) OR [fifflg]=(1)),
    CONSTRAINT [aremst_ftlflg_ck] CHECK ([ftl_flg]=(0) OR [ftl_flg]=(1)),
    CONSTRAINT [aremst_fwiflg_ck] CHECK ([fwiflg]=(0) OR [fwiflg]=(1)),
    CONSTRAINT [aremst_icnflg_ck] CHECK ([icnflg]=(0) OR [icnflg]=(1)),
    CONSTRAINT [aremst_lbl_spl_ck] CHECK ([lbl_on_split]=(0) OR [lbl_on_split]=(1)),
    CONSTRAINT [aremst_loccod_ck] CHECK ([loccod]=N'E' OR [loccod]=N'L' OR [loccod]=N'V' OR [loccod]=N'P'),
    CONSTRAINT [aremst_locstsflgck] CHECK ([set_locsts_flg]=(0) OR [set_locsts_flg]=(1)),
    CONSTRAINT [aremst_lodflg_ck] CHECK ([lodflg]=(0) OR [lodflg]=(1)),
    CONSTRAINT [aremst_lpncntflg_ck] CHECK ([lpncntflg]=(0) OR [lpncntflg]=(1)),
    CONSTRAINT [aremst_maxqvlflgck] CHECK ([set_maxqvl_flg]=(0) OR [set_maxqvl_flg]=(1)),
    CONSTRAINT [aremst_mxshprcvck] CHECK ([mix_shprcv_flg]=(0) OR [mix_shprcv_flg]=(1)),
    CONSTRAINT [aremst_ovrpckrpl] CHECK ([ovrpck_rpl_flg]=(0) OR [ovrpck_rpl_flg]=(1)),
    CONSTRAINT [aremst_pckcod_ck] CHECK ([pckcod]=N'N' OR [pckcod]=N'M' OR [pckcod]=N'S'),
    CONSTRAINT [aremst_pckstlflgck] CHECK ([pck_steal_flg]=(0) OR [pck_steal_flg]=(1)),
    CONSTRAINT [aremst_pdflg_ck] CHECK ([pdflg]=(0) OR [pdflg]=(1)),
    CONSTRAINT [aremst_pktostflgck] CHECK ([pck_to_sto_flg]=(0) OR [pck_to_sto_flg]=(1)),
    CONSTRAINT [aremst_praflg_ck] CHECK ([praflg]=(0) OR [praflg]=(1)),
    CONSTRAINT [aremst_prdstgflgck] CHECK ([prd_stgflg]=(0) OR [prd_stgflg]=(1)),
    CONSTRAINT [aremst_prod_flg_ck] CHECK ([prod_flg]=(0) OR [prod_flg]=(1)),
    CONSTRAINT [aremst_pttostflgck] CHECK ([put_to_sto_flg]=(0) OR [put_to_sto_flg]=(1)),
    CONSTRAINT [aremst_r_c_p_ck] CHECK ([recalc_putaway]=(0) OR [recalc_putaway]=(1)),
    CONSTRAINT [aremst_rcvdckflgck] CHECK ([rcv_dck_flg]=(0) OR [rcv_dck_flg]=(1)),
    CONSTRAINT [aremst_rcvstgflgck] CHECK ([rcv_stgflg]=(0) OR [rcv_stgflg]=(1)),
    CONSTRAINT [aremst_rcvwononfwiflg_ck] CHECK ([rcvwo_non_fwiflg]=(0) OR [rcvwo_non_fwiflg]=(1)),
    CONSTRAINT [aremst_rdtflg_ck] CHECK ([rdtflg]=(0) OR [rdtflg]=(1)),
    CONSTRAINT [aremst_rnwstoflgck] CHECK ([rnwl_sto_flg]=(0) OR [rnwl_sto_flg]=(1)),
    CONSTRAINT [aremst_s_l_f_ck] CHECK ([share_loc_flg]=(0) OR [share_loc_flg]=(1)),
    CONSTRAINT [aremst_shpdckflgck] CHECK ([shp_dck_flg]=(0) OR [shp_dck_flg]=(1)),
    CONSTRAINT [aremst_shpflg_ck] CHECK ([shpflg]=(0) OR [shpflg]=(1)),
    CONSTRAINT [aremst_sigflg_ck] CHECK ([sigflg]=(0) OR [sigflg]=(1)),
    CONSTRAINT [aremst_sovrdflg_ck] CHECK ([shp_stg_ovrd_flg]=(0) OR [shp_stg_ovrd_flg]=(1)),
    CONSTRAINT [aremst_spl_trn_ck] CHECK ([split_trn]=(0) OR [split_trn]=(1)),
    CONSTRAINT [aremst_startpal_ck] CHECK ([start_pal_flg]=(0) OR [start_pal_flg]=(1)),
    CONSTRAINT [aremst_stgflg_ck] CHECK ([stgflg]=(0) OR [stgflg]=(1)),
    CONSTRAINT [aremst_stotrlr_ck] CHECK ([sto_trlr_flg]=(0) OR [sto_trlr_flg]=(1)),
    CONSTRAINT [aremst_subflg_ck] CHECK ([subflg]=(0) OR [subflg]=(1)),
    CONSTRAINT [aremst_wipexpflgck] CHECK ([wip_expflg]=(0) OR [wip_expflg]=(1)),
    CONSTRAINT [aremst_wipflg_ck] CHECK ([wipflg]=(0) OR [wipflg]=(1)),
    CONSTRAINT [aremst_wipsupflgck] CHECK ([wip_supflg]=(0) OR [wip_supflg]=(1)),
    CONSTRAINT [aremst_xdaflg_ck] CHECK ([xdaflg]=(0) OR [xdaflg]=(1)),
    CONSTRAINT [aremst_yrdflg_ck] CHECK ([yrdflg]=(0) OR [yrdflg]=(1))
);


GO
CREATE NONCLUSTERED INDEX [aremst_idx1]
    ON [dbo].[aremst]([wh_id] ASC, [bldg_id] ASC) WITH (FILLFACTOR = 90);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The aremst table is used to represent areas in a facility.  Areas represent groupings of locs which are generally treated in the same logical manner.  Typical area codes in a facility include SSTG (ship staging), BULK (Bulk sto)', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aremst';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warehouse ID - identifies the warehouse in which the building is located.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aremst', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Identifies which building this area resides in.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aremst', @level2type = N'COLUMN', @level2name = N'bldg_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicates if location capacity is tracked.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aremst', @level2type = N'COLUMN', @level2name = N'sigflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Specifies if locations in area are Single Item (S), Mixed Item (M), or non-pickable (N).', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aremst', @level2type = N'COLUMN', @level2name = N'pckcod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicates if locations within this area are candidates for stock consolidation. (not used)', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aremst', @level2type = N'COLUMN', @level2name = N'conflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Specifies if locations are tracked at a unit quantity (Q), volume(V), length (L) or pallet footprint(P) level.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aremst', @level2type = N'COLUMN', @level2name = N'loccod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicates if locations in this area are FIFO controlled.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aremst', @level2type = N'COLUMN', @level2name = N'fifflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicates if pallet (load) picking is enabled for locations within this area.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aremst', @level2type = N'COLUMN', @level2name = N'lodflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicates if case (subload) picking is enabled for locations within this area.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aremst', @level2type = N'COLUMN', @level2name = N'subflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicates if piece (detail) picking is enabled for locations within this area.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aremst', @level2type = N'COLUMN', @level2name = N'dtlflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicates if locations in this area are used as processing areas.  Typical examples of processing areas are consolidation, overpack, etc.  If an area is a processing area, then the pckmov.arrqty and pckmov.prcqty are tracked.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aremst', @level2type = N'COLUMN', @level2name = N'praflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicates if area is one which holds locations representing expected receipts.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aremst', @level2type = N'COLUMN', @level2name = N'expflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicates if locations contained in this area are used to represent receiving docks.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aremst', @level2type = N'COLUMN', @level2name = N'rcv_dck_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicates if this is an area for inventory adjustments.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aremst', @level2type = N'COLUMN', @level2name = N'adjflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicates if this is an area containing shipment staging locations.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aremst', @level2type = N'COLUMN', @level2name = N'stgflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicates if locations in this area represent shipments.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aremst', @level2type = N'COLUMN', @level2name = N'shpflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicates locations in this area are dedicated to work order processing.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aremst', @level2type = N'COLUMN', @level2name = N'wipflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicates if locations in this area should be considered within the four walls of the warehouse.  This is typically used during an inventory rollup to the host system.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aremst', @level2type = N'COLUMN', @level2name = N'fwiflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicates if area is one in which it is desired to perform cycle counts.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aremst', @level2type = N'COLUMN', @level2name = N'cntflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicates if area is a ''Count by LPN'' area.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aremst', @level2type = N'COLUMN', @level2name = N'lpncntflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicates the LPN Count Area Level.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aremst', @level2type = N'COLUMN', @level2name = N'lpncnt_area_lodlvl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicates that locations within this area are used for cross-dock processing purposes.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aremst', @level2type = N'COLUMN', @level2name = N'xdaflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This flag is set if counts and picks/stores are performed via RF and NOT by paper based movement requests.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aremst', @level2type = N'COLUMN', @level2name = N'icnflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Production Line Staging Flag. If it is checked, the locations in this area are available as staging locations for production lines and production stations.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aremst', @level2type = N'COLUMN', @level2name = N'prd_stgflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This flag indicates that this area is a WIP Supply area.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aremst', @level2type = N'COLUMN', @level2name = N'wip_supflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This flag indicates that this area is used for receiving product from a work order processing operation.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aremst', @level2type = N'COLUMN', @level2name = N'wip_expflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This flag indicates that this area is a Pickup and Deposit (P & D) area.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aremst', @level2type = N'COLUMN', @level2name = N'pdflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This flag indicates that this area is a Ship Dock area.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aremst', @level2type = N'COLUMN', @level2name = N'shp_dck_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicates if locations contained in this area are used to represent yard locations.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aremst', @level2type = N'COLUMN', @level2name = N'yrdflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicates if these locations should be included when calculating renewal storage charges for client billing.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aremst', @level2type = N'COLUMN', @level2name = N'rnwl_sto_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicates the Count Near Zero code.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aremst', @level2type = N'COLUMN', @level2name = N'cnzcod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The value used to calculate when a Near Zero Count will take place.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aremst', @level2type = N'COLUMN', @level2name = N'cnzamt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The default inventory status used when replenishment configurations are created by the system (slotting).', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aremst', @level2type = N'COLUMN', @level2name = N'def_rplcfg_invsts';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The default percetage flag value used when replenishment configurations are created by the system (slotting).', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aremst', @level2type = N'COLUMN', @level2name = N'def_rplcfg_pctflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The default maximum unit used when replenishment configurations are created by the system (slotting).', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aremst', @level2type = N'COLUMN', @level2name = N'def_rplcfg_maxunt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The default minimum unit used when replenishment configurations are created by the system (slotting).', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aremst', @level2type = N'COLUMN', @level2name = N'def_rplcfg_minunt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This flag indicates that it is a storage area.  It is used mainly in services to indicate that we are going to a storage area, because there may be some services that we only want to occur when moving to a storage area vs. a P&D', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aremst', @level2type = N'COLUMN', @level2name = N'stoare_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Remote Device Flag', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aremst', @level2type = N'COLUMN', @level2name = N'rdtflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Automatically Clear Processing Area', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aremst', @level2type = N'COLUMN', @level2name = N'autclr_prcare';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Receiving Staging Flag', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aremst', @level2type = N'COLUMN', @level2name = N'rcv_stgflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Production Line Flag enables this area to be used for production line locations', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aremst', @level2type = N'COLUMN', @level2name = N'prod_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Put To Store Flag - specifies that the locations in this area are to be used for temporary storage of outbound inventory.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aremst', @level2type = N'COLUMN', @level2name = N'put_to_sto_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Distribution Flag - specifies that the locations in this area are to be used for temporary pre-staging of outbound inventory.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aremst', @level2type = N'COLUMN', @level2name = N'pck_to_sto_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This flag indicates whether system need to re-calculate the put away location while picking up inventory from this area', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aremst', @level2type = N'COLUMN', @level2name = N'recalc_putaway';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The default location that lost inventory will be sent to for that area, when inventory is found to have less than system expects during counting, and that inventory does not support adjustments.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aremst', @level2type = N'COLUMN', @level2name = N'lost_loc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This flag indicates whether a user can scan new LPNs while splitting inventory due to different movement paths during inventory transfer.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aremst', @level2type = N'COLUMN', @level2name = N'lbl_on_split';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This flag indicates whether system performs splitting transfer if movement paths differ while doing load transfer.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aremst', @level2type = N'COLUMN', @level2name = N'split_trn';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Consolidate Pallet Flag - If checked, users will be allowed to conslidate loads when inventory shares the same movement path.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aremst', @level2type = N'COLUMN', @level2name = N'con_pal_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Share Put to Store Locations - This flag indicates whether this put-to-store area is shareable by multiple stores.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aremst', @level2type = N'COLUMN', @level2name = N'share_loc_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Pick Steal Flag - specifies whether picks having this area as source area are enabled for pick stealing.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aremst', @level2type = N'COLUMN', @level2name = N'pck_steal_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This field will be used to get the exception location from this area where the partial pallet can be deposited for a partial pallet that is being picked for a list pick which has been created by Pallet control or BTO.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aremst', @level2type = N'COLUMN', @level2name = N'pck_exp_are';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This field will be used to get Pick Up and Deposit area for an area.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aremst', @level2type = N'COLUMN', @level2name = N'pck_dpst_are';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This flag indicates it is Storage Trailer Area. This area will hold locations that will be Storage Trailers. Inventory in the Storage Trailers will be related to this area.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aremst', @level2type = N'COLUMN', @level2name = N'sto_trlr_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This flag determines if a BTO order''s completed kit pick should be prompted to be deposited to a shipping container slot.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aremst', @level2type = N'COLUMN', @level2name = N'bto_kit_dep_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Ship Staging location override is permitted if this flag is enabled for both original and override areas.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aremst', @level2type = N'COLUMN', @level2name = N'shp_stg_ovrd_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'After Ship Staging location override for a pick, Follow-the-Leader functionality will be initiated if this flag is enabled for both the original and override areas.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aremst', @level2type = N'COLUMN', @level2name = N'ftl_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Proximity Putaway Code - Determines type of Proximity Putaway : SRC = Source Proximity, PF = Pickface Proximity.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aremst', @level2type = N'COLUMN', @level2name = N'prox_put_cod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicates inventory in area can be considered for Starter Pallets.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aremst', @level2type = N'COLUMN', @level2name = N'start_pal_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This flag on the area master sets up the area to be available for dynamic slotting.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aremst', @level2type = N'COLUMN', @level2name = N'dyn_slot_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Dispatch Area Flag - Indicates that the area is a Dispatch Area.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aremst', @level2type = N'COLUMN', @level2name = N'dispatch_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicates if locations within this area support Distribution Consolidation. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aremst', @level2type = N'COLUMN', @level2name = N'dstr_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicate If system will pickup closed Loads automatically for user.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aremst', @level2type = N'COLUMN', @level2name = N'dstr_pck_pal_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicate If system will pickup closed Cartons automatically for user.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aremst', @level2type = N'COLUMN', @level2name = N'dstr_pck_ctn_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicates if system will find a load for user when user deposit inventory to this area.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aremst', @level2type = N'COLUMN', @level2name = N'dstr_sug_pal_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicates if system will find a Carton for user when user deposit inventory to this area.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aremst', @level2type = N'COLUMN', @level2name = N'dstr_sug_ctn_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The location that inventory is taken to when a user fails an RF distribution audit meaning their leftover inventory after performing a distribution is not what the system expects it to be.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aremst', @level2type = N'COLUMN', @level2name = N'dstr_excp_loc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicates whether mixing of picked and non-picked inventory is allowed.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aremst', @level2type = N'COLUMN', @level2name = N'mix_shprcv_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Emergency/Demand Replenishment Fill to Capacity. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aremst', @level2type = N'COLUMN', @level2name = N'cap_fill_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicates whether changing the location status during override is allowed.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aremst', @level2type = N'COLUMN', @level2name = N'set_locsts_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicates whether changing the maximum capacity during override is allowed.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aremst', @level2type = N'COLUMN', @level2name = N'set_maxqvl_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicates whether overpicking of replenishment quantity is allowed.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aremst', @level2type = N'COLUMN', @level2name = N'ovrpck_rpl_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicates when we want deposit inbound inventory if the stage area is clear.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aremst', @level2type = N'COLUMN', @level2name = N'clr_dstloc_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicates if locations in this area should be considered for Receiving without order.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aremst', @level2type = N'COLUMN', @level2name = N'rcvwo_non_fwiflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Specifies if the area is enabled to allocate inventory from locations, until they are empty: D = Disabled, A = Allocation, M = Manual, B = Both.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aremst', @level2type = N'COLUMN', @level2name = N'atecod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Error location for Inventory Status change.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aremst', @level2type = N'COLUMN', @level2name = N'err_loc_invsts_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Modified Date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aremst', @level2type = N'COLUMN', @level2name = N'moddte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Modified User ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aremst', @level2type = N'COLUMN', @level2name = N'mod_usr_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The version number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aremst', @level2type = N'COLUMN', @level2name = N'u_version';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was inserted', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aremst', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was last updated', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aremst', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who created the row', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aremst', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aremst', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Defines the maximum handling unit of measure by which a user may deposit inventory to any location in the area.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aremst', @level2type = N'COLUMN', @level2name = N'max_mhu_deposit';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default Receiving Inventory Status', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aremst', @level2type = N'COLUMN', @level2name = N'def_rcv_invsts';

