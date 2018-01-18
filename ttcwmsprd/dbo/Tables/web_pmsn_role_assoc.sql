CREATE TABLE [dbo].[web_pmsn_role_assoc] (
    [pmsn_id] NVARCHAR (20) NOT NULL,
    [role_id] NVARCHAR (20) NOT NULL,
    CONSTRAINT [web_pmn_rl_asoc_pk] PRIMARY KEY CLUSTERED ([pmsn_id] ASC, [role_id] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Waffle Framework Custom Permission Role Association table.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'web_pmsn_role_assoc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Permission ID.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'web_pmsn_role_assoc', @level2type = N'COLUMN', @level2name = N'pmsn_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Role ID of authorized role for defined permission.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'web_pmsn_role_assoc', @level2type = N'COLUMN', @level2name = N'role_id';

