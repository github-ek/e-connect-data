CREATE TABLE [dbo].[pcklst_grp_cri] (
    [pcklst_grp_cri_id] INT           NOT NULL,
    [pcklst_rule_id]    INT           NOT NULL,
    [seqnum]            INT           NOT NULL,
    [table_nam]         NVARCHAR (30) NOT NULL,
    [field_name]        NVARCHAR (30) NOT NULL,
    [ins_dt]            DATETIME      NULL,
    [last_upd_dt]       DATETIME      NULL,
    [ins_user_id]       NVARCHAR (40) NULL,
    [last_upd_user_id]  NVARCHAR (40) NULL,
    CONSTRAINT [pcklst_grp_cri_pk] PRIMARY KEY CLUSTERED ([pcklst_grp_cri_id] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table is used to define pick list rule grouping criteria.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcklst_grp_cri';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Identifies the pick list grouping criteria.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcklst_grp_cri', @level2type = N'COLUMN', @level2name = N'pcklst_grp_cri_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Identifies the pick list rule to which the grouping criteria belongs to.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcklst_grp_cri', @level2type = N'COLUMN', @level2name = N'pcklst_rule_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Sequence number determining the order of a grouping criteria.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcklst_grp_cri', @level2type = N'COLUMN', @level2name = N'seqnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Table name.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcklst_grp_cri', @level2type = N'COLUMN', @level2name = N'table_nam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Field name.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcklst_grp_cri', @level2type = N'COLUMN', @level2name = N'field_name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was inserted', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcklst_grp_cri', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was last updated', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcklst_grp_cri', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who created the row', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcklst_grp_cri', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcklst_grp_cri', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

