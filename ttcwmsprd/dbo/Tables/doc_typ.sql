CREATE TABLE [dbo].[doc_typ] (
    [doc_typ]     NVARCHAR (20)   NOT NULL,
    [doc_typ_cod] NVARCHAR (1)    NOT NULL,
    [lvl_colnam]  NVARCHAR (100)  NULL,
    [data_cmd]    NVARCHAR (2000) NULL,
    [break_lvl]   NVARCHAR (8)    NULL,
    [bill_flg]    INT             DEFAULT ((0)) NULL,
    [moddte]      DATETIME        NULL,
    [mod_usr_id]  NVARCHAR (40)   NULL,
    CONSTRAINT [doc_typ_pk] PRIMARY KEY CLUSTERED ([doc_typ] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The doc_typ table holds all the document types whether they be shipping label, bill of lading, and so on.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'doc_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Document Type - Holds the document type name.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'doc_typ', @level2type = N'COLUMN', @level2name = N'doc_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Document Type Code - Determines if this document type is a report(R) or a label(L).', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'doc_typ', @level2type = N'COLUMN', @level2name = N'doc_typ_cod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Column to use to determine default inventory levels; either Unit Of Measure or Load Level .)', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'doc_typ', @level2type = N'COLUMN', @level2name = N'lvl_colnam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Data Command - This will hold the driving command used in gathering the information needed for processing this doc_typ through label compliance.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'doc_typ', @level2type = N'COLUMN', @level2name = N'data_cmd';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Break Level - This will represent what inventory we are printing for.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'doc_typ', @level2type = N'COLUMN', @level2name = N'break_lvl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Bill Flag - This defines whether the document type can be billed upon generation', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'doc_typ', @level2type = N'COLUMN', @level2name = N'bill_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Modified Date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'doc_typ', @level2type = N'COLUMN', @level2name = N'moddte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Modified User ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'doc_typ', @level2type = N'COLUMN', @level2name = N'mod_usr_id';

