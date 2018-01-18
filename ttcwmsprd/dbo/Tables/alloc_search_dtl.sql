CREATE TABLE [dbo].[alloc_search_dtl] (
    [alloc_search_id]  NVARCHAR (9)   NOT NULL,
    [colnam]           NVARCHAR (100) NOT NULL,
    [colval]           NVARCHAR (200) NOT NULL,
    [ins_dt]           DATETIME       NULL,
    [last_upd_dt]      DATETIME       NULL,
    [ins_user_id]      NVARCHAR (40)  NULL,
    [last_upd_user_id] NVARCHAR (40)  NULL,
    CONSTRAINT [alc_search_dtl_pk] PRIMARY KEY CLUSTERED ([alloc_search_id] ASC, [colnam] ASC) WITH (FILLFACTOR = 90)
);


GO
CREATE NONCLUSTERED INDEX [alc_srch_dtl_idx1]
    ON [dbo].[alloc_search_dtl]([colnam] ASC) WITH (FILLFACTOR = 90);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Represents Pick and Replenishment Allocation policies.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'alloc_search_dtl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Unique Id to identify the allocation search path.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'alloc_search_dtl', @level2type = N'COLUMN', @level2name = N'alloc_search_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Criteria for which the allocation search path applies.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'alloc_search_dtl', @level2type = N'COLUMN', @level2name = N'colnam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Specific column value for the allocation search path.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'alloc_search_dtl', @level2type = N'COLUMN', @level2name = N'colval';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date the row was inserted.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'alloc_search_dtl', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date the row was last updated.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'alloc_search_dtl', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User id of the person who created the row.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'alloc_search_dtl', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'alloc_search_dtl', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

