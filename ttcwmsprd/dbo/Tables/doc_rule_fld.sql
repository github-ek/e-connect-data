CREATE TABLE [dbo].[doc_rule_fld] (
    [doc_typ]    NVARCHAR (20)  NOT NULL,
    [seqnum]     INT            NOT NULL,
    [colnam]     NVARCHAR (100) NOT NULL,
    [colval]     NVARCHAR (200) NOT NULL,
    [colopr]     NVARCHAR (15)  NULL,
    [moddte]     DATETIME       NULL,
    [mod_usr_id] NVARCHAR (40)  NULL,
    CONSTRAINT [doc_rule_fld_pk] PRIMARY KEY CLUSTERED ([doc_typ] ASC, [seqnum] ASC, [colnam] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'DOC_RULE_FLD table holds the entity values and somewhat of a config table also. The values that are stored in the field column will be entity options set up in codmst.  Ex: wh, client, customer, and wh_client.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'doc_rule_fld';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Document Type - Holds the document type code.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'doc_rule_fld', @level2type = N'COLUMN', @level2name = N'doc_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Sequence Number - Represents the precedence of this document type and entity.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'doc_rule_fld', @level2type = N'COLUMN', @level2name = N'seqnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Column Name - These column names are stored in codmst and represent the entities whether they be customer, warehouse, client etc.  Most of these will be the same from site-to-site.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'doc_rule_fld', @level2type = N'COLUMN', @level2name = N'colnam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Column Value - These are the actual values of the column and will be different from site-to-site. (Example:  If colnam was ''cstnum'', a colval may be ''Target''.)', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'doc_rule_fld', @level2type = N'COLUMN', @level2name = N'colval';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Column Operator - This is the operator used in the evaluation between colnam and colval', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'doc_rule_fld', @level2type = N'COLUMN', @level2name = N'colopr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date/time this record was last modified.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'doc_rule_fld', @level2type = N'COLUMN', @level2name = N'moddte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'ID of user that performed last modification.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'doc_rule_fld', @level2type = N'COLUMN', @level2name = N'mod_usr_id';

