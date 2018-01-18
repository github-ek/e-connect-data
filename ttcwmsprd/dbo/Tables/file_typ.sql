CREATE TABLE [dbo].[file_typ] (
    [file_typ]         NVARCHAR (10) NOT NULL,
    [file_cat]         NVARCHAR (10) NOT NULL,
    [ins_dt]           DATETIME      NULL,
    [last_upd_dt]      DATETIME      NULL,
    [ins_user_id]      NVARCHAR (40) NULL,
    [last_upd_user_id] NVARCHAR (40) NULL,
    CONSTRAINT [file_typ_pk] PRIMARY KEY CLUSTERED ([file_typ] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The file_typ table is the table that defines the valid file types supported in the system. Each file type will have a file category that is used to give a general classification of the file', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'file_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Unique key for file type (Example:avi,jpg, etc.)', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'file_typ', @level2type = N'COLUMN', @level2name = N'file_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'File category used to put each of the file types into a general category (Example: IMAGE,AUDIO,VIDEO)', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'file_typ', @level2type = N'COLUMN', @level2name = N'file_cat';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was inserted', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'file_typ', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was last updated', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'file_typ', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who created the row', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'file_typ', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'file_typ', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

