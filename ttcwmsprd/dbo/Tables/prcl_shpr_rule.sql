CREATE TABLE [dbo].[prcl_shpr_rule] (
    [rule_id]          INT           NOT NULL,
    [wh_id]            NVARCHAR (32) NOT NULL,
    [loc_id]           NVARCHAR (20) NOT NULL,
    [seqnum]           INT           NOT NULL,
    [ins_dt]           DATETIME      NULL,
    [last_upd_dt]      DATETIME      NULL,
    [ins_user_id]      NVARCHAR (40) NULL,
    [last_upd_user_id] NVARCHAR (40) NULL,
    CONSTRAINT [prcl_shpr_rule_pk] PRIMARY KEY CLUSTERED ([rule_id] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The Parcel Shipper Rule table will store the rules, sort sequence, and shipper location ids that match.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prcl_shpr_rule';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'System generated identifier used to identify the rule.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prcl_shpr_rule', @level2type = N'COLUMN', @level2name = N'rule_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warehouse ID - The unique identifier for the warehouse.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prcl_shpr_rule', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'External Shipper Identifier within the Dlx Parcel manifesting system that is used for manifesting packages.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prcl_shpr_rule', @level2type = N'COLUMN', @level2name = N'loc_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Sequence Number - Represents the precedence of this shipper rule.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prcl_shpr_rule', @level2type = N'COLUMN', @level2name = N'seqnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was inserted.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prcl_shpr_rule', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was last updated.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prcl_shpr_rule', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who created the row.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prcl_shpr_rule', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prcl_shpr_rule', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

