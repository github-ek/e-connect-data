CREATE TABLE [dbo].[pcklst_seq_cri] (
    [pcklst_seq_cri_id] INT           NOT NULL,
    [pcklst_rule_id]    INT           NOT NULL,
    [table_nam]         NVARCHAR (30) NOT NULL,
    [field_name]        NVARCHAR (30) NOT NULL,
    [sort_order]        INT           DEFAULT ((0)) NOT NULL,
    [seqnum]            INT           NOT NULL,
    [ins_dt]            DATETIME      NULL,
    [last_upd_dt]       DATETIME      NULL,
    [ins_user_id]       NVARCHAR (40) NULL,
    [last_upd_user_id]  NVARCHAR (40) NULL,
    CONSTRAINT [pcklst_seq_cri_pk] PRIMARY KEY CLUSTERED ([pcklst_seq_cri_id] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [plseq_sortorder_ck] CHECK ([sort_order]=(0) OR [sort_order]=(1))
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table is used to define pick list rule sequencing criteria.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcklst_seq_cri';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Identifies the pick list sequencing criteria.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcklst_seq_cri', @level2type = N'COLUMN', @level2name = N'pcklst_seq_cri_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Identifies the pick list rule to which the sequencing criteria belongs to.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcklst_seq_cri', @level2type = N'COLUMN', @level2name = N'pcklst_rule_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Table name.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcklst_seq_cri', @level2type = N'COLUMN', @level2name = N'table_nam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Field name.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcklst_seq_cri', @level2type = N'COLUMN', @level2name = N'field_name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Determines the sort order of a sequencing criteria.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcklst_seq_cri', @level2type = N'COLUMN', @level2name = N'sort_order';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Determines the sequence number of a sequencing criteria.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcklst_seq_cri', @level2type = N'COLUMN', @level2name = N'seqnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was inserted', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcklst_seq_cri', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was last updated', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcklst_seq_cri', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who created the row', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcklst_seq_cri', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcklst_seq_cri', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

