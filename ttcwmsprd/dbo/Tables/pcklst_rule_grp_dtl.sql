CREATE TABLE [dbo].[pcklst_rule_grp_dtl] (
    [pcklst_rule_grp_id] INT           NOT NULL,
    [pcklst_rule_id]     INT           NOT NULL,
    [seqnum]             INT           NOT NULL,
    [ins_dt]             DATETIME      NULL,
    [last_upd_dt]        DATETIME      NULL,
    [ins_user_id]        NVARCHAR (40) NULL,
    [last_upd_user_id]   NVARCHAR (40) NULL,
    CONSTRAINT [pcklst_rule_grp_dtl_pk] PRIMARY KEY CLUSTERED ([pcklst_rule_grp_id] ASC, [pcklst_rule_id] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table is used to define associations between pick list rule group and rules.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcklst_rule_grp_dtl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Identifies the pick list rule group. Rule group ID and rule ID are primary key.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcklst_rule_grp_dtl', @level2type = N'COLUMN', @level2name = N'pcklst_rule_grp_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Identifies the pick list rule. Rule group ID and rule ID are primary key.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcklst_rule_grp_dtl', @level2type = N'COLUMN', @level2name = N'pcklst_rule_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Determines the sequence number.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcklst_rule_grp_dtl', @level2type = N'COLUMN', @level2name = N'seqnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was inserted', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcklst_rule_grp_dtl', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was last updated', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcklst_rule_grp_dtl', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who created the row', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcklst_rule_grp_dtl', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcklst_rule_grp_dtl', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

