CREATE TABLE [dbo].[sl_comm_mthd_attr] (
    [comm_mthd_id]         NVARCHAR (30)  NOT NULL,
    [comm_mthd_attr]       NVARCHAR (30)  NOT NULL,
    [comm_mthd_attr_descr] NVARCHAR (250) NULL,
    [in_bnd_var_id]        NVARCHAR (30)  NULL,
    [alg_id]               NVARCHAR (30)  NULL,
    [u_version]            NUMERIC (5)    NULL,
    [ins_dt]               DATETIME       NULL,
    [last_upd_dt]          DATETIME       NULL,
    [ins_user_id]          NVARCHAR (40)  NULL,
    [last_upd_user_id]     NVARCHAR (40)  NULL,
    CONSTRAINT [sl_cmmdatpk] PRIMARY KEY CLUSTERED ([comm_mthd_id] ASC, [comm_mthd_attr] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [sl_cmmdatfkalgib] FOREIGN KEY ([alg_id], [in_bnd_var_id]) REFERENCES [dbo].[sl_alg_in_bnd_var] ([alg_id], [in_bnd_var_id]),
    CONSTRAINT [sl_cmmdatfkcm] FOREIGN KEY ([comm_mthd_id]) REFERENCES [dbo].[sl_comm_mthd_def] ([comm_mthd_id]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [sl_cmmdatfkalgib]
    ON [dbo].[sl_comm_mthd_attr]([alg_id] ASC, [in_bnd_var_id] ASC) WITH (FILLFACTOR = 90);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table defines communication method attribute.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_comm_mthd_attr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The communication method name', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_comm_mthd_attr', @level2type = N'COLUMN', @level2name = N'comm_mthd_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The communication method attribute name', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_comm_mthd_attr', @level2type = N'COLUMN', @level2name = N'comm_mthd_attr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The description of communication method attribute', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_comm_mthd_attr', @level2type = N'COLUMN', @level2name = N'comm_mthd_attr_descr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The bind variable name of communication method attribute', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_comm_mthd_attr', @level2type = N'COLUMN', @level2name = N'in_bnd_var_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The algorithm which is called by communication method attribute', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_comm_mthd_attr', @level2type = N'COLUMN', @level2name = N'alg_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The version number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_comm_mthd_attr', @level2type = N'COLUMN', @level2name = N'u_version';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Insert date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_comm_mthd_attr', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Last update date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_comm_mthd_attr', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User who created this record', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_comm_mthd_attr', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User who performed the last update to the entry', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_comm_mthd_attr', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

