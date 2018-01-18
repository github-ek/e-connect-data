CREATE TABLE [dbo].[alloc_search_grp] (
    [alloc_grp_nam]    NVARCHAR (9)  NOT NULL,
    [wh_id]            NVARCHAR (32) NOT NULL,
    [alloc_grp_dsc]    NVARCHAR (30) NULL,
    [alloc_grp_seq]    INT           NOT NULL,
    [ins_dt]           DATETIME      NULL,
    [last_upd_dt]      DATETIME      NULL,
    [ins_user_id]      NVARCHAR (40) NULL,
    [last_upd_user_id] NVARCHAR (40) NULL,
    CONSTRAINT [alc_search_grp_pk] PRIMARY KEY CLUSTERED ([alloc_grp_nam] ASC, [wh_id] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The group of allocation search path.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'alloc_search_grp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Unique Id to identify the allocation search group.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'alloc_search_grp', @level2type = N'COLUMN', @level2name = N'alloc_grp_nam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warehouse Id for the allocation search path group.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'alloc_search_grp', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Description of the allocation search group.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'alloc_search_grp', @level2type = N'COLUMN', @level2name = N'alloc_grp_dsc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This will be generated from ''generate next number where numcod = alloc_grp_seq''. This indicates the priority of the preferred group of allocation search path records for allocation.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'alloc_search_grp', @level2type = N'COLUMN', @level2name = N'alloc_grp_seq';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date the row was inserted.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'alloc_search_grp', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date the row was last updated.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'alloc_search_grp', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User id of the person who created the row.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'alloc_search_grp', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User id of the person who updated the row most recently.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'alloc_search_grp', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

