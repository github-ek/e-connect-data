CREATE TABLE [dbo].[les_usr_pswd_hst] (
    [usr_id]     NVARCHAR (40)  NOT NULL,
    [chg_dte]    DATETIME       NOT NULL,
    [usr_pswd]   NVARCHAR (128) NOT NULL,
    [mod_usr_id] NVARCHAR (40)  NULL,
    CONSTRAINT [les_usr_pwd_hst_pk] PRIMARY KEY CLUSTERED ([usr_id] ASC, [chg_dte] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table stores the past passwords for each user.  It is used to ensure no password repeats.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_usr_pswd_hst';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Part of the unique identifier.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_usr_pswd_hst', @level2type = N'COLUMN', @level2name = N'usr_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date and time when the password was changed.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_usr_pswd_hst', @level2type = N'COLUMN', @level2name = N'chg_dte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The new password value.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_usr_pswd_hst', @level2type = N'COLUMN', @level2name = N'usr_pswd';

