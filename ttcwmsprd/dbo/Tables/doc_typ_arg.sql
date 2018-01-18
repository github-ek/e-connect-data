CREATE TABLE [dbo].[doc_typ_arg] (
    [doc_typ]     NVARCHAR (20)  NOT NULL,
    [doc_typ_arg] NVARCHAR (100) NOT NULL,
    [rqdflg]      INT            DEFAULT ((0)) NULL,
    [moddte]      DATETIME       NULL,
    [mod_usr_id]  NVARCHAR (40)  NULL,
    CONSTRAINT [doc_typ_arg_pk] PRIMARY KEY CLUSTERED ([doc_typ] ASC, [doc_typ_arg] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [doctyparg_rqdflgck] CHECK ([rqdflg]=(0) OR [rqdflg]=(1))
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Holds the required arguments needed by each doc_typ to print.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'doc_typ_arg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Holds the document type.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'doc_typ_arg', @level2type = N'COLUMN', @level2name = N'doc_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Holds the argument which is assigned to the document type.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'doc_typ_arg', @level2type = N'COLUMN', @level2name = N'doc_typ_arg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Determines whether the argment field requires input data.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'doc_typ_arg', @level2type = N'COLUMN', @level2name = N'rqdflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Datetime Stamp of last change to row.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'doc_typ_arg', @level2type = N'COLUMN', @level2name = N'moddte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'ID of user that performed last modification.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'doc_typ_arg', @level2type = N'COLUMN', @level2name = N'mod_usr_id';

