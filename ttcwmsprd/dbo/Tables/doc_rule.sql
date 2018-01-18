CREATE TABLE [dbo].[doc_rule] (
    [doc_typ]    NVARCHAR (20) NOT NULL,
    [seqnum]     INT           NOT NULL,
    [docfmt]     NVARCHAR (30) NOT NULL,
    [docqty]     INT           DEFAULT ((1)) NOT NULL,
    [exitpnt]    NVARCHAR (15) NOT NULL,
    [devsrc]     NVARCHAR (40) NOT NULL,
    [docgrp]     NVARCHAR (10) NULL,
    [locale_typ] NVARCHAR (80) NULL,
    [locale_id]  NVARCHAR (20) NULL,
    [moddte]     DATETIME      NULL,
    [mod_usr_id] NVARCHAR (40) NULL,
    CONSTRAINT [doc_rule_pk] PRIMARY KEY CLUSTERED ([doc_typ] ASC, [seqnum] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The doc_rule table stores a lot of the configuration of the label compliance functionality.  The precedence, format, exit point, and number of copies are stored on this table.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'doc_rule';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Document Type - Holds the document type code.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'doc_rule', @level2type = N'COLUMN', @level2name = N'doc_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Sequence Number - Represents the precedence of this document type and entity.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'doc_rule', @level2type = N'COLUMN', @level2name = N'seqnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Document Format - Holds the format to be used for this particular document type and entity.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'doc_rule', @level2type = N'COLUMN', @level2name = N'docfmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Number of Copies - Print this number of copies for the chosen load level, default value is 1. (Example: Four pallet labels where load level is ''Load'')', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'doc_rule', @level2type = N'COLUMN', @level2name = N'docqty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Exit Point - Point during the order''s lifetime that printing may occur. (Examples: Pre-Pick, Staging and Load Stop.)', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'doc_rule', @level2type = N'COLUMN', @level2name = N'exitpnt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Device Source - This is the srcloc, dstloc, RF/Workstation or Report which determines the printer device.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'doc_rule', @level2type = N'COLUMN', @level2name = N'devsrc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Document Group - Represents the group to which this particular document type belongs.  When a doc_typ belongs to a docgrp, all formats of that group get printed.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'doc_rule', @level2type = N'COLUMN', @level2name = N'docgrp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicates the field on which the Locale has to be considered for printing the docuemnt .', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'doc_rule', @level2type = N'COLUMN', @level2name = N'locale_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Locale Id in which the document will be printed when nothing/Default is specified for locale_typ.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'doc_rule', @level2type = N'COLUMN', @level2name = N'locale_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date/time this record was last modified.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'doc_rule', @level2type = N'COLUMN', @level2name = N'moddte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'ID of user that performed last modification.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'doc_rule', @level2type = N'COLUMN', @level2name = N'mod_usr_id';

