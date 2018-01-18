CREATE TABLE [dbo].[sl_alg_def_grp] (
    [alg_grp_id]          NVARCHAR (30)  NOT NULL,
    [alg_grp_descr]       NVARCHAR (250) NULL,
    [val_in_bnd_var_flg]  NVARCHAR (1)   NOT NULL,
    [val_out_bnd_var_flg] NVARCHAR (1)   NOT NULL,
    [u_version]           NUMERIC (5)    NULL,
    [ins_dt]              DATETIME       NULL,
    [last_upd_dt]         DATETIME       NULL,
    [ins_user_id]         NVARCHAR (40)  NULL,
    [last_upd_user_id]    NVARCHAR (40)  NULL,
    CONSTRAINT [sl_alg_def_grp_pk] PRIMARY KEY CLUSTERED ([alg_grp_id] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table defines an algorithm group.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_alg_def_grp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The algorithm group name', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_alg_def_grp', @level2type = N'COLUMN', @level2name = N'alg_grp_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The description of algorithm group', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_alg_def_grp', @level2type = N'COLUMN', @level2name = N'alg_grp_descr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The algorithm group contains in bind variable', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_alg_def_grp', @level2type = N'COLUMN', @level2name = N'val_in_bnd_var_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The algorithm group contains out bind variable', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_alg_def_grp', @level2type = N'COLUMN', @level2name = N'val_out_bnd_var_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The version number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_alg_def_grp', @level2type = N'COLUMN', @level2name = N'u_version';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Insert date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_alg_def_grp', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Last update date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_alg_def_grp', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User who created this record', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_alg_def_grp', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User who performed the last update to the entry', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_alg_def_grp', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

