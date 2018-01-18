CREATE TABLE [dbo].[pmsn_role_assoc] (
    [pmsn_id]   NVARCHAR (20) NOT NULL,
    [role_id]   NVARCHAR (20) NOT NULL,
    [pmsn_mask] INT           NOT NULL,
    CONSTRAINT [pmsn_role_assoc_pk] PRIMARY KEY CLUSTERED ([pmsn_id] ASC, [role_id] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table lists the permissions assigned to a role.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pmsn_role_assoc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Permission ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pmsn_role_assoc', @level2type = N'COLUMN', @level2name = N'pmsn_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Role ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pmsn_role_assoc', @level2type = N'COLUMN', @level2name = N'role_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Permission mask', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pmsn_role_assoc', @level2type = N'COLUMN', @level2name = N'pmsn_mask';

