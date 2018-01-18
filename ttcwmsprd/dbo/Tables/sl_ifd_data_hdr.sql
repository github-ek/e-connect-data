CREATE TABLE [dbo].[sl_ifd_data_hdr] (
    [ifd_data_seq]      NUMERIC (12)   NOT NULL,
    [evt_data_seq]      NUMERIC (12)   NULL,
    [ifd_id]            NVARCHAR (30)  NULL,
    [ifd_ver]           NVARCHAR (15)  NULL,
    [sys_id]            NVARCHAR (30)  NULL,
    [cre_dt]            DATETIME       NOT NULL,
    [cre_ts]            NUMERIC (20)   NULL,
    [cmpl_dt]           DATETIME       NULL,
    [cmpl_ts]           NUMERIC (20)   NULL,
    [snd_dt]            DATETIME       NULL,
    [snd_ts]            NUMERIC (20)   NULL,
    [dwnld_seq]         NUMERIC (12)   NULL,
    [commit_ctxt_idseq] NUMERIC (12)   NULL,
    [ifd_action]        NVARCHAR (5)   NULL,
    [ifd_action_cd]     NVARCHAR (5)   NULL,
    [nonrec_key]        NVARCHAR (100) NULL,
    [work_user_id]      NVARCHAR (40)  NULL,
    [proc_err_flg]      NVARCHAR (1)   NULL,
    [comm_cmnt]         NVARCHAR (100) NULL,
    [ins_dt]            DATETIME       NULL,
    [last_upd_dt]       DATETIME       NULL,
    [ins_user_id]       NVARCHAR (40)  NULL,
    [last_upd_user_id]  NVARCHAR (40)  NULL,
    [modified_flg]      NVARCHAR (1)   NULL,
    [tid]               NVARCHAR (24)  NULL,
    CONSTRAINT [sl_ifd_data_hdr_pk] PRIMARY KEY CLUSTERED ([ifd_data_seq] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [sl_ifddthdrfkdld] FOREIGN KEY ([dwnld_seq]) REFERENCES [dbo].[sl_dwnld] ([dwnld_seq]) ON DELETE CASCADE,
    CONSTRAINT [sl_ifddthdrfkevtd] FOREIGN KEY ([evt_data_seq]) REFERENCES [dbo].[sl_evt_data] ([evt_data_seq]) ON DELETE CASCADE,
    CONSTRAINT [sl_ifddthdrfktid] FOREIGN KEY ([tid], [sys_id]) REFERENCES [dbo].[sl_tid_cnt] ([tid], [sys_id])
);


GO
CREATE NONCLUSTERED INDEX [sl_dthdrskevtsysid]
    ON [dbo].[sl_ifd_data_hdr]([evt_data_seq] ASC, [sys_id] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [sl_fddthdrskdldseq]
    ON [dbo].[sl_ifd_data_hdr]([dwnld_seq] ASC, [work_user_id] ASC, [proc_err_flg] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [sl_fddthdrsknonrec]
    ON [dbo].[sl_ifd_data_hdr]([nonrec_key] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [sl_ifddthdrfktid]
    ON [dbo].[sl_ifd_data_hdr]([tid] ASC, [sys_id] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [sl_ifddthdrskcmit]
    ON [dbo].[sl_ifd_data_hdr]([commit_ctxt_idseq] ASC, [dwnld_seq] ASC, [ifd_data_seq] ASC, [ifd_id] ASC, [ifd_ver] ASC, [evt_data_seq] ASC, [work_user_id] ASC, [proc_err_flg] ASC) WITH (FILLFACTOR = 90);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table contains instances of data for an IFD.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_data_hdr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The IFD data sequence', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_data_hdr', @level2type = N'COLUMN', @level2name = N'ifd_data_seq';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The event data sequence', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_data_hdr', @level2type = N'COLUMN', @level2name = N'evt_data_seq';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The IFD name', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_data_hdr', @level2type = N'COLUMN', @level2name = N'ifd_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The IFD version', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_data_hdr', @level2type = N'COLUMN', @level2name = N'ifd_ver';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The system name', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_data_hdr', @level2type = N'COLUMN', @level2name = N'sys_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Create date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_data_hdr', @level2type = N'COLUMN', @level2name = N'cre_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Create time stamp', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_data_hdr', @level2type = N'COLUMN', @level2name = N'cre_ts';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Complete date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_data_hdr', @level2type = N'COLUMN', @level2name = N'cmpl_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Complete time stamp', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_data_hdr', @level2type = N'COLUMN', @level2name = N'cmpl_ts';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Send date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_data_hdr', @level2type = N'COLUMN', @level2name = N'snd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Send time stamp', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_data_hdr', @level2type = N'COLUMN', @level2name = N'snd_ts';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The download sequence (only for instance of inbound IFD)', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_data_hdr', @level2type = N'COLUMN', @level2name = N'dwnld_seq';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The commit context ID sequence (only for instance of inbound IFD)', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_data_hdr', @level2type = N'COLUMN', @level2name = N'commit_ctxt_idseq';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The IFD action (only for instance of inbound IFD)', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_data_hdr', @level2type = N'COLUMN', @level2name = N'ifd_action';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The IFD action code type (only for instance of inbound IFD): MISS = Missing/Disabled Action, PROC = Processed Action', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_data_hdr', @level2type = N'COLUMN', @level2name = N'ifd_action_cd';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The Non-recursive key (not currently used)', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_data_hdr', @level2type = N'COLUMN', @level2name = N'nonrec_key';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) User who working on this IFD', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_data_hdr', @level2type = N'COLUMN', @level2name = N'work_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Is process error?', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_data_hdr', @level2type = N'COLUMN', @level2name = N'proc_err_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Communication Comments', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_data_hdr', @level2type = N'COLUMN', @level2name = N'comm_cmnt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Insert date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_data_hdr', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Last update date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_data_hdr', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User who created this record', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_data_hdr', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User who performed the last update to the entry', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_data_hdr', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Is IFD data header modified?', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_data_hdr', @level2type = N'COLUMN', @level2name = N'modified_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Optional transaction communication identifier, for duplicate checking', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_data_hdr', @level2type = N'COLUMN', @level2name = N'tid';

