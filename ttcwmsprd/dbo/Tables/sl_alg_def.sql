CREATE TABLE [dbo].[sl_alg_def] (
    [alg_id]               NVARCHAR (30)  NOT NULL,
    [alg_grp_id]           NVARCHAR (30)  NULL,
    [alg_typ_cd]           NVARCHAR (5)   NOT NULL,
    [alg_descr]            NVARCHAR (250) NULL,
    [need_evt_flg]         NVARCHAR (1)   NOT NULL,
    [need_evt_arg_flg]     NVARCHAR (1)   NOT NULL,
    [need_next_eo_seg_flg] NVARCHAR (1)   NOT NULL,
    [need_this_eo_seg_flg] NVARCHAR (1)   NOT NULL,
    [var_arg_list_flg]     NVARCHAR (1)   NOT NULL,
    [overstack_arg_flg]    NVARCHAR (1)   NOT NULL,
    [always_local_flg]     NVARCHAR (1)   NULL,
    [code]                 NVARCHAR (MAX) NULL,
    [code_len]             NUMERIC (8)    NULL,
    [u_version]            NUMERIC (5)    NULL,
    [ins_dt]               DATETIME       NULL,
    [last_upd_dt]          DATETIME       NULL,
    [ins_user_id]          NVARCHAR (40)  NULL,
    [last_upd_user_id]     NVARCHAR (40)  NULL,
    CONSTRAINT [sl_alg_def_pk] PRIMARY KEY CLUSTERED ([alg_id] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [sl_alg_def_fk_grp] FOREIGN KEY ([alg_grp_id]) REFERENCES [dbo].[sl_alg_def_grp] ([alg_grp_id])
);


GO
CREATE NONCLUSTERED INDEX [sl_alg_def_fk_grp]
    ON [dbo].[sl_alg_def]([alg_grp_id] ASC) WITH (FILLFACTOR = 90);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table defines an algorithm to define MOCA local syntax/PL SQL code to be execute by the Integrator.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_alg_def';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The algorithm name', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_alg_def', @level2type = N'COLUMN', @level2name = N'alg_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The algorithm group name', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_alg_def', @level2type = N'COLUMN', @level2name = N'alg_grp_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The algorithm type: MOCA = MOCA Callable, PLSQL = PL/SQL', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_alg_def', @level2type = N'COLUMN', @level2name = N'alg_typ_cd';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The description of algorithm', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_alg_def', @level2type = N'COLUMN', @level2name = N'alg_descr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Need Event data for PL/SQL', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_alg_def', @level2type = N'COLUMN', @level2name = N'need_evt_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Need Event Argument data for PL/SQL', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_alg_def', @level2type = N'COLUMN', @level2name = N'need_evt_arg_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Need next Event Output Segment data for PL/SQL', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_alg_def', @level2type = N'COLUMN', @level2name = N'need_next_eo_seg_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Need this Event Output Segment data for PL/SQL', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_alg_def', @level2type = N'COLUMN', @level2name = N'need_this_eo_seg_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Use variable argument list for Local Syntax', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_alg_def', @level2type = N'COLUMN', @level2name = N'var_arg_list_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Use overstack arguments <<OVERSTACKED_ARGS>> for Local Syntax', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_alg_def', @level2type = N'COLUMN', @level2name = N'overstack_arg_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Always execute algorithm locally', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_alg_def', @level2type = N'COLUMN', @level2name = N'always_local_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The algorithm code', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_alg_def', @level2type = N'COLUMN', @level2name = N'code';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The length of algorithm code', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_alg_def', @level2type = N'COLUMN', @level2name = N'code_len';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The version number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_alg_def', @level2type = N'COLUMN', @level2name = N'u_version';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Insert date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_alg_def', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Last update date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_alg_def', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User who created this record', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_alg_def', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User who performed the last update to the entry', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_alg_def', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

