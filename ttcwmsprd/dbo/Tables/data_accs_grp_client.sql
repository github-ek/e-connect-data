CREATE TABLE [dbo].[data_accs_grp_client] (
    [accs_grp_nam]     NVARCHAR (40) NOT NULL,
    [client_id]        NVARCHAR (32) NOT NULL,
    [ins_dt]           DATETIME      NULL,
    [ins_user_id]      NVARCHAR (40) NULL,
    [last_upd_dt]      DATETIME      NULL,
    [last_upd_user_id] NVARCHAR (40) NULL,
    CONSTRAINT [dag_client_pk] PRIMARY KEY CLUSTERED ([accs_grp_nam] ASC, [client_id] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Associate a Data Access Group with an authorized client.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'data_accs_grp_client';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Access Group Name.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'data_accs_grp_client', @level2type = N'COLUMN', @level2name = N'accs_grp_nam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Client ID.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'data_accs_grp_client', @level2type = N'COLUMN', @level2name = N'client_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Insert Date.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'data_accs_grp_client', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Insert User ID.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'data_accs_grp_client', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Last Update Date.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'data_accs_grp_client', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Last Update User ID.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'data_accs_grp_client', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

