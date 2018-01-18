CREATE TABLE [dbo].[wh_trnsp_mode] (
    [trnsp_mode]       NVARCHAR (10) NOT NULL,
    [wh_id]            NVARCHAR (32) NOT NULL,
    [max_usr]          INT           NULL,
    [lock_usr_flg]     INT           DEFAULT ((0)) NOT NULL,
    [def_stacks_rel]   INT           NULL,
    [stack_cmpl_flg]   INT           DEFAULT ((0)) NOT NULL,
    [trlr_dck_flg]     INT           DEFAULT ((0)) NOT NULL,
    [bol_break_lvl]    NVARCHAR (40) NULL,
    [ins_dt]           DATETIME      NULL,
    [last_upd_dt]      DATETIME      NULL,
    [ins_user_id]      NVARCHAR (40) NULL,
    [last_upd_user_id] NVARCHAR (40) NULL,
    CONSTRAINT [wh_trnsp_mode_pk] PRIMARY KEY CLUSTERED ([trnsp_mode] ASC, [wh_id] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [tm_loc_usr_flg_ck] CHECK ([lock_usr_flg]=(0) OR [lock_usr_flg]=(1)),
    CONSTRAINT [whtrnstack_cmpl_ck] CHECK ([stack_cmpl_flg]=(0) OR [stack_cmpl_flg]=(1)),
    CONSTRAINT [whtrnstrldckflg_ck] CHECK ([trlr_dck_flg]=(0) OR [trlr_dck_flg]=(1))
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table contains the transportation modes at the warehouse level.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wh_trnsp_mode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Mode of transport.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wh_trnsp_mode', @level2type = N'COLUMN', @level2name = N'trnsp_mode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The warehouse identifier.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wh_trnsp_mode', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Maximum Users - This will limit the maximum number of users assigned to a carrier move. If max_usr is null or 0, any number of users can be assigned to the carrier move.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wh_trnsp_mode', @level2type = N'COLUMN', @level2name = N'max_usr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Lock User - If this flag is set, user will be locked to the carrier move.  If the flag not is set then the user will be assigned to the carrier move until there is no more work for that carrier.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wh_trnsp_mode', @level2type = N'COLUMN', @level2name = N'lock_usr_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default stacks to release - This will determine how many stacks need to go from LOCKED to PENDING', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wh_trnsp_mode', @level2type = N'COLUMN', @level2name = N'def_stacks_rel';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Force stack complete - This flag will determine if inventory needs to be a part of a complete stack that is on the device before it can be loaded', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wh_trnsp_mode', @level2type = N'COLUMN', @level2name = N'stack_cmpl_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Release stacks when trlr at door - If this flag is checked, the respective work for that UOM will be set to PEND when trailer is at the dock door.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wh_trnsp_mode', @level2type = N'COLUMN', @level2name = N'trlr_dck_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Bill of Lading Break Level - This will represent the level at which the Bill of Lading report will be printed.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wh_trnsp_mode', @level2type = N'COLUMN', @level2name = N'bol_break_lvl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was inserted.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wh_trnsp_mode', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was last updated.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wh_trnsp_mode', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who created the row.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wh_trnsp_mode', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wh_trnsp_mode', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

