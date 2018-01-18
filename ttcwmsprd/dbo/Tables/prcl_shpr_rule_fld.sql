CREATE TABLE [dbo].[prcl_shpr_rule_fld] (
    [rule_id]          INT            NOT NULL,
    [colnam]           NVARCHAR (100) NOT NULL,
    [colval]           NVARCHAR (200) NOT NULL,
    [ins_dt]           DATETIME       NULL,
    [last_upd_dt]      DATETIME       NULL,
    [ins_user_id]      NVARCHAR (40)  NULL,
    [last_upd_user_id] NVARCHAR (40)  NULL,
    CONSTRAINT [prclshprrulefld_pk] PRIMARY KEY CLUSTERED ([rule_id] ASC, [colnam] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The Parcel Shipper Rule Field table will be used to store the fields that are defined for a specific rule. This is the child table to Parcel Shipper Rule.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prcl_shpr_rule_fld';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'System generated identifier used to identify the rule.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prcl_shpr_rule_fld', @level2type = N'COLUMN', @level2name = N'rule_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Column Name - These column names are stored in codmst and represent the entities whether they be customer, warehouse, client etc.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prcl_shpr_rule_fld', @level2type = N'COLUMN', @level2name = N'colnam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Column Value - These are the actual values of the column and will be different from site-to-site. (Example: If colnam was ''cstnum'', a colval may be ''Target''.)', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prcl_shpr_rule_fld', @level2type = N'COLUMN', @level2name = N'colval';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was inserted.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prcl_shpr_rule_fld', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was last updated.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prcl_shpr_rule_fld', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who created the row.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prcl_shpr_rule_fld', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prcl_shpr_rule_fld', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

