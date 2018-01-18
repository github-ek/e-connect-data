CREATE TABLE [dbo].[sl_eo_seg] (
    [eo_id]            NVARCHAR (30)  NOT NULL,
    [eo_ver]           NVARCHAR (15)  NOT NULL,
    [eo_seg_id]        NVARCHAR (30)  NOT NULL,
    [eo_seg_descr]     NVARCHAR (250) NULL,
    [parent_eo_id]     NVARCHAR (30)  NULL,
    [parent_eo_ver]    NVARCHAR (15)  NULL,
    [parent_eo_seg_id] NVARCHAR (30)  NULL,
    [blk_alg_id]       NVARCHAR (30)  NULL,
    [blk_alg_eval_cd]  NVARCHAR (5)   NULL,
    [retr_mthd_id]     NVARCHAR (30)  NULL,
    [eo_seg_ordr]      NUMERIC (5)    NULL,
    [u_version]        NUMERIC (5)    NULL,
    [ins_dt]           DATETIME       NULL,
    [last_upd_dt]      DATETIME       NULL,
    [ins_user_id]      NVARCHAR (40)  NULL,
    [last_upd_user_id] NVARCHAR (40)  NULL,
    CONSTRAINT [sl_eo_seg_pk] PRIMARY KEY CLUSTERED ([eo_id] ASC, [eo_ver] ASC, [eo_seg_id] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [sl_eo_seg_fk_eo] FOREIGN KEY ([eo_id], [eo_ver]) REFERENCES [dbo].[sl_eo_def] ([eo_id], [eo_ver]),
    CONSTRAINT [sl_eo_seg_fk_rm] FOREIGN KEY ([retr_mthd_id]) REFERENCES [dbo].[sl_retr_mthd_def] ([retr_mthd_id]),
    CONSTRAINT [sl_eosegfkpeoseg] FOREIGN KEY ([parent_eo_id], [parent_eo_ver], [parent_eo_seg_id]) REFERENCES [dbo].[sl_eo_seg] ([eo_id], [eo_ver], [eo_seg_id])
);


GO
CREATE NONCLUSTERED INDEX [sl_eosegfkpeoseg]
    ON [dbo].[sl_eo_seg]([parent_eo_id] ASC, [parent_eo_ver] ASC, [parent_eo_seg_id] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [sl_eo_seg_fk_rm]
    ON [dbo].[sl_eo_seg]([retr_mthd_id] ASC) WITH (FILLFACTOR = 90);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table defines event output segments.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_eo_seg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) Event output name', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_eo_seg', @level2type = N'COLUMN', @level2name = N'eo_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) Event output version', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_eo_seg', @level2type = N'COLUMN', @level2name = N'eo_ver';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'EO segment name', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_eo_seg', @level2type = N'COLUMN', @level2name = N'eo_seg_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The description of EO segment', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_eo_seg', @level2type = N'COLUMN', @level2name = N'eo_seg_descr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The parent event output name', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_eo_seg', @level2type = N'COLUMN', @level2name = N'parent_eo_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The parent event output version', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_eo_seg', @level2type = N'COLUMN', @level2name = N'parent_eo_ver';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The parent EO segment name', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_eo_seg', @level2type = N'COLUMN', @level2name = N'parent_eo_seg_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Block algorithm name', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_eo_seg', @level2type = N'COLUMN', @level2name = N'blk_alg_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The type of block algorithm: B = If T returned then Block, S = If T returned then Send', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_eo_seg', @level2type = N'COLUMN', @level2name = N'blk_alg_eval_cd';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) Retrieve method name', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_eo_seg', @level2type = N'COLUMN', @level2name = N'retr_mthd_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'EO segment order', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_eo_seg', @level2type = N'COLUMN', @level2name = N'eo_seg_ordr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The version number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_eo_seg', @level2type = N'COLUMN', @level2name = N'u_version';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Insert date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_eo_seg', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Last update date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_eo_seg', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User who created this record', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_eo_seg', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User who performed the last update to the entry', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_eo_seg', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

