CREATE TABLE [dbo].[sys_audit] (
    [auddte]    DATETIME        NULL,
    [usr_id]    NVARCHAR (40)   NULL,
    [appl_id]   NVARCHAR (40)   NULL,
    [tcpadr]    NVARCHAR (45)   NULL,
    [aud_typ]   NVARCHAR (1)    NULL,
    [ret_sts]   INT             NULL,
    [exec_rows] INT             NULL,
    [exec_cmd]  NVARCHAR (4000) NULL
);


GO
CREATE NONCLUSTERED INDEX [sys_audit_auddte]
    ON [dbo].[sys_audit]([auddte] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [sys_audit_usr_id]
    ON [dbo].[sys_audit]([usr_id] ASC, [appl_id] ASC, [aud_typ] ASC) WITH (FILLFACTOR = 90);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table logs audit information for interactive auditing.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sys_audit';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date this operation was performed.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sys_audit', @level2type = N'COLUMN', @level2name = N'auddte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Sysetm user id for the user that performed the operation.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sys_audit', @level2type = N'COLUMN', @level2name = N'usr_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Application identifier for the client compoment that performed the operation being audited.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sys_audit', @level2type = N'COLUMN', @level2name = N'appl_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'TCP address of the client from where the operation was performed.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sys_audit', @level2type = N'COLUMN', @level2name = N'tcpadr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Used to indicate the type of audit records. Current known types: I - Interactve,
    U - User Authentication', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sys_audit', @level2type = N'COLUMN', @level2name = N'aud_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Return status of the operation.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sys_audit', @level2type = N'COLUMN', @level2name = N'ret_sts';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Rows affected by the operation or returned to the client.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sys_audit', @level2type = N'COLUMN', @level2name = N'exec_rows';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Executed command/operation.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sys_audit', @level2type = N'COLUMN', @level2name = N'exec_cmd';

