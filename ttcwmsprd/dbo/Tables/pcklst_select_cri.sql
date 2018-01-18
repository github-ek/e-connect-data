CREATE TABLE [dbo].[pcklst_select_cri] (
    [pcklst_select_cri_id] INT            NOT NULL,
    [pcklst_rule_id]       INT            NOT NULL,
    [seqnum]               INT            NOT NULL,
    [log_opr]              NVARCHAR (15)  NULL,
    [table_nam]            NVARCHAR (30)  NULL,
    [field_name]           NVARCHAR (30)  NULL,
    [operator]             NVARCHAR (15)  NULL,
    [value]                NVARCHAR (500) NULL,
    [ins_dt]               DATETIME       NULL,
    [last_upd_dt]          DATETIME       NULL,
    [ins_user_id]          NVARCHAR (40)  NULL,
    [last_upd_user_id]     NVARCHAR (40)  NULL,
    CONSTRAINT [pcklst_select_cri_pk] PRIMARY KEY CLUSTERED ([pcklst_select_cri_id] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Stores the Selection Criteria attributes for a Pick List Rule', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcklst_select_cri';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The unique identifier of a Pick List Selection Criteria.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcklst_select_cri', @level2type = N'COLUMN', @level2name = N'pcklst_select_cri_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The unique identifier of a Pick List Rule.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcklst_select_cri', @level2type = N'COLUMN', @level2name = N'pcklst_rule_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Sequence Number.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcklst_select_cri', @level2type = N'COLUMN', @level2name = N'seqnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Logical Operator. They are AND and OR.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcklst_select_cri', @level2type = N'COLUMN', @level2name = N'log_opr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Table Name.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcklst_select_cri', @level2type = N'COLUMN', @level2name = N'table_nam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Field Name.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcklst_select_cri', @level2type = N'COLUMN', @level2name = N'field_name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Operator.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcklst_select_cri', @level2type = N'COLUMN', @level2name = N'operator';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Value of the field.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcklst_select_cri', @level2type = N'COLUMN', @level2name = N'value';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was inserted.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcklst_select_cri', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was last updated.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcklst_select_cri', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who created the row.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcklst_select_cri', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcklst_select_cri', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

