CREATE TABLE [dbo].[pcklst_rule_grp] (
    [pcklst_rule_grp_id]   INT            NOT NULL,
    [pcklst_rule_grp_name] NVARCHAR (120) NOT NULL,
    [wh_id]                NVARCHAR (32)  NOT NULL,
    [client_id]            NVARCHAR (32)  NOT NULL,
    [ena_flg]              INT            DEFAULT ((0)) NOT NULL,
    [ins_dt]               DATETIME       NULL,
    [last_upd_dt]          DATETIME       NULL,
    [ins_user_id]          NVARCHAR (40)  NULL,
    [last_upd_user_id]     NVARCHAR (40)  NULL,
    CONSTRAINT [pcklst_rule_grp_pk] PRIMARY KEY CLUSTERED ([pcklst_rule_grp_id] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [plrulgrp_enaflg_ck] CHECK ([ena_flg]=(0) OR [ena_flg]=(1))
);


GO
CREATE NONCLUSTERED INDEX [pcklst_rule_grp_nam_cli_wh]
    ON [dbo].[pcklst_rule_grp]([pcklst_rule_grp_name] ASC, [wh_id] ASC, [client_id] ASC) WITH (FILLFACTOR = 90);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table is used to maintain pick list rule groups.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcklst_rule_grp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Identifies the pick list rule group.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcklst_rule_grp', @level2type = N'COLUMN', @level2name = N'pcklst_rule_grp_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User defined rule group name.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcklst_rule_grp', @level2type = N'COLUMN', @level2name = N'pcklst_rule_grp_name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warehouse Identifier', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcklst_rule_grp', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Client Identifier', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcklst_rule_grp', @level2type = N'COLUMN', @level2name = N'client_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Status flag of the rule group, whether enabled or disabled.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcklst_rule_grp', @level2type = N'COLUMN', @level2name = N'ena_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was inserted', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcklst_rule_grp', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was last updated', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcklst_rule_grp', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who created the row', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcklst_rule_grp', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcklst_rule_grp', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

