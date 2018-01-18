CREATE TABLE [dbo].[invsts_role] (
    [invsts_role_id] INT           NOT NULL,
    [role_id]        NVARCHAR (20) NOT NULL,
    [frm_invsts]     NVARCHAR (4)  NOT NULL,
    [to_invsts]      NVARCHAR (4)  NOT NULL,
    [ins_dt]         DATETIME      NULL,
    [ins_user_id]    NVARCHAR (40) NULL,
    [moddte]         DATETIME      NULL,
    [mod_usr_id]     NVARCHAR (40) NULL,
    CONSTRAINT [invsts_role_pk] PRIMARY KEY CLUSTERED ([invsts_role_id] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table will be used to store allowable inventory status changes for roles', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invsts_role';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A unique identifier for inventory status roles', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invsts_role', @level2type = N'COLUMN', @level2name = N'invsts_role_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'ID assigned to a particular user', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invsts_role', @level2type = N'COLUMN', @level2name = N'role_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'From inventory status', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invsts_role', @level2type = N'COLUMN', @level2name = N'frm_invsts';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'To inventory status', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invsts_role', @level2type = N'COLUMN', @level2name = N'to_invsts';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was inserted', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invsts_role', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who created the row', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invsts_role', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who modified the row most recently', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invsts_role', @level2type = N'COLUMN', @level2name = N'mod_usr_id';

