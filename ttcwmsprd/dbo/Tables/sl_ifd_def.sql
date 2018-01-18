CREATE TABLE [dbo].[sl_ifd_def] (
    [ifd_id]               NVARCHAR (30)  NOT NULL,
    [ifd_ver]              NVARCHAR (15)  NOT NULL,
    [ifd_descr]            NVARCHAR (MAX) NULL,
    [ifd_typ_cd]           NVARCHAR (5)   NOT NULL,
    [data_lay_id]          NVARCHAR (30)  NULL,
    [ifd_grp_id]           NVARCHAR (30)  NOT NULL,
    [eo_id]                NVARCHAR (30)  NULL,
    [eo_ver]               NVARCHAR (15)  NULL,
    [root_seg_rpt_brk_flg] NVARCHAR (1)   NOT NULL,
    [recursive_flg]        NVARCHAR (1)   NOT NULL,
    [post_alg_id]          NVARCHAR (30)  NULL,
    [pre_alg_id]           NVARCHAR (30)  NULL,
    [ifd_tag]              NVARCHAR (60)  NULL,
    [post_proc_flg]        NVARCHAR (1)   NULL,
    [u_version]            NUMERIC (5)    NULL,
    [ins_dt]               DATETIME       NULL,
    [last_upd_dt]          DATETIME       NULL,
    [ins_user_id]          NVARCHAR (40)  NULL,
    [last_upd_user_id]     NVARCHAR (40)  NULL,
    CONSTRAINT [sl_ifd_def_pk] PRIMARY KEY CLUSTERED ([ifd_id] ASC, [ifd_ver] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [sl_ifd_def_fk_eo] FOREIGN KEY ([eo_id], [eo_ver]) REFERENCES [dbo].[sl_eo_def] ([eo_id], [eo_ver]),
    CONSTRAINT [sl_ifd_def_fk_grp] FOREIGN KEY ([ifd_grp_id]) REFERENCES [dbo].[sl_ifd_def_grp] ([ifd_grp_id]),
    CONSTRAINT [sl_ifddeffkalgpost] FOREIGN KEY ([pre_alg_id]) REFERENCES [dbo].[sl_alg_def] ([alg_id]),
    CONSTRAINT [sl_ifddeffkalgpre] FOREIGN KEY ([post_alg_id]) REFERENCES [dbo].[sl_alg_def] ([alg_id]),
    CONSTRAINT [sl_ifddeffkdatalay] FOREIGN KEY ([data_lay_id]) REFERENCES [dbo].[sl_data_layout] ([data_lay_id])
);


GO
CREATE NONCLUSTERED INDEX [sl_ifddeffkalgpost]
    ON [dbo].[sl_ifd_def]([post_alg_id] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [sl_ifddeffkalgpre]
    ON [dbo].[sl_ifd_def]([pre_alg_id] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [sl_ifddeffkdatalay]
    ON [dbo].[sl_ifd_def]([data_lay_id] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [sl_ifd_def_fk_eo]
    ON [dbo].[sl_ifd_def]([eo_id] ASC, [eo_ver] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [sl_ifd_def_fk_grp]
    ON [dbo].[sl_ifd_def]([ifd_grp_id] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [sl_ifd_def_ifd_tag]
    ON [dbo].[sl_ifd_def]([ifd_tag] ASC) WITH (FILLFACTOR = 90);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table defines an IFD.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_def';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The IFD name', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_def', @level2type = N'COLUMN', @level2name = N'ifd_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The IFD version', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_def', @level2type = N'COLUMN', @level2name = N'ifd_ver';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The IFD description', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_def', @level2type = N'COLUMN', @level2name = N'ifd_descr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The IFD type code: I = Inbound IFD, O = Result IFD', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_def', @level2type = N'COLUMN', @level2name = N'ifd_typ_cd';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The data layout ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_def', @level2type = N'COLUMN', @level2name = N'data_lay_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The IFD group name', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_def', @level2type = N'COLUMN', @level2name = N'ifd_grp_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The event output name (only for result IFD)', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_def', @level2type = N'COLUMN', @level2name = N'eo_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The event output version (only for result IFD)', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_def', @level2type = N'COLUMN', @level2name = N'eo_ver';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Break if root segment repeats', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_def', @level2type = N'COLUMN', @level2name = N'root_seg_rpt_brk_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Is recursive?', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_def', @level2type = N'COLUMN', @level2name = N'recursive_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The algorithm runs after the IFD is created', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_def', @level2type = N'COLUMN', @level2name = N'post_alg_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The algorithm runs before the IFD is created', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_def', @level2type = N'COLUMN', @level2name = N'pre_alg_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The IFD tag', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_def', @level2type = N'COLUMN', @level2name = N'ifd_tag';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Is perform post-processing?', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_def', @level2type = N'COLUMN', @level2name = N'post_proc_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The version number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_def', @level2type = N'COLUMN', @level2name = N'u_version';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Insert date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_def', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Last update date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_def', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User who created this record', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_def', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User who performed the last update to the entry', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_def', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

