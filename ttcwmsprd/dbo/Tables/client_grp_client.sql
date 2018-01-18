CREATE TABLE [dbo].[client_grp_client] (
    [client_grp]       NVARCHAR (32) NOT NULL,
    [client_id]        NVARCHAR (32) NOT NULL,
    [u_version]        INT           NULL,
    [ins_dt]           DATETIME      NULL,
    [last_upd_dt]      DATETIME      NULL,
    [ins_user_id]      NVARCHAR (40) NULL,
    [last_upd_user_id] NVARCHAR (40) NULL,
    CONSTRAINT [clnt_grp_clnt_pk] PRIMARY KEY CLUSTERED ([client_grp] ASC, [client_id] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Association of a client to a client group', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'client_grp_client';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(PK,FK,Required) Identifying name of client group', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'client_grp_client', @level2type = N'COLUMN', @level2name = N'client_grp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(PK,FK,Required) Client identifier.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'client_grp_client', @level2type = N'COLUMN', @level2name = N'client_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Generation Number (used for optimistic locking).', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'client_grp_client', @level2type = N'COLUMN', @level2name = N'u_version';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date of the create.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'client_grp_client', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date of the last update.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'client_grp_client', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User ID of the user that created the record.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'client_grp_client', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User ID of the user that last modified the record.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'client_grp_client', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

