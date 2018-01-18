CREATE TABLE [dbo].[client_grp] (
    [client_grp]       NVARCHAR (32)   NOT NULL,
    [adj_thr_cst]      NUMERIC (19, 4) NULL,
    [adj_thr_unit]     INT             NULL,
    [u_version]        INT             NULL,
    [ins_dt]           DATETIME        NULL,
    [last_upd_dt]      DATETIME        NULL,
    [ins_user_id]      NVARCHAR (40)   NULL,
    [last_upd_user_id] NVARCHAR (40)   NULL,
    CONSTRAINT [client_grp_pk] PRIMARY KEY CLUSTERED ([client_grp] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A grouping of clients used for configuration purposes', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'client_grp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(PK,Required) Identifying name of client group', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'client_grp', @level2type = N'COLUMN', @level2name = N'client_grp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Client group threshold cost value - This is the maximum value of an adjustment that will be allowed without requiring approval by supervisor.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'client_grp', @level2type = N'COLUMN', @level2name = N'adj_thr_cst';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Client group threshold unit value - This is the maximum value of an adjustment that will be allowed without requiring approval by supervisor.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'client_grp', @level2type = N'COLUMN', @level2name = N'adj_thr_unit';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Generation Number (used for optimistic locking).', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'client_grp', @level2type = N'COLUMN', @level2name = N'u_version';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date of the create.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'client_grp', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date of the last update.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'client_grp', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User ID of the user that created the record.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'client_grp', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User ID of the user that last modified the record.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'client_grp', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

