CREATE TABLE [dbo].[pcklst_break_on_cri] (
    [pcklst_break_on_cri_id] INT             NOT NULL,
    [pcklst_rule_id]         INT             NOT NULL,
    [break_on_function]      NVARCHAR (20)   NOT NULL,
    [break_on_field]         NVARCHAR (30)   NULL,
    [max_weight]             NUMERIC (23, 8) NULL,
    [max_volume]             NUMERIC (19, 4) NULL,
    [max_qty]                INT             NULL,
    [volume_thr]             NUMERIC (19, 4) NULL,
    [max_add_pick_weight]    NUMERIC (23, 8) NULL,
    [seqnum]                 INT             NOT NULL,
    [ins_dt]                 DATETIME        NULL,
    [last_upd_dt]            DATETIME        NULL,
    [ins_user_id]            NVARCHAR (40)   NULL,
    [last_upd_user_id]       NVARCHAR (40)   NULL,
    CONSTRAINT [pcklst_break_on_cri_pk] PRIMARY KEY CLUSTERED ([pcklst_break_on_cri_id] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table is used to define pick list rule break on criteria.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcklst_break_on_cri';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Identifies the pick list break on criteria.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcklst_break_on_cri', @level2type = N'COLUMN', @level2name = N'pcklst_break_on_cri_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Identifies the pick list rule to which the sequencing criteria belongs to.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcklst_break_on_cri', @level2type = N'COLUMN', @level2name = N'pcklst_rule_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Name of the function to break on.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcklst_break_on_cri', @level2type = N'COLUMN', @level2name = N'break_on_function';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Field name.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcklst_break_on_cri', @level2type = N'COLUMN', @level2name = N'break_on_field';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Maximum weight to break on.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcklst_break_on_cri', @level2type = N'COLUMN', @level2name = N'max_weight';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Maximum volume to break on.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcklst_break_on_cri', @level2type = N'COLUMN', @level2name = N'max_volume';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Maximum quantity to break on.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcklst_break_on_cri', @level2type = N'COLUMN', @level2name = N'max_qty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Volume threshold after which only picks less than the Maximum Pick Weight are added to a list.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcklst_break_on_cri', @level2type = N'COLUMN', @level2name = N'volume_thr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Maximum Additional Pick Weight', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcklst_break_on_cri', @level2type = N'COLUMN', @level2name = N'max_add_pick_weight';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Determines the sequence number of a break on criteria.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcklst_break_on_cri', @level2type = N'COLUMN', @level2name = N'seqnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was inserted', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcklst_break_on_cri', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was last updated', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcklst_break_on_cri', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who created the row', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcklst_break_on_cri', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcklst_break_on_cri', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

