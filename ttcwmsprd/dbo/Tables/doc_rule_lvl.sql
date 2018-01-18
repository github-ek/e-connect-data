CREATE TABLE [dbo].[doc_rule_lvl] (
    [doc_typ]          NVARCHAR (20)  NOT NULL,
    [seqnum]           INT            NOT NULL,
    [colval]           NVARCHAR (200) NOT NULL,
    [par_uom_flg]      INT            DEFAULT ((0)) NOT NULL,
    [ins_dt]           DATETIME       NULL,
    [last_upd_dt]      DATETIME       NULL,
    [ins_user_id]      NVARCHAR (40)  NULL,
    [last_upd_user_id] NVARCHAR (40)  NULL,
    CONSTRAINT [doc_rule_lvl_pk] PRIMARY KEY CLUSTERED ([doc_typ] ASC, [seqnum] ASC, [colval] ASC, [par_uom_flg] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [docrulelvl_paruomflg_ck] CHECK ([par_uom_flg]=(0) OR [par_uom_flg]=(1))
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The doc_rule_lvl table stores the Load Levels and UOMs configured for a document rule.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'doc_rule_lvl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Document Type - Holds the document type name.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'doc_rule_lvl', @level2type = N'COLUMN', @level2name = N'doc_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The sequence number.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'doc_rule_lvl', @level2type = N'COLUMN', @level2name = N'seqnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Column Value - Used to store the load level or UOM code value depending on the document type''s level.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'doc_rule_lvl', @level2type = N'COLUMN', @level2name = N'colval';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Partial UOM - Determines if the rule should be used for partial quantities of this UOM.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'doc_rule_lvl', @level2type = N'COLUMN', @level2name = N'par_uom_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was inserted.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'doc_rule_lvl', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was last updated.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'doc_rule_lvl', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who created the row.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'doc_rule_lvl', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'doc_rule_lvl', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

