CREATE TABLE [dbo].[doc_lblfmt] (
    [doc_typ]    NVARCHAR (20) NOT NULL,
    [lblfmt]     NVARCHAR (20) NOT NULL,
    [moddte]     DATETIME      NULL,
    [mod_usr_id] NVARCHAR (40) NULL,
    CONSTRAINT [doc_lblfmt_pk] PRIMARY KEY CLUSTERED ([doc_typ] ASC, [lblfmt] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'DOC_LBLFMT is simply a composite table that serves as a bridge between the doc_typ and lblfmt tables.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'doc_lblfmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Document Type - Holds the document type name.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'doc_lblfmt', @level2type = N'COLUMN', @level2name = N'doc_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Label Format - Holds the label format name.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'doc_lblfmt', @level2type = N'COLUMN', @level2name = N'lblfmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Modified Date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'doc_lblfmt', @level2type = N'COLUMN', @level2name = N'moddte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Modified User ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'doc_lblfmt', @level2type = N'COLUMN', @level2name = N'mod_usr_id';

