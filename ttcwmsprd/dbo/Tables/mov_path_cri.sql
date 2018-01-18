CREATE TABLE [dbo].[mov_path_cri] (
    [cri_id]           NVARCHAR (9)   NOT NULL,
    [seqnum]           INT            NOT NULL,
    [wh_id]            NVARCHAR (32)  NOT NULL,
    [grpopr]           NVARCHAR (15)  NULL,
    [table_nam]        NVARCHAR (30)  NULL,
    [field_name]       NVARCHAR (30)  NULL,
    [operator]         NVARCHAR (15)  NULL,
    [value]            NVARCHAR (500) NULL,
    [ins_dt]           DATETIME       NULL,
    [last_upd_dt]      DATETIME       NULL,
    [ins_user_id]      NVARCHAR (40)  NULL,
    [last_upd_user_id] NVARCHAR (40)  NULL,
    CONSTRAINT [mov_path_cri_pk] PRIMARY KEY CLUSTERED ([cri_id] ASC, [seqnum] ASC, [wh_id] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Stores the Criteria attribute data used to hop areas of the movement path ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'mov_path_cri';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The unique identifier of a Criteria.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'mov_path_cri', @level2type = N'COLUMN', @level2name = N'cri_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Sequence Number.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'mov_path_cri', @level2type = N'COLUMN', @level2name = N'seqnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warehouse ID.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'mov_path_cri', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Group Operator. They are AND and OR.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'mov_path_cri', @level2type = N'COLUMN', @level2name = N'grpopr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Table Name.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'mov_path_cri', @level2type = N'COLUMN', @level2name = N'table_nam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Field Name.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'mov_path_cri', @level2type = N'COLUMN', @level2name = N'field_name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Operator.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'mov_path_cri', @level2type = N'COLUMN', @level2name = N'operator';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Value of the field.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'mov_path_cri', @level2type = N'COLUMN', @level2name = N'value';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was inserted.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'mov_path_cri', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was last updated.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'mov_path_cri', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who created the row.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'mov_path_cri', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'mov_path_cri', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

