CREATE TABLE [dbo].[alloc_rule_dtl] (
    [rule_nam]          NVARCHAR (20)  NOT NULL,
    [wh_id]             NVARCHAR (32)  NOT NULL,
    [alloc_rule_dtl_id] INT            NOT NULL,
    [seqnum]            INT            NOT NULL,
    [field_name]        NVARCHAR (30)  NULL,
    [value]             NVARCHAR (300) NULL,
    [grpopr]            NVARCHAR (15)  NULL,
    [operator]          NVARCHAR (15)  NULL,
    [ins_dt]            DATETIME       NULL,
    [last_upd_dt]       DATETIME       NULL,
    [ins_user_id]       NVARCHAR (40)  NULL,
    [last_upd_user_id]  NVARCHAR (40)  NULL,
    CONSTRAINT [alloc_rule_dtl_pk] PRIMARY KEY CLUSTERED ([rule_nam] ASC, [wh_id] ASC, [alloc_rule_dtl_id] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The allocation rule detail table is used to defines inventory attributes,field name, operator,group operator and values for a rule.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'alloc_rule_dtl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The name of an allocation rule.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'alloc_rule_dtl', @level2type = N'COLUMN', @level2name = N'rule_nam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The warehouse a rule name exists in.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'alloc_rule_dtl', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Allocation Rule Detail ID.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'alloc_rule_dtl', @level2type = N'COLUMN', @level2name = N'alloc_rule_dtl_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Sequence number determining the order of a rule should be built.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'alloc_rule_dtl', @level2type = N'COLUMN', @level2name = N'seqnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'An inventory attribute which includes all previous attributes (ex. lot number, origin code, revision level, manufacturer date and expire date) for allocation.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'alloc_rule_dtl', @level2type = N'COLUMN', @level2name = N'field_name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The value of the corresponding field name.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'alloc_rule_dtl', @level2type = N'COLUMN', @level2name = N'value';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Grouping logic used to group fields and values together to create different conditional statements. Valid group operators are: AND, OR, ) AND, AND (, OR (, ) OR, (, and ).', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'alloc_rule_dtl', @level2type = N'COLUMN', @level2name = N'grpopr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Is the operator used when testing the relationship between two entities.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'alloc_rule_dtl', @level2type = N'COLUMN', @level2name = N'operator';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date the row was inserted.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'alloc_rule_dtl', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date the row was last updated.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'alloc_rule_dtl', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User id of the person who created the row.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'alloc_rule_dtl', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User id of the person who updated the row most recently.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'alloc_rule_dtl', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

