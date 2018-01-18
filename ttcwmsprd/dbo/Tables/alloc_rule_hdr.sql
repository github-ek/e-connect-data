CREATE TABLE [dbo].[alloc_rule_hdr] (
    [rule_nam]         NVARCHAR (20) NOT NULL,
    [wh_id]            NVARCHAR (32) NOT NULL,
    [cplx_flg]         INT           DEFAULT ((0)) NULL,
    [valid_flg]        INT           DEFAULT ((0)) NULL,
    [temp_flg]         INT           DEFAULT ((1)) NULL,
    [rule_cmd_str]     TEXT          NULL,
    [ins_dt]           DATETIME      NULL,
    [last_upd_dt]      DATETIME      NULL,
    [ins_user_id]      NVARCHAR (40) NULL,
    [last_upd_user_id] NVARCHAR (40) NULL,
    CONSTRAINT [alloc_rule_hdr_pk] PRIMARY KEY CLUSTERED ([rule_nam] ASC, [wh_id] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [alcrulhdr_cplxfgck] CHECK ([cplx_flg]=(0) OR [cplx_flg]=(1)),
    CONSTRAINT [alcrulhdr_tmpflgck] CHECK ([temp_flg]=(0) OR [temp_flg]=(1)),
    CONSTRAINT [alcrulhdr_valflgck] CHECK ([valid_flg]=(0) OR [valid_flg]=(1))
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table is used to store the a rules name, the warehouse it exists in, the status and the complexity of a rule.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'alloc_rule_hdr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The name of an allocation rule.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'alloc_rule_hdr', @level2type = N'COLUMN', @level2name = N'rule_nam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The warehouse a rule name exists in allocate rule header.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'alloc_rule_hdr', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Identifies a rule as either complex (multiple values per field) or simple (every field assigned to a single value and the AND group operator is used).', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'alloc_rule_hdr', @level2type = N'COLUMN', @level2name = N'cplx_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Value is set to false if rule fails validation(if there is a syntax miss in the rule details) otherwise true.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'alloc_rule_hdr', @level2type = N'COLUMN', @level2name = N'valid_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Temporary,By Default Value is set to true (Temporary Rule). ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'alloc_rule_hdr', @level2type = N'COLUMN', @level2name = N'temp_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Contains the allocation rule details as a string for the respective rule.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'alloc_rule_hdr', @level2type = N'COLUMN', @level2name = N'rule_cmd_str';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date the row was inserted.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'alloc_rule_hdr', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date the row was last updated.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'alloc_rule_hdr', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User id of the person who created the row.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'alloc_rule_hdr', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User id of the person who updated the row most recently.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'alloc_rule_hdr', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

