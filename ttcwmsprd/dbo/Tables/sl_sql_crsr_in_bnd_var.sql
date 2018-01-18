CREATE TABLE [dbo].[sl_sql_crsr_in_bnd_var] (
    [retr_mthd_id]         NVARCHAR (30)  NOT NULL,
    [retr_mthd_impl_genid] NVARCHAR (100) NOT NULL,
    [in_bnd_var]           NVARCHAR (30)  NOT NULL,
    [u_version]            NUMERIC (5)    NULL,
    [ins_dt]               DATETIME       NULL,
    [last_upd_dt]          DATETIME       NULL,
    [ins_user_id]          NVARCHAR (40)  NULL,
    [last_upd_user_id]     NVARCHAR (40)  NULL,
    CONSTRAINT [sl_lcrsrinbndvarpk] PRIMARY KEY CLUSTERED ([retr_mthd_id] ASC, [retr_mthd_impl_genid] ASC, [in_bnd_var] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [sl_srinbndvarfkrmi] FOREIGN KEY ([retr_mthd_id], [retr_mthd_impl_genid]) REFERENCES [dbo].[sl_retr_mthd_impl_def] ([retr_mthd_id], [retr_mthd_impl_genid]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [sl_srinbndvarfkrmi]
    ON [dbo].[sl_sql_crsr_in_bnd_var]([retr_mthd_impl_genid] ASC, [retr_mthd_id] ASC) WITH (FILLFACTOR = 90);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table defines SQL cursor bind variable for retrieve method.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_sql_crsr_in_bnd_var';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The retrieve method name', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_sql_crsr_in_bnd_var', @level2type = N'COLUMN', @level2name = N'retr_mthd_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The retrieve method implementation identifier', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_sql_crsr_in_bnd_var', @level2type = N'COLUMN', @level2name = N'retr_mthd_impl_genid';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The input bind variable', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_sql_crsr_in_bnd_var', @level2type = N'COLUMN', @level2name = N'in_bnd_var';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The version number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_sql_crsr_in_bnd_var', @level2type = N'COLUMN', @level2name = N'u_version';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Insert date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_sql_crsr_in_bnd_var', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Last update date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_sql_crsr_in_bnd_var', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User who created this record', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_sql_crsr_in_bnd_var', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User who performed the last update to the entry', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_sql_crsr_in_bnd_var', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

