CREATE TABLE [dbo].[ctn_select_cri] (
    [ctn_select_cri_id] INT            NOT NULL,
    [wh_id]             NVARCHAR (32)  NOT NULL,
    [seqnum]            INT            NOT NULL,
    [log_opr]           NVARCHAR (15)  NULL,
    [table_nam]         NVARCHAR (30)  NULL,
    [field_name]        NVARCHAR (30)  NULL,
    [operator]          NVARCHAR (15)  NULL,
    [value]             NVARCHAR (500) NULL,
    [ins_dt]            DATETIME       NULL,
    [last_upd_dt]       DATETIME       NULL,
    [ins_user_id]       NVARCHAR (40)  NULL,
    [last_upd_user_id]  NVARCHAR (40)  NULL,
    CONSTRAINT [ctn_select_cri_pk] PRIMARY KEY CLUSTERED ([ctn_select_cri_id] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Stores the Selection Criteria attributes for Cartonization.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ctn_select_cri';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The unique identifier of a Cartonization Selection Criteria.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ctn_select_cri', @level2type = N'COLUMN', @level2name = N'ctn_select_cri_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The warehouse ID.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ctn_select_cri', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The number that represents the precedence of this criteria.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ctn_select_cri', @level2type = N'COLUMN', @level2name = N'seqnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The logical operator.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ctn_select_cri', @level2type = N'COLUMN', @level2name = N'log_opr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The table name.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ctn_select_cri', @level2type = N'COLUMN', @level2name = N'table_nam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The field name.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ctn_select_cri', @level2type = N'COLUMN', @level2name = N'field_name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The operator.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ctn_select_cri', @level2type = N'COLUMN', @level2name = N'operator';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The field value.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ctn_select_cri', @level2type = N'COLUMN', @level2name = N'value';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was inserted.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ctn_select_cri', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was last updated.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ctn_select_cri', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who created the row.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ctn_select_cri', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ctn_select_cri', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

