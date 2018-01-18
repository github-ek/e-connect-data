CREATE TABLE [dbo].[manfst_dtl] (
    [crtnid]           NVARCHAR (30)  NOT NULL,
    [varnam]           NVARCHAR (100) NOT NULL,
    [vartyp]           NVARCHAR (1)   NOT NULL,
    [varcod]           NVARCHAR (250) NULL,
    [ins_dt]           DATETIME       NULL,
    [last_upd_dt]      DATETIME       NULL,
    [ins_user_id]      NVARCHAR (40)  NULL,
    [last_upd_user_id] NVARCHAR (40)  NULL,
    CONSTRAINT [manfst_dtl_pk] PRIMARY KEY CLUSTERED ([crtnid] ASC, [varnam] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table is being added to store the information for re-manifest.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'manfst_dtl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This is a foreign key which point to crtn_id of table manfst. It indicates which carton this value belongs to and is used for re-manifesting automatically voided packages.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'manfst_dtl', @level2type = N'COLUMN', @level2name = N'crtnid';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The name of this variable. It will be used in the construction of name-value list for the parameters of re-manifest.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'manfst_dtl', @level2type = N'COLUMN', @level2name = N'varnam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The type of this variable. It would be ''I'' for integer, ''S'' for string and ''L'' for the carrier service parameter list. For variable of type L, we will join them into one parameter for the re-manifest.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'manfst_dtl', @level2type = N'COLUMN', @level2name = N'vartyp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The value of this variable. It will be used in the construction of name-value list for the parameters of re-manifest.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'manfst_dtl', @level2type = N'COLUMN', @level2name = N'varcod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was inserted', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'manfst_dtl', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was last updated', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'manfst_dtl', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who created the row', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'manfst_dtl', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'manfst_dtl', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

