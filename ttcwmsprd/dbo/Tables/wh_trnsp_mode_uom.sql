CREATE TABLE [dbo].[wh_trnsp_mode_uom] (
    [trnsp_mode]        NVARCHAR (10) NOT NULL,
    [uomcod]            NVARCHAR (4)  NOT NULL,
    [wh_id]             NVARCHAR (32) NOT NULL,
    [opt_dck_flg]       INT           DEFAULT ((0)) NOT NULL,
    [rel_palletctl_flg] INT           DEFAULT ((0)) NOT NULL,
    [ins_dt]            DATETIME      NULL,
    [last_upd_dt]       DATETIME      NULL,
    [ins_user_id]       NVARCHAR (40) NULL,
    [last_upd_user_id]  NVARCHAR (40) NULL,
    CONSTRAINT [whtrnsp_mod_uom_pk] PRIMARY KEY CLUSTERED ([trnsp_mode] ASC, [uomcod] ASC, [wh_id] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [wh_tmod_opt_dck_ck] CHECK ([opt_dck_flg]=(0) OR [opt_dck_flg]=(1)),
    CONSTRAINT [whtm_rlplctlflg_ck] CHECK ([rel_palletctl_flg]=(0) OR [rel_palletctl_flg]=(1))
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The wh_trnsp_mode_uom table stores the transport level UOM settings and allows the selection of Optimal Outbound Dock Door UOM settings at the warehouse and transport mode level.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wh_trnsp_mode_uom';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Mode of transport the UOM is applicable to.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wh_trnsp_mode_uom', @level2type = N'COLUMN', @level2name = N'trnsp_mode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The unit of measure code.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wh_trnsp_mode_uom', @level2type = N'COLUMN', @level2name = N'uomcod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The warehouse identifier.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wh_trnsp_mode_uom', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The flag that specifies whether the UOM for warehouse transportation mode is included in optimal dock door calculation.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wh_trnsp_mode_uom', @level2type = N'COLUMN', @level2name = N'opt_dck_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Release stacks post PalletCtl - If this flag is checked, the respective work for that UOM will be set to PEND post Pallet Control plan.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wh_trnsp_mode_uom', @level2type = N'COLUMN', @level2name = N'rel_palletctl_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was inserted.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wh_trnsp_mode_uom', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was last updated.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wh_trnsp_mode_uom', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who created the row.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wh_trnsp_mode_uom', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wh_trnsp_mode_uom', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

