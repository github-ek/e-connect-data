CREATE TABLE [dbo].[sl_comm_mthd_def] (
    [comm_mthd_id]          NVARCHAR (30)  NOT NULL,
    [comm_mthd_descr]       NVARCHAR (250) NULL,
    [post_alg_id]           NVARCHAR (30)  NULL,
    [pre_alg_id]            NVARCHAR (30)  NULL,
    [alg_id]                NVARCHAR (30)  NOT NULL,
    [inhibit_ifd_group_flg] NVARCHAR (1)   NULL,
    [u_version]             NUMERIC (5)    NULL,
    [ins_dt]                DATETIME       NULL,
    [last_upd_dt]           DATETIME       NULL,
    [ins_user_id]           NVARCHAR (40)  NULL,
    [last_upd_user_id]      NVARCHAR (40)  NULL,
    [comm_dir_cd]           NVARCHAR (5)   NULL,
    [comm_mthd_stat_cd]     NVARCHAR (5)   NULL,
    CONSTRAINT [sl_cmmddefpk] PRIMARY KEY CLUSTERED ([comm_mthd_id] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [sl_cmmddeffkalgpre] FOREIGN KEY ([pre_alg_id]) REFERENCES [dbo].[sl_alg_def] ([alg_id]),
    CONSTRAINT [sl_mmddeffkalgpost] FOREIGN KEY ([post_alg_id]) REFERENCES [dbo].[sl_alg_def] ([alg_id]),
    CONSTRAINT [sl_mmddeffkalgproc] FOREIGN KEY ([alg_id]) REFERENCES [dbo].[sl_alg_def] ([alg_id])
);


GO
CREATE NONCLUSTERED INDEX [sl_cmmddeffkalgpre]
    ON [dbo].[sl_comm_mthd_def]([pre_alg_id] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [sl_mmddeffkalgpost]
    ON [dbo].[sl_comm_mthd_def]([post_alg_id] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [sl_mmddeffkalgproc]
    ON [dbo].[sl_comm_mthd_def]([alg_id] ASC) WITH (FILLFACTOR = 90);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table defines a communication method.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_comm_mthd_def';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The communication method name', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_comm_mthd_def', @level2type = N'COLUMN', @level2name = N'comm_mthd_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The description of communication method', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_comm_mthd_def', @level2type = N'COLUMN', @level2name = N'comm_mthd_descr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The algorithm runs after the communication method algorithm is called', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_comm_mthd_def', @level2type = N'COLUMN', @level2name = N'post_alg_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The algorithm runs before the communication method algorithm is called', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_comm_mthd_def', @level2type = N'COLUMN', @level2name = N'pre_alg_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The algorithm which is called by the communication method', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_comm_mthd_def', @level2type = N'COLUMN', @level2name = N'alg_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Is the communication method inhibitted by the special IFD group?', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_comm_mthd_def', @level2type = N'COLUMN', @level2name = N'inhibit_ifd_group_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The version number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_comm_mthd_def', @level2type = N'COLUMN', @level2name = N'u_version';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Insert date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_comm_mthd_def', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Last update date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_comm_mthd_def', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User who created this record', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_comm_mthd_def', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User who performed the last update to the entry', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_comm_mthd_def', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The communication direction: I = Inbound, O = Outbound', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_comm_mthd_def', @level2type = N'COLUMN', @level2name = N'comm_dir_cd';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The communication status code: A = Active, D = Deprecated, O = Obsoleted', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_comm_mthd_def', @level2type = N'COLUMN', @level2name = N'comm_mthd_stat_cd';

