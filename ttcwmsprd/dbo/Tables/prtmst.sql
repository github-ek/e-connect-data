CREATE TABLE [dbo].[prtmst] (
    [prtnum]               NVARCHAR (50)   NOT NULL,
    [prt_client_id]        NVARCHAR (32)   DEFAULT (N'----') NOT NULL,
    [wh_id_tmpl]           NVARCHAR (32)   DEFAULT (N'----') NOT NULL,
    [comcod]               NVARCHAR (32)   NULL,
    [subcfg]               NVARCHAR (6)    NULL,
    [scfpos]               INT             NULL,
    [dtlcfg]               NVARCHAR (6)    NULL,
    [dcfpos]               INT             NULL,
    [typcod]               NVARCHAR (32)   NULL,
    [prtfam]               NVARCHAR (10)   NULL,
    [dsp_prtnum]           NVARCHAR (50)   NULL,
    [age_pflnam]           NVARCHAR (30)   NULL,
    [lodlvl]               NVARCHAR (1)    NOT NULL,
    [orgflg]               INT             NOT NULL,
    [revflg]               INT             NOT NULL,
    [lotflg]               INT             NOT NULL,
    [sup_lot_flg]          INT             DEFAULT ((0)) NOT NULL,
    [untcst]               NUMERIC (19, 4) NULL,
    [reoqty]               INT             NULL,
    [reopnt]               INT             NULL,
    [stkuom]               NVARCHAR (2)    NULL,
    [unt_ins_val]          NUMERIC (19, 4) NULL,
    [rel_val]              NUMERIC (19, 4) NULL,
    [rel_val_unt_typ]      NVARCHAR (30)   NULL,
    [abccod]               NVARCHAR (1)    NULL,
    [fifwin]               INT             NULL,
    [timcod]               NVARCHAR (1)    NULL,
    [velzon]               NVARCHAR (1)    NULL,
    [rcvsts]               NVARCHAR (4)    NULL,
    [rsvuom]               NVARCHAR (2)    NULL,
    [rcvflg]               INT             NULL,
    [prdflg]               INT             NULL,
    [ltlcls]               NVARCHAR (8)    NULL,
    [wip_prtflg]           INT             NULL,
    [dtcflg]               INT             NULL,
    [cnzflg]               INT             NULL,
    [cnzamt]               NUMERIC (19, 4) NULL,
    [catch_cod]            NVARCHAR (1)    NULL,
    [avg_catch]            INT             NULL,
    [catch_unttyp]         NVARCHAR (30)   NULL,
    [catch_untwgt]         NUMERIC (19, 4) NULL,
    [catch_untcst]         NUMERIC (19, 4) NULL,
    [min_catch_qty]        NUMERIC (19, 4) NULL,
    [max_catch_qty]        NUMERIC (19, 4) NULL,
    [stccod]               NVARCHAR (32)   NULL,
    [parcel_flg]           INT             DEFAULT ((1)) NULL,
    [hazmat_flg]           INT             DEFAULT ((0)) NULL,
    [insflg]               INT             DEFAULT ((0)) NULL,
    [nstcls]               NVARCHAR (20)   NULL,
    [ser_typ]              NVARCHAR (20)   NULL,
    [ser_lvl]              NVARCHAR (1)    NULL,
    [prt_disp]             NVARCHAR (100)  NULL,
    [prt_disptn]           NVARCHAR (3)    NULL,
    [lot_fmt_id]           NVARCHAR (10)   NULL,
    [wgtcod]               NVARCHAR (10)   NULL,
    [lod_tag_encode]       NVARCHAR (40)   NULL,
    [sub_tag_encode]       NVARCHAR (40)   NULL,
    [co_prefix_len]        INT             NULL,
    [dept_cod]             NVARCHAR (5)    NULL,
    [time_to_warn_for_exp] INT             NULL,
    [prtadjflg]            INT             NULL,
    [cntbck_ena_flg]       INT             NULL,
    [cnt_thr_cst]          NUMERIC (19, 4) NULL,
    [cnt_thr_unit]         INT             NULL,
    [prtstyle]             NVARCHAR (30)   NULL,
    [prtfit]               NVARCHAR (30)   NULL,
    [prtcolor]             NVARCHAR (30)   NULL,
    [prtsize]              NVARCHAR (30)   NULL,
    [pck_steal_flg]        INT             DEFAULT ((1)) NULL,
    [box_pck_flg]          INT             DEFAULT ((0)) NULL,
    [moddte]               DATETIME        NULL,
    [mod_usr_id]           NVARCHAR (40)   NULL,
    [crncy_code]           NVARCHAR (4)    NULL,
    [htsnum]               NVARCHAR (40)   NULL,
    [schedbnum]            NVARCHAR (40)   NULL,
    [u_version]            INT             NULL,
    [ins_dt]               DATETIME        NULL,
    [last_upd_dt]          DATETIME        NULL,
    [ins_user_id]          NVARCHAR (40)   NULL,
    [last_upd_user_id]     NVARCHAR (40)   NULL,
    [bto_subst_prtnum]     NVARCHAR (50)   NULL,
    [bto_obso_flg]         INT             DEFAULT ((0)) NOT NULL,
    [dspuom]               NVARCHAR (2)    NULL,
    [rptuom]               NVARCHAR (2)    NULL,
    [ignore_con_flg]       INT             DEFAULT ((0)) NOT NULL,
    [prc_for_rps_flg]      INT             DEFAULT ((0)) NOT NULL,
    [abs_ordinv_win]       INT             NULL,
    [abs_ordinv_code]      NVARCHAR (4)    NULL,
    [thresh_pck_var]       NUMERIC (19, 4) DEFAULT ((0)) NOT NULL,
    [dte_win_typ]          NVARCHAR (5)    NULL,
    [dte_code]             NVARCHAR (5)    NULL,
    [attr_str1]            NVARCHAR (5)    DEFAULT (N'N') NOT NULL,
    [attr_str2]            NVARCHAR (5)    DEFAULT (N'N') NOT NULL,
    [attr_str3]            NVARCHAR (5)    DEFAULT (N'N') NOT NULL,
    [attr_str4]            NVARCHAR (5)    DEFAULT (N'N') NOT NULL,
    [attr_str5]            NVARCHAR (5)    DEFAULT (N'N') NOT NULL,
    [attr_str6]            NVARCHAR (5)    DEFAULT (N'N') NOT NULL,
    [attr_str7]            NVARCHAR (5)    DEFAULT (N'N') NOT NULL,
    [attr_str8]            NVARCHAR (5)    DEFAULT (N'N') NOT NULL,
    [attr_str9]            NVARCHAR (5)    DEFAULT (N'N') NOT NULL,
    [attr_str10]           NVARCHAR (5)    DEFAULT (N'N') NOT NULL,
    [attr_str11]           NVARCHAR (5)    DEFAULT (N'N') NOT NULL,
    [attr_str12]           NVARCHAR (5)    DEFAULT (N'N') NOT NULL,
    [attr_str13]           NVARCHAR (5)    DEFAULT (N'N') NOT NULL,
    [attr_str14]           NVARCHAR (5)    DEFAULT (N'N') NOT NULL,
    [attr_str15]           NVARCHAR (5)    DEFAULT (N'N') NOT NULL,
    [attr_str16]           NVARCHAR (5)    DEFAULT (N'N') NOT NULL,
    [attr_str17]           NVARCHAR (5)    DEFAULT (N'N') NOT NULL,
    [attr_str18]           NVARCHAR (5)    DEFAULT (N'N') NOT NULL,
    [attr_int1]            NVARCHAR (5)    DEFAULT (N'N') NOT NULL,
    [attr_int2]            NVARCHAR (5)    DEFAULT (N'N') NOT NULL,
    [attr_int3]            NVARCHAR (5)    DEFAULT (N'N') NOT NULL,
    [attr_int4]            NVARCHAR (5)    DEFAULT (N'N') NOT NULL,
    [attr_int5]            NVARCHAR (5)    DEFAULT (N'N') NOT NULL,
    [attr_flt1]            NVARCHAR (5)    DEFAULT (N'N') NOT NULL,
    [attr_flt2]            NVARCHAR (5)    DEFAULT (N'N') NOT NULL,
    [attr_flt3]            NVARCHAR (5)    DEFAULT (N'N') NOT NULL,
    [attr_dte1]            NVARCHAR (5)    DEFAULT (N'N') NOT NULL,
    [attr_dte2]            NVARCHAR (5)    DEFAULT (N'N') NOT NULL,
    [cstms_itm_typ]        NVARCHAR (8)    NULL,
    [cstms_crncy]          NVARCHAR (20)   NULL,
    [dflt_orgcod]          NVARCHAR (3)    NULL,
    [cstms_vat_cod]        NVARCHAR (10)   NULL,
    [dty_stmp_trk_flg]     INT             DEFAULT ((0)) NOT NULL,
    [cstms_cst]            INT             NULL,
    [cstms_cmmdty_cod]     NVARCHAR (150)  NULL,
    [alt_prt_typ]          NVARCHAR (20)   NULL,
    [velzon_recalc_flg]    INT             DEFAULT ((1)) NOT NULL,
    [ordinv]               NVARCHAR (30)   NULL,
    [pakflg]               INT             DEFAULT ((0)) NOT NULL,
    [shelf_life]           INT             NULL,
    [shelf_timecode]       NVARCHAR (1)    NULL,
    CONSTRAINT [prtmst_pk] PRIMARY KEY CLUSTERED ([prtnum] ASC, [wh_id_tmpl] ASC, [prt_client_id] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [pm_avg_catch_ck] CHECK ([avg_catch]=(0) OR [avg_catch]=(1)),
    CONSTRAINT [prtmst_box_flg_ck] CHECK ([box_pck_flg]=(0) OR [box_pck_flg]=(1)),
    CONSTRAINT [prtmst_cntbckenflg] CHECK ([cntbck_ena_flg]=(0) OR [cntbck_ena_flg]=(1)),
    CONSTRAINT [prtmst_cnzflg_ck] CHECK ([cnzflg]=(0) OR [cnzflg]=(1)),
    CONSTRAINT [prtmst_dtcflg_ck] CHECK ([dtcflg]=(0) OR [dtcflg]=(1)),
    CONSTRAINT [prtmst_dtystmptrk] CHECK ([dty_stmp_trk_flg]=(0) OR [dty_stmp_trk_flg]=(1)),
    CONSTRAINT [prtmst_hzmt_flg_ck] CHECK ([hazmat_flg]=(0) OR [hazmat_flg]=(1)),
    CONSTRAINT [prtmst_ignoreflgck] CHECK ([ignore_con_flg]=(0) OR [ignore_con_flg]=(1)),
    CONSTRAINT [prtmst_insflg_ck] CHECK ([insflg]=(0) OR [insflg]=(1)),
    CONSTRAINT [prtmst_lodlvl_ck] CHECK ([lodlvl]=N'D' OR [lodlvl]=N'S' OR [lodlvl]=N'L'),
    CONSTRAINT [prtmst_lotflg_ck] CHECK ([lotflg]=(0) OR [lotflg]=(1)),
    CONSTRAINT [prtmst_obso_flg_ck] CHECK ([bto_obso_flg]=(0) OR [bto_obso_flg]=(1)),
    CONSTRAINT [prtmst_orgflg_ck] CHECK ([orgflg]=(0) OR [orgflg]=(1)),
    CONSTRAINT [prtmst_pakflg_ck] CHECK ([pakflg]=(0) OR [pakflg]=(1)),
    CONSTRAINT [prtmst_pckstlflgck] CHECK ([pck_steal_flg]=(0) OR [pck_steal_flg]=(1)),
    CONSTRAINT [prtmst_pcl_flg_ck] CHECK ([parcel_flg]=(0) OR [parcel_flg]=(1)),
    CONSTRAINT [prtmst_prdflg_ck] CHECK ([prdflg]=(0) OR [prdflg]=(1)),
    CONSTRAINT [prtmst_prtadjflg] CHECK ([prtadjflg]=(0) OR [prtadjflg]=(1)),
    CONSTRAINT [prtmst_rcvflg_ck] CHECK ([rcvflg]=(0) OR [rcvflg]=(1)),
    CONSTRAINT [prtmst_revflg_ck] CHECK ([revflg]=(0) OR [revflg]=(1)),
    CONSTRAINT [prtmst_rpsflgck] CHECK ([prc_for_rps_flg]=(0) OR [prc_for_rps_flg]=(1)),
    CONSTRAINT [prtmst_suplotflgck] CHECK ([sup_lot_flg]=(0) OR [sup_lot_flg]=(1)),
    CONSTRAINT [prtmst_velcalcflg] CHECK ([velzon_recalc_flg]=(0) OR [velzon_recalc_flg]=(1)),
    CONSTRAINT [prtmst_wipprtflgck] CHECK ([wip_prtflg]=(0) OR [wip_prtflg]=(1))
);


GO
CREATE NONCLUSTERED INDEX [prtmst_idx3]
    ON [dbo].[prtmst]([lodlvl] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [prtmst_idx4]
    ON [dbo].[prtmst]([wh_id_tmpl] ASC, [ignore_con_flg] ASC) WITH (FILLFACTOR = 90);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The item master table is used to represent valid items for the system.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtmst';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Also referred to as item number or SKU.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtmst', @level2type = N'COLUMN', @level2name = N'prtnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The client which owns the item number.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtmst', @level2type = N'COLUMN', @level2name = N'prt_client_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warehouse ID Template - The wh_id_tmpl= ''----'' will represent a default item that will be shared by all warehouses. An entry with a wh_id_tmpl != ''----'' is an override for that warehouse.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtmst', @level2type = N'COLUMN', @level2name = N'wh_id_tmpl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Used optionally when using serialized case tracking.  Indicates that valid subnum identifier for this item will contain this string (subcfg) starting at position scfpos in the subload number.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtmst', @level2type = N'COLUMN', @level2name = N'subcfg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The starting position for the subload configuration code.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtmst', @level2type = N'COLUMN', @level2name = N'scfpos';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This is the same as the subcfg but applies to serialized detail identifiers.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtmst', @level2type = N'COLUMN', @level2name = N'dtlcfg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Same as scfpos but applies to dtlcfg.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtmst', @level2type = N'COLUMN', @level2name = N'dcfpos';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Display Item Number.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtmst', @level2type = N'COLUMN', @level2name = N'dsp_prtnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Set to one of L (load), S (Subload), or D (Detail).  For example, if set to Subload, then product is considered serialized at a case level.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtmst', @level2type = N'COLUMN', @level2name = N'lodlvl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If set, the system will track origin code for this product.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtmst', @level2type = N'COLUMN', @level2name = N'orgflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If set, the system will track revision level for this product.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtmst', @level2type = N'COLUMN', @level2name = N'revflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If set, the system will track lot number for this product.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtmst', @level2type = N'COLUMN', @level2name = N'lotflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If set, the system will track supplier lot number for this product.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtmst', @level2type = N'COLUMN', @level2name = N'sup_lot_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The cost of a single unit of this item.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtmst', @level2type = N'COLUMN', @level2name = N'untcst';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The amount of product to re-order should inventory levels fall below reopnt levels.  This field is not used for any standard system processing.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtmst', @level2type = N'COLUMN', @level2name = N'reoqty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If inventory levels fall below this level, an order should be generated for more inventory.  This field is not used for any standard system processing.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtmst', @level2type = N'COLUMN', @level2name = N'reopnt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Provides the UOM code to associate with untqty.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtmst', @level2type = N'COLUMN', @level2name = N'stkuom';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The insurable value of each release value unit.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtmst', @level2type = N'COLUMN', @level2name = N'unt_ins_val';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The value for a release value basis, this value can be in any currencies.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtmst', @level2type = N'COLUMN', @level2name = N'rel_val';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The unit basis for the release value.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtmst', @level2type = N'COLUMN', @level2name = N'rel_val_unt_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Used to indicate the relative frequency by which this product should be counted.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtmst', @level2type = N'COLUMN', @level2name = N'abccod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Used to indicate the time interval in which product should be considered equal for FIFO consideration during product storage.  The unit of measure of the time interval is based on the TIMCOD field.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtmst', @level2type = N'COLUMN', @level2name = N'fifwin';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Time Code.  This can be either in MINUTES, HOURS, or DAYS.  It governs how the FIFWIN column will be evaluated in the system.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtmst', @level2type = N'COLUMN', @level2name = N'timcod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Used to indicate the relative velocity of the product and how it should be stored.  I.e. fast moving product should be stored in easy to access fast moving locations.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtmst', @level2type = N'COLUMN', @level2name = N'velzon';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The default inventory status that this product should get when identified during receiving.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtmst', @level2type = N'COLUMN', @level2name = N'rcvsts';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The lowest UOM by which inventory will be reserved by in order reservation.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtmst', @level2type = N'COLUMN', @level2name = N'rsvuom';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This flag must be set for product to be identified during receiving. Useful if items downloads from host often need addtln info.  New items may be downloaded with rcvflg set to false to prevent rcv''ng until someone manually intervenes.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtmst', @level2type = N'COLUMN', @level2name = N'rcvflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This flag is set if this is inventory that a host system cares about.  When tracking supplies and other non-costed items, this flag should be set to false.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtmst', @level2type = N'COLUMN', @level2name = N'prdflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Freight Class - used by TMS systems to determine freight rate of the item.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtmst', @level2type = N'COLUMN', @level2name = N'ltlcls';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This flag will be set if this item is allowed to transfer in to a WIP supply area.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtmst', @level2type = N'COLUMN', @level2name = N'wip_prtflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If set to TRUE, this value will be used to determine if the near zero count will take place rather than the value configured on the aremst table.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtmst', @level2type = N'COLUMN', @level2name = N'cnzflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The value used to calculate when a Near Zero Count will take place.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtmst', @level2type = N'COLUMN', @level2name = N'cnzamt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The value used to determine if and when this item will require catch unit processing.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtmst', @level2type = N'COLUMN', @level2name = N'catch_cod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A flag to determine whether this item will use the average catch quantity functionality.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtmst', @level2type = N'COLUMN', @level2name = N'avg_catch';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The metric that catch units are captured in.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtmst', @level2type = N'COLUMN', @level2name = N'catch_unttyp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The Weight of 1 unit of metric.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtmst', @level2type = N'COLUMN', @level2name = N'catch_untwgt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The cost of 1 unit of metric.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtmst', @level2type = N'COLUMN', @level2name = N'catch_untcst';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Minimum catch qty a user may enter per stocking unit of measure.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtmst', @level2type = N'COLUMN', @level2name = N'min_catch_qty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Maximum catch qty a user may enter per stocking unit of measure.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtmst', @level2type = N'COLUMN', @level2name = N'max_catch_qty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Standard Transportation Commodity Code - used for rail transportation.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtmst', @level2type = N'COLUMN', @level2name = N'stccod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Parcel Flag - indicates whether or not a item can be shipped parcel.  This is used for TM shipment planning.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtmst', @level2type = N'COLUMN', @level2name = N'parcel_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Hazardous Material Flag - indicates whether or not a item is considered hazardous material.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtmst', @level2type = N'COLUMN', @level2name = N'hazmat_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Insurance Flag - indicates whether or not a item requires insurance.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtmst', @level2type = N'COLUMN', @level2name = N'insflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Nesting Information Code - indicates how the products cartons can be nested in packaging.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtmst', @level2type = N'COLUMN', @level2name = N'nstcls';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Item Display - Item Picture position, it should be a local picture or net picture.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtmst', @level2type = N'COLUMN', @level2name = N'prt_disp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The disposition of the item.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtmst', @level2type = N'COLUMN', @level2name = N'prt_disptn';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The Lot Format ID, used for parsing of lot numbers.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtmst', @level2type = N'COLUMN', @level2name = N'lot_fmt_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The weight Code - This is a user defined code for the describing the weight type, usually takes the values HEAVY, MEDIUM or LIGHT.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtmst', @level2type = N'COLUMN', @level2name = N'wgtcod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The Tag Encoding used when encoding a pallet level RFID tag', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtmst', @level2type = N'COLUMN', @level2name = N'lod_tag_encode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The Tag Encoding used when encoding a carton level RFID tag', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtmst', @level2type = N'COLUMN', @level2name = N'sub_tag_encode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The Company Prefix Length.  Used for parsing company prefix from GTIN', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtmst', @level2type = N'COLUMN', @level2name = N'co_prefix_len';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Department Code - user-defined code master entry defining the department where this item is expected to be shipped.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtmst', @level2type = N'COLUMN', @level2name = N'dept_cod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A number of time (whatever the time code is), that system will give a warning message to user if the the receiving item will expires within this time.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtmst', @level2type = N'COLUMN', @level2name = N'time_to_warn_for_exp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If this flag is true, it is acceptable to record an inventory adjustment for this item.  If not, no adjustment record may be written.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtmst', @level2type = N'COLUMN', @level2name = N'prtadjflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If this flag is set, the item supports countback.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtmst', @level2type = N'COLUMN', @level2name = N'cntbck_ena_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The threshold of counting. We won''t genreate count if the current cost is lower than this value. 0 measn the threshold is disabled.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtmst', @level2type = N'COLUMN', @level2name = N'cnt_thr_cst';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The Unit threshold of counting. We won''t genreate count if the current unit is lower than this value. 0 means the threshold is disabled.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtmst', @level2type = N'COLUMN', @level2name = N'cnt_thr_unit';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The style', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtmst', @level2type = N'COLUMN', @level2name = N'prtstyle';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The fit', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtmst', @level2type = N'COLUMN', @level2name = N'prtfit';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The color', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtmst', @level2type = N'COLUMN', @level2name = N'prtcolor';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The size', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtmst', @level2type = N'COLUMN', @level2name = N'prtsize';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This flag specifies whether the item is enabled for pick stealing', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtmst', @level2type = N'COLUMN', @level2name = N'pck_steal_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If this flag is set, the item will be picked to box during cartonization', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtmst', @level2type = N'COLUMN', @level2name = N'box_pck_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Currency Code - the currency unit of currency sensitive data.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtmst', @level2type = N'COLUMN', @level2name = N'crncy_code';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'HTS number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtmst', @level2type = N'COLUMN', @level2name = N'htsnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Schedule-B number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtmst', @level2type = N'COLUMN', @level2name = N'schedbnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The version number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtmst', @level2type = N'COLUMN', @level2name = N'u_version';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was inserted', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtmst', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was last updated', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtmst', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who created the row', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtmst', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtmst', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The item which is the BTO substitute for the item', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtmst', @level2type = N'COLUMN', @level2name = N'bto_subst_prtnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This flag indicates that BTO will not use this item any more', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtmst', @level2type = N'COLUMN', @level2name = N'bto_obso_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The uom that this item used to display. It should be UOM defined in itmftp_dtl', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtmst', @level2type = N'COLUMN', @level2name = N'dspuom';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The uom that this item used to report. It should be UOM defined in itmftp_dtl', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtmst', @level2type = N'COLUMN', @level2name = N'rptuom';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'When the flag is set to true,it indicates that picks of this item could not be combined by combination code so that the user performs separate picks.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtmst', @level2type = N'COLUMN', @level2name = N'ignore_con_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Process for RPS flag - This flag will indicate to process the inventory stock transition states to be sent to RPS for the item.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtmst', @level2type = N'COLUMN', @level2name = N'prc_for_rps_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Used in conjunction with XXFO-ORDER-BY-ABSOLUTE as skip logic', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtmst', @level2type = N'COLUMN', @level2name = N'abs_ordinv_win';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Time interval for the Absolute Order Inventory Window', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtmst', @level2type = N'COLUMN', @level2name = N'abs_ordinv_code';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicates if user should be warned when picking outside of the threshold variance percentage. Can be 0 to 100.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtmst', @level2type = N'COLUMN', @level2name = N'thresh_pck_var';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date Window Type selected for the part. This can have Manufacture Date Window or Expiration Date Window or FIFO Window.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtmst', @level2type = N'COLUMN', @level2name = N'dte_win_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This will describe whether the part is Manufacture Date (M) or Expiration Date (E) or Both (B) tracked. If the part is not date tracked, its value will be null.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtmst', @level2type = N'COLUMN', @level2name = N'dte_code';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This will describe whether the User Defined Attribute Text1 is Tracked - Optional (T) or Tracked - Required (R) or Not Tracked (N).', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtmst', @level2type = N'COLUMN', @level2name = N'attr_str1';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This will describe whether the User Defined Attribute Text2 is Tracked - Optional (T) or Tracked - Required (R) or Not Tracked (N).', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtmst', @level2type = N'COLUMN', @level2name = N'attr_str2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This will describe whether the User Defined Attribute Text3 is Tracked - Optional (T) or Tracked - Required (R) or Not Tracked (N).', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtmst', @level2type = N'COLUMN', @level2name = N'attr_str3';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This will describe whether the User Defined Attribute Text4 is Tracked - Optional (T) or Tracked - Required (R) or Not Tracked (N).', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtmst', @level2type = N'COLUMN', @level2name = N'attr_str4';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This will describe whether the User Defined Attribute Text5 is Tracked - Optional (T) or Tracked - Required (R) or Not Tracked (N).', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtmst', @level2type = N'COLUMN', @level2name = N'attr_str5';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This will describe whether the User Defined Attribute Text6 is Tracked - Optional (T) or Tracked - Required (R) or Not Tracked (N).', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtmst', @level2type = N'COLUMN', @level2name = N'attr_str6';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This will describe whether the User Defined Attribute Text7 is Tracked - Optional (T) or Tracked - Required (R) or Not Tracked (N).', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtmst', @level2type = N'COLUMN', @level2name = N'attr_str7';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This will describe whether the User Defined Attribute Text8 is Tracked - Optional (T) or Tracked - Required (R) or Not Tracked (N).', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtmst', @level2type = N'COLUMN', @level2name = N'attr_str8';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This will describe whether the User Defined Attribute Text9 is Tracked - Optional (T) or Tracked - Required (R) or Not Tracked (N).', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtmst', @level2type = N'COLUMN', @level2name = N'attr_str9';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This will describe whether the User Defined Attribute Text10 is Tracked - Optional (T) or Tracked - Required (R) or Not Tracked (N).', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtmst', @level2type = N'COLUMN', @level2name = N'attr_str10';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This will describe whether the User Defined Attribute Text11 is Tracked - Optional (T) or Tracked - Required (R) or Not Tracked (N).', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtmst', @level2type = N'COLUMN', @level2name = N'attr_str11';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This will describe whether the User Defined Attribute Text12 is Tracked - Optional (T) or Tracked - Required (R) or Not Tracked (N).', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtmst', @level2type = N'COLUMN', @level2name = N'attr_str12';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This will describe whether the User Defined Attribute Text13 is Tracked - Optional (T) or Tracked - Required (R) or Not Tracked (N).', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtmst', @level2type = N'COLUMN', @level2name = N'attr_str13';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This will describe whether the User Defined Attribute Text14 is Tracked - Optional (T) or Tracked - Required (R) or Not Tracked (N).', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtmst', @level2type = N'COLUMN', @level2name = N'attr_str14';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This will describe whether the User Defined Attribute Text15 is Tracked - Optional (T) or Tracked - Required (R) or Not Tracked (N).', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtmst', @level2type = N'COLUMN', @level2name = N'attr_str15';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This will describe whether the User Defined Attribute Text16 is Tracked - Optional (T) or Tracked - Required (R) or Not Tracked (N).', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtmst', @level2type = N'COLUMN', @level2name = N'attr_str16';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This will describe whether the User Defined Attribute Text17 is Tracked - Optional (T) or Tracked - Required (R) or Not Tracked (N).', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtmst', @level2type = N'COLUMN', @level2name = N'attr_str17';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This will describe whether the User Defined Attribute Text18 is Tracked - Optional (T) or Tracked - Required (R) or Not Tracked (N).', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtmst', @level2type = N'COLUMN', @level2name = N'attr_str18';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This will describe whether the User Defined Integer Attribute 1 is Tracked - Optional (T) or Tracked - Required (R) or Not Tracked (N).', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtmst', @level2type = N'COLUMN', @level2name = N'attr_int1';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This will describe whether the User Defined Integer Attribute 2 is Tracked - Optional (T) or Tracked - Required (R) or Not Tracked (N).', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtmst', @level2type = N'COLUMN', @level2name = N'attr_int2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This will describe whether the User Defined Integer Attribute 3 is Tracked - Optional (T) or Tracked - Required (R) or Not Tracked (N).', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtmst', @level2type = N'COLUMN', @level2name = N'attr_int3';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This will describe whether the User Defined Integer Attribute 4 is Tracked - Optional (T) or Tracked - Required (R) or Not Tracked (N).', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtmst', @level2type = N'COLUMN', @level2name = N'attr_int4';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This will describe whether the User Defined Integer Attribute 5 is Tracked - Optional (T) or Tracked - Required (R) or Not Tracked (N).', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtmst', @level2type = N'COLUMN', @level2name = N'attr_int5';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This will describe whether the User Defined Decimal Attribute 1 is Tracked - Optional (T) or Tracked - Required (R) or Not Tracked (N).', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtmst', @level2type = N'COLUMN', @level2name = N'attr_flt1';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This will describe whether the User Defined Decimal Attribute 2 is Tracked - Optional (T) or Tracked - Required (R) or Not Tracked (N).', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtmst', @level2type = N'COLUMN', @level2name = N'attr_flt2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This will describe whether the User Defined Decimal Attribute 3 is Tracked - Optional (T) or Tracked - Required (R) or Not Tracked (N).', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtmst', @level2type = N'COLUMN', @level2name = N'attr_flt3';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This will describe whether the User Defined Date-Time Attribute 1 is Tracked - Optional (T) or Tracked - Required (R) or Not Tracked (N).', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtmst', @level2type = N'COLUMN', @level2name = N'attr_dte1';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This will describe whether the User Defined Date-Time Attribute 2 is Tracked - Optional (T) or Tracked - Required (R) or Not Tracked (N).', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtmst', @level2type = N'COLUMN', @level2name = N'attr_dte2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Customs Item Type values are customs, excise, neither. If the item type is customs or excise then the item is bonded.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtmst', @level2type = N'COLUMN', @level2name = N'cstms_itm_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The currency customs needs paid in.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtmst', @level2type = N'COLUMN', @level2name = N'cstms_crncy';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Country where the goods were manufactured.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtmst', @level2type = N'COLUMN', @level2name = N'dflt_orgcod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Customs Value Added Tax Code which can have a value of ''S'' for Standard VAT or a ''Z'' for Zero Vat (VAT not required).', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtmst', @level2type = N'COLUMN', @level2name = N'cstms_vat_cod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This must be enabled (''1'') for all excise products over 30% alcohol by volume in containers 35cl or larger.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtmst', @level2type = N'COLUMN', @level2name = N'dty_stmp_trk_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The customs cost of the item used by Duty Management', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtmst', @level2type = N'COLUMN', @level2name = N'cstms_cst';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Customs commodity code used by Duty Management to determine the type of duty to be paid. No validation in WM.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtmst', @level2type = N'COLUMN', @level2name = N'cstms_cmmdty_cod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The alternate item type.for the display item number. If there''s no display item number defined for the item, this field will be empty. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtmst', @level2type = N'COLUMN', @level2name = N'alt_prt_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Enable this flag to allow velocity zone recalculation to be done for this item.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtmst', @level2type = N'COLUMN', @level2name = N'velzon_recalc_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Location Order By - This value determines how the system will determine which inventory in an area code to allocate for this order line. Examples of possible values include FEFO-ORDER-BY, FIFO-ORDER-BY', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtmst', @level2type = N'COLUMN', @level2name = N'ordinv';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Delay OutBound Serial Capture Until Packing.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtmst', @level2type = N'COLUMN', @level2name = N'pakflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Shelf Life is used to calculate the expiration date in the absence of an aging profile for date controlled items with a date code value set as Both.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtmst', @level2type = N'COLUMN', @level2name = N'shelf_life';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Time Code for the shelf life', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtmst', @level2type = N'COLUMN', @level2name = N'shelf_timecode';

