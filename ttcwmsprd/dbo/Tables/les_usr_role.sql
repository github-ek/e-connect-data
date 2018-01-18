CREATE TABLE [dbo].[les_usr_role] (
    [usr_id]   NVARCHAR (40) NOT NULL,
    [role_id]  NVARCHAR (20) NOT NULL,
    [ldap_flg] INT           NULL,
    [grp_nam]  NVARCHAR (40) NULL,
    CONSTRAINT [les_usr_role_pk] PRIMARY KEY CLUSTERED ([usr_id] ASC, [role_id] ASC) WITH (FILLFACTOR = 90)
);


GO
CREATE NONCLUSTERED INDEX [les_usr_role_ldapflg]
    ON [dbo].[les_usr_role]([ldap_flg] ASC) WITH (FILLFACTOR = 90);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table lists the roles for a user.  Please note, this table is not the only source of role assignments.  If a system is enabled to use LDAP Authorization, the LDAP system could have users assigned roles .', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_usr_role';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Part of the unique identifier', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_usr_role', @level2type = N'COLUMN', @level2name = N'usr_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Part of the unique identifier', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_usr_role', @level2type = N'COLUMN', @level2name = N'role_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Identifies if this role is a cached role from an ldap authorization model', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_usr_role', @level2type = N'COLUMN', @level2name = N'ldap_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Specifies which product group was responsible for loading this data row.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_usr_role', @level2type = N'COLUMN', @level2name = N'grp_nam';

