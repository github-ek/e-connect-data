CREATE TABLE [dbo].[sl_ifd_seg] (
    [ifd_id]              NVARCHAR (30)  NOT NULL,
    [ifd_ver]             NVARCHAR (15)  NOT NULL,
    [ifd_seg_id]          NVARCHAR (30)  NOT NULL,
    [ifd_seg_rel_pos]     NUMERIC (5)    NULL,
    [ifd_seg_descr]       NVARCHAR (MAX) NULL,
    [ifd_seg_ordr]        NUMERIC (5)    NULL,
    [eo_id]               NVARCHAR (30)  NULL,
    [eo_ver]              NVARCHAR (15)  NULL,
    [eo_seg_id]           NVARCHAR (30)  NULL,
    [pre_alg_id]          NVARCHAR (30)  NULL,
    [post_alg_id]         NVARCHAR (30)  NULL,
    [parent_ifd_id]       NVARCHAR (30)  NULL,
    [parent_ifd_ver]      NVARCHAR (15)  NULL,
    [parent_ifd_seg_id]   NVARCHAR (30)  NULL,
    [blk_alg_id]          NVARCHAR (30)  NULL,
    [blk_alg_eval_cd]     NVARCHAR (5)   NULL,
    [proc_alg_id]         NVARCHAR (30)  NULL,
    [xml_use_seg_tag_flg] NVARCHAR (1)   NULL,
    [ifd_seg_tag]         NVARCHAR (60)  NULL,
    [sib_is_rel_flg]      NVARCHAR (1)   NULL,
    [u_version]           NUMERIC (5)    NULL,
    [ins_dt]              DATETIME       NULL,
    [ins_user_id]         NVARCHAR (40)  NULL,
    [last_upd_dt]         DATETIME       NULL,
    [last_upd_user_id]    NVARCHAR (40)  NULL,
    [sync_with_eo_flg]    NVARCHAR (1)   NULL,
    [ifd_seg_ol_attr_cd]  NVARCHAR (5)   NULL,
    CONSTRAINT [sl_ifd_seg_pk] PRIMARY KEY CLUSTERED ([ifd_id] ASC, [ifd_ver] ASC, [ifd_seg_id] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [sl_ifd_seg_fk_ifd] FOREIGN KEY ([ifd_id], [ifd_ver]) REFERENCES [dbo].[sl_ifd_def] ([ifd_id], [ifd_ver]) ON DELETE CASCADE,
    CONSTRAINT [sl_ifdsegfkalgblk] FOREIGN KEY ([blk_alg_id]) REFERENCES [dbo].[sl_alg_def] ([alg_id]),
    CONSTRAINT [sl_ifdsegfkalgpost] FOREIGN KEY ([post_alg_id]) REFERENCES [dbo].[sl_alg_def] ([alg_id]),
    CONSTRAINT [sl_ifdsegfkalgpre] FOREIGN KEY ([pre_alg_id]) REFERENCES [dbo].[sl_alg_def] ([alg_id]),
    CONSTRAINT [sl_ifdsegfkalgproc] FOREIGN KEY ([proc_alg_id]) REFERENCES [dbo].[sl_alg_def] ([alg_id]),
    CONSTRAINT [sl_ifdsegfkeoseg] FOREIGN KEY ([eo_id], [eo_ver], [eo_seg_id]) REFERENCES [dbo].[sl_eo_seg] ([eo_id], [eo_ver], [eo_seg_id]),
    CONSTRAINT [sl_ifdsegfkpifdseg] FOREIGN KEY ([parent_ifd_id], [parent_ifd_ver], [parent_ifd_seg_id]) REFERENCES [dbo].[sl_ifd_seg] ([ifd_id], [ifd_ver], [ifd_seg_id])
);


GO
CREATE NONCLUSTERED INDEX [sl_ifdsegfkalgblk]
    ON [dbo].[sl_ifd_seg]([blk_alg_id] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [sl_ifdsegfkalgpost]
    ON [dbo].[sl_ifd_seg]([post_alg_id] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [sl_ifdsegfkalgpre]
    ON [dbo].[sl_ifd_seg]([pre_alg_id] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [sl_ifdsegfkalgproc]
    ON [dbo].[sl_ifd_seg]([proc_alg_id] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [sl_ifdsegfkeoseg]
    ON [dbo].[sl_ifd_seg]([eo_id] ASC, [eo_ver] ASC, [eo_seg_id] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [sl_ifdsegfkpifdseg]
    ON [dbo].[sl_ifd_seg]([parent_ifd_id] ASC, [parent_ifd_ver] ASC, [parent_ifd_seg_id] ASC) WITH (FILLFACTOR = 90);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table defines an IFD Segment.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_seg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The IFD name', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_seg', @level2type = N'COLUMN', @level2name = N'ifd_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The IFD version', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_seg', @level2type = N'COLUMN', @level2name = N'ifd_ver';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The IFD segment name', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_seg', @level2type = N'COLUMN', @level2name = N'ifd_seg_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The IFD segment Rel. position', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_seg', @level2type = N'COLUMN', @level2name = N'ifd_seg_rel_pos';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The IFD segment description', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_seg', @level2type = N'COLUMN', @level2name = N'ifd_seg_descr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The IFD segment order', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_seg', @level2type = N'COLUMN', @level2name = N'ifd_seg_ordr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The event output name', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_seg', @level2type = N'COLUMN', @level2name = N'eo_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The event output version', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_seg', @level2type = N'COLUMN', @level2name = N'eo_ver';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The event output segment name', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_seg', @level2type = N'COLUMN', @level2name = N'eo_seg_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The algorithm runs before the IFD Segment is called', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_seg', @level2type = N'COLUMN', @level2name = N'pre_alg_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The algorithm runs after the IFD Segment is called', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_seg', @level2type = N'COLUMN', @level2name = N'post_alg_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The parent IFD name', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_seg', @level2type = N'COLUMN', @level2name = N'parent_ifd_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The parent IFD version', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_seg', @level2type = N'COLUMN', @level2name = N'parent_ifd_ver';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The parent IFD segment name', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_seg', @level2type = N'COLUMN', @level2name = N'parent_ifd_seg_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The blocking algorithm', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_seg', @level2type = N'COLUMN', @level2name = N'blk_alg_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The blocking algorithm evaluation type: B = If T returned then Block, S = If T returned then Send', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_seg', @level2type = N'COLUMN', @level2name = N'blk_alg_eval_cd';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The processing algorithm', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_seg', @level2type = N'COLUMN', @level2name = N'proc_alg_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Is using segment tag?', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_seg', @level2type = N'COLUMN', @level2name = N'xml_use_seg_tag_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The IFD segment tag', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_seg', @level2type = N'COLUMN', @level2name = N'ifd_seg_tag';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Is sibling related?', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_seg', @level2type = N'COLUMN', @level2name = N'sib_is_rel_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The version number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_seg', @level2type = N'COLUMN', @level2name = N'u_version';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Insert date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_seg', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User who created this record', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_seg', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Last update date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_seg', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User who performed the last update to the entry', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_seg', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Is sync with event output?', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_seg', @level2type = N'COLUMN', @level2name = N'sync_with_eo_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The IFD segment over-loaded attribute: XATTR = XML Attribute, XIGNR = XML Ignore, XTXTN = XML Text Node', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_seg', @level2type = N'COLUMN', @level2name = N'ifd_seg_ol_attr_cd';

