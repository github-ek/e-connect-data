CREATE TABLE [dbo].[pcklst_rule] (
    [pcklst_rule_id]         INT            NOT NULL,
    [pcklst_rule_name]       NVARCHAR (120) NOT NULL,
    [wh_id]                  NVARCHAR (32)  NOT NULL,
    [client_id]              NVARCHAR (32)  NOT NULL,
    [re_list_flg]            INT            DEFAULT ((0)) NOT NULL,
    [allow_split_flg]        INT            DEFAULT ((0)) NOT NULL,
    [list_typ]               NVARCHAR (3)   NOT NULL,
    [one_pass_only]          NVARCHAR (1)   NULL,
    [assign_slot_flg]        INT            DEFAULT ((0)) NOT NULL,
    [asset_typ]              NVARCHAR (30)  NULL,
    [valid_flg]              INT            DEFAULT ((1)) NOT NULL,
    [cnf_mtused_prt]         INT            DEFAULT ((0)) NOT NULL,
    [cmdtxt]                 NVARCHAR (200) NULL,
    [opr_cod]                NVARCHAR (9)   NULL,
    [pick_ord_by]            NVARCHAR (150) NULL,
    [max_start_picks]        INT            NULL,
    [drop_at_wrkzone_change] INT            DEFAULT ((0)) NOT NULL,
    [frc_pickup_prev]        INT            DEFAULT ((0)) NOT NULL,
    [rsm_lst_pck_prev_opr]   INT            DEFAULT ((0)) NOT NULL,
    [cmb_list_flg]           INT            DEFAULT ((0)) NOT NULL,
    [ins_dt]                 DATETIME       NULL,
    [last_upd_dt]            DATETIME       NULL,
    [ins_user_id]            NVARCHAR (40)  NULL,
    [last_upd_user_id]       NVARCHAR (40)  NULL,
    CONSTRAINT [pcklst_rule_pk] PRIMARY KEY CLUSTERED ([pcklst_rule_id] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [plr_alwspltflg_ck] CHECK ([allow_split_flg]=(0) OR [allow_split_flg]=(1)),
    CONSTRAINT [plr_asnslotflg_ck] CHECK ([assign_slot_flg]=(0) OR [assign_slot_flg]=(1)),
    CONSTRAINT [plr_cfmtusdprt_ck] CHECK ([cnf_mtused_prt]=(0) OR [cnf_mtused_prt]=(1)),
    CONSTRAINT [plr_cmblistflg_ck] CHECK ([cmb_list_flg]=(0) OR [cmb_list_flg]=(1)),
    CONSTRAINT [plr_drpwkznchg_ck] CHECK ([drop_at_wrkzone_change]=(0) OR [drop_at_wrkzone_change]=(1)),
    CONSTRAINT [plr_frcpkupprv_ck] CHECK ([frc_pickup_prev]=(0) OR [frc_pickup_prev]=(1)),
    CONSTRAINT [plr_relistflg_ck] CHECK ([re_list_flg]=(0) OR [re_list_flg]=(1)),
    CONSTRAINT [plr_rsmlstpckp_ck] CHECK ([rsm_lst_pck_prev_opr]=(0) OR [rsm_lst_pck_prev_opr]=(1)),
    CONSTRAINT [plr_validflg_ck] CHECK ([valid_flg]=(0) OR [valid_flg]=(1))
);


GO
CREATE NONCLUSTERED INDEX [pcklst_rule_nam_wh_cl]
    ON [dbo].[pcklst_rule]([pcklst_rule_name] ASC, [wh_id] ASC, [client_id] ASC) WITH (FILLFACTOR = 90);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Stores the Rules data used for creating lists ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcklst_rule';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The unique identifier of a Rule.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcklst_rule', @level2type = N'COLUMN', @level2name = N'pcklst_rule_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The name of the Rule.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcklst_rule', @level2type = N'COLUMN', @level2name = N'pcklst_rule_name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warehouse ID.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcklst_rule', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Client ID for which the rule would be available.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcklst_rule', @level2type = N'COLUMN', @level2name = N'client_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Flag used for specifying Re-Listing.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcklst_rule', @level2type = N'COLUMN', @level2name = N're_list_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Flag used for specifying pick task splitting.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcklst_rule', @level2type = N'COLUMN', @level2name = N'allow_split_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'List Type - The type of a list - options include: ORD, WKO and RPL.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcklst_rule', @level2type = N'COLUMN', @level2name = N'list_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Specifies whether list changes are allowed. N(Never)No new picks will be added to the list once built,A(Always) Qualifying New picks will be added to the list irrespective of list status,B(Before In Progress) Qualifying New picks will be added to the list only if the list has not been started.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcklst_rule', @level2type = N'COLUMN', @level2name = N'one_pass_only';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Flag used for specifying whether the slot assigned based on slot rule.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcklst_rule', @level2type = N'COLUMN', @level2name = N'assign_slot_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Asset Type for the pick list', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcklst_rule', @level2type = N'COLUMN', @level2name = N'asset_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Flag used for specifying whether the rule is valid', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcklst_rule', @level2type = N'COLUMN', @level2name = N'valid_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Enforce List Sequence for BTO bulk picking.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcklst_rule', @level2type = N'COLUMN', @level2name = N'cnf_mtused_prt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Release command.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcklst_rule', @level2type = N'COLUMN', @level2name = N'cmdtxt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Release command operation code.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcklst_rule', @level2type = N'COLUMN', @level2name = N'opr_cod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Pick Order By', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcklst_rule', @level2type = N'COLUMN', @level2name = N'pick_ord_by';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Maximum starter pallets per list.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcklst_rule', @level2type = N'COLUMN', @level2name = N'max_start_picks';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Drop at work zone change.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcklst_rule', @level2type = N'COLUMN', @level2name = N'drop_at_wrkzone_change';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Force to Pick up Previous Loads.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcklst_rule', @level2type = N'COLUMN', @level2name = N'frc_pickup_prev';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'To Previous Operator After In-line Replenishment.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcklst_rule', @level2type = N'COLUMN', @level2name = N'rsm_lst_pck_prev_opr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This flag indicates that identical picks in lists(same item, location, lot,  etc.) will be combined by combination code so that the user does not perform separate picks from the same location.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcklst_rule', @level2type = N'COLUMN', @level2name = N'cmb_list_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was inserted.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcklst_rule', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was last updated.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcklst_rule', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who created the row.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcklst_rule', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcklst_rule', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

