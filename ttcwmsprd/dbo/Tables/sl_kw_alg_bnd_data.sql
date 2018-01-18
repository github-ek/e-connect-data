CREATE TABLE [dbo].[sl_kw_alg_bnd_data] (
    [kw_id]            NVARCHAR (30)  NOT NULL,
    [alg_id]           NVARCHAR (30)  NOT NULL,
    [in_bnd_var_id]    NVARCHAR (30)  NOT NULL,
    [bnd_data]         NVARCHAR (200) NULL,
    [u_version]        NUMERIC (5)    NULL,
    [ins_dt]           DATETIME       NULL,
    [last_upd_dt]      DATETIME       NULL,
    [ins_user_id]      NVARCHAR (40)  NULL,
    [last_upd_user_id] NVARCHAR (40)  NULL,
    CONSTRAINT [sl_kwalgbnddtpk] PRIMARY KEY CLUSTERED ([kw_id] ASC, [alg_id] ASC, [in_bnd_var_id] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [sl_kwalgbnddtfkkw] FOREIGN KEY ([kw_id]) REFERENCES [dbo].[sl_kw_def] ([kw_id]) ON DELETE CASCADE,
    CONSTRAINT [sl_walgbnddtfkalgi] FOREIGN KEY ([alg_id], [in_bnd_var_id]) REFERENCES [dbo].[sl_alg_in_bnd_var] ([alg_id], [in_bnd_var_id])
);


GO
CREATE NONCLUSTERED INDEX [sl_walgbnddtfkalgi]
    ON [dbo].[sl_kw_alg_bnd_data]([alg_id] ASC, [in_bnd_var_id] ASC) WITH (FILLFACTOR = 90);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table defines keyword bind variable data.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_kw_alg_bnd_data';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The keyword', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_kw_alg_bnd_data', @level2type = N'COLUMN', @level2name = N'kw_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The algorithm name', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_kw_alg_bnd_data', @level2type = N'COLUMN', @level2name = N'alg_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The input bind variable', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_kw_alg_bnd_data', @level2type = N'COLUMN', @level2name = N'in_bnd_var_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The bind variable data', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_kw_alg_bnd_data', @level2type = N'COLUMN', @level2name = N'bnd_data';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The update version', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_kw_alg_bnd_data', @level2type = N'COLUMN', @level2name = N'u_version';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Insert date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_kw_alg_bnd_data', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Last update date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_kw_alg_bnd_data', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User who created this record', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_kw_alg_bnd_data', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User who performed the last update to the entry', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_kw_alg_bnd_data', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

